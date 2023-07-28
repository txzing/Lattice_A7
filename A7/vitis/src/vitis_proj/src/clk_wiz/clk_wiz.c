#include "clk_wiz.h"
#include "xparameters.h"
#include "xstatus.h"
#include "../config.h"
#include "../vtc/vtiming_gen.h"
#include "../vtc/video_resolution.h"
#ifdef  XPAR_XCLK_WIZ_NUM_INSTANCES

XClk_Wiz ClkWizInst0;
XVtc        VtcInst0;       /**< Instance of the VTC core. */
XVtc_Config *VtcConfig0;

XClk_Wiz ClkWizInst1;
XVtc        VtcInst1;       /**< Instance of the VTC core. */
XVtc_Config *VtcConfig1;

XClk_Wiz ClkWiz_Dynamic; /* The instance of the ClkWiz_Dynamic */

/*****************************************************************************/
/**
 *
 * This is the Wait_For_Lock function, it will wait for lock to settle change
 * frequency value
 *
 * @param	CfgPtr_Dynamic provides pointer to clock wizard dynamic config
 *
 * @return
 *		- Error 0 for pass scenario
 *		- Error > 0 for failure scenario
 *
 * @note		None
 *
 ******************************************************************************/
int Wait_For_Lock(XClk_Wiz_Config *CfgPtr_Dynamic)
{
    u32 Count = 0;
    u32 Error = 0;

    while(!(*(u32 *) (CfgPtr_Dynamic->BaseAddr + 0x04) & CLK_LOCK))
    {
        if(Count == 10000)
        {
            Error++;
            break;
        }
        Count++;
    }
    return Error;
}

/*****************************************************************************/
/**
 *
 * XClk_Wiz wizard dynamic reconfig.
 *
 * @param	None.
 *
 * @return
 *		- XST_SUCCESS if XClk_Wiz dynamic reconfig ran successfully.
 *		- XST_FAILURE if XClk_Wiz dynamic reconfig failed.
 *
 * @note		None.
 *
 ****************************************************************************/
