#include "xil_printf.h"
#include "vdma.h"
#include "../config.h"
#ifdef XPAR_XAXIVDMA_NUM_INSTANCES

#define DDR_BASEADDR XPAR_MIG_7SERIES_0_BASEADDR
#define FRAME_BUFFER_BASE_ADDR  	(DDR_BASEADDR + (0x10000000))
//#define USR_FRAME_BUF_BASEADDR     	(DDR_BASEADDR + (0x20000000))

//#define FRAME_BUFFER_SIZE0      0x2000000    //0x2000000 for max 4KW RGB888 8bpc
#define FRAME_BUFFER_SIZE0      0x600000    //0x600000 for max 1080p RGB888 8bpc

#define FRAME_BUFFER_1          FRAME_BUFFER_BASE_ADDR
#define FRAME_BUFFER_2          FRAME_BUFFER_BASE_ADDR + FRAME_BUFFER_SIZE0
#define FRAME_BUFFER_3          FRAME_BUFFER_BASE_ADDR + (FRAME_BUFFER_SIZE0*2)
#define FRAME_BUFFER_4          FRAME_BUFFER_BASE_ADDR + (FRAME_BUFFER_SIZE0*3)
#define FRAME_BUFFER_5          FRAME_BUFFER_BASE_ADDR + (FRAME_BUFFER_SIZE0*4)
#define FRAME_BUFFER_6          FRAME_BUFFER_BASE_ADDR + (FRAME_BUFFER_SIZE0*5)
#define FRAME_BUFFER_7          FRAME_BUFFER_BASE_ADDR + (FRAME_BUFFER_SIZE0*6)
#define FRAME_BUFFER_8          FRAME_BUFFER_BASE_ADDR + (FRAME_BUFFER_SIZE0*7)
#define FRAME_BUFFER_9          FRAME_BUFFER_BASE_ADDR + (FRAME_BUFFER_SIZE0*8)
#define FRAME_BUFFER_10         FRAME_BUFFER_BASE_ADDR + (FRAME_BUFFER_SIZE0*9)
#define FRAME_BUFFER_11         FRAME_BUFFER_BASE_ADDR + (FRAME_BUFFER_SIZE0*10)
#define FRAME_BUFFER_12         FRAME_BUFFER_BASE_ADDR + (FRAME_BUFFER_SIZE0*11)

extern u8 current_ch;

XAxiVdma Vdma0;
XAxiVdma Vdma1;
XAxiVdma Vdma2;

u32 vdma_init(u16 DeviceID,XAxiVdma *Vdma)
{
	XAxiVdma_Config *Config;
	int Status;

	Config = XAxiVdma_LookupConfig(DeviceID);
	if (NULL == Config) {
		xil_printf("XAxiVdma_LookupConfig failure\r\n");
		return XST_FAILURE;
	}

	Status = XAxiVdma_CfgInitialize(Vdma, Config, Config->BaseAddress);
	if (Status != XST_SUCCESS) {
		xil_printf("XAxiVdma_CfgInitialize failure\r\n");
		return XST_FAILURE;
	}
}

u32 vdma_version(XAxiVdma *Vdma) {
	return XAxiVdma_GetVersion(Vdma);
}

int vdma_read_start(XAxiVdma *Vdma) {
	int Status;

	// MM2S Startup
	Status = XAxiVdma_DmaStart(Vdma, XAXIVDMA_READ);
	if (Status != XST_SUCCESS)
	{
	   xil_printf("Start read transfer failed %d\n\r", Status);
	   return XST_FAILURE;
	}

	return XST_SUCCESS;
}


int vdma_read_stop(XAxiVdma *Vdma) {
	XAxiVdma_DmaStop(Vdma, XAXIVDMA_READ);
	return XST_SUCCESS;
}


