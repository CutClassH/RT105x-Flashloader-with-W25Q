/*****************************************************************************
 *                   SEGGER Microcontroller GmbH & Co. KG                    *
 *            Solutions for real time microcontroller applications           *
 *****************************************************************************
 *                                                                           *
 *               (c) 2018 SEGGER Microcontroller GmbH & Co. KG               *
 *                                                                           *
 *           Internet: www.segger.com   Support: support@segger.com          *
 *                                                                           *
 *****************************************************************************/

/*****************************************************************************
 *                         Preprocessor Definitions                          *
 *                         ------------------------                          *
 * VECTORS_IN_RAM                                                            *
 *                                                                           *
 *   If defined, an area of RAM will large enough to store the vector table  *
 *   will be reserved.                                                       *
 *                                                                           *
 *****************************************************************************/

  .syntax unified
  .code 16

  .section .init, "ax"
  .align 0

/*****************************************************************************
 * Default Exception Handlers                                                *
 *****************************************************************************/

  .thumb_func
  .weak NMI_Handler
NMI_Handler:
  b .

  .thumb_func
  .weak HardFault_Handler
HardFault_Handler:
  b .

  .thumb_func
  .weak SVC_Handler
SVC_Handler:
  b .

  .thumb_func
  .weak PendSV_Handler
PendSV_Handler:
  b .

  .thumb_func
  .weak SysTick_Handler
SysTick_Handler:
  b .

  .thumb_func
Dummy_Handler:
  b .

