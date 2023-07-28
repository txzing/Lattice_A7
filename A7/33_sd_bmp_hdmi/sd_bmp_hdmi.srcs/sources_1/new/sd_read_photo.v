//****************************************Copyright (c)***********************************//
//����֧�֣�www.openedv.com
//�Ա����̣�http://openedv.taobao.com 
//��ע΢�Ź���ƽ̨΢�źţ�"����ԭ��"����ѻ�ȡFPGA & STM32���ϡ�
//��Ȩ���У�����ؾ���
//Copyright(C) ����ԭ�� 2018-2028
//All rights reserved                               
//----------------------------------------------------------------------------------------
// File name:           sd_read_photo
// Last modified Date:  2020/11/22 15:16:38
// Last Version:        V1.0
// Descriptions:        SD����ȡBMPͼƬ
//----------------------------------------------------------------------------------------
// Created by:          ����ԭ��
// Created date:        2020/11/22 15:16:38
// Version:             V1.0
// Descriptions:        The original version
//
//----------------------------------------------------------------------------------------
//****************************************************************************************//

module sd_read_photo(
    input                clk           ,  //ʱ���ź�
    input                rst_n         ,  //��λ�ź�,�͵�ƽ��Ч

    input        [23:0]  ddr_max_addr  ,  //DDR��д����ַ  
    input        [15:0]  sd_sec_num    ,  //SD������������
    input                rd_busy       ,  //SD����æ�ź�
    input                sd_rd_val_en  ,  //SD����������Ч�ź�
    input        [15:0]  sd_rd_val_data,  //SD������������
    output  reg          rd_start_en   ,  //��ʼдSD�������ź�
    output  reg  [31:0]  rd_sec_addr   ,  //������������ַ
    output  reg          ddr_wr_en     ,  //DDRдʹ���ź�
    output       [15:0]  ddr_wr_data      //DDRд����
    );

//parameter define                          
//��������ͼƬ��������ַ,ͨ����λ��WinHex����鿴
parameter PHOTO_SECTION_ADDR0 = 32'd37152;//��һ��ͼƬ������ʼ��ַ
parameter PHOTO_SECTION_ADDR1 = 32'd46400;//�ڶ���ͼƬ������ʼ��ַ
//BMP�ļ��ײ�����=BMP�ļ�ͷ+��Ϣͷ
parameter BMP_HEAD_NUM = 6'd54;           //BMP�ļ�ͷ+��Ϣͷ=14+40=54

//reg define
reg    [1:0]          rd_flow_cnt      ;  //���������̿��Ƽ�����
reg    [15:0]         rd_sec_cnt       ;  //����������������
reg                   rd_addr_sw       ;  //������ͼƬ�л�
reg    [25:0]         delay_cnt        ;  //��ʱ�л�ͼƬ������
reg                   bmp_rd_done      ;  //����ͼƬ��ȡ���

reg                   rd_busy_d0       ;  //��æ�źŴ��ģ��������½���
reg                   rd_busy_d1       ;  

reg    [1:0]          val_en_cnt       ;  //SD��������Ч������
reg    [15:0]         val_data_t       ;  //SD��������Ч�Ĵ�
reg    [5:0]          bmp_head_cnt     ;  //BMP�ײ�������
reg                   bmp_head_flag    ;  //BMP�ײ���־
reg    [23:0]         rgb888_data      ;  //24λRGB888����
reg    [23:0]         ddr_wr_cnt       ;  //DDRд�������
reg    [1:0]          ddr_flow_cnt     ;  //DDRд�������̿�����������

//wire define
wire                  neg_rd_busy      ;  //SD����æ�ź��½���
      
//*****************************************************
//**                    main code
//*****************************************************

assign  neg_rd_busy = rd_busy_d1 & (~rd_busy_d0);
//24λRGB888��ʽת��16λRGB565��ʽ
assign  ddr_wr_data = {rgb888_data[23:19],rgb888_data[15:10],rgb888_data[7:3]};

