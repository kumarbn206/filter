//
// Script to switch on ADPLL and all clock except the RF-BIST clock
//
// If OTP values are available, please write them into the following registers
// MCGEN.ADPLL_SET_IREF
// MCGEN.FREQ_DET_CAL_OV
// MCGEN.FREQ_DET_CAL_UND

MCGEN.PON_CTL.PON_LS_MCGEN=1;
sleep(100);
// check for POR signal of MCGEN
sleep_bv(MCGEN.MCGEN_STATUS.MCGEN_0V9_ANA_OK,1);
// RESET XO FUSA
MCGEN.TEST_RESET_ERROR.XO_DET_PLLCLK_RESET=1;
MCGEN.TEST_RESET_ERROR.XO_DET_CLKIN_RESET=1;
MCGEN.TEST_RESET_ERROR.XO_DET_CHIRPREFCLK_RESET=1;
MCGEN.TEST_RESET_ERROR.XO_DET_XOCLK_RESET=1;
sleep(10);
MCGEN.TEST_RESET_ERROR.XO_DET_PLLCLK_RESET=0;
MCGEN.TEST_RESET_ERROR.XO_DET_CLKIN_RESET=0;
MCGEN.TEST_RESET_ERROR.XO_DET_CHIRPREFCLK_RESET=0;
MCGEN.TEST_RESET_ERROR.XO_DET_XOCLK_RESET=0;
sleep(10);
// Enable AD-PLL on
// check input clock for ADPLL
sleep_bv(MCGEN.ERROR_STATUS.XO_DET_PLLCLK_ERROR,0);
MCGEN.LDO_ADPLL_DIG.ADPLL_ENA_LDO_DIG=1;
sleep(100);
// check POR of ADPLL digital
sleep_bv(MCGEN.ADPLL_STATUS.ADPLL_OUT_VDD_0V9_DIG_OK,1);
MCGEN.ADPLL_CTL.ADPLL_RST_N=1;

// init sequence of AD-PLL
ADPLL.DCO_CTRL.CTRL_DCO_AMPL=0x05;
ADPLL.LOOP_FILTER_MISC.HALF_INTEGER_MODE=0x0;
ADPLL.LOCK_DET_CONTROL_1.LOCK_DET_KHP=0x2;
ADPLL.TEST_PVT_DATA.SW_LOOP_TIME=0x01;
ADPLL.TEST_ACQ_DATA.HW_LOOP_TIME=0x01;
ADPLL.TR_TIMER_VALUE.TR_STEP=0x10;
ADPLL.LOOP_FILTER_MISC.TR_LOCK_TARGET=0x6D9;
ADPLL.LOOP_FILTER_MISC.DRIFT_COMP_ENABLE=0x1;
ADPLL.DPLL_TEST_CONFIG.DRIFT_THRESHOLD_H=0x2E8;
ADPLL.DPLL_TEST_CONFIG.DRIFT_THRESHOLD_L=0x2CA;
ADPLL.DATA_STROBE.STROBE=1;
sleep(300);
// check for lock of AD-PLL
sleep_bv(MCGEN.ADPLL_STATUS.ADPLL_LOCK_DET,1);
// disable write lock
MCGEN.WRITE_LOCK_CTL.MCGEN_WRITE_LOCK=0xAA551234;
MCGEN.WRITE_LOCK_CTL.MCGEN_WRITE_LOCK=0x32415A5A;
MCGEN.BUFFER_ALWAYS_ON.CLKGATE_640M=0;
sleep(10);
// reset ADPLL FUSA LATCHES
MCGEN.TEST_RESET_ERROR.GLITCH_DET_RESET=1;
MCGEN.TEST_RESET_ERROR.FREQ_DET_OV_RESET=1;
MCGEN.TEST_RESET_ERROR.FREQ_DET_UND_RESET=1;
MCGEN.TEST_RESET_ERROR.DC_DET_LOW_RESET=1;
MCGEN.TEST_RESET_ERROR.DC_DET_HIGH_RESET=1;
MCGEN.TEST_RESET_ERROR.ADPLL_LOCK_RESET=1;
MCGEN.TEST_RESET_ERROR.ADPLL_DCO_LVL_MAX_RESET=1;
MCGEN.TEST_RESET_ERROR.ADPLL_DCO_LVL_MIN_RESET=1;
MCGEN.TEST_RESET_ERROR.ADPLL_FREQ_DET_RESET=1;
// unset reset registers
MCGEN.TEST_RESET_ERROR.GLITCH_DET_RESET=0;
MCGEN.TEST_RESET_ERROR.FREQ_DET_OV_RESET=0;
MCGEN.TEST_RESET_ERROR.FREQ_DET_UND_RESET=0;
MCGEN.TEST_RESET_ERROR.DC_DET_LOW_RESET=0;
MCGEN.TEST_RESET_ERROR.DC_DET_HIGH_RESET=0;
MCGEN.TEST_RESET_ERROR.ADPLL_LOCK_RESET=0;
MCGEN.TEST_RESET_ERROR.ADPLL_DCO_LVL_MAX_RESET=0;
MCGEN.TEST_RESET_ERROR.ADPLL_DCO_LVL_MIN_RESET=0;
MCGEN.TEST_RESET_ERROR.ADPLL_FREQ_DET_RESET=0;
// enable write lock again
MCGEN.WRITE_LOCK_CTL.MCGEN_WRITE_LOCK=0xAA551234;