#if defined(__OPTIMIZATION_SMALL)

  .weak DMA0_DMA16_IRQHandler
  .thumb_set DMA0_DMA16_IRQHandler,Dummy_Handler

  .weak DMA1_DMA17_IRQHandler
  .thumb_set DMA1_DMA17_IRQHandler,Dummy_Handler

  .weak DMA2_DMA18_IRQHandler
  .thumb_set DMA2_DMA18_IRQHandler,Dummy_Handler

  .weak DMA3_DMA19_IRQHandler
  .thumb_set DMA3_DMA19_IRQHandler,Dummy_Handler

  .weak DMA4_DMA20_IRQHandler
  .thumb_set DMA4_DMA20_IRQHandler,Dummy_Handler

  .weak DMA5_DMA21_IRQHandler
  .thumb_set DMA5_DMA21_IRQHandler,Dummy_Handler

  .weak DMA6_DMA22_IRQHandler
  .thumb_set DMA6_DMA22_IRQHandler,Dummy_Handler

  .weak DMA7_DMA23_IRQHandler
  .thumb_set DMA7_DMA23_IRQHandler,Dummy_Handler

  .weak DMA8_DMA24_IRQHandler
  .thumb_set DMA8_DMA24_IRQHandler,Dummy_Handler

  .weak DMA9_DMA25_IRQHandler
  .thumb_set DMA9_DMA25_IRQHandler,Dummy_Handler

  .weak DMA10_DMA26_IRQHandler
  .thumb_set DMA10_DMA26_IRQHandler,Dummy_Handler

  .weak DMA11_DMA27_IRQHandler
  .thumb_set DMA11_DMA27_IRQHandler,Dummy_Handler

  .weak DMA12_DMA28_IRQHandler
  .thumb_set DMA12_DMA28_IRQHandler,Dummy_Handler

  .weak DMA13_DMA29_IRQHandler
  .thumb_set DMA13_DMA29_IRQHandler,Dummy_Handler

  .weak DMA14_DMA30_IRQHandler
  .thumb_set DMA14_DMA30_IRQHandler,Dummy_Handler

  .weak DMA15_DMA31_IRQHandler
  .thumb_set DMA15_DMA31_IRQHandler,Dummy_Handler

  .weak DMA_ERROR_IRQHandler
  .thumb_set DMA_ERROR_IRQHandler,Dummy_Handler

  .weak LPUART1_IRQHandler
  .thumb_set LPUART1_IRQHandler,Dummy_Handler

  .weak LPUART2_IRQHandler
  .thumb_set LPUART2_IRQHandler,Dummy_Handler

  .weak LPUART3_IRQHandler
  .thumb_set LPUART3_IRQHandler,Dummy_Handler

  .weak LPUART4_IRQHandler
  .thumb_set LPUART4_IRQHandler,Dummy_Handler

  .weak LPUART5_IRQHandler
  .thumb_set LPUART5_IRQHandler,Dummy_Handler

  .weak LPUART6_IRQHandler
  .thumb_set LPUART6_IRQHandler,Dummy_Handler

  .weak LPUART7_IRQHandler
  .thumb_set LPUART7_IRQHandler,Dummy_Handler

  .weak LPUART8_IRQHandler
  .thumb_set LPUART8_IRQHandler,Dummy_Handler

  .weak LPI2C1_IRQHandler
  .thumb_set LPI2C1_IRQHandler,Dummy_Handler

  .weak LPI2C2_IRQHandler
  .thumb_set LPI2C2_IRQHandler,Dummy_Handler

  .weak LPI2C3_IRQHandler
  .thumb_set LPI2C3_IRQHandler,Dummy_Handler

  .weak LPI2C4_IRQHandler
  .thumb_set LPI2C4_IRQHandler,Dummy_Handler

  .weak LPSPI1_IRQHandler
  .thumb_set LPSPI1_IRQHandler,Dummy_Handler

  .weak LPSPI2_IRQHandler
  .thumb_set LPSPI2_IRQHandler,Dummy_Handler

  .weak LPSPI3_IRQHandler
  .thumb_set LPSPI3_IRQHandler,Dummy_Handler

  .weak LPSPI4_IRQHandler
  .thumb_set LPSPI4_IRQHandler,Dummy_Handler

  .weak CAN1_IRQHandler
  .thumb_set CAN1_IRQHandler,Dummy_Handler

  .weak CAN2_IRQHandler
  .thumb_set CAN2_IRQHandler,Dummy_Handler

  .weak FLEXRAM_IRQHandler
  .thumb_set FLEXRAM_IRQHandler,Dummy_Handler

  .weak KPP_IRQHandler
  .thumb_set KPP_IRQHandler,Dummy_Handler

  .weak TSC_DIG_IRQHandler
  .thumb_set TSC_DIG_IRQHandler,Dummy_Handler

  .weak LCDIF_IRQHandler
  .thumb_set LCDIF_IRQHandler,Dummy_Handler

  .weak CSI_IRQHandler
  .thumb_set CSI_IRQHandler,Dummy_Handler

  .weak PXP_IRQHandler
  .thumb_set PXP_IRQHandler,Dummy_Handler

  .weak WDOG2_IRQHandler
  .thumb_set WDOG2_IRQHandler,Dummy_Handler

  .weak SNVS_HP_WRAPPER_IRQHandler
  .thumb_set SNVS_HP_WRAPPER_IRQHandler,Dummy_Handler

  .weak SNVS_HP_WRAPPER_TZ_IRQHandler
  .thumb_set SNVS_HP_WRAPPER_TZ_IRQHandler,Dummy_Handler

  .weak SNVS_LP_WRAPPER_IRQHandler
  .thumb_set SNVS_LP_WRAPPER_IRQHandler,Dummy_Handler

  .weak CSU_IRQHandler
  .thumb_set CSU_IRQHandler,Dummy_Handler

  .weak DCP_IRQHandler
  .thumb_set DCP_IRQHandler,Dummy_Handler

  .weak DCP_VMI_IRQHandler
  .thumb_set DCP_VMI_IRQHandler,Dummy_Handler

  .weak TRNG_IRQHandler
  .thumb_set TRNG_IRQHandler,Dummy_Handler

  .weak BEE_IRQHandler
  .thumb_set BEE_IRQHandler,Dummy_Handler

  .weak SAI1_IRQHandler
  .thumb_set SAI1_IRQHandler,Dummy_Handler

  .weak SAI2_IRQHandler
  .thumb_set SAI2_IRQHandler,Dummy_Handler

  .weak SAI3_RX_IRQHandler
  .thumb_set SAI3_RX_IRQHandler,Dummy_Handler

  .weak SAI3_TX_IRQHandler
  .thumb_set SAI3_TX_IRQHandler,Dummy_Handler

  .weak SPDIF_IRQHandler
  .thumb_set SPDIF_IRQHandler,Dummy_Handler

  .weak USB_PHY1_IRQHandler
  .thumb_set USB_PHY1_IRQHandler,Dummy_Handler

  .weak USB_PHY2_IRQHandler
  .thumb_set USB_PHY2_IRQHandler,Dummy_Handler

  .weak ADC1_IRQHandler
  .thumb_set ADC1_IRQHandler,Dummy_Handler

  .weak ADC2_IRQHandler
  .thumb_set ADC2_IRQHandler,Dummy_Handler

  .weak DCDC_IRQHandler
  .thumb_set DCDC_IRQHandler,Dummy_Handler

  .weak GPIO1_INT0_IRQHandler
  .thumb_set GPIO1_INT0_IRQHandler,Dummy_Handler

  .weak GPIO1_INT1_IRQHandler
  .thumb_set GPIO1_INT1_IRQHandler,Dummy_Handler

  .weak GPIO1_INT2_IRQHandler
  .thumb_set GPIO1_INT2_IRQHandler,Dummy_Handler

  .weak GPIO1_INT3_IRQHandler
  .thumb_set GPIO1_INT3_IRQHandler,Dummy_Handler

  .weak GPIO1_INT4_IRQHandler
  .thumb_set GPIO1_INT4_IRQHandler,Dummy_Handler

  .weak GPIO1_INT5_IRQHandler
  .thumb_set GPIO1_INT5_IRQHandler,Dummy_Handler

  .weak GPIO1_INT6_IRQHandler
  .thumb_set GPIO1_INT6_IRQHandler,Dummy_Handler

  .weak GPIO1_INT7_IRQHandler
  .thumb_set GPIO1_INT7_IRQHandler,Dummy_Handler

  .weak GPIO1_Combined_0_15_IRQHandler
  .thumb_set GPIO1_Combined_0_15_IRQHandler,Dummy_Handler

  .weak GPIO1_Combined_16_31_IRQHandler
  .thumb_set GPIO1_Combined_16_31_IRQHandler,Dummy_Handler

  .weak GPIO2_Combined_0_15_IRQHandler
  .thumb_set GPIO2_Combined_0_15_IRQHandler,Dummy_Handler

  .weak GPIO2_Combined_16_31_IRQHandler
  .thumb_set GPIO2_Combined_16_31_IRQHandler,Dummy_Handler

  .weak GPIO3_Combined_0_15_IRQHandler
  .thumb_set GPIO3_Combined_0_15_IRQHandler,Dummy_Handler

  .weak GPIO3_Combined_16_31_IRQHandler
  .thumb_set GPIO3_Combined_16_31_IRQHandler,Dummy_Handler

  .weak GPIO4_Combined_0_15_IRQHandler
  .thumb_set GPIO4_Combined_0_15_IRQHandler,Dummy_Handler

  .weak GPIO4_Combined_16_31_IRQHandler
  .thumb_set GPIO4_Combined_16_31_IRQHandler,Dummy_Handler

  .weak GPIO5_Combined_0_15_IRQHandler
  .thumb_set GPIO5_Combined_0_15_IRQHandler,Dummy_Handler

  .weak GPIO5_Combined_16_31_IRQHandler
  .thumb_set GPIO5_Combined_16_31_IRQHandler,Dummy_Handler

  .weak FLEXIO1_IRQHandler
  .thumb_set FLEXIO1_IRQHandler,Dummy_Handler

  .weak FLEXIO2_IRQHandler
  .thumb_set FLEXIO2_IRQHandler,Dummy_Handler

  .weak WDOG1_IRQHandler
  .thumb_set WDOG1_IRQHandler,Dummy_Handler

  .weak RTWDOG_IRQHandler
  .thumb_set RTWDOG_IRQHandler,Dummy_Handler

  .weak EWM_IRQHandler
  .thumb_set EWM_IRQHandler,Dummy_Handler

  .weak CCM_1_IRQHandler
  .thumb_set CCM_1_IRQHandler,Dummy_Handler

  .weak CCM_2_IRQHandler
  .thumb_set CCM_2_IRQHandler,Dummy_Handler

  .weak GPC_IRQHandler
  .thumb_set GPC_IRQHandler,Dummy_Handler

  .weak SRC_IRQHandler
  .thumb_set SRC_IRQHandler,Dummy_Handler

  .weak GPT1_IRQHandler
  .thumb_set GPT1_IRQHandler,Dummy_Handler

  .weak GPT2_IRQHandler
  .thumb_set GPT2_IRQHandler,Dummy_Handler

  .weak PWM1_0_IRQHandler
  .thumb_set PWM1_0_IRQHandler,Dummy_Handler

  .weak PWM1_1_IRQHandler
  .thumb_set PWM1_1_IRQHandler,Dummy_Handler

  .weak PWM1_2_IRQHandler
  .thumb_set PWM1_2_IRQHandler,Dummy_Handler

  .weak PWM1_3_IRQHandler
  .thumb_set PWM1_3_IRQHandler,Dummy_Handler

  .weak PWM1_FAULT_IRQHandler
  .thumb_set PWM1_FAULT_IRQHandler,Dummy_Handler

  .weak FLEXSPI_IRQHandler
  .thumb_set FLEXSPI_IRQHandler,Dummy_Handler

  .weak SEMC_IRQHandler
  .thumb_set SEMC_IRQHandler,Dummy_Handler

  .weak USDHC1_IRQHandler
  .thumb_set USDHC1_IRQHandler,Dummy_Handler

  .weak USDHC2_IRQHandler
  .thumb_set USDHC2_IRQHandler,Dummy_Handler

  .weak USB_OTG2_IRQHandler
  .thumb_set USB_OTG2_IRQHandler,Dummy_Handler

  .weak USB_OTG1_IRQHandler
  .thumb_set USB_OTG1_IRQHandler,Dummy_Handler

  .weak ENET_IRQHandler
  .thumb_set ENET_IRQHandler,Dummy_Handler

  .weak ENET_1588_Timer_IRQHandler
  .thumb_set ENET_1588_Timer_IRQHandler,Dummy_Handler

  .weak ADC_ETC_IRQ0_IRQHandler
  .thumb_set ADC_ETC_IRQ0_IRQHandler,Dummy_Handler

  .weak ADC_ETC_IRQ1_IRQHandler
  .thumb_set ADC_ETC_IRQ1_IRQHandler,Dummy_Handler

  .weak ADC_ETC_IRQ2_IRQHandler
  .thumb_set ADC_ETC_IRQ2_IRQHandler,Dummy_Handler

  .weak ADC_ETC_ERROR_IRQHandler
  .thumb_set ADC_ETC_ERROR_IRQHandler,Dummy_Handler

  .weak PIT_IRQHandler
  .thumb_set PIT_IRQHandler,Dummy_Handler

  .weak ACMP1_IRQHandler
  .thumb_set ACMP1_IRQHandler,Dummy_Handler

  .weak ACMP2_IRQHandler
  .thumb_set ACMP2_IRQHandler,Dummy_Handler

  .weak ACMP3_IRQHandler
  .thumb_set ACMP3_IRQHandler,Dummy_Handler

  .weak ACMP4_IRQHandler
  .thumb_set ACMP4_IRQHandler,Dummy_Handler

  .weak ENC1_IRQHandler
  .thumb_set ENC1_IRQHandler,Dummy_Handler

  .weak ENC2_IRQHandler
  .thumb_set ENC2_IRQHandler,Dummy_Handler

  .weak ENC3_IRQHandler
  .thumb_set ENC3_IRQHandler,Dummy_Handler

  .weak ENC4_IRQHandler
  .thumb_set ENC4_IRQHandler,Dummy_Handler

  .weak TMR1_IRQHandler
  .thumb_set TMR1_IRQHandler,Dummy_Handler

  .weak TMR2_IRQHandler
  .thumb_set TMR2_IRQHandler,Dummy_Handler

  .weak TMR3_IRQHandler
  .thumb_set TMR3_IRQHandler,Dummy_Handler

  .weak TMR4_IRQHandler
  .thumb_set TMR4_IRQHandler,Dummy_Handler

  .weak PWM2_0_IRQHandler
  .thumb_set PWM2_0_IRQHandler,Dummy_Handler

  .weak PWM2_1_IRQHandler
  .thumb_set PWM2_1_IRQHandler,Dummy_Handler

  .weak PWM2_2_IRQHandler
  .thumb_set PWM2_2_IRQHandler,Dummy_Handler

  .weak PWM2_3_IRQHandler
  .thumb_set PWM2_3_IRQHandler,Dummy_Handler

  .weak PWM2_FAULT_IRQHandler
  .thumb_set PWM2_FAULT_IRQHandler,Dummy_Handler

  .weak PWM3_0_IRQHandler
  .thumb_set PWM3_0_IRQHandler,Dummy_Handler

  .weak PWM3_1_IRQHandler
  .thumb_set PWM3_1_IRQHandler,Dummy_Handler

  .weak PWM3_2_IRQHandler
  .thumb_set PWM3_2_IRQHandler,Dummy_Handler

  .weak PWM3_3_IRQHandler
  .thumb_set PWM3_3_IRQHandler,Dummy_Handler

  .weak PWM3_FAULT_IRQHandler
  .thumb_set PWM3_FAULT_IRQHandler,Dummy_Handler

  .weak PWM4_0_IRQHandler
  .thumb_set PWM4_0_IRQHandler,Dummy_Handler

  .weak PWM4_1_IRQHandler
  .thumb_set PWM4_1_IRQHandler,Dummy_Handler

  .weak PWM4_2_IRQHandler
  .thumb_set PWM4_2_IRQHandler,Dummy_Handler

  .weak PWM4_3_IRQHandler
  .thumb_set PWM4_3_IRQHandler,Dummy_Handler

  .weak PWM4_FAULT_IRQHandler
  .thumb_set PWM4_FAULT_IRQHandler,Dummy_Handler

