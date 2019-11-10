/*********************************************************************
*            (c) 1995 - 2018 SEGGER Microcontroller GmbH             *
*                        The Embedded Experts                        *
*                           www.segger.com                           *
**********************************************************************
----------------------------------------------------------------------
File    : FlashPrg.c
Purpose : Implementation of RAMCode template
--------  END-OF-HEADER  ---------------------------------------------
*/
#include "FlashOS.h"
#include "flexspi_cfg.h"
#include "fsl_flexspi.h"
#include "pin_mux.h"
#include "clock_config.h"

/*********************************************************************
*
*       Defines (configurable)
*
**********************************************************************
*/
//
// Some flash types require a native verify function as the memory is not memory mapped available (e.g. eMMC flashes).
// If the verify function is implemented in the algorithm, it will be used by the J-Link DLL during compare / verify
// independent of what verify type is configured in the J-Link DLL.
// Please note, that SEGGER does not recommend to use this function if the flash can be memory mapped read
// as this may can slow-down the compare / verify step.
//
#define SUPPORT_NATIVE_VERIFY        (1)
#define SUPPORT_NATIVE_READ_FUNCTION (0)
#define SUPPORT_BLANK_CHECK          (0)
#define SUPPORT_ERASE_CHIP           (0)
#define SUPPORT_SEGGER_OPEN_Program  (0)
#define SUPPORT_SEGGER_OPEN_ERASE    (0)

#define PAGE_SIZE_SHIFT (8)             // 256 bytes page size

/*********************************************************************
*
*       Types
*
**********************************************************************
*/

/*********************************************************************
*
*       Static data
*
**********************************************************************
*/
//
// We use this dummy variable to make sure that the PrgData
// section is present in the output elf-file as this section
// is mandatory in current versions of the J-Link DLL 
//
static volatile int _Dummy;

/*********************************************************************
*
*       Static code
*
**********************************************************************
*/

/*********************************************************************
*
*       _FeedWatchdog
*
*  Function description
*    Feeds the watchdog. Needs to be called during RAMCode execution
*    in case of an watchdog is active.
*/
/*! @name Refresh sequence */
/*@{*/
#define WDOG_FIRST_WORD_OF_REFRESH (RTWDOG_REFRESH_KEY & 0xFFFFU)  /*!< First word of refresh sequence */
#define WDOG_SECOND_WORD_OF_REFRESH ((RTWDOG_REFRESH_KEY >> 16U)& 0xFFFFU) /*!< Second word of refresh sequence */
static void _FeedWatchdog(void) {
	if ((RTWDOG->CS) & RTWDOG_CS_CMD32EN_MASK)
    {
        RTWDOG->CNT = RTWDOG_REFRESH_KEY;
    }
    else
    {
        RTWDOG->CNT = WDOG_FIRST_WORD_OF_REFRESH;
        RTWDOG->CNT = WDOG_SECOND_WORD_OF_REFRESH;
    }
}

/*********************************************************************
*
*       Public code
*
**********************************************************************
*/

#ifdef EXCLUDE_LIBC
#include "usr_std.h"
/* ----------------------------------------------------------------------------
   -- Core clock
   ---------------------------------------------------------------------------- */

uint32_t SystemCoreClock = DEFAULT_SYSTEM_CLOCK;

/* ----------------------------------------------------------------------------
   -- SystemInit()
   ---------------------------------------------------------------------------- */
inline void SystemInit (void) {
#if ((__FPU_PRESENT == 1) && (__FPU_USED == 1))
  SCB->CPACR |= ((3UL << 10*2) | (3UL << 11*2));    /* set CP10, CP11 Full Access */
#endif /* ((__FPU_PRESENT == 1) && (__FPU_USED == 1)) */

#if defined(__MCUXPRESSO)
    extern uint32_t g_pfnVectors[];  // Vector table defined in startup code
    SCB->VTOR = (uint32_t)g_pfnVectors;
#endif

/* Watchdog disable */

    /* Disable Systick which might be enabled by bootrom */
    if (SysTick->CTRL & SysTick_CTRL_ENABLE_Msk)
    {
        SysTick->CTRL &= ~SysTick_CTRL_ENABLE_Msk;
    }
    //SCB_DisableDCache();

}

/* ----------------------------------------------------------------------------
   -- SystemCoreClockUpdate()
   ---------------------------------------------------------------------------- */