int vdma_read_init(short DeviceID,short HoriSizeInput,short VertSizeInput,short Stride,unsigned int FrameStoreStartAddr)
{
	XAxiVdma Vdma;
	XAxiVdma_Config *Config;
	XAxiVdma_DmaSetup ReadCfg;
	int Status;


	Config = XAxiVdma_LookupConfig(DeviceID);
	if (NULL == Config) {
		xil_printf("XAxiVdma_LookupConfig failure\r\n");
		return XST_FAILURE;
	}

	Status = XAxiVdma_CfgInitialize(&Vdma, Config, Config->BaseAddress);
	if (Status != XST_SUCCESS) {
		xil_printf("XAxiVdma_CfgInitialize failure\r\n");
		return XST_FAILURE;
	}

	

	ReadCfg.EnableCircularBuf = 1;
	ReadCfg.EnableFrameCounter = 0;
	ReadCfg.FixedFrameStoreAddr = 0;

	ReadCfg.EnableSync = 1;
	ReadCfg.PointNum = 1;

	ReadCfg.FrameDelay = 0;

	ReadCfg.VertSizeInput = VertSizeInput;
	ReadCfg.HoriSizeInput = HoriSizeInput;
	ReadCfg.Stride = Stride;

	Status = XAxiVdma_DmaConfig(&Vdma, XAXIVDMA_READ, &ReadCfg);
	if (Status != XST_SUCCESS) {
			xdbg_printf(XDBG_DEBUG_ERROR,
				"Read channel config failed %d\r\n", Status);

			return XST_FAILURE;
	}


	ReadCfg.FrameStoreStartAddr[0] = FrameStoreStartAddr;

	Status = XAxiVdma_DmaSetBufferAddr(&Vdma, XAXIVDMA_READ, ReadCfg.FrameStoreStartAddr);
	if (Status != XST_SUCCESS) {
			xdbg_printf(XDBG_DEBUG_ERROR,"Read channel set buffer address failed %d\r\n", Status);
			return XST_FAILURE;
	}


	Status = vdma_read_start(&Vdma);
	if (Status != XST_SUCCESS) {
		   xil_printf("error starting VDMA..!");
		   return Status;
	}
	return XST_SUCCESS;

}


int vdma_write_start(XAxiVdma *Vdma) {
	int Status;

	// MM2S Startup
	Status = XAxiVdma_DmaStart(Vdma, XAXIVDMA_WRITE);
	if (Status != XST_SUCCESS)
	{
	   xil_printf("Start write transfer failed %d\n\r", Status);
	   return XST_FAILURE;
	}

	return XST_SUCCESS;
}


int vdma_write_stop(XAxiVdma *Vdma) {
	XAxiVdma_DmaStop(Vdma, XAXIVDMA_WRITE);
	return XST_SUCCESS;
}


int vdma_write_init(short DeviceID,short HoriSizeInput,short VertSizeInput,short Stride,unsigned int FrameStoreStartAddr)
{
	XAxiVdma Vdma;
	XAxiVdma_Config *Config;
	XAxiVdma_DmaSetup WriteCfg;
	int Status;


	Config = XAxiVdma_LookupConfig(DeviceID);
	if (NULL == Config) {
		xil_printf("XAxiVdma_LookupConfig failure\r\n");
		return XST_FAILURE;
	}

	Status = XAxiVdma_CfgInitialize(&Vdma, Config, Config->BaseAddress);
	if (Status != XST_SUCCESS) {
		xil_printf("XAxiVdma_CfgInitialize failure\r\n");
		return XST_FAILURE;
	}

	

	WriteCfg.EnableCircularBuf = 0;
	WriteCfg.EnableFrameCounter = 0;
	WriteCfg.FixedFrameStoreAddr = 0;

	WriteCfg.EnableSync = 1;
	WriteCfg.PointNum = 1;

	WriteCfg.FrameDelay = 0;

	WriteCfg.VertSizeInput = VertSizeInput;
	WriteCfg.HoriSizeInput = HoriSizeInput;
	WriteCfg.Stride = Stride;

	Status = XAxiVdma_DmaConfig(&Vdma, XAXIVDMA_WRITE, &WriteCfg);
	if (Status != XST_SUCCESS) {
			xdbg_printf(XDBG_DEBUG_ERROR,
				"Read channel config failed %d\r\n", Status);

			return XST_FAILURE;
	}


	WriteCfg.FrameStoreStartAddr[0] = FrameStoreStartAddr;

	Status = XAxiVdma_DmaSetBufferAddr(&Vdma, XAXIVDMA_WRITE, WriteCfg.FrameStoreStartAddr);
	if (Status != XST_SUCCESS) {
			xdbg_printf(XDBG_DEBUG_ERROR,"Write channel set buffer address failed %d\r\n", Status);
			return XST_FAILURE;
	}


	Status = vdma_write_start(&Vdma);
	if (Status != XST_SUCCESS) {
		   xil_printf("error starting VDMA..!");
		   return Status;
	}
	return XST_SUCCESS;

}