#else

  .thumb_func
  .weak DMA0_DMA16_IRQHandler
DMA0_DMA16_IRQHandler:
  b .

  .thumb_func
  .weak DMA1_DMA17_IRQHandler
DMA1_DMA17_IRQHandler:
  b .

  .thumb_func
  .weak DMA2_DMA18_IRQHandler
DMA2_DMA18_IRQHandler:
  b .

  .thumb_func
  .weak DMA3_DMA19_IRQHandler
DMA3_DMA19_IRQHandler:
  b .

  .thumb_func
  .weak DMA4_DMA20_IRQHandler
DMA4_DMA20_IRQHandler:
  b .

  .thumb_func
  .weak DMA5_DMA21_IRQHandler
DMA5_DMA21_IRQHandler:
  b .

  .thumb_func
  .weak DMA6_DMA22_IRQHandler
DMA6_DMA22_IRQHandler:
  b .

  .thumb_func
  .weak DMA7_DMA23_IRQHandler
DMA7_DMA23_IRQHandler:
  b .

  .thumb_func
  .weak DMA8_DMA24_IRQHandler
DMA8_DMA24_IRQHandler:
  b .

  .thumb_func
  .weak DMA9_DMA25_IRQHandler
DMA9_DMA25_IRQHandler:
  b .

  .thumb_func
  .weak DMA10_DMA26_IRQHandler