int XClk_Wiz_dynamic_reconfig(XClk_Wiz * ClkWizInstance, u32 DeviceId)
{
    XClk_Wiz_Config *CfgPtr_Dynamic;
    u32 Count = 0;
    u32 Divide = 0;
    u32 Multiply_Int = 0;
    u32 Multiply_Frac = 0;
    u32 Divide0_Int = 0;
    u32 Divide0_Frac = 0;
    u32 Divide1_Int = 0;
    u32 Divide1_Frac = 0;
    u32 Divide2_Int = 0;
    u32 Divide2_Frac = 0;
    u32 Divide3_Int = 0;
    u32 Divide3_Frac = 0;
    int Status;

    /*
     * Get the CLK_WIZ Dynamic reconfiguration driver instance
     */
    CfgPtr_Dynamic = XClk_Wiz_LookupConfig(DeviceId);
    if(!CfgPtr_Dynamic)
    {
        return XST_FAILURE;
    }

    /*
     * Initialize the CLK_WIZ Dynamic reconfiguration driver
     */
    Status = XClk_Wiz_CfgInitialize(ClkWizInstance, CfgPtr_Dynamic, CfgPtr_Dynamic->BaseAddr);
    if(Status != XST_SUCCESS)
    {
        return XST_FAILURE;
    }

    Status = Wait_For_Lock(CfgPtr_Dynamic);
    if(Status)
    {
        xil_printf("\n ERROR: Clock is not locked for default frequency"
                   " : 0x%x\n\r",
                   *(u32 *) (CfgPtr_Dynamic->BaseAddr + 0x04) & CLK_LOCK);
    }

    /* SW reset applied */
    *(u32 *) (CfgPtr_Dynamic->BaseAddr + 0x00) = 0xA;

    if(*(u32 *) (CfgPtr_Dynamic->BaseAddr + 0x04) & CLK_LOCK)
    {
        xil_printf("\n ERROR: Clock is locked : 0x%x \t expected "
                   "0x00\n\r",
                   *(u32 *) (CfgPtr_Dynamic->BaseAddr + 0x04) & CLK_LOCK);
    }

    /* Wait cycles after SW reset */
    for(Count = 0; Count < 2000; Count++)
        ;

    Status = Wait_For_Lock(CfgPtr_Dynamic);
    if(Status)
    {
        xil_printf("\n ERROR: Clock is not locked after SW reset :"
                   "0x%x \t Expected  : 0x1\n\r",
                   *(u32 *) (CfgPtr_Dynamic->BaseAddr + 0x04) & CLK_LOCK);
    }
#if (defined R1080P60)
    // in=200
    // out1 148.5
    Multiply_Int = 37;
    Multiply_Frac = 125;
    Divide = 5;
    Divide0_Int = 10;
    Divide0_Frac = 0;

#elif (defined R4K30W)
    //in=200
    //out1 297
    Multiply_Int = 37;
    Multiply_Frac = 125;
    Divide = 5;
    Divide0_Int = 5;
    Divide0_Frac = 0;


#else

//in 200
//out1 90
//out2 225
//out3 450
	Multiply_Int = 4;
	Multiply_Frac = 5;
	Divide = 1;
	Divide0_Int = 10;
	Divide0_Frac = 0;
    Divide1_Int = 4;
    Divide1_Frac = 0;
    Divide2_Int = 2;
    Divide2_Frac = 0;
//    Divide3_Int = 4;
//    Divide3_Frac = 0;

#endif

    /* Configuring Multiply and Divide values */
    *(u32 *) (CfgPtr_Dynamic->BaseAddr + 0x200) = (Multiply_Frac << 16) | (Multiply_Int << 8) | Divide;
    *(u32 *) (CfgPtr_Dynamic->BaseAddr + 0x204) = 0x00;

    /* Configuring Multiply and Divide values */
    *(u32 *) (CfgPtr_Dynamic->BaseAddr + 0x208) = (Divide0_Frac << 8) | Divide0_Int;
    *(u32 *) (CfgPtr_Dynamic->BaseAddr + 0x20C) = 0x00;

   /* Configuring Multiply and Divide values */
   *(u32 *) (CfgPtr_Dynamic->BaseAddr + 0x214) = (Divide1_Frac << 8) | Divide1_Int;
   *(u32 *) (CfgPtr_Dynamic->BaseAddr + 0x218) = 0x00;

   /* Configuring Multiply and Divide values */
   *(u32 *) (CfgPtr_Dynamic->BaseAddr + 0x220) = (Divide2_Frac << 8) | Divide2_Int;
   *(u32 *) (CfgPtr_Dynamic->BaseAddr + 0x224) = 0x00;

    /* Configuring Multiply and Divide values */
//    *(u32 *) (CfgPtr_Dynamic->BaseAddr + 0x22C) = (Divide3_Frac << 8) | Divide3_Int;
//    *(u32 *) (CfgPtr_Dynamic->BaseAddr + 0x230) = 0x00;

    /* Load Clock Configuration Register values */
    *(u32 *) (CfgPtr_Dynamic->BaseAddr + 0x25C) = 0x07;

    if(*(u32 *) (CfgPtr_Dynamic->BaseAddr + 0x04) & CLK_LOCK)
    {
        xil_printf("\n ERROR: Clock is locked : 0x%x \t expected "
                   "0x00\n\r",
                   *(u32 *) (CfgPtr_Dynamic->BaseAddr + 0x04) & CLK_LOCK);
    }

    /* Clock Configuration Registers are used for dynamic reconfiguration */
    *(u32 *) (CfgPtr_Dynamic->BaseAddr + 0x25C) = 0x02;

    Status = Wait_For_Lock(CfgPtr_Dynamic);
    if(Status)
    {
        xil_printf("\n ERROR: Clock is not locked : 0x%x \t Expected "
                   ": 0x1\n\r",
                   *(u32 *) (CfgPtr_Dynamic->BaseAddr + 0x04) & CLK_LOCK);
    }

    return XST_SUCCESS;
}

void clkwiz_vtc_cfg(void)
{
    u32 Status;
    // dynamic config clkwiz
    Status = XClk_Wiz_dynamic_reconfig(&ClkWizInst0, XPAR_CLK_WIZ_0_DEVICE_ID);
    if (Status != XST_SUCCESS)
    {
      xil_printf("XClk_Wiz0 dynamic reconfig failed.\r\n");
//      return XST_FAILURE;
    }
    //xil_printf("XClk_Wiz0 dynamic reconfig ok\n\r");

    // vtc configuration
    VtcConfig0 = XVtc_LookupConfig(XPAR_VTC_0_DEVICE_ID);
    Status = XVtc_CfgInitialize(&VtcInst0, VtcConfig0, VtcConfig0->BaseAddress);
    if(Status != XST_SUCCESS)
    {
        xil_printf("VTC0 Initialization failed %d\r\n", Status);
//      return(XST_FAILURE);
    }

    vtiming_gen_run(&VtcInst0, VISTEON_1920_720, 1);

/*******************************************************************************/

}

#endif