void vdma_config_0(void)
{
    /* Start of VDMA Configuration */
    u32 bytePerPixels = 3;

    int offset0 = 0; // (y*w+x)*Bpp
    int offset1 = 0; // (y*w+x)*Bpp

//    u32 stride0 = 1920;
//    u32 width0  = 1920;
//    u32 height0 = 720;
    u32 stride1 = 1920;  // crop keeps write Stride
    u32 width1  = 1920;
    u32 height1 = 720;

//    u32 stride0 = 3840;
//    u32 width0  = 3840;
//    u32 height0 = 2160;
//    u32 stride1 = 3840;  // crop keeps write Stride
//    u32 width1  = 3840;
//    u32 height1 = 2160;

#if 0
    /* Configure the Write interface (S2MM)*/
    // S2MM Control Register
    Xil_Out32(XPAR_AXIVDMA_0_BASEADDR + 0x30, 0x8B);
    //S2MM Start Address 1
    Xil_Out32(XPAR_AXIVDMA_0_BASEADDR + 0xAC, FRAME_BUFFER_1 + offset0);
    //S2MM Start Address 2
    Xil_Out32(XPAR_AXIVDMA_0_BASEADDR + 0xB0, FRAME_BUFFER_2 + offset0);
    //S2MM Start Address 3
    Xil_Out32(XPAR_AXIVDMA_0_BASEADDR + 0xB4, FRAME_BUFFER_3 + offset0);
    //S2MM Frame delay / Stride register
    Xil_Out32(XPAR_AXIVDMA_0_BASEADDR + 0xA8, stride0*bytePerPixels);
    // S2MM HSIZE register
    Xil_Out32(XPAR_AXIVDMA_0_BASEADDR + 0xA4, width0*bytePerPixels);
    // S2MM VSIZE register
    Xil_Out32(XPAR_AXIVDMA_0_BASEADDR + 0xA0, height0);
#endif
    /* Configure the Read interface (MM2S)*/
    // MM2S Control Register
//    Xil_Out32(XPAR_AXIVDMA_0_BASEADDR + 0x00, 0x8B);
    Xil_Out32(XPAR_AXIVDMA_0_BASEADDR + 0x00, 0x83);// there should be no genlock as there is no S2MM
    // MM2S Start Address 1
    Xil_Out32(XPAR_AXIVDMA_0_BASEADDR + 0x5C, FRAME_BUFFER_1 + offset1);
//    // MM2S Start Address 2
//    Xil_Out32(XPAR_AXIVDMA_0_BASEADDR + 0x60, FRAME_BUFFER_2 + offset1);
//    // MM2S Start Address 3
//    Xil_Out32(XPAR_AXIVDMA_0_BASEADDR + 0x64, FRAME_BUFFER_3 + offset1);
    // MM2S Frame delay / Stride register
    Xil_Out32(XPAR_AXIVDMA_0_BASEADDR + 0x58, stride1*bytePerPixels);
    // MM2S HSIZE register
    Xil_Out32(XPAR_AXIVDMA_0_BASEADDR + 0x54, width1*bytePerPixels);
    // MM2S VSIZE register
    Xil_Out32(XPAR_AXIVDMA_0_BASEADDR + 0x50, height1);

    xil_printf("VDMA_0 started!\r\n");
    /* End of VDMA Configuration */
}

