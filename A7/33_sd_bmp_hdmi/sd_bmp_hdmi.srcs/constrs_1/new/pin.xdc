#IO管脚约束
#时钟周期约束
set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design]

create_clock -period 5.000 -name sys_clk_p [get_ports sys_clk_p]
#时钟
set_property IOSTANDARD DIFF_SSTL15 [get_ports sys_clk_p]
set_property IOSTANDARD DIFF_SSTL15 [get_ports sys_clk_n]
set_property PACKAGE_PIN R4 [get_ports sys_clk_p]
set_property PACKAGE_PIN T4 [get_ports sys_clk_n]

#--------------------------------HDMI_B----------------------------------------
set_property IOSTANDARD TMDS_33 [get_ports tmds_clk_n]
set_property -dict {PACKAGE_PIN W19 IOSTANDARD TMDS_33} [get_ports tmds_clk_p]
set_property -dict {PACKAGE_PIN U20 IOSTANDARD TMDS_33} [get_ports {tmds_data_p[0]}]
set_property -dict {PACKAGE_PIN AB21 IOSTANDARD TMDS_33} [get_ports {tmds_data_p[1]}]
set_property -dict {PACKAGE_PIN Y21 IOSTANDARD TMDS_33} [get_ports {tmds_data_p[2]}]
set_property IOSTANDARD TMDS_33 [get_ports {tmds_data_n[0]}]
set_property IOSTANDARD TMDS_33 [get_ports {tmds_data_n[1]}]
set_property IOSTANDARD TMDS_33 [get_ports {tmds_data_n[2]}]
#-----------------------------------SD卡----------------------------------------
set_property -dict {PACKAGE_PIN W17 IOSTANDARD LVCMOS33} [get_ports sd_miso]
set_property -dict {PACKAGE_PIN AB20 IOSTANDARD LVCMOS33} [get_ports sd_mosi]
set_property -dict {PACKAGE_PIN V17 IOSTANDARD LVCMOS33} [get_ports sd_clk]
set_property -dict {PACKAGE_PIN AA19 IOSTANDARD LVCMOS33} [get_ports sd_cs]



create_debug_core u_ila_0 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_0]
set_property ALL_PROBE_SAME_MU_CNT 1 [get_debug_cores u_ila_0]
set_property C_ADV_TRIGGER false [get_debug_cores u_ila_0]
set_property C_DATA_DEPTH 2048 [get_debug_cores u_ila_0]
set_property C_EN_STRG_QUAL false [get_debug_cores u_ila_0]
set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_0]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_0]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_0]
set_property port_width 1 [get_debug_ports u_ila_0/clk]
connect_debug_port u_ila_0/clk [get_nets [list u_clk_wiz_0/inst/clk_out3]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
set_property port_width 1 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list clk_50m]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 1 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list init_calib_complete]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property port_width 1 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list pixel_clk]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
set_property port_width 1 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list sd_init_done]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe4]
set_property port_width 1 [get_debug_ports u_ila_0/probe4]
connect_debug_port u_ila_0/probe4 [get_nets [list sys_rst_n]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets pixel_clk_5x]
