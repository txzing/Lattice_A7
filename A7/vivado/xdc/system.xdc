#IO管脚约束
#时钟周期约束
set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design]

create_clock -period 5.000 -name sys_clk_clk_p [get_ports sys_clk_clk_p]
#时钟
set_property IOSTANDARD DIFF_SSTL15 [get_ports sys_clk_clk_p]
set_property IOSTANDARD DIFF_SSTL15 [get_ports sys_clk_clk_n]
set_property PACKAGE_PIN R4 [get_ports sys_clk_clk_p]
set_property PACKAGE_PIN T4 [get_ports sys_clk_clk_n]
#set_property CLOCK_DEDICATED_ROUTE BACKBONE [get_nets system_i/clk_wiz_0/inst/clk_in1_system_clk_wiz_1_0]
set_property CLOCK_DEDICATED_ROUTE BACKBONE [get_nets system_i/clk_wiz_0/inst/clk_in1_system_clk_wiz_0_0]
#set_property CLOCK_DEDICATED_ROUTE BACKBONE [get_nets system_i/clk_wiz_1/inst/CLK_CORE_DRP_I/clk_inst/clk_in1_system_clk_wiz_1_0]

set_property -dict {PACKAGE_PIN Y19 IOSTANDARD LVCMOS33} [get_ports UART_rxd]
set_property -dict {PACKAGE_PIN Y18 IOSTANDARD LVCMOS33} [get_ports UART_txd]
set_property -dict {PACKAGE_PIN V18 IOSTANDARD LVCMOS33} [get_ports uart_0_txen_tri_o]




#set_property -dict {PACKAGE_PIN B20 IOSTANDARD LVCMOS33} [get_ports UART1_rxd]
#set_property -dict {PACKAGE_PIN A20 IOSTANDARD LVCMOS33} [get_ports UART1_txd]

#set_property -dict {PACKAGE_PIN T19 IOSTANDARD LVCMOS33} [get_ports spi_flash_ss_io]
#set_property -dict {PACKAGE_PIN P22 IOSTANDARD LVCMOS33} [get_ports spi_flash_io0_io]
#set_property -dict {PACKAGE_PIN R22 IOSTANDARD LVCMOS33} [get_ports spi_flash_io1_io]
#set_property -dict {PACKAGE_PIN P21 IOSTANDARD LVCMOS33} [get_ports spi_flash_io2_io]
#set_property -dict {PACKAGE_PIN R21 IOSTANDARD LVCMOS33} [get_ports spi_flash_io3_io]


set_property PACKAGE_PIN W19 [get_ports TMDS_0_clk_p]
set_property IOSTANDARD TMDS_33 [get_ports TMDS_0_clk_n]

set_property PACKAGE_PIN U20 [get_ports {TMDS_0_data_p[0]}]
set_property PACKAGE_PIN AB21 [get_ports {TMDS_0_data_p[1]}]
set_property PACKAGE_PIN Y21 [get_ports {TMDS_0_data_p[2]}]
set_property IOSTANDARD TMDS_33 [get_ports {TMDS_0_data_p[*]}]
