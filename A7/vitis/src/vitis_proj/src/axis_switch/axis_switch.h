#ifndef __AXIS_SWITCH_H__
#define __AXIS_SWITCH_H__

#include "xparameters.h"
#ifdef XPAR_XAXIS_SWITCH_NUM_INSTANCES

#include "xaxis_switch.h"

int AxisSwitch(u16 DeviceId, XAxis_Switch * pAxisSwitch, u8 MiIndex, u8 SiIndex);
void axis_switch_cfg(void);


#endif

#endif
