// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
// Date        : Fri Feb 26 14:48:58 2021
// Host        : LAPTOP-5V5UTU19 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub {D:/desktop/DAVINCI
//               PRO/code/37_sd_bmp_hdmi/sd_bmp_hdmi/sd_bmp_hdmi.srcs/sources_1/ip/wr_fifo/wr_fifo_stub.v}
// Design      : wr_fifo
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a35tfgg484-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "fifo_generator_v13_2_5,Vivado 2019.2" *)
module wr_fifo(rst, wr_clk, rd_clk, din, wr_en, rd_en, dout, full, 
  empty, rd_data_count, wr_data_count, wr_rst_busy, rd_rst_busy)
/* synthesis syn_black_box black_box_pad_pin="rst,wr_clk,rd_clk,din[255:0],wr_en,rd_en,dout[255:0],full,empty,rd_data_count[7:0],wr_data_count[7:0],wr_rst_busy,rd_rst_busy" */;
  input rst;
  input wr_clk;
  input rd_clk;
  input [255:0]din;
  input wr_en;
  input rd_en;
  output [255:0]dout;
  output full;
  output empty;
  output [7:0]rd_data_count;
  output [7:0]wr_data_count;
  output wr_rst_busy;
  output rd_rst_busy;
endmodule
