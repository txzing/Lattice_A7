/*
 * tpg.c
 *
 *  Created on: Apr 30, 2021
 *      Author: andreas
 */


#include "tpg.h"
#include "xparameters.h"
#ifdef XPAR_XV_TPG_NUM_INSTANCES
#include "../config.h"
#include "xvidc.h"


/************************** Function Definitions *****************************/

/*****************************************************************************/
/**
*
* This function configures the TPG core.
* @param	InstancePtr is a pointer to the TPG core instance to be
*		worked on.
* @param	height is the output video height
* @param	width is the output video width
* @param	colorFormat is the output colorFormat
* @param	bckgndId is the ID for the background
*
*
******************************************************************************/
void tpg_cfg(XV_tpg *InstancePtr, u32 height, u32 width, u32 colorFormat, u32 bckgndId)
{
	// Stop TPG
	XV_tpg_DisableAutoRestart(InstancePtr);

	// Set Resolution
    XV_tpg_Set_height(InstancePtr, height);
    XV_tpg_Set_width(InstancePtr, width);

    // Set Color Space
    XV_tpg_Set_colorFormat(InstancePtr, colorFormat);

    // Change the pattern to color bar
    XV_tpg_Set_bckgndId(InstancePtr, bckgndId);

    // Enable overlay
    XV_tpg_Set_ovrlayId(InstancePtr, 0);
}

/*****************************************************************************/
/**
*
* This function sets up the moving box of the TPG core.
* @param	InstancePtr is a pointer to the TPG core instance to be
*		worked on.
* @param	boxSize is the size of the moving box
* @param	motionSpeed is the speed of the moving box
*
*
******************************************************************************/
void tpg_box(XV_tpg *InstancePtr, u32 boxSize, u32 motionSpeed)
{
    // Set Overlay to moving box
    // Set the size of the box
    XV_tpg_Set_boxSize(InstancePtr, boxSize);
    // Set the speed of the box
    XV_tpg_Set_motionSpeed(InstancePtr, motionSpeed);
    // Enable the moving box
    XV_tpg_Set_ovrlayId(InstancePtr, 1);

}

XV_tpg 			tpg_inst0;
XV_tpg_Config 	*tpg_config0;
XV_tpg          tpg_inst1;
XV_tpg_Config   *tpg_config1;

XVidC_ColorFormat colorFmtIn0 = XVIDC_CSF_RGB;
XVidC_ColorFormat colorFmtOut0 = XVIDC_CSF_RGB;
XVidC_ColorFormat colorFmtIn1 = XVIDC_CSF_RGB;
XVidC_ColorFormat colorFmtOut1 = XVIDC_CSF_RGB;
u32 bckgndId0=XTPG_BKGND_COLOR_BARS;
u32 bckgndId1=XTPG_BKGND_ZONE_PLATE;

void tpg_config(void)
{
     u32 Status;

    // tpg0
    xil_printf("TPG0 Initializing\n\r");

    Status = XV_tpg_Initialize(&tpg_inst0, XPAR_XV_TPG_0_DEVICE_ID);
    if(Status!= XST_SUCCESS)
    {
        xil_printf("TPG0 configuration failed\r\n");
//      return(XST_FAILURE);
    }

    tpg_cfg(&tpg_inst0, 720, 1920, colorFmtIn0, bckgndId0);
//    tpg_cfg(&tpg_inst0, 2160, 3840, colorFmtIn0, bckgndId0);

    //Configure the moving box of the TPG0
    tpg_box(&tpg_inst0, 50, 1);

    XV_tpg_EnableAutoRestart(&tpg_inst0);
    XV_tpg_Start(&tpg_inst0);
    xil_printf("TPG0 started!\r\n");

/******************************************/
    //Start the TPG1
    // tpg1
    xil_printf("TPG1 Initializing\n\r");

    Status = XV_tpg_Initialize(&tpg_inst1, XPAR_XV_TPG_1_DEVICE_ID);
    if(Status!= XST_SUCCESS)
    {
        xil_printf("TPG1 configuration failed\r\n");
//      return(XST_FAILURE);
    }

    tpg_cfg(&tpg_inst1, 720, 1920, colorFmtIn1, bckgndId1);
//    tpg_cfg(&tpg_inst0, 2160, 3840, colorFmtIn0, bckgndId0);

    //Configure the moving box of the TPG0
    tpg_box(&tpg_inst1, 50, 1);

    //Start the TPG0
    XV_tpg_EnableAutoRestart(&tpg_inst1);
    XV_tpg_Start(&tpg_inst1);
    xil_printf("TPG1 started!\r\n");

}
#endif
