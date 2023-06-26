set_property SRC_FILE_INFO {cfile:c:/Users/txzing/Desktop/test/vivado/vivado_proj/vivado_proj.srcs/sources_1/bd/system/ip/system_clk_wiz_1_0/system_clk_wiz_1_0/system_clk_wiz_1_0_in_context.xdc rfile:../../../vivado_proj.srcs/sources_1/bd/system/ip/system_clk_wiz_1_0/system_clk_wiz_1_0/system_clk_wiz_1_0_in_context.xdc id:1 order:EARLY scoped_inst:system_i/clk_wiz_1} [current_design]
set_property SRC_FILE_INFO {cfile:c:/Users/txzing/Desktop/test/vivado/vivado_proj/vivado_proj.srcs/sources_1/bd/system/ip/system_mdm_1_0/system_mdm_1_0/system_mdm_1_0_in_context.xdc rfile:../../../vivado_proj.srcs/sources_1/bd/system/ip/system_mdm_1_0/system_mdm_1_0/system_mdm_1_0_in_context.xdc id:2 order:EARLY scoped_inst:system_i/mdm_1} [current_design]
set_property SRC_FILE_INFO {cfile:c:/Users/txzing/Desktop/test/vivado/vivado_proj/vivado_proj.srcs/sources_1/bd/system/ip/system_dlmb_bram_if_cntlr_0/system_dlmb_bram_if_cntlr_0/system_dlmb_bram_if_cntlr_0_in_context.xdc rfile:../../../vivado_proj.srcs/sources_1/bd/system/ip/system_dlmb_bram_if_cntlr_0/system_dlmb_bram_if_cntlr_0/system_dlmb_bram_if_cntlr_0_in_context.xdc id:3 order:EARLY scoped_inst:system_i/microblaze_0_local_memory/dlmb_bram_if_cntlr} [current_design]
set_property SRC_FILE_INFO {cfile:c:/Users/txzing/Desktop/test/vivado/vivado_proj/vivado_proj.srcs/sources_1/bd/system/ip/system_ilmb_bram_if_cntlr_0/system_ilmb_bram_if_cntlr_0/system_ilmb_bram_if_cntlr_0_in_context.xdc rfile:../../../vivado_proj.srcs/sources_1/bd/system/ip/system_ilmb_bram_if_cntlr_0/system_ilmb_bram_if_cntlr_0/system_ilmb_bram_if_cntlr_0_in_context.xdc id:4 order:EARLY scoped_inst:system_i/microblaze_0_local_memory/ilmb_bram_if_cntlr} [current_design]
set_property SRC_FILE_INFO {cfile:C:/Users/txzing/Desktop/test/vivado/vivado_proj/vivado_proj.srcs/constrs_1/imports/xdc/system.xdc rfile:../../../vivado_proj.srcs/constrs_1/imports/xdc/system.xdc id:5} [current_design]
current_instance system_i/clk_wiz_1
set_property src_info {type:SCOPED_XDC file:1 line:1 export:INPUT save:INPUT read:READ} [current_design]
create_clock -period 5.000 [get_ports -no_traverse {}]
set_property src_info {type:SCOPED_XDC file:1 line:4 export:INPUT save:INPUT read:READ} [current_design]
create_generated_clock -source [get_ports clk_in1_p] -edges {1 2 3} -edge_shift {0.000 2.500 5.000} [get_ports {}]
current_instance
current_instance system_i/mdm_1
set_property src_info {type:SCOPED_XDC file:2 line:2 export:INPUT save:INPUT read:READ} [current_design]
create_clock -period 33.333 [get_ports {}]
set_property src_info {type:SCOPED_XDC file:2 line:4 export:INPUT save:INPUT read:READ} [current_design]
create_clock -period 33.333 [get_ports {}]
current_instance
current_instance system_i/microblaze_0_local_memory/dlmb_bram_if_cntlr
set_property src_info {type:SCOPED_XDC file:3 line:2 export:INPUT save:INPUT read:READ} [current_design]
create_clock -period 10.000 [get_ports {}]
current_instance
current_instance system_i/microblaze_0_local_memory/ilmb_bram_if_cntlr
set_property src_info {type:SCOPED_XDC file:4 line:2 export:INPUT save:INPUT read:READ} [current_design]
create_clock -period 10.000 [get_ports {}]
current_instance
set_property src_info {type:XDC file:5 line:9 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN R4 [get_ports sys_clk_p]
set_property src_info {type:XDC file:5 line:10 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN T4 [get_ports sys_clk_n]
set_property src_info {type:XDC file:5 line:12 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict {PACKAGE_PIN Y19 IOSTANDARD LVCMOS33} [get_ports UART_rxd]
set_property src_info {type:XDC file:5 line:13 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict {PACKAGE_PIN Y18 IOSTANDARD LVCMOS33} [get_ports UART_txd]
set_property src_info {type:XDC file:5 line:14 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict {PACKAGE_PIN V18 IOSTANDARD LVCMOS33} [get_ports uart_0_txen_tri_o]
