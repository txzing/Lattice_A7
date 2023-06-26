`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/06/16 16:05:00
// Design Name: 
// Module Name: reset_module
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


`timescale 1ns / 1ps

// 产生FPGA内部复位信号

module reset_module  # (
    parameter        SYS_CYCLE      = 'd20,         //系统时钟周期20ns，频率是50MHz
    parameter        MS_WAIT_TIME   = 'd1000000,    //ns, SYS_CYCLE的倍数, 大于等于40
    parameter        RST_MS_MAX     = 'd20         // 对MS_CNT_MAX计数
    //parameter       RST_LEVEL      = 1'b0          // 复位有效电平
)
(
    input wire         clk,
    output wire        rst_o,
    output wire        rst_n_o
);

parameter     MS_CNT_MAX = MS_WAIT_TIME/SYS_CYCLE - 1;

reg [31:0]    ms_cnt;
reg [24:0]    reset_cnt = 'd0;
reg           rst_o_reg;

always @ (posedge clk)
begin
    if (ms_cnt < MS_CNT_MAX)
    begin
        ms_cnt <= ms_cnt + 1'd1;
    end
    else
    begin
        ms_cnt <= 32'd0;
    end
end


always @ (posedge clk)
begin
    if (ms_cnt == MS_CNT_MAX) 
    begin
        if (reset_cnt < RST_MS_MAX)
        begin
            reset_cnt <= reset_cnt + 1'd1;
        end
    end
end


always @ (posedge clk)
begin
    if (reset_cnt >= RST_MS_MAX)
    begin
        //rst_o_reg <= ~RST_LEVEL;
        rst_o_reg <= 1'b0;
    end
    else
    begin
        rst_o_reg <= 1'b1;
    end
end

assign rst_o = rst_o_reg;
assign rst_n_o = ~rst_o_reg;

endmodule
