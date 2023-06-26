//Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
//Date        : Mon Jun 26 10:47:25 2023
//Host        : TX running 64-bit major release  (build 9200)
//Command     : generate_target system_wrapper.bd
//Design      : system_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module system_wrapper
   (UART_rxd,
    UART_txd,
    sys_clk_n,
    sys_clk_p,
    uart_0_txen_tri_o);
  input UART_rxd;
  output UART_txd;
  input sys_clk_n;
  input sys_clk_p;
  output [0:0]uart_0_txen_tri_o;

  wire UART_rxd;
  wire UART_txd;
  wire sys_clk_n;
  wire sys_clk_p;
  wire [0:0]uart_0_txen_tri_o;

  system system_i
       (.UART_rxd(UART_rxd),
        .UART_txd(UART_txd),
        .sys_clk_n(sys_clk_n),
        .sys_clk_p(sys_clk_p),
        .uart_0_txen_tri_o(uart_0_txen_tri_o));
endmodule