inline void SystemCoreClockUpdate (void) {

    uint32_t freq;
    uint32_t PLL1MainClock;
    uint32_t PLL2MainClock;

    /* Periph_clk2_clk ---> Periph_clk */
    if (CCM->CBCDR & CCM_CBCDR_PERIPH_CLK_SEL_MASK)
    {
        switch (CCM->CBCMR & CCM_CBCMR_PERIPH_CLK2_SEL_MASK)
        {
            /* Pll3_sw_clk ---> Periph_clk2_clk ---> Periph_clk */
            case CCM_CBCMR_PERIPH_CLK2_SEL(0U):
                freq = (24000000UL * ((CCM_ANALOG->PLL_USB1 & CCM_ANALOG_PLL_USB1_DIV_SELECT_MASK) ? 22U : 20U));
                break;

            /* Osc_clk ---> Periph_clk2_clk ---> Periph_clk */
            case CCM_CBCMR_PERIPH_CLK2_SEL(1U):
                freq = 24000000UL;
                break;

            case CCM_CBCMR_PERIPH_CLK2_SEL(2U):
            case CCM_CBCMR_PERIPH_CLK2_SEL(3U):
            default:
                freq = 0U;
                break;
        }

        freq /= (((CCM->CBCDR & CCM_CBCDR_PERIPH_CLK2_PODF_MASK) >> CCM_CBCDR_PERIPH_CLK2_PODF_SHIFT) + 1U);
    }
    /* Pre_Periph_clk ---> Periph_clk */
    else
    {
        PLL1MainClock = ((24000000UL * ((CCM_ANALOG->PLL_ARM & CCM_ANALOG_PLL_ARM_DIV_SELECT_MASK) >>
                                         CCM_ANALOG_PLL_ARM_DIV_SELECT_SHIFT)) >> 1U);

        PLL2MainClock = (24000000UL * ((CCM_ANALOG->PLL_SYS & CCM_ANALOG_PLL_SYS_DIV_SELECT_MASK) ? 22U : 20U));
		uint32_t temp =(CCM_ANALOG->PLL_SYS_NUM) / (CCM_ANALOG->PLL_SYS_DENOM);
        PLL2MainClock += (24000000UL * (uint64_t)temp);


        switch (CCM->CBCMR & CCM_CBCMR_PRE_PERIPH_CLK_SEL_MASK)
        {
            /* PLL2 ---> Pre_Periph_clk ---> Periph_clk */
            case CCM_CBCMR_PRE_PERIPH_CLK_SEL(0U):
                freq = PLL2MainClock;
                break;

            /* PLL2 PFD2 ---> Pre_Periph_clk ---> Periph_clk */
            case CCM_CBCMR_PRE_PERIPH_CLK_SEL(1U):
                freq = PLL2MainClock / ((CCM_ANALOG->PFD_528 & CCM_ANALOG_PFD_528_PFD2_FRAC_MASK) >> CCM_ANALOG_PFD_528_PFD2_FRAC_SHIFT) * 18U;
                break;

            /* PLL2 PFD0 ---> Pre_Periph_clk ---> Periph_clk */
            case CCM_CBCMR_PRE_PERIPH_CLK_SEL(2U):
                freq = PLL2MainClock / ((CCM_ANALOG->PFD_528 & CCM_ANALOG_PFD_528_PFD0_FRAC_MASK) >> CCM_ANALOG_PFD_528_PFD0_FRAC_SHIFT) * 18U;
                break;

            /* PLL1 divided(/2) ---> Pre_Periph_clk ---> Periph_clk */
            case CCM_CBCMR_PRE_PERIPH_CLK_SEL(3U):
                freq = PLL1MainClock / (((CCM->CACRR & CCM_CACRR_ARM_PODF_MASK) >> CCM_CACRR_ARM_PODF_SHIFT) + 1U);
                break;

            default:
                freq = 0U;
                break;
        }
    }

    SystemCoreClock = (freq / (((CCM->CBCDR & CCM_CBCDR_AHB_PODF_MASK) >> CCM_CBCDR_AHB_PODF_SHIFT) + 1U));

}
#endif