#if 0
void vdma_config_1(void)
{
    /* Start of VDMA Configuration */
    u32 bytePerPixels = 3;

    int offset0 = 0; // (y*w+x)*Bpp
    int offset1 = 0; // (y*w+x)*Bpp

//    u32 stride0 = 1920;
//    u32 width0  = 1920;
//    u32 height0 = 720;
    u32 stride1 = 1920;  // crop keeps write Stride
    u32 width1  = 1920;
    u32 height1 = 720;

//    u32 stride0 = 3840;
//    u32 width0  = 3840;
//    u32 height0 = 2160;
//    u32 stride1 = 3840;  // crop keeps write Stride
//    u32 width1  = 3840;
//    u32 height1 = 2160;

#if 0
    /* Configure the Write interface (S2MM)*/
    // S2MM Control Register
    Xil_Out32(XPAR_AXIVDMA_0_BASEADDR + 0x30, 0x8B);
    //S2MM Start Address 1
    Xil_Out32(XPAR_AXIVDMA_0_BASEADDR + 0xAC, FRAME_BUFFER_1 + offset0);
    //S2MM Start Address 2
    Xil_Out32(XPAR_AXIVDMA_0_BASEADDR + 0xB0, FRAME_BUFFER_2 + offset0);
    //S2MM Start Address 3
    Xil_Out32(XPAR_AXIVDMA_0_BASEADDR + 0xB4, FRAME_BUFFER_3 + offset0);
    //S2MM Frame delay / Stride register
    Xil_Out32(XPAR_AXIVDMA_0_BASEADDR + 0xA8, stride0*bytePerPixels);
    // S2MM HSIZE register
    Xil_Out32(XPAR_AXIVDMA_0_BASEADDR + 0xA4, width0*bytePerPixels);
    // S2MM VSIZE register
    Xil_Out32(XPAR_AXIVDMA_0_BASEADDR + 0xA0, height0);
#endif
    /* Configure the Read interface (MM2S)*/
    // MM2S Control Register
//    Xil_Out32(XPAR_AXIVDMA_0_BASEADDR + 0x00, 0x8B);
    Xil_Out32(XPAR_AXIVDMA_0_BASEADDR + 0x00, 0x83);// there should be no genlock as there is no S2MM
    // MM2S Start Address 1
    Xil_Out32(XPAR_AXIVDMA_1_BASEADDR + 0x5C, FRAME_BUFFER_1 + offset1);
//    // MM2S Start Address 2
//    Xil_Out32(XPAR_AXIVDMA_1_BASEADDR + 0x60, FRAME_BUFFER_2 + offset1);
//    // MM2S Start Address 3
//    Xil_Out32(XPAR_AXIVDMA_1_BASEADDR + 0x64, FRAME_BUFFER_3 + offset1);
    // MM2S Frame delay / Stride register
    Xil_Out32(XPAR_AXIVDMA_1_BASEADDR + 0x58, stride1*bytePerPixels);
    // MM2S HSIZE register
    Xil_Out32(XPAR_AXIVDMA_1_BASEADDR + 0x54, width1*bytePerPixels);
    // MM2S VSIZE register
    Xil_Out32(XPAR_AXIVDMA_1_BASEADDR + 0x50, height1);

    xil_printf("VDMA_1 started!\r\n");
    /* End of VDMA Configuration */
}
#endif

#if 0
void vdma_config_2(void)
{
 /* Start of VDMA Configuration */
	u32 bytePerPixels = 3;


	int offset0 = 0; // (y*w+x)*Bpp
	int offset1 = 0; // (y*w+x)*Bpp
	u32 stride0 = 1920;
	u32 width0 = 1920;
	u32 height0 = 1080;
	u32 stride1 = 1920;  // crop keeps write Stride
	u32 width1 = 1920;
	u32 height1 = 1080;


    /* Configure the Write interface (S2MM)*/
	// S2MM Control Register
	Xil_Out32(XPAR_PORT_3_YUV422_1080P_AXI_VDMA_0_BASEADDR + 0x30, 0x8B);
	//S2MM Start Address 1
	Xil_Out32(XPAR_PORT_3_YUV422_1080P_AXI_VDMA_0_BASEADDR + 0xAC, FRAME_BUFFER_7 + offset0);
	//S2MM Start Address 2
	Xil_Out32(XPAR_PORT_3_YUV422_1080P_AXI_VDMA_0_BASEADDR + 0xB0, FRAME_BUFFER_8 + offset0);
	//S2MM Start Address 3
	Xil_Out32(XPAR_PORT_3_YUV422_1080P_AXI_VDMA_0_BASEADDR + 0xB4, FRAME_BUFFER_9 + offset0);
	//S2MM Frame delay / Stride register
	Xil_Out32(XPAR_PORT_3_YUV422_1080P_AXI_VDMA_0_BASEADDR + 0xA8, stride0*bytePerPixels);
	// S2MM HSIZE register
	Xil_Out32(XPAR_PORT_3_YUV422_1080P_AXI_VDMA_0_BASEADDR + 0xA4, width0*bytePerPixels);
	// S2MM VSIZE register
	Xil_Out32(XPAR_PORT_3_YUV422_1080P_AXI_VDMA_0_BASEADDR + 0xA0, height0);

	/* Configure the Read interface (MM2S)*/
	// MM2S Control Register
	Xil_Out32(XPAR_PORT_3_YUV422_1080P_AXI_VDMA_0_BASEADDR + 0x00, 0x8B);
	// MM2S Start Address 1
	Xil_Out32(XPAR_PORT_3_YUV422_1080P_AXI_VDMA_0_BASEADDR + 0x5C, FRAME_BUFFER_7 + offset1);
	// MM2S Start Address 2
	Xil_Out32(XPAR_PORT_3_YUV422_1080P_AXI_VDMA_0_BASEADDR + 0x60, FRAME_BUFFER_8 + offset1);
	// MM2S Start Address 3
	Xil_Out32(XPAR_PORT_3_YUV422_1080P_AXI_VDMA_0_BASEADDR + 0x64, FRAME_BUFFER_9 + offset1);
	// MM2S Frame delay / Stride register
	Xil_Out32(XPAR_PORT_3_YUV422_1080P_AXI_VDMA_0_BASEADDR + 0x58, stride1*bytePerPixels);
	// MM2S HSIZE register
	Xil_Out32(XPAR_PORT_3_YUV422_1080P_AXI_VDMA_0_BASEADDR + 0x54, width1*bytePerPixels);
	// MM2S VSIZE register
	Xil_Out32(XPAR_PORT_3_YUV422_1080P_AXI_VDMA_0_BASEADDR + 0x50, height1);
}
#endif

