/******************************************************************************
*
* Copyright (C) 2009 - 2014 Xilinx, Inc.  All rights reserved.
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in
* all copies or substantial portions of the Software.
*
* Use of the Software is limited solely to applications:
* (a) running on a Xilinx device, or
* (b) that interact with a Xilinx device through a bus or interconnect.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
* XILINX  BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
* WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF
* OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
* SOFTWARE.
*
* Except as contained in this notice, the name of the Xilinx shall not be used
* in advertising or otherwise to promote the sale, use or other dealings in
* this Software without prior written authorization from Xilinx.
*
******************************************************************************/


#include "include.h"

int XGpioSetup(XGpio *InstancePtr, u16 DeviceId)
{
	int Status ;

	Status = XGpio_Initialize(InstancePtr, DeviceId) ;
	if (Status != XST_SUCCESS)
	{
		return XST_FAILURE ;
	}
	/* set as output */
    XGpio_SetDataDirection(InstancePtr, 1, 0x0);
    if(InstancePtr->IsDual == TRUE)
    {
	   XGpio_SetDataDirection(InstancePtr, 2, 0x0);
    }

	return XST_SUCCESS ;
}

void video_resolution_print(char *info,u32 baseaddr)
{
	xil_printf("-%s freq: %d -\r\n", info, AXI_LITE_REG_mReadReg(baseaddr, AXI_LITE_REG_S00_AXI_SLV_REG2_OFFSET));
	xil_printf("-%s res: %dx%d -\r\n", info, AXI_LITE_REG_mReadReg(baseaddr, AXI_LITE_REG_S00_AXI_SLV_REG0_OFFSET),\
											 AXI_LITE_REG_mReadReg(baseaddr, AXI_LITE_REG_S00_AXI_SLV_REG1_OFFSET));
}

void uart_receive_process(void)
{

	if (!XUartLite_IsReceiveEmpty(XPAR_UARTLITE_0_BASEADDR))
	{
		// Read data from uart
		u8 Data;
		Data = XUartLite_RecvByte(XPAR_UARTLITE_0_BASEADDR);

		if((Data == 'd') || (Data == 'D'))
		{
			XGpio_DiscreteWrite(&XGpioInst, 1, 1);
			xil_printf("\r\n!!!!!!!!!!!!!!!!!!!!!!!!\r\n");

			xil_printf("------------------------\r\n");
			video_resolution_print("video out",XPAR_AXIS_PASSTHROUGH_MON_0_S00_AXI_BASEADDR);

			xil_printf("------------------------\r\n");
		}


		while(!XUartLite_IsTransmitEmpty(XPAR_UARTLITE_0_BASEADDR));
		XGpio_DiscreteWrite(&XGpioInst, 1, 0);
	}
}


//写彩条函数
void colorbar(u8 *frame, u32 width, u32 height, u32 stride)
{
	u32 color_edge, colorbar_2, colorbar_3, colorbar_4, colorbar_5;
	u32 x_pos, y_pos;
	u32 y_stride = 0;
	u32 rgb = 0;
	u8 BYTES_PIXEL = 3;

    color_edge = width * BYTES_PIXEL / 5;
    colorbar_2 = color_edge * 2;
    colorbar_3 = color_edge * 3;
    colorbar_4 = color_edge * 4;
    colorbar_5 = color_edge * 5;

	//开始写彩条
	xil_printf("write color star \r\n");
    for (y_pos = 0; y_pos < height; y_pos++) {
    	for (x_pos = 0; x_pos < width * BYTES_PIXEL; x_pos += BYTES_PIXEL) {
    		if (x_pos < color_edge) {													//白色
                rgb = 0xffffff;
    		} else if ((x_pos >= color_edge) && (x_pos < colorbar_2)) {    				//黑色
                rgb = 0x0;
    		} else if ((x_pos >= colorbar_2) && (x_pos < colorbar_3)) { 				//红色
                rgb = 0xff0000;
    		} else if ((x_pos >= colorbar_3) && (x_pos < colorbar_4)) { 				//绿色
                rgb = 0x08000;
    		} else if ((x_pos >= colorbar_4) && (x_pos < colorbar_5)) { 				//蓝色
                rgb = 0x0000ff;
    		}
            frame[x_pos + y_stride + 0] = rgb;
			frame[x_pos + y_stride + 1] = rgb>>8;
			frame[x_pos + y_stride + 2] = rgb>>16;
    	}
        y_stride += stride;
    }
    Xil_DCacheFlush();                  //刷新Cache，数据更新至DDR3中
	xil_printf("show color bar\r\n");
}

int main()
{
/***********************init_begin*****************************/
	init_platform();
    XGpioSetup(&XGpioInst,XPAR_AXI_GPIO_0_DEVICE_ID);
    XGpio_DiscreteWrite(&XGpioInst, 1, 1);

	xil_printf("\r\n********************************\r\n");
#if (defined UDP_UPDATE)
	xil_printf("udp updata \n\r");
#endif
	xil_printf("A7 1920*720\n\r");

#ifdef XPAR_AXI_LITE_REG_NUM_INSTANCES
	if(XPAR_PS_SYSTEM_AXI_LITE_REG_0_DEVICE_ID==0)
	{
		hardware_version = AXI_LITE_REG_mReadReg(XPAR_PS_SYSTEM_AXI_LITE_REG_0_S00_AXI_BASEADDR,AXI_LITE_REG_S00_AXI_SLV_REG0_OFFSET);
		xil_printf("\r\nhardware ver = 0x%08x\r\n",hardware_version);
	}
#endif
//	xil_printf("\r\nsoftware ver = 0x%08x\r\n", __SW_VER__);
    xil_printf("\r\n%s,%s\r\n",__DATE__,__TIME__);
	xil_printf("\r\n********************************\r\n");



#ifdef XPAR_XV_TPG_NUM_INSTANCES
	tpg_config();
#endif
	clkwiz_vtc_cfg();
//	clear_display();
	vdma_config();

	colorbar((u8*)(XPAR_MIG_7SERIES_0_BASEADDR + (0x10000000)), 1920,720,1920*3);

	xil_printf("start\r\n");
	xil_printf("\r\n");
#if (defined RS485_CTL)
	xil_printf("----------------------\r\n");
	xil_printf("----------------------\r\n");
	print("input :\n\r");
	xil_printf("d - detect info\r\n");
	xil_printf("----------------------\r\n");
	xil_printf("\r\n");
	while(!XUartLite_IsTransmitEmpty(XPAR_UARTLITE_0_BASEADDR));
	XGpio_DiscreteWrite(&XGpioInst, 1, 0);
#endif
    while(1)
    {

#if (defined RS485_CTL)
    	uart_receive_process();
#endif

    }
    cleanup_platform();
    return 0;
}
