#IO管脚约束
#时钟周期约束
set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design]

create_clock -period 5.000 -name sys_clk_p [get_ports sys_clk_p]
#时钟
set_property IOSTANDARD DIFF_SSTL15 [get_ports sys_clk_p]
set_property IOSTANDARD DIFF_SSTL15 [get_ports sys_clk_n]
set_property PACKAGE_PIN R4 [get_ports sys_clk_p]
set_property PACKAGE_PIN T4 [get_ports sys_clk_n]

set_property -dict {PACKAGE_PIN Y19 IOSTANDARD LVCMOS33} [get_ports UART_rxd]
set_property -dict {PACKAGE_PIN Y18 IOSTANDARD LVCMOS33} [get_ports UART_txd]
set_property -dict {PACKAGE_PIN V18 IOSTANDARD LVCMOS33} [get_ports uart_0_txen_tri_o]