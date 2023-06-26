//****************************************Copyright (c)***********************************//
//原子哥在线教学平台：www.yuanzige.com
//技术支持：www.openedv.com
//淘宝店铺：http://openedv.taobao.com
//关注微信公众平台微信号："正点原子"，免费获取ZYNQ & FPGA & STM32 & LINUX资料。
//版权所有，盗版必究。
//Copyright(C) 正点原子 2018-2028
//All rights reserved
//----------------------------------------------------------------------------------------
// File name:           sd_bmp_hdmi
// Last modified Date:  2020/11/22 15:16:38
// Last Version:        V1.0
// Descriptions:        SD卡读BMP图片HDMI显示
//                      
//----------------------------------------------------------------------------------------
// Created by:          正点原子
// Created date:        2020/11/22 15:16:38
// Version:             V1.0
// Descriptions:        The original version
//
//----------------------------------------------------------------------------------------
//****************************************************************************************//

module sd_bmp_hdmi(    
    input                 sys_clk_p ,           //系统差分输入时钟
    input                 sys_clk_n ,           //系统差分输入时钟
    //SD卡接口
    input                 sd_miso      ,  //SD卡SPI串行输入数据信号
    output                sd_clk       ,  //SD卡SPI时钟信号
    output                sd_cs        ,  //SD卡SPI片选信号
    output                sd_mosi      ,  //SD卡SPI串行输出数据信号     
    // DDR3                            
    inout   [31:0]        ddr3_dq      ,  //DDR3 数据
    inout   [3:0]         ddr3_dqs_n   ,  //DDR3 dqs负
    inout   [3:0]         ddr3_dqs_p   ,  //DDR3 dqs正  
    output  [14:0]        ddr3_addr    ,  //DDR3 地址   
    output  [2:0]         ddr3_ba      ,  //DDR3 banck 选择
    output                ddr3_ras_n   ,  //DDR3 行选择
    output                ddr3_cas_n   ,  //DDR3 列选择
    output                ddr3_we_n    ,  //DDR3 读写选择
    output                ddr3_reset_n ,  //DDR3 复位
    output  [0:0]         ddr3_ck_p    ,  //DDR3 时钟正
    output  [0:0]         ddr3_ck_n    ,  //DDR3 时钟负
    output  [0:0]         ddr3_cke     ,  //DDR3 时钟使能
    output  [0:0]         ddr3_cs_n    ,  //DDR3 片选
    output  [3:0]         ddr3_dm      ,  //DDR3_dm
    output  [0:0]         ddr3_odt     ,  //DDR3_odt									                            
    //hdmi接口                           
    output                tmds_clk_p   ,  // TMDS 时钟通道
    output                tmds_clk_n   ,
    output  [2:0]         tmds_data_p  ,  // TMDS 数据通道
    output  [2:0]         tmds_data_n      
    );
    
wire sys_clk;   
//转换差分信号
IBUFDS diff_clock
(
    .I (sys_clk_p),    //系统差分输入时钟
    .IB(sys_clk_n),    //系统差分输入时钟
    .O (sys_clk)       //输出系统时钟
); 

(*MARK_DEBUG="TRUE"*)wire        sys_rst_n; 
reset_module #(.SYS_CYCLE(5)) reset_module_inst
(
    .clk        (sys_clk),
    .rst_o      (),
    .rst_n_o    (sys_rst_n)
);

//parameter define 
//DDR3读写最大地址 1024 * 768 = 786432
parameter  DDR_MAX_ADDR = 786432;  
//SD卡读扇区个数 1024 * 768 * 3 / 512 + 1 = 4609
parameter  SD_SEC_NUM = 4609;    

//wire define                          
wire         clk_200m                  ;  //ddr3参考时钟
(*MARK_DEBUG="TRUE"*)wire         clk_50m                   ;  //50mhz时钟
wire         pixel_clk_5x              ;  //HDMI像素时钟
(*MARK_DEBUG="TRUE"*)wire         pixel_clk                 ;  //HDMI 5倍像素时钟
wire         clk_50m_180deg            ;  //50mhz时钟,相位偏移180度
wire         locked                    ;  //时钟锁定信号
wire         rst_n                     ;  //全局复位 	