DMA10_DMA26_IRQHandler:
  b .

  .thumb_func
  .weak DMA11_DMA27_IRQHandler
DMA11_DMA27_IRQHandler:
  b .

  .thumb_func
  .weak DMA12_DMA28_IRQHandler
DMA12_DMA28_IRQHandler:
  b .

  .thumb_func
  .weak DMA13_DMA29_IRQHandler
DMA13_DMA29_IRQHandler:
  b .

  .thumb_func
  .weak DMA14_DMA30_IRQHandler
DMA14_DMA30_IRQHandler:
  b .

  .thumb_func
  .weak DMA15_DMA31_IRQHandler
DMA15_DMA31_IRQHandler:
  b .

  .thumb_func
  .weak DMA_ERROR_IRQHandler
DMA_ERROR_IRQHandler:
  b .

  .thumb_func
  .weak LPUART1_IRQHandler
LPUART1_IRQHandler:
  b .

  .thumb_func
  .weak LPUART2_IRQHandler
LPUART2_IRQHandler:
  b .

  .thumb_func
  .weak LPUART3_IRQHandler
LPUART3_IRQHandler:
  b .

  .thumb_func
  .weak LPUART4_IRQHandler
LPUART4_IRQHandler:
  b .

  .thumb_func
  .weak LPUART5_IRQHandler
