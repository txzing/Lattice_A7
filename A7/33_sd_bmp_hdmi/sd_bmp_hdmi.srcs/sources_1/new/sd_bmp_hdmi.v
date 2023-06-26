//****************************************Copyright (c)***********************************//
//ԭ�Ӹ����߽�ѧƽ̨��www.yuanzige.com
//����֧�֣�www.openedv.com
//�Ա����̣�http://openedv.taobao.com
//��ע΢�Ź���ƽ̨΢�źţ�"����ԭ��"����ѻ�ȡZYNQ & FPGA & STM32 & LINUX���ϡ�
//��Ȩ���У�����ؾ���
//Copyright(C) ����ԭ�� 2018-2028
//All rights reserved
//----------------------------------------------------------------------------------------
// File name:           sd_bmp_hdmi
// Last modified Date:  2020/11/22 15:16:38
// Last Version:        V1.0
// Descriptions:        SD����BMPͼƬHDMI��ʾ
//                      
//----------------------------------------------------------------------------------------
// Created by:          ����ԭ��
// Created date:        2020/11/22 15:16:38
// Version:             V1.0
// Descriptions:        The original version
//
//----------------------------------------------------------------------------------------
//****************************************************************************************//

module sd_bmp_hdmi(    
    input                 sys_clk_p ,           //ϵͳ�������ʱ��
    input                 sys_clk_n ,           //ϵͳ�������ʱ��
    //SD���ӿ�
    input                 sd_miso      ,  //SD��SPI�������������ź�
    output                sd_clk       ,  //SD��SPIʱ���ź�
    output                sd_cs        ,  //SD��SPIƬѡ�ź�
    output                sd_mosi      ,  //SD��SPI������������ź�     
    // DDR3                            
    inout   [31:0]        ddr3_dq      ,  //DDR3 ����
    inout   [3:0]         ddr3_dqs_n   ,  //DDR3 dqs��
    inout   [3:0]         ddr3_dqs_p   ,  //DDR3 dqs��  
    output  [14:0]        ddr3_addr    ,  //DDR3 ��ַ   
    output  [2:0]         ddr3_ba      ,  //DDR3 banck ѡ��
    output                ddr3_ras_n   ,  //DDR3 ��ѡ��
    output                ddr3_cas_n   ,  //DDR3 ��ѡ��
    output                ddr3_we_n    ,  //DDR3 ��дѡ��
    output                ddr3_reset_n ,  //DDR3 ��λ
    output  [0:0]         ddr3_ck_p    ,  //DDR3 ʱ����
    output  [0:0]         ddr3_ck_n    ,  //DDR3 ʱ�Ӹ�
    output  [0:0]         ddr3_cke     ,  //DDR3 ʱ��ʹ��
    output  [0:0]         ddr3_cs_n    ,  //DDR3 Ƭѡ
    output  [3:0]         ddr3_dm      ,  //DDR3_dm
    output  [0:0]         ddr3_odt     ,  //DDR3_odt									                            
    //hdmi�ӿ�                           
    output                tmds_clk_p   ,  // TMDS ʱ��ͨ��
    output                tmds_clk_n   ,
    output  [2:0]         tmds_data_p  ,  // TMDS ����ͨ��
    output  [2:0]         tmds_data_n      
    );
    
wire sys_clk;   
//ת������ź�
IBUFDS diff_clock
(
    .I (sys_clk_p),    //ϵͳ�������ʱ��
    .IB(sys_clk_n),    //ϵͳ�������ʱ��
    .O (sys_clk)       //���ϵͳʱ��
); 

(*MARK_DEBUG="TRUE"*)wire        sys_rst_n; 
reset_module #(.SYS_CYCLE(5)) reset_module_inst
(
    .clk        (sys_clk),
    .rst_o      (),
    .rst_n_o    (sys_rst_n)
);

//parameter define 
//DDR3��д����ַ 1024 * 768 = 786432
parameter  DDR_MAX_ADDR = 786432;  
//SD������������ 1024 * 768 * 3 / 512 + 1 = 4609
parameter  SD_SEC_NUM = 4609;    