wire  [23:0] ddr_max_addr              ;  //DDR读写最大地址
wire  [15:0] sd_sec_num                ;  //SD卡读扇区个数
wire         sd_rd_start_en            ;  //开始写SD卡数据信号
wire  [31:0] sd_rd_sec_addr            ;  //读数据扇区地址    
wire         sd_rd_busy                ;  //读忙信号
wire         sd_rd_val_en              ;  //数据读取有效使能信号
wire  [15:0] sd_rd_val_data            ;  //读数据
(*MARK_DEBUG="TRUE"*)wire         sd_init_done              ;  //SD卡初始化完成信号	
wire         ddr_wr_en                 ;  //DDR3控制器模块写使能
wire  [15:0] ddr_wr_data               ;  //DDR3控制器模块写数据

wire         wr_en                     ;  //DDR3控制器模块写使能
wire  [15:0] wr_data                   ;  //DDR3控制器模块写数据
wire         rdata_req                 ;  //DDR3控制器模块读使能
wire  [15:0] rd_data                   ;  //DDR3控制器模块读数据
(*MARK_DEBUG="TRUE"*)wire         init_calib_complete       ;  //DDR3初始化完成init_calib_complete
wire         sys_init_done             ;  //系统初始化完成(DDR初始化+摄像头初始化)

wire  [12:0] h_disp                    ;  //HDMI水平分辨率
wire  [12:0] v_disp                    ;  //HDMI垂直分辨率     
//*****************************************************
//**                    main code
//*****************************************************

//待时钟锁定后产生复位结束信号
assign  rst_n = sys_rst_n & locked;

assign  rst_n = sys_rst_n;

//系统初始化完成：DDR3初始化完成 & SD卡初始化完成
assign  sys_init_done = init_calib_complete & sd_init_done;
//DDR3控制器模块为写使能和写数据赋值
assign  wr_en = ddr_wr_en;
assign  wr_data = ddr_wr_data;



//读取SD卡图片
sd_read_photo u_sd_read_photo(
    .clk             (clk_50m),
    //系统初始化完成之后,再开始从SD卡中读取图片
    .rst_n           (rst_n & sys_init_done), 
    .ddr_max_addr    (DDR_MAX_ADDR),       
    .sd_sec_num      (SD_SEC_NUM), 
    .rd_busy         (sd_rd_busy),
    .sd_rd_val_en    (sd_rd_val_en),
    .sd_rd_val_data  (sd_rd_val_data),
    .rd_start_en     (sd_rd_start_en),
    .rd_sec_addr     (sd_rd_sec_addr),
    .ddr_wr_en       (ddr_wr_en),
    .ddr_wr_data     (ddr_wr_data)
    );     