LPUART5_IRQHandler:
  b .

  .thumb_func
  .weak LPUART6_IRQHandler
LPUART6_IRQHandler:
  b .

  .thumb_func
  .weak LPUART7_IRQHandler
LPUART7_IRQHandler:
  b .

  .thumb_func
  .weak LPUART8_IRQHandler
LPUART8_IRQHandler:
  b .

  .thumb_func
  .weak LPI2C1_IRQHandler
LPI2C1_IRQHandler:
  b .

  .thumb_func
  .weak LPI2C2_IRQHandler
LPI2C2_IRQHandler:
  b .

  .thumb_func
  .weak LPI2C3_IRQHandler
LPI2C3_IRQHandler:
  b .

  .thumb_func
  .weak LPI2C4_IRQHandler
LPI2C4_IRQHandler:
  b .

  .thumb_func
  .weak LPSPI1_IRQHandler
LPSPI1_IRQHandler:
  b .

  .thumb_func
  .weak LPSPI2_IRQHandler
LPSPI2_IRQHandler:
  b .

  .thumb_func
  .weak LPSPI3_IRQHandler
LPSPI3_IRQHandler:
  b .

  .thumb_func
  .weak LPSPI4_IRQHandler
LPSPI4_IRQHandler:
  b .

  .thumb_func
  .weak CAN1_IRQHandler
CAN1_IRQHandler:
  b .

  .thumb_func
  .weak CAN2_IRQHandler
CAN2_IRQHandler:
  b .

  .thumb_func
  .weak FLEXRAM_IRQHandler
FLEXRAM_IRQHandler:
  b .

  .thumb_func
  .weak KPP_IRQHandler
KPP_IRQHandler:
  b .

  .thumb_func
  .weak TSC_DIG_IRQHandler
TSC_DIG_IRQHandler:
  b .

  .thumb_func
  .weak LCDIF_IRQHandler
LCDIF_IRQHandler:
  b .

  .thumb_func
  .weak CSI_IRQHandler
CSI_IRQHandler:
  b .

  .thumb_func
  .weak PXP_IRQHandler
PXP_IRQHandler:
  b .

  .thumb_func
  .weak WDOG2_IRQHandler
WDOG2_IRQHandler:
  b .

  .thumb_func
  .weak SNVS_HP_WRAPPER_IRQHandler
SNVS_HP_WRAPPER_IRQHandler:
  b .

  .thumb_func
  .weak SNVS_HP_WRAPPER_TZ_IRQHandler
SNVS_HP_WRAPPER_TZ_IRQHandler:
  b .

  .thumb_func
  .weak SNVS_LP_WRAPPER_IRQHandler
SNVS_LP_WRAPPER_IRQHandler:
  b .

  .thumb_func
  .weak CSU_IRQHandler
CSU_IRQHandler:
  b .

  .thumb_func
  .weak DCP_IRQHandler
DCP_IRQHandler:
  b .

  .thumb_func
  .weak DCP_VMI_IRQHandler
DCP_VMI_IRQHandler:
  b .

  .thumb_func
  .weak TRNG_IRQHandler
TRNG_IRQHandler:
  b .

  .thumb_func
  .weak BEE_IRQHandler
BEE_IRQHandler:
  b .

  .thumb_func
  .weak SAI1_IRQHandler
SAI1_IRQHandler:
  b .

  .thumb_func
  .weak SAI2_IRQHandler
SAI2_IRQHandler:
  b .

  .thumb_func
  .weak SAI3_RX_IRQHandler
SAI3_RX_IRQHandler:
  b .

  .thumb_func
  .weak SAI3_TX_IRQHandler
SAI3_TX_IRQHandler:
  b .

  .thumb_func
  .weak SPDIF_IRQHandler
SPDIF_IRQHandler:
  b .

  .thumb_func
  .weak USB_PHY1_IRQHandler
USB_PHY1_IRQHandler:
  b .

  .thumb_func
  .weak USB_PHY2_IRQHandler
USB_PHY2_IRQHandler:
  b .

  .thumb_func
  .weak ADC1_IRQHandler
ADC1_IRQHandler:
  b .

  .thumb_func
  .weak ADC2_IRQHandler
ADC2_IRQHandler:
  b .

  .thumb_func
  .weak DCDC_IRQHandler
DCDC_IRQHandler:
  b .

  .thumb_func
  .weak GPIO1_INT0_IRQHandler
GPIO1_INT0_IRQHandler:
  b .

  .thumb_func
  .weak GPIO1_INT1_IRQHandler
GPIO1_INT1_IRQHandler:
  b .

  .thumb_func
  .weak GPIO1_INT2_IRQHandler
GPIO1_INT2_IRQHandler:
  b .

  .thumb_func
  .weak GPIO1_INT3_IRQHandler
GPIO1_INT3_IRQHandler:
  b .

  .thumb_func
  .weak GPIO1_INT4_IRQHandler
GPIO1_INT4_IRQHandler:
  b .

  .thumb_func
  .weak GPIO1_INT5_IRQHandler
GPIO1_INT5_IRQHandler:
  b .

  .thumb_func
  .weak GPIO1_INT6_IRQHandler
GPIO1_INT6_IRQHandler:
  b .

  .thumb_func
  .weak GPIO1_INT7_IRQHandler