//wire define                          
wire         clk_200m                  ;  //ddr3�ο�ʱ��
(*MARK_DEBUG="TRUE"*)wire         clk_50m                   ;  //50mhzʱ��
wire         pixel_clk_5x              ;  //HDMI����ʱ��
(*MARK_DEBUG="TRUE"*)wire         pixel_clk                 ;  //HDMI 5������ʱ��
wire         clk_50m_180deg            ;  //50mhzʱ��,��λƫ��180��
wire         locked                    ;  //ʱ�������ź�
wire         rst_n                     ;  //ȫ�ָ�λ 	

wire  [23:0] ddr_max_addr              ;  //DDR��д����ַ
wire  [15:0] sd_sec_num                ;  //SD������������
wire         sd_rd_start_en            ;  //��ʼдSD�������ź�
wire  [31:0] sd_rd_sec_addr            ;  //������������ַ    
wire         sd_rd_busy                ;  //��æ�ź�
wire         sd_rd_val_en              ;  //���ݶ�ȡ��Чʹ���ź�
wire  [15:0] sd_rd_val_data            ;  //������
(*MARK_DEBUG="TRUE"*)wire         sd_init_done              ;  //SD����ʼ������ź�	
wire         ddr_wr_en                 ;  //DDR3������ģ��дʹ��
wire  [15:0] ddr_wr_data               ;  //DDR3������ģ��д����

wire         wr_en                     ;  //DDR3������ģ��дʹ��
wire  [15:0] wr_data                   ;  //DDR3������ģ��д����
wire         rdata_req                 ;  //DDR3������ģ���ʹ��
wire  [15:0] rd_data                   ;  //DDR3������ģ�������
(*MARK_DEBUG="TRUE"*)wire         init_calib_complete       ;  //DDR3��ʼ�����init_calib_complete
wire         sys_init_done             ;  //ϵͳ��ʼ�����(DDR��ʼ��+����ͷ��ʼ��)

wire  [12:0] h_disp                    ;  //HDMIˮƽ�ֱ���
wire  [12:0] v_disp                    ;  //HDMI��ֱ�ֱ���     
//*****************************************************
//**                    main code
//*****************************************************

//��ʱ�������������λ�����ź�
assign  rst_n = sys_rst_n & locked;

assign  rst_n = sys_rst_n;

//ϵͳ��ʼ����ɣ�DDR3��ʼ����� & SD����ʼ�����
assign  sys_init_done = init_calib_complete & sd_init_done;
//DDR3������ģ��Ϊдʹ�ܺ�д���ݸ�ֵ
assign  wr_en = ddr_wr_en;
assign  wr_data = ddr_wr_data;



