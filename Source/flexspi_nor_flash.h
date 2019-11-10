#ifndef  _FLEXSPI_NOR_FLASH_H
#define  _FLEXSPI_NOR_FLASH_H

#include "fsl_flexspi.h"
#include "pin_mux.h"

/*******************************************************************************
 * Definitions
 ******************************************************************************/
#define EXAMPLE_FLEXSPI FLEXSPI
#define FLASH_SIZE 0x2000 /* 64Mb/KByte */
#define EXAMPLE_FLEXSPI_AMBA_BASE FlexSPI_AMBA_BASE
#define FLASH_PAGE_SIZE 256
#define EXAMPLE_SECTOR 0
#define SECTOR_SIZE 0x1000 /* 4K */
#define EXAMPLE_FLEXSPI_CLOCK kCLOCK_FlexSpi

/*  */
#define NOR_CMD_INDEX_READ CMD_INDEX_READ 0              //!< 0
#define NOR_CMD_INDEX_READSTATUS CMD_INDEX_READSTATUS 1  //!< 1
#define NOR_CMD_INDEX_WRITEENABLE CMD_INDEX_WRITEENABLE 2//!< 2
#define NOR_CMD_INDEX_ERASESECTOR 3                     //!< 3
#define NOR_CMD_INDEX_PAGEPROGRAM CMD_INDEX_WRITE       //!< 4
#define NOR_CMD_INDEX_CHIPERASE 5                       //!< 5
#define NOR_CMD_INDEX_DUMMY 6                           //!< 6
#define NOR_CMD_INDEX_ERASEBLOCK 7                      //!< 7

#define NOR_CMD_LUT_SEQ_IDX_READ CMD_LUT_SEQ_IDX_READ //!< 0  READ LUT sequence id in lookupTable stored in config block
#define NOR_CMD_LUT_SEQ_IDX_READSTATUSREG CMD_LUT_SEQ_IDX_READSTATUS 
									  //!< 1  Read Status LUT sequence id in lookupTable stored in config block
#define NOR_CMD_LUT_SEQ_IDX_READSTATUS_XPI 2 
									  //!< 2  Read status DPI/QPI/OPI sequence id in lookupTable stored in config block
#define NOR_CMD_LUT_SEQ_IDX_WRITEENABLE CMD_LUT_SEQ_IDX_WRITEENABLE 
									  //!< 3  Write Enable sequence id in lookupTable stored in config block
#define NOR_CMD_LUT_SEQ_IDX_WRITEENABLE_XPI 4 
									  //!< 4  Write Enable DPI/QPI/OPI sequence id in lookupTable stored in config block
#define NOR_CMD_LUT_SEQ_IDX_ERASESECTOR 5 //!< 5  Erase Sector sequence id in lookupTable stored in config block
#define NOR_CMD_LUT_SEQ_IDX_ERASEBLOCK 8  //!< 8 Erase Block sequence id in lookupTable stored in config block
#define NOR_CMD_LUT_SEQ_IDX_PAGEPROGRAM CMD_LUT_SEQ_IDX_WRITE
									//!< 9  Program sequence id in lookupTable stored in config block
#define NOR_CMD_LUT_SEQ_IDX_CHIPERASE 11 //!< 11 Chip Erase sequence in lookupTable id stored in config block
#define NOR_CMD_LUT_SEQ_IDX_READ_SFDP 13 //!< 13 Read SFDP sequence in lookupTable id stored in config block
#define NOR_CMD_LUT_SEQ_IDX_RESTORE_NOCMD 14 
									//!< 14 Restore 0-4-4/0-8-8 mode sequence id in lookupTable stored in config block
#define NOR_CMD_LUT_SEQ_IDX_EXIT_NOCMD 15 
									//!< 15 Exit 0-4-4/0-8-8 mode sequence id in lookupTable stored in config blob

/*******************************************************************************
 * Prototypes
 ******************************************************************************/
/*${prototype:start}*/
static inline void BOARD_InitHardware(void)
{
  BOARD_InitPins();
}

static inline void flexspi_clock_init(void)
{
    const clock_usb_pll_config_t g_ccmConfigUsbPll = {.loopDivider = 0U};

    CLOCK_InitUsb1Pll(&g_ccmConfigUsbPll);
    CLOCK_InitUsb1Pfd(kCLOCK_Pfd0, 24);   /* Set PLL3 PFD0 clock 360MHZ. */
    CLOCK_SetMux(kCLOCK_FlexspiMux, 0x3); /* Choose PLL3 PFD0 clock as flexspi source clock. */
    CLOCK_SetDiv(kCLOCK_FlexspiDiv, 3);   /* flexspi clock 120M. */
    SCB_DisableDCache();
}
/*${prototype:end}*/

#endif