GPIO1_INT7_IRQHandler:
  b .

  .thumb_func
  .weak GPIO1_Combined_0_15_IRQHandler
GPIO1_Combined_0_15_IRQHandler:
  b .

  .thumb_func
  .weak GPIO1_Combined_16_31_IRQHandler
GPIO1_Combined_16_31_IRQHandler:
  b .

  .thumb_func
  .weak GPIO2_Combined_0_15_IRQHandler
GPIO2_Combined_0_15_IRQHandler:
  b .

  .thumb_func
  .weak GPIO2_Combined_16_31_IRQHandler
GPIO2_Combined_16_31_IRQHandler:
  b .

  .thumb_func
  .weak GPIO3_Combined_0_15_IRQHandler
GPIO3_Combined_0_15_IRQHandler:
  b .

  .thumb_func
  .weak GPIO3_Combined_16_31_IRQHandler
GPIO3_Combined_16_31_IRQHandler:
  b .

  .thumb_func
  .weak GPIO4_Combined_0_15_IRQHandler
GPIO4_Combined_0_15_IRQHandler:
  b .

  .thumb_func
  .weak GPIO4_Combined_16_31_IRQHandler
GPIO4_Combined_16_31_IRQHandler:
  b .

  .thumb_func
  .weak GPIO5_Combined_0_15_IRQHandler
GPIO5_Combined_0_15_IRQHandler:
  b .

  .thumb_func
  .weak GPIO5_Combined_16_31_IRQHandler
GPIO5_Combined_16_31_IRQHandler:
  b .

  .thumb_func
  .weak FLEXIO1_IRQHandler
FLEXIO1_IRQHandler:
  b .

  .thumb_func
  .weak FLEXIO2_IRQHandler
FLEXIO2_IRQHandler:
  b .

  .thumb_func
  .weak WDOG1_IRQHandler
WDOG1_IRQHandler:
  b .

  .thumb_func
  .weak RTWDOG_IRQHandler
RTWDOG_IRQHandler:
  b .

  .thumb_func
  .weak EWM_IRQHandler
EWM_IRQHandler:
  b .

  .thumb_func
  .weak CCM_1_IRQHandler
CCM_1_IRQHandler:
  b .

  .thumb_func
  .weak CCM_2_IRQHandler
CCM_2_IRQHandler:
  b .

  .thumb_func
  .weak GPC_IRQHandler
GPC_IRQHandler:
  b .

  .thumb_func
  .weak SRC_IRQHandler
SRC_IRQHandler:
  b .

  .thumb_func
  .weak GPT1_IRQHandler
GPT1_IRQHandler:
  b .

  .thumb_func
  .weak GPT2_IRQHandler
GPT2_IRQHandler:
  b .

  .thumb_func
  .weak PWM1_0_IRQHandler
PWM1_0_IRQHandler:
  b .

  .thumb_func
  .weak PWM1_1_IRQHandler
PWM1_1_IRQHandler:
  b .

  .thumb_func
  .weak PWM1_2_IRQHandler
PWM1_2_IRQHandler:
  b .

  .thumb_func
  .weak PWM1_3_IRQHandler
PWM1_3_IRQHandler:
  b .

  .thumb_func
  .weak PWM1_FAULT_IRQHandler
PWM1_FAULT_IRQHandler:
  b .

  .thumb_func
  .weak FLEXSPI_IRQHandler
FLEXSPI_IRQHandler:
  b .

  .thumb_func
  .weak SEMC_IRQHandler
SEMC_IRQHandler:
  b .

  .thumb_func
  .weak USDHC1_IRQHandler
USDHC1_IRQHandler:
  b .

  .thumb_func
  .weak USDHC2_IRQHandler
USDHC2_IRQHandler:
  b .

  .thumb_func
  .weak USB_OTG2_IRQHandler
USB_OTG2_IRQHandler:
  b .

  .thumb_func
  .weak USB_OTG1_IRQHandler
USB_OTG1_IRQHandler:
  b .

  .thumb_func
  .weak ENET_IRQHandler
ENET_IRQHandler:
  b .

  .thumb_func
  .weak ENET_1588_Timer_IRQHandler
ENET_1588_Timer_IRQHandler:
  b .

  .thumb_func
  .weak ADC_ETC_IRQ0_IRQHandler
ADC_ETC_IRQ0_IRQHandler:
  b .

  .thumb_func
  .weak ADC_ETC_IRQ1_IRQHandler
ADC_ETC_IRQ1_IRQHandler:
  b .

  .thumb_func
  .weak ADC_ETC_IRQ2_IRQHandler
ADC_ETC_IRQ2_IRQHandler:
  b .

  .thumb_func
  .weak ADC_ETC_ERROR_IRQHandler
ADC_ETC_ERROR_IRQHandler:
  b .

  .thumb_func
  .weak PIT_IRQHandler
PIT_IRQHandler:
  b .

  .thumb_func
  .weak ACMP1_IRQHandler
ACMP1_IRQHandler:
  b .

  .thumb_func
  .weak ACMP2_IRQHandler
ACMP2_IRQHandler:
  b .

  .thumb_func
  .weak ACMP3_IRQHandler
ACMP3_IRQHandler:
  b .

  .thumb_func
  .weak ACMP4_IRQHandler
