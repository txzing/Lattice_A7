-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
-- Date        : Mon Jun 26 10:48:38 2023
-- Host        : TX running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               c:/Users/txzing/Desktop/test/vivado/vivado_proj/vivado_proj.srcs/sources_1/bd/system/ip/system_Reset_Delay_0_0/system_Reset_Delay_0_0_stub.vhdl
-- Design      : system_Reset_Delay_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a35tfgg484-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity system_Reset_Delay_0_0 is
  Port ( 
    clk : in STD_LOGIC;
    rst_o : out STD_LOGIC;
    rst_n_o : out STD_LOGIC
  );

end system_Reset_Delay_0_0;

architecture stub of system_Reset_Delay_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk,rst_o,rst_n_o";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "Reset_Delay,Vivado 2020.1";
begin
end;