/*********************************************************************
*
*       Init
*
*  Function description
*    Handles the initialization of the flash module.
*
*  Parameters
*    Addr: Flash base address
*    Freq: Clock frequency in Hz
*    Func: Specifies the action followed by Init() (e.g.: 1 - Erase, 2 - Program, 3 - Verify / Read)
*
*  Return value 
*    0 O.K.
*    1 Error
*/
int Init(U32 Addr, U32 Freq, U32 Func) {
  (void)Addr;
  (void)Freq;
  (void)Func;
  //
  // Init code
  //
  SystemInit();
  SystemCoreClockUpdate();
  BOARD_InitBootClocks();
  BOARD_InitPins();
  _FeedWatchdog();
  flexspi_nor_flash_init(EXAMPLE_FLEXSPI);
  flexspi_nor_enable_quad_mode(EXAMPLE_FLEXSPI);
  //flexspi_nor_enable_quad_mode(EXAMPLE_FLEXSPI);
  return 0;
}

/*********************************************************************
*
*       UnInit
*
*  Function description
*    Handles the de-initialization of the flash module.
*
*  Parameters
*    Func: Caller type (e.g.: 1 - Erase, 2 - Program, 3 - Verify)
*
*  Return value 
*    0 O.K.
*    1 Error
*/
int UnInit(U32 Func) {
  (void)Func;
  //
  // Uninit code
  _FeedWatchdog();
  FLEXSPI_Deinit(EXAMPLE_FLEXSPI);
  //asm("bl 0x60000000");
  //
  return 0;
}

/*********************************************************************
*
*       EraseSector
*
*  Function description
*    Erases one flash sector.
*
*  Parameters
*    SectorAddr: Absolute address of the sector to be erased
*
*  Return value 
*    0 O.K.
*    1 Error
*/
int EraseSector(U32 SectorAddr) {
  //
  // Erase sector code
  //
  int r;
  _FeedWatchdog();
  r=flexspi_nor_flash_erase_sector(EXAMPLE_FLEXSPI,SectorAddr-EXAMPLE_FLEXSPI_AMBA_BASE);
  _FeedWatchdog();
  return r;
}

/*********************************************************************
*
*       ProgramPage
*
*  Function description
*    Programs one flash page.
*
*  Parameters
*    DestAddr: Destination address
*    NumBytes: Number of bytes to be programmed (always a multiple of program page size, defined in FlashDev.c)
*    pSrcBuff: Point to the source buffer
*
*  Return value 
*    0 O.K.
*    1 Error
*/
int ProgramPage(U32 DestAddr, U32 NumBytes, U8 *pSrcBuff) {
  volatile U32 * pSrc;
  volatile U32 * pDest;
  U32 AccessWidth;
  int r;
  _FeedWatchdog();
  r           = -1;
  pSrc        = (volatile U32*)pSrcBuff;
  pDest       = (volatile U32*)(DestAddr-EXAMPLE_FLEXSPI_AMBA_BASE);
  AccessWidth = 128;

  do{
	_FeedWatchdog();
	r=flexspi_nor_flash_program(EXAMPLE_FLEXSPI,(U32)pDest,pSrc,AccessWidth);
	if(r!=0){
	return 1;
	}
	NumBytes -= AccessWidth;
	pSrc +=AccessWidth>>2;
	pDest +=AccessWidth>>2;
  }while(NumBytes);
  return 0;
}

/*********************************************************************
*
*       Verify
*
*  Function description
*    Compares a specified number of bytes of a provided data
*    buffer with the content of the device
*
*  Parameters
*    Addr: Start address in memory which should be compared
*    NumBytes: Number of bytes to be compared
*    pBuff: Pointer to the data to be compared
*
*  Return value 
*    == (Addr + NumBytes): O.K.
*    != (Addr + NumBytes): *not* O.K. (ideally the fail address is returned)
*
*/
#if SUPPORT_NATIVE_VERIFY
U32 Verify(U32 Addr, U32 NumBytes, U8 *pBuff) {
  unsigned char *pFlash;
  unsigned long r;

  _FeedWatchdog();
  pFlash = (unsigned char *)Addr;
  r = Addr + NumBytes;
  do {
      if (*pFlash != *pBuff) {
        r = (unsigned long)pFlash;
        break;
      }
      pFlash++;
      pBuff++;
  } while (--NumBytes);
  return r;
}
#endif