ACMP4_IRQHandler:
  b .

  .thumb_func
  .weak ENC1_IRQHandler
ENC1_IRQHandler:
  b .

  .thumb_func
  .weak ENC2_IRQHandler
ENC2_IRQHandler:
  b .

  .thumb_func
  .weak ENC3_IRQHandler
ENC3_IRQHandler:
  b .

  .thumb_func
  .weak ENC4_IRQHandler
ENC4_IRQHandler:
  b .

  .thumb_func
  .weak TMR1_IRQHandler
TMR1_IRQHandler:
  b .

  .thumb_func
  .weak TMR2_IRQHandler
TMR2_IRQHandler:
  b .

  .thumb_func
  .weak TMR3_IRQHandler
TMR3_IRQHandler:
  b .

  .thumb_func
  .weak TMR4_IRQHandler
TMR4_IRQHandler:
  b .

  .thumb_func
  .weak PWM2_0_IRQHandler
PWM2_0_IRQHandler:
  b .

  .thumb_func
  .weak PWM2_1_IRQHandler
PWM2_1_IRQHandler:
  b .

  .thumb_func
  .weak PWM2_2_IRQHandler
PWM2_2_IRQHandler:
  b .

  .thumb_func
  .weak PWM2_3_IRQHandler
PWM2_3_IRQHandler:
  b .

  .thumb_func
  .weak PWM2_FAULT_IRQHandler
PWM2_FAULT_IRQHandler:
  b .

  .thumb_func
  .weak PWM3_0_IRQHandler
PWM3_0_IRQHandler:
  b .

  .thumb_func
  .weak PWM3_1_IRQHandler
PWM3_1_IRQHandler:
  b .

  .thumb_func
  .weak PWM3_2_IRQHandler
PWM3_2_IRQHandler:
  b .

  .thumb_func
  .weak PWM3_3_IRQHandler
PWM3_3_IRQHandler:
  b .

  .thumb_func
  .weak PWM3_FAULT_IRQHandler
PWM3_FAULT_IRQHandler:
  b .

  .thumb_func
  .weak PWM4_0_IRQHandler
PWM4_0_IRQHandler:
  b .

  .thumb_func
  .weak PWM4_1_IRQHandler
PWM4_1_IRQHandler:
  b .

  .thumb_func
  .weak PWM4_2_IRQHandler
PWM4_2_IRQHandler:
  b .

  .thumb_func
  .weak PWM4_3_IRQHandler
PWM4_3_IRQHandler:
  b .

  .thumb_func
  .weak PWM4_FAULT_IRQHandler
PWM4_FAULT_IRQHandler:
  b .

#endif

/*****************************************************************************
 * Vector Table                                                              *
 *****************************************************************************/

  .section .vectors, "ax"
  .align 0
  .global _vectors
  .extern __stack_end__
  .extern Reset_Handler