//��rd_busy�źŽ�����ʱ����,���ڲ�rd_busy�źŵ��½���
always @(posedge clk or negedge rst_n) begin
    if(rst_n == 1'b0) begin
        rd_busy_d0 <= 1'b0;
        rd_busy_d1 <= 1'b0;
    end
    else begin
        rd_busy_d0 <= rd_busy;
        rd_busy_d1 <= rd_busy_d0;
    end
end

//ѭ����ȡSD���е�����ͼƬ������֮����ʱ1s�ٶ���һ����
always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        rd_flow_cnt <= 2'd0;
        rd_addr_sw <= 1'b0;
        rd_sec_cnt <= 16'd0;
        rd_start_en <= 1'b0;
        rd_sec_addr <= 32'd0;
        bmp_rd_done <= 1'b0;
        delay_cnt <= 26'd0;
    end
    else begin
        rd_start_en <= 1'b0;
        bmp_rd_done <= 1'b0;
        case(rd_flow_cnt)
            2'd0 : begin
                //��ʼ��ȡSD������
                rd_flow_cnt <= rd_flow_cnt + 2'd1;
                rd_start_en <= 1'b1;
                rd_addr_sw <= ~rd_addr_sw;                     //�����ݵ�ַ�л�
                if(rd_addr_sw == 1'b0)
                    rd_sec_addr <= PHOTO_SECTION_ADDR0;
                else
                    rd_sec_addr <= PHOTO_SECTION_ADDR1;    
            end
            2'd1 : begin
                //��æ�źŵ��½��ش������һ������,��ʼ��ȡ��һ������ַ����
                if(neg_rd_busy) begin                          
                    rd_sec_cnt <= rd_sec_cnt + 1'b1;
                    rd_sec_addr <= rd_sec_addr + 32'd1;
					//����ͼƬ����
                    if(rd_sec_cnt == sd_sec_num - 1'b1) begin
                        rd_sec_cnt <= 16'd0;
                        rd_flow_cnt <= rd_flow_cnt + 2'd1;
                        bmp_rd_done <= 1'b1;
                    end    
                    else
                        rd_start_en <= 1'b1;                   
                end                    
            end
            2'd2 : begin
                delay_cnt <= delay_cnt + 1'b1;                 //����ͼƬ�������ʱ1��
                if(delay_cnt == 26'd50_000_000 - 26'd1) begin  //50_000_000*20ns = 1s
                    delay_cnt <= 26'd0;
                    rd_flow_cnt <= 2'd0;
                end 
            end    
            default : ;
        endcase    
    end
end

//SD����ȡ��16λ���ݣ�ת��24λRGB888��ʽ
always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        val_en_cnt <= 2'd0;
        val_data_t <= 16'd0; 
        bmp_head_cnt <= 6'd0;
        ddr_wr_en <= 1'b0;
        rgb888_data <= 24'd0;
        ddr_wr_cnt <= 24'd0;
        ddr_flow_cnt <= 2'd0;
    end
    else begin
        ddr_wr_en <= 1'b0;
        case(ddr_flow_cnt)
            2'd0 : begin   //BMP�ײ�         
                if(sd_rd_val_en) begin
                    bmp_head_cnt <= bmp_head_cnt + 1'b1;
                    if(bmp_head_cnt == BMP_HEAD_NUM[5:1] - 1'b1) begin
                        ddr_flow_cnt <= ddr_flow_cnt + 1'b1;
                        bmp_head_cnt <= 6'd0;
                    end    
                end   
            end                
            2'd1 : begin   //BMP��Ч����
                if(sd_rd_val_en) begin
                    val_en_cnt <= val_en_cnt + 1'b1;
                    val_data_t <= sd_rd_val_data;                
                    if(val_en_cnt == 2'd1) begin  //3��16λ����ת��2��24λ����
                        ddr_wr_en <= 1'b1;
                        rgb888_data <= {sd_rd_val_data[15:8],val_data_t[7:0],
                                       val_data_t[15:8]}; 
                    end
                    else if(val_en_cnt == 2'd2) begin
                        ddr_wr_en <= 1'b1;
                        rgb888_data <= {sd_rd_val_data[7:0],sd_rd_val_data[15:8],
                                        val_data_t[7:0]};
                        val_en_cnt <= 2'd0;
                    end   
                end     
                if(ddr_wr_en) begin
                    ddr_wr_cnt <= ddr_wr_cnt + 1'b1;
                    if(ddr_wr_cnt == ddr_max_addr - 1'b1) begin
                        ddr_wr_cnt <= 24'd0;
                        ddr_flow_cnt <= ddr_flow_cnt + 1'b1;
                    end
                end
            end
            2'd2 : begin //�ȴ�����BMPͼƬ��ȡ����
                if(bmp_rd_done)
                    ddr_flow_cnt <= 2'd0;
            end
            default :;
        endcase
    end
end

endmodule