#if 0
void vdma_config_video_out(void)
{
	 /* Start of VDMA Configuration */
		u32 bytePerPixels = 3;

	#if (defined TEST) || (defined R1080P60)
		int offset0 = 0; // (y*w+x)*Bpp
		int offset1 = 0; // (y*w+x)*Bpp
		u32 stride0 = 1920;
		u32 width0 = 1920;
		u32 height0 = 1080;
		u32 stride1 = 1920;  // crop keeps write Stride
		u32 width1 = 1920;
		u32 height1 = 1080;
	#else
		int offset0 = 0; // (y*w+x)*Bpp
	    int offset1 = 0; // (y*w+x)*Bpp
		u32 stride0 = 3840;
		u32 width0 = 3840;
		u32 height0 = 2160;
		u32 stride1 = 3840;  // crop keeps write Stride
		u32 width1 = 3840;
		u32 height1 = 2160;
	#endif

	/* Configure the Write interface (S2MM)*/
	// S2MM Control Register
	Xil_Out32(XPAR_AXIVDMA_0_BASEADDR + 0x30, 0x8B);
	//S2MM Start Address 1
	Xil_Out32(XPAR_AXIVDMA_0_BASEADDR + 0xAC, FRAME_BUFFER_10 + offset0);
	//S2MM Start Address 2
	Xil_Out32(XPAR_AXIVDMA_0_BASEADDR + 0xB0, FRAME_BUFFER_11 + offset0);
	//S2MM Start Address 3
	Xil_Out32(XPAR_AXIVDMA_0_BASEADDR + 0xB4, FRAME_BUFFER_12 + offset0);
	//S2MM Frame delay / Stride register
	Xil_Out32(XPAR_AXIVDMA_0_BASEADDR + 0xA8, stride0*bytePerPixels);
	// S2MM HSIZE register
	Xil_Out32(XPAR_AXIVDMA_0_BASEADDR + 0xA4, width0*bytePerPixels);
	// S2MM VSIZE register
	Xil_Out32(XPAR_AXIVDMA_0_BASEADDR + 0xA0, height0);

	/* Configure the Read interface (MM2S)*/
	// MM2S Control Register
	Xil_Out32(XPAR_AXIVDMA_0_BASEADDR + 0x00, 0x8B);
	// MM2S Start Address 1
	Xil_Out32(XPAR_AXIVDMA_0_BASEADDR + 0x5C, FRAME_BUFFER_10 + offset1);
	// MM2S Start Address 2
	Xil_Out32(XPAR_AXIVDMA_0_BASEADDR + 0x60, FRAME_BUFFER_11 + offset1);
	// MM2S Start Address 3
	Xil_Out32(XPAR_AXIVDMA_0_BASEADDR + 0x64, FRAME_BUFFER_12 + offset1);
	// MM2S Frame delay / Stride register
	Xil_Out32(XPAR_AXIVDMA_0_BASEADDR + 0x58, stride1*bytePerPixels);
	// MM2S HSIZE register
	Xil_Out32(XPAR_AXIVDMA_0_BASEADDR + 0x54, width1*bytePerPixels);
	// MM2S VSIZE register
	Xil_Out32(XPAR_AXIVDMA_0_BASEADDR + 0x50, height1);

}
#endif
void vdma_config(void)
{
	vdma_config_0();
//	vdma_config_1();
}