_vectors:
  .word __stack_end__
  .word Reset_Handler
  .word NMI_Handler
  .word HardFault_Handler
  .word 0 /* Reserved */
  .word 0 /* Reserved */
  .word 0 /* Reserved */
  .word 0 /* Reserved */
  .word 0 /* Reserved */
  .word 0 /* Reserved */
  .word 0 /* Reserved */
  .word SVC_Handler
  .word 0 /* Reserved */
  .word 0 /* Reserved */
  .word PendSV_Handler
  .word SysTick_Handler
  .word DMA0_DMA16_IRQHandler
  .word DMA1_DMA17_IRQHandler
  .word DMA2_DMA18_IRQHandler
  .word DMA3_DMA19_IRQHandler
  .word DMA4_DMA20_IRQHandler
  .word DMA5_DMA21_IRQHandler
  .word DMA6_DMA22_IRQHandler
  .word DMA7_DMA23_IRQHandler
  .word DMA8_DMA24_IRQHandler
  .word DMA9_DMA25_IRQHandler
  .word DMA10_DMA26_IRQHandler
  .word DMA11_DMA27_IRQHandler
  .word DMA12_DMA28_IRQHandler
  .word DMA13_DMA29_IRQHandler
  .word DMA14_DMA30_IRQHandler
  .word DMA15_DMA31_IRQHandler
  .word DMA_ERROR_IRQHandler
  .word Dummy_Handler /* Reserved */
  .word Dummy_Handler /* Reserved */
  .word Dummy_Handler /* Reserved */
  .word LPUART1_IRQHandler
  .word LPUART2_IRQHandler
  .word LPUART3_IRQHandler
  .word LPUART4_IRQHandler
  .word LPUART5_IRQHandler
  .word LPUART6_IRQHandler
  .word LPUART7_IRQHandler
  .word LPUART8_IRQHandler
  .word LPI2C1_IRQHandler
  .word LPI2C2_IRQHandler
  .word LPI2C3_IRQHandler
  .word LPI2C4_IRQHandler
  .word LPSPI1_IRQHandler
  .word LPSPI2_IRQHandler
  .word LPSPI3_IRQHandler
  .word LPSPI4_IRQHandler
  .word CAN1_IRQHandler
  .word CAN2_IRQHandler
  .word FLEXRAM_IRQHandler
  .word KPP_IRQHandler
  .word TSC_DIG_IRQHandler
  .word Dummy_Handler /* Reserved */
  .word LCDIF_IRQHandler
  .word CSI_IRQHandler
  .word PXP_IRQHandler
  .word WDOG2_IRQHandler
  .word SNVS_HP_WRAPPER_IRQHandler
  .word SNVS_HP_WRAPPER_TZ_IRQHandler
  .word SNVS_LP_WRAPPER_IRQHandler
  .word CSU_IRQHandler
  .word DCP_IRQHandler
  .word DCP_VMI_IRQHandler
  .word Dummy_Handler /* Reserved */
  .word TRNG_IRQHandler
  .word Dummy_Handler /* Reserved */
  .word BEE_IRQHandler
  .word SAI1_IRQHandler
  .word SAI2_IRQHandler
  .word SAI3_RX_IRQHandler
  .word SAI3_TX_IRQHandler
  .word SPDIF_IRQHandler
  .word Dummy_Handler /* Reserved */
  .word Dummy_Handler /* Reserved */
  .word Dummy_Handler /* Reserved */
  .word Dummy_Handler /* Reserved */
  .word USB_PHY1_IRQHandler
  .word USB_PHY2_IRQHandler
  .word ADC1_IRQHandler
  .word ADC2_IRQHandler
  .word DCDC_IRQHandler
  .word Dummy_Handler /* Reserved */
  .word Dummy_Handler /* Reserved */
  .word GPIO1_INT0_IRQHandler
  .word GPIO1_INT1_IRQHandler
  .word GPIO1_INT2_IRQHandler
  .word GPIO1_INT3_IRQHandler
  .word GPIO1_INT4_IRQHandler
  .word GPIO1_INT5_IRQHandler
  .word GPIO1_INT6_IRQHandler
  .word GPIO1_INT7_IRQHandler
  .word GPIO1_Combined_0_15_IRQHandler
  .word GPIO1_Combined_16_31_IRQHandler
  .word GPIO2_Combined_0_15_IRQHandler
  .word GPIO2_Combined_16_31_IRQHandler
  .word GPIO3_Combined_0_15_IRQHandler
  .word GPIO3_Combined_16_31_IRQHandler
  .word GPIO4_Combined_0_15_IRQHandler
  .word GPIO4_Combined_16_31_IRQHandler
  .word GPIO5_Combined_0_15_IRQHandler
  .word GPIO5_Combined_16_31_IRQHandler
  .word FLEXIO1_IRQHandler
  .word FLEXIO2_IRQHandler
  .word WDOG1_IRQHandler
  .word RTWDOG_IRQHandler
  .word EWM_IRQHandler
  .word CCM_1_IRQHandler
  .word CCM_2_IRQHandler
  .word GPC_IRQHandler
  .word SRC_IRQHandler
  .word Dummy_Handler /* Reserved */
  .word GPT1_IRQHandler
  .word GPT2_IRQHandler
  .word PWM1_0_IRQHandler
  .word PWM1_1_IRQHandler
  .word PWM1_2_IRQHandler
  .word PWM1_3_IRQHandler
  .word PWM1_FAULT_IRQHandler
  .word Dummy_Handler /* Reserved */
  .word FLEXSPI_IRQHandler
  .word SEMC_IRQHandler
  .word USDHC1_IRQHandler
  .word USDHC2_IRQHandler
  .word USB_OTG2_IRQHandler
  .word USB_OTG1_IRQHandler
  .word ENET_IRQHandler
  .word ENET_1588_Timer_IRQHandler
  .word Dummy_Handler /* Reserved */
  .word Dummy_Handler /* Reserved */
  .word ADC_ETC_IRQ0_IRQHandler
  .word ADC_ETC_IRQ1_IRQHandler
  .word ADC_ETC_IRQ2_IRQHandler
  .word ADC_ETC_ERROR_IRQHandler
  .word PIT_IRQHandler
  .word ACMP1_IRQHandler
  .word ACMP2_IRQHandler
  .word ACMP3_IRQHandler
  .word ACMP4_IRQHandler
  .word Dummy_Handler /* Reserved */
  .word Dummy_Handler /* Reserved */
  .word ENC1_IRQHandler
  .word ENC2_IRQHandler
  .word ENC3_IRQHandler
  .word ENC4_IRQHandler
  .word TMR1_IRQHandler
  .word TMR2_IRQHandler
  .word TMR3_IRQHandler
  .word TMR4_IRQHandler
  .word PWM2_0_IRQHandler
  .word PWM2_1_IRQHandler
  .word PWM2_2_IRQHandler
  .word PWM2_3_IRQHandler
  .word PWM2_FAULT_IRQHandler
  .word PWM3_0_IRQHandler
  .word PWM3_1_IRQHandler
  .word PWM3_2_IRQHandler
  .word PWM3_3_IRQHandler
  .word PWM3_FAULT_IRQHandler
  .word PWM4_0_IRQHandler
  .word PWM4_1_IRQHandler
  .word PWM4_2_IRQHandler
  .word PWM4_3_IRQHandler
  .word PWM4_FAULT_IRQHandler
_vectors_end:

#ifdef VECTORS_IN_RAM
  .section .vectors_ram, "ax"
  .align 0
  .global _vectors_ram

_vectors_ram:
  .space _vectors_end - _vectors, 0
#endif