//��ȡSD��ͼƬ
sd_read_photo u_sd_read_photo(
    .clk             (clk_50m),
    //ϵͳ��ʼ�����֮��,�ٿ�ʼ��SD���ж�ȡͼƬ
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

//SD���������ģ��
sd_ctrl_top u_sd_ctrl_top(
    .clk_ref           (clk_50m),
    .clk_ref_180deg    (clk_50m_180deg),
    .rst_n             (rst_n),
    //SD���ӿ�
    .sd_miso           (sd_miso),
    .sd_clk            (sd_clk),
    .sd_cs             (sd_cs),
    .sd_mosi           (sd_mosi),
    //�û�дSD���ӿ�
    .wr_start_en       (1'b0),                      //����Ҫд������,д��ӿڸ�ֵΪ0
    .wr_sec_addr       (32'b0),
    .wr_data           (16'b0),
    .wr_busy           (),
    .wr_req            (),
    //�û���SD���ӿ�
    .rd_start_en       (sd_rd_start_en),
    .rd_sec_addr       (sd_rd_sec_addr),
    .rd_busy           (sd_rd_busy),
    .rd_val_en         (sd_rd_val_en),
    .rd_val_data       (sd_rd_val_data),    
    
    .sd_init_done      (sd_init_done)
    );

//DDR3ģ��
ddr3_top u_ddr3_top (
    .clk_200m              (clk_200m),              //ϵͳʱ��
    .sys_rst_n             (rst_n),                 //��λ,����Ч
    .sys_init_done         (sys_init_done),         //ϵͳ��ʼ�����
    .init_calib_complete   (init_calib_complete),   //ddr3��ʼ������ź�    
    //ddr3�ӿ��ź�         
    .app_addr_rd_min       (29'd0),                 //��DDR3����ʼ��ַ
    .app_addr_rd_max       (DDR_MAX_ADDR/2),          //��DDR3�Ľ�����ַ
    .rd_bust_len           (h_disp[10:4]),          //��DDR3�ж�����ʱ��ͻ������
    .app_addr_wr_min       (29'd0),                 //дDDR3����ʼ��ַ
    .app_addr_wr_max       (DDR_MAX_ADDR/2),          //дDDR3�Ľ�����ַ
    .wr_bust_len           (h_disp[10:4]),          //��DDR3��д����ʱ��ͻ������
    // DDR3 IO�ӿ�                
    .ddr3_dq               (ddr3_dq),               //DDR3 ����
    .ddr3_dqs_n            (ddr3_dqs_n),            //DDR3 dqs��
    .ddr3_dqs_p            (ddr3_dqs_p),            //DDR3 dqs��  
    .ddr3_addr             (ddr3_addr),             //DDR3 ��ַ   
    .ddr3_ba               (ddr3_ba),               //DDR3 banck ѡ��
    .ddr3_ras_n            (ddr3_ras_n),            //DDR3 ��ѡ��
    .ddr3_cas_n            (ddr3_cas_n),            //DDR3 ��ѡ��
    .ddr3_we_n             (ddr3_we_n),             //DDR3 ��дѡ��
    .ddr3_reset_n          (ddr3_reset_n),          //DDR3 ��λ
    .ddr3_ck_p             (ddr3_ck_p),             //DDR3 ʱ����
    .ddr3_ck_n             (ddr3_ck_n),             //DDR3 ʱ�Ӹ�  
    .ddr3_cke              (ddr3_cke),              //DDR3 ʱ��ʹ��
    .ddr3_cs_n             (ddr3_cs_n),             //DDR3 Ƭѡ
    .ddr3_dm               (ddr3_dm),               //DDR3_dm
    .ddr3_odt              (ddr3_odt),              //DDR3_odt
    //�û�
    .ddr3_read_valid       (1'b1),                  //DDR3 ��ʹ��
    .ddr3_pingpang_en      (1'b0),                  //DDR3 ƹ�Ҳ���ʹ��
    .wr_clk                (clk_50m),               //дʱ��
    .wr_load               (1'b0),                  //����Դ�����ź�   
	.datain_valid          (wr_en),                 //������Чʹ���ź�
    .datain                (wr_data),               //��Ч���� 
    .rd_clk                (pixel_clk),             //��ʱ�� 
    .rd_load               (rd_vsync),              //���Դ�����ź�    
    .dataout               (rd_data),               //rfifo�������
    .rdata_req             (rdata_req)              //������������     
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
 
//HDMI������ʾģ��    
hdmi_top u_hdmi_top(
    .pixel_clk            (pixel_clk),
    .pixel_clk_5x         (pixel_clk_5x),    
    .sys_rst_n            (sys_init_done & rst_n),
    //hdmi�ӿ�            
    .tmds_clk_p           (tmds_clk_p   ),   // TMDS ʱ��ͨ��
    .tmds_clk_n           (tmds_clk_n   ),
    .tmds_data_p          (tmds_data_p  ),   // TMDS ����ͨ��
    .tmds_data_n          (tmds_data_n  ),  
    //�û��ӿ� 
    .video_vs             (rd_vsync     ),   //HDMI���ź�  
    .h_disp               (h_disp       ),   //HDMI��ˮƽ�ֱ���
    .v_disp               (),                //HDMI����ֱ�ֱ��� 
    .pixel_xpos           (),
    .pixel_ypos           (),      
    .data_in              (rd_data),         //�������� 
    .data_req             (rdata_req)        //������������   
);   

endmodule