void clear_display(void)
{
    //print("Initialize frame buffer data...");
    //Disable the data cache to initialize the frame buffer with a blue color
//    Xil_DCacheDisable();
	u32 bytePerPixels = 3;
    UINTPTR Addr1=FRAME_BUFFER_1,Addr2=FRAME_BUFFER_2,Addr3=FRAME_BUFFER_3;
    UINTPTR Addr4=FRAME_BUFFER_4,Addr5=FRAME_BUFFER_5,Addr6=FRAME_BUFFER_6;
    UINTPTR Addr7=FRAME_BUFFER_7,Addr8=FRAME_BUFFER_8,Addr9=FRAME_BUFFER_9;
    UINTPTR Addr10=FRAME_BUFFER_10,Addr11=FRAME_BUFFER_11,Addr12=FRAME_BUFFER_12;
    int line, column;

    bytePerPixels = 2;
	for(line=0; line < 2166; line++)
	{
		for(column=0; column < 3840*bytePerPixels/4; column++)
		{
			Xil_Out32(Addr1, 0xFFFFFFFF);
			Xil_Out32(Addr2, 0xFFFFFFFF);
			Xil_Out32(Addr3, 0xFFFFFFFF);

			Addr1+=4;
			Addr2+=4;
			Addr3+=4;
		}
	}

	bytePerPixels = 3;
	for(line=0; line < 1080; line++)
	{
		for(column=0; column < 1920*bytePerPixels/4; column++)
		{
			Xil_Out32(Addr4, 0xFFFFFFFF);
			Xil_Out32(Addr5, 0xFFFFFFFF);
			Xil_Out32(Addr6, 0xFFFFFFFF);
			Xil_Out32(Addr7, 0xFFFFFFFF);
			Xil_Out32(Addr8, 0xFFFFFFFF);
			Xil_Out32(Addr9, 0xFFFFFFFF);

			Addr4+=4;
			Addr5+=4;
			Addr6+=4;
			Addr7+=4;
			Addr8+=4;
			Addr9+=4;

		}
	}

	bytePerPixels = 3;
#if (defined TEST) || (defined R1080P60)
	for(line=0; line < 1080; line++)
	{
		for(column=0; column < 1920*bytePerPixels/4; column++)
		{
			Xil_Out32(Addr7, 0xFFFFFFFF);
			Xil_Out32(Addr8, 0xFFFFFFFF);
			Xil_Out32(Addr9, 0xFFFFFFFF);

			Addr7+=4;
			Addr8+=4;
			Addr9+=4;

		}
	}
#else
	for(line=0; line < 2160; line++)
	{
		for(column=0; column < 3840*bytePerPixels/4; column++)
		{
			Xil_Out32(Addr10, 0xFFFFFFFF);
			Xil_Out32(Addr11, 0xFFFFFFFF);
			Xil_Out32(Addr12, 0xFFFFFFFF);

			Addr10+=4;
			Addr11+=4;
			Addr12+=4;

		}
	}
#endif

	xil_printf("clear Done\n\r");

}

void clear_video_out_display(void)
{
	u32 bytePerPixels;
    UINTPTR Addr1=FRAME_BUFFER_1,Addr2=FRAME_BUFFER_2,Addr3=FRAME_BUFFER_3;
    UINTPTR Addr4=FRAME_BUFFER_4,Addr5=FRAME_BUFFER_5,Addr6=FRAME_BUFFER_6;
    UINTPTR Addr7=FRAME_BUFFER_7,Addr8=FRAME_BUFFER_8,Addr9=FRAME_BUFFER_9;
    UINTPTR Addr10=FRAME_BUFFER_10,Addr11=FRAME_BUFFER_11,Addr12=FRAME_BUFFER_12;
    int line, column;
	bytePerPixels = 3;
#if 0
	for(line=0; line < 2160; line++)
	{
		for(column=0; column < 3840*bytePerPixels/4; column++)
		{
			Xil_Out32(Addr10, 0xFFFFFFFF);
			Xil_Out32(Addr11, 0xFFFFFFFF);
			Xil_Out32(Addr12, 0xFFFFFFFF);

			Addr10+=4;
			Addr11+=4;
			Addr12+=4;

		}
	}
#else
    memset(FRAME_BUFFER_10,0xff,3840*2160*3);//background
    memset(FRAME_BUFFER_11,0xff,3840*2160*3);//background
    memset(FRAME_BUFFER_12,0xff,3840*2160*3);//background
    Xil_DCacheFlush();
#endif

	xil_printf("video_out_display clear Done\n\r");
}


#endif