/*********************************************************************
*
*       BlankCheck
*
*  Function description
*    Checks if a memory region is blank
*
*  Parameters
*    Addr: Blank check start address
*    NumBytes: Number of bytes to be checked
*    BlankData: Pointer to the destination data
*
*  Return value 
*    0: O.K., blank
*    1: O.K., *not* blank
*    < 0: Error
*
*/
#if SUPPORT_BLANK_CHECK
int BlankCheck(U32 Addr, U32 NumBytes, U8 BlankData) {
  U8* pData;
  
  pData = (U8*)Addr;
  do {
    if (*pData++ != BlankData) {
      return 1;
    }
  } while (--NumBytes);
  return 0;
}
#endif

/*********************************************************************
*
*       EraseChip
*
*  Function description
*    Erases the entire flash
*
*  Return value 
*    0: O.K.
*    1: Error
*/
#if SUPPORT_ERASE_CHIP
int EraseChip(void) {
  //
  // Erase chip code
  //
  //*(volatile U32*)(0x000000) = SectorAddr;  // Dummy code, needs to be replaced with erase chip code
  flexspi_nor_erase_chip(EXAMPLE_FLEXSPI);
  return 0;
}
#endif

/*********************************************************************
*
*       SEGGER_OPEN_Read
*
*  Function description
*    Reads a specified number of bytes into the provided buffer
*
*  Parameters
*    Addr: Start read address
*    NumBytes: Number of bytes to be read
*    pBuff: Pointer to the destination data
*
*  Return value 
*    >= 0: O.K., NumBytes read
*    <  0: Error
*
*/
#if SUPPORT_NATIVE_READ_FUNCTION
int SEGGER_OPEN_Read(U32 Addr, U32 NumBytes, U8 *pDestBuff) {
  //
  // Read function
  // Add your code here...
  //
  return NumBytes;
}
#endif

/*********************************************************************
*
*       SEGGER_OPEN_Program
*
*  Function description
*    Programs a specified number of bytes into the target flash.
*    NumBytes is either FlashDevice.PageSize or a multiple of it.
*
*  Notes
*    (1) This function can rely on that at least FlashDevice.PageSize will be passed
*    (2) This function must be able to handle multiple of FlashDevice.PageSize
*
*  Parameters
*    Addr: Start read address
*    NumBytes: Number of bytes to be read
*    pBuff: Pointer to the destination data
*
*  Return value 
*    0 O.K.
*    1 Error
*
*/
#if SUPPORT_SEGGER_OPEN_Program
int SEGGER_OPEN_Program(U32 DestAddr, U32 NumBytes, U8 *pSrcBuff) {
  U32 NumPages;
  int r;

  NumPages = (NumBytes >> PAGE_SIZE_SHIFT);
  r = 0;
  do {
    r = ProgramPage(DestAddr, (1uL << PAGE_SIZE_SHIFT), pSrcBuff);
    if (r < 0) {
      return r;
    }
    DestAddr += (1uL << PAGE_SIZE_SHIFT);
    pSrcBuff += (1uL << PAGE_SIZE_SHIFT);
  } while (--NumPages);
  return r;
}
#endif

/*********************************************************************
*
*       SEGGER_OPEN_Erase
*
*  Function description
*    Erases one or more flash sectors
*
*  Notes
*    (1) This function can rely on that at least one sector will be passed
*    (2) This function must be able to handle multiple sectors at once
*    (3) This function can rely on that only multiple sectors of the same sector
*        size will be passed. (e.g. if the device has two sectors with different
*        sizes, the DLL will call this function two times with NumSectors = 1)
*
*  Parameters
*    SectorAddr: Address of the start sector to be erased
*    SectorIndex: Index of the start sector to be erased
*    NumSectors: Number of sectors to be erased. At least 1 sector is passed.
*
*  Return value 
*    0 O.K.
*    1 Error
*
*/
#if SUPPORT_SEGGER_OPEN_ERASE
int SEGGER_OPEN_Erase(U32 SectorAddr, U32 SectorIndex, U32 NumSectors) {
  (void)SectorAddr;
  U32 Status;
  int r;
  
  _FeedWatchdog();
  r = 0;
  do {
    EraseSector(SectorAddr);
    SectorAddr += (1 << SECTOR_SIZE_SHIFT);
  } while (--NumSectors);
  return r;
}
#endif

/**************************** End of file ***************************/
