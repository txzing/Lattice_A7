#ifndef __SRC_INCLUDE_H__
#define __SRC_INCLUDE_H__

#include <string.h>
#include <stdio.h>
#include <ctype.h>
#include "platform.h"
#include "xparameters.h"
#include "platform.h"
#include "platform_config.h"
#if defined (__arm__) || defined(__aarch64__)
#include "xil_printf.h"
#endif
#include "xil_types.h"
#include "xstatus.h"
#include "clk_wiz/clk_wiz.h"
#include "tpg/tpg.h"
#include "xvtc.h"
#include "vtc/video_resolution.h"
#include "vtc/vtiming_gen.h"
#include "xil_exception.h"
#include "bitmanip.h"
#include "config.h"
#include "xgpio.h"
#include "sleep.h"
#include "xuartlite_l.h"
#include "xil_cache.h"
#include "xil_printf.h"
#include "vdma/vdma.h"
#include "axis_switch/axis_switch.h"
#include "axis_passthrough_monitor.h"

//#include "vpss/vpss.h"
//#include "demosaic/demosaic.h"
//#include "gamma/gamma_lut.h"
//#include "eeprom/eeprom.h"
//#include "serdes_table.h"


/*
 *global variable
 */
u32 ret32;
u8 ret8=0;
u8 menu_level=0;
u32 hardware_version;

#define XUartLite_IsTransmitEmpty(BaseAddress) \
	((XUartLite_GetStatusReg((BaseAddress)) & XUL_SR_TX_FIFO_EMPTY) == \
		XUL_SR_TX_FIFO_EMPTY)

XGpio  XGpioInst;

#ifdef XPAR_XAXIS_SWITCH_NUM_INSTANCES
extern XAxis_Switch AxisSwitch0;
extern XAxis_Switch AxisSwitch1;
extern XAxis_Switch AxisSwitch2;
extern XAxis_Switch AxisSwitch3;
#endif

#endif
