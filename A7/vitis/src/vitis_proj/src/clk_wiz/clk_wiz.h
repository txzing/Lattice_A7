#ifndef __CLK_WIZ_H__
#define __CLK_WIZ_H__

#include "xparameters.h"
#ifdef XPAR_XCLK_WIZ_NUM_INSTANCES

#include "xil_types.h"
#include "xclk_wiz.h"

#define CLK_LOCK			1

int Wait_For_Lock(XClk_Wiz_Config *CfgPtr_Dynamic);
int XClk_Wiz_dynamic_reconfig(XClk_Wiz * ClkWizInstance, u32 DeviceId);
void clkwiz_vtc_cfg(void);

#endif

#endif
