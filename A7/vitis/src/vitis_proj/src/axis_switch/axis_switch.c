#include "xil_printf.h"
#include "../config.h"
#include "axis_switch.h"


#include "xparameters.h"
#ifdef XPAR_XAXIS_SWITCH_NUM_INSTANCES

#include "xaxis_switch.h"

XAxis_Switch AxisSwitch0;
XAxis_Switch AxisSwitch1;
XAxis_Switch AxisSwitch2;

int AxisSwitch(u16 DeviceId, XAxis_Switch * pAxisSwitch, u8 MiIndex, u8 SiIndex)
{
    XAxis_Switch_Config *Config;
    int Status;


    /* Initialize the AXI4-Stream Switch driver so that it's ready to
     * use look up configuration in the config table, then
     * initialize it.
     */
    Config = XAxisScr_LookupConfig(DeviceId);
    if (NULL == Config) {
        return XST_FAILURE;
    }

    Status = XAxisScr_CfgInitialize(pAxisSwitch, Config,
                        Config->BaseAddress);
    if (Status != XST_SUCCESS) {
        xil_printf("AXI4-Stream initialization failed.\r\n");
        return XST_FAILURE;
    }

    /* Disable register update */
    XAxisScr_RegUpdateDisable(pAxisSwitch);

    /* Disable all MI ports */
    XAxisScr_MiPortDisableAll(pAxisSwitch);

    /* Source SI[1] to MI[0] */
    XAxisScr_MiPortEnable(pAxisSwitch, MiIndex, SiIndex);

    /* Enable register update */
    XAxisScr_RegUpdateEnable(pAxisSwitch);

    /* Check for MI port enable */
    Status = XAxisScr_IsMiPortEnabled(pAxisSwitch, MiIndex, SiIndex);
    if (Status) {
        xil_printf("Switch: MI[%d] is sourced from SI[%d].\r\n", MiIndex, SiIndex);
    }

    return XST_SUCCESS;
}

void axis_switch_cfg(void)
{
    AxisSwitch(XPAR_AXIS_SWITCH_0_DEVICE_ID, &AxisSwitch0, 0, 1); // tpg
//    AxisSwitch(XPAR_AXIS_SWITCH_0_DEVICE_ID, &AxisSwitch0, 0, 0); // SD

    AxisSwitch(XPAR_AXIS_SWITCH_1_DEVICE_ID, &AxisSwitch1, 0, 1); // tpg
//	AxisSwitch(XPAR_AXIS_SWITCH_1_DEVICE_ID, &AxisSwitch1, 0, 0); // SD

}
#endif