//SD卡顶层控制模块
sd_ctrl_top u_sd_ctrl_top(
    .clk_ref           (clk_50m),
    .clk_ref_180deg    (clk_50m_180deg),
    .rst_n             (rst_n),
    //SD卡接口
    .sd_miso           (sd_miso),
    .sd_clk            (sd_clk),
    .sd_cs             (sd_cs),
    .sd_mosi           (sd_mosi),
    //用户写SD卡接口
    .wr_start_en       (1'b0),                      //不需要写入数据,写入接口赋值为0
    .wr_sec_addr       (32'b0),
    .wr_data           (16'b0),
    .wr_busy           (),
    .wr_req            (),
    //用户读SD卡接口
    .rd_start_en       (sd_rd_start_en),
    .rd_sec_addr       (sd_rd_sec_addr),
    .rd_busy           (sd_rd_busy),
    .rd_val_en         (sd_rd_val_en),
    .rd_val_data       (sd_rd_val_data),    
    
    .sd_init_done      (sd_init_done)
    );

//DDR3模块
ddr3_top u_ddr3_top (
    .clk_200m              (clk_200m),              //系统时钟
    .sys_rst_n             (rst_n),                 //复位,低有效
    .sys_init_done         (sys_init_done),         //系统初始化完成
    .init_calib_complete   (init_calib_complete),   //ddr3初始化完成信号    
    //ddr3接口信号         
    .app_addr_rd_min       (29'd0),                 //读DDR3的起始地址
    .app_addr_rd_max       (DDR_MAX_ADDR/2),          //读DDR3的结束地址
    .rd_bust_len           (h_disp[10:4]),          //从DDR3中读数据时的突发长度
    .app_addr_wr_min       (29'd0),                 //写DDR3的起始地址
    .app_addr_wr_max       (DDR_MAX_ADDR/2),          //写DDR3的结束地址
    .wr_bust_len           (h_disp[10:4]),          //从DDR3中写数据时的突发长度
    // DDR3 IO接口                
    .ddr3_dq               (ddr3_dq),               //DDR3 数据
    .ddr3_dqs_n            (ddr3_dqs_n),            //DDR3 dqs负
    .ddr3_dqs_p            (ddr3_dqs_p),            //DDR3 dqs正  
    .ddr3_addr             (ddr3_addr),             //DDR3 地址   
    .ddr3_ba               (ddr3_ba),               //DDR3 banck 选择
    .ddr3_ras_n            (ddr3_ras_n),            //DDR3 行选择
    .ddr3_cas_n            (ddr3_cas_n),            //DDR3 列选择
    .ddr3_we_n             (ddr3_we_n),             //DDR3 读写选择
    .ddr3_reset_n          (ddr3_reset_n),          //DDR3 复位
    .ddr3_ck_p             (ddr3_ck_p),             //DDR3 时钟正
    .ddr3_ck_n             (ddr3_ck_n),             //DDR3 时钟负  
    .ddr3_cke              (ddr3_cke),              //DDR3 时钟使能
    .ddr3_cs_n             (ddr3_cs_n),             //DDR3 片选
    .ddr3_dm               (ddr3_dm),               //DDR3_dm
    .ddr3_odt              (ddr3_odt),              //DDR3_odt
    //用户
    .ddr3_read_valid       (1'b1),                  //DDR3 读使能
    .ddr3_pingpang_en      (1'b0),                  //DDR3 乒乓操作使能
    .wr_clk                (clk_50m),               //写时钟
    .wr_load               (1'b0),                  //输入源更新信号   
	.datain_valid          (wr_en),                 //数据有效使能信号
    .datain                (wr_data),               //有效数据 
    .rd_clk                (pixel_clk),             //读时钟 
    .rd_load               (rd_vsync),              //输出源更新信号    
    .dataout               (rd_data),               //rfifo输出数据
    .rdata_req             (rdata_req)              //请求数据输入     
     );       

 clk_wiz_0 u_clk_wiz_0
   (
    // Clock out ports
    .clk_out1              (clk_200m),     
    .clk_out2              (clk_50m),
    .clk_out3              (pixel_clk_5x),
    .clk_out4              (pixel_clk),
    .clk_out5              (clk_50m_180deg),
    // Status and control signals
    .reset                 (~sys_rst_n), 
    .locked                (locked),       
   // Clock in ports
    .clk_in1                (sys_clk)
//    .clk_in1_p             (sys_clk_p),
//    .clk_in1_n             (sys_clk_n)
    );     
 
//HDMI驱动显示模块    
hdmi_top u_hdmi_top(
    .pixel_clk            (pixel_clk),
    .pixel_clk_5x         (pixel_clk_5x),    
    .sys_rst_n            (sys_init_done & rst_n),
    //hdmi接口            
    .tmds_clk_p           (tmds_clk_p   ),   // TMDS 时钟通道
    .tmds_clk_n           (tmds_clk_n   ),
    .tmds_data_p          (tmds_data_p  ),   // TMDS 数据通道
    .tmds_data_n          (tmds_data_n  ),  
    //用户接口 
    .video_vs             (rd_vsync     ),   //HDMI场信号  
    .h_disp               (h_disp       ),   //HDMI屏水平分辨率
    .v_disp               (),                //HDMI屏垂直分辨率 
    .pixel_xpos           (),
    .pixel_ypos           (),      
    .data_in              (rd_data),         //数据输入 
    .data_req             (rdata_req)        //请求数据输入   
);   

endmodule