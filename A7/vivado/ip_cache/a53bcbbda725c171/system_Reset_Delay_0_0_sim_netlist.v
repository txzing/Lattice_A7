// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
// Date        : Mon Jun 26 10:48:38 2023
// Host        : TX running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ system_Reset_Delay_0_0_sim_netlist.v
// Design      : system_Reset_Delay_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tfgg484-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_Reset_Delay
   (rst_n_o,
    rst_o,
    clk);
  output rst_n_o;
  output rst_o;
  input clk;

  wire clk;
  wire \reset_cnt[0]_i_2_n_0 ;
  wire [20:7]reset_cnt_reg;
  wire \reset_cnt_reg[0]_i_1_n_0 ;
  wire \reset_cnt_reg[0]_i_1_n_1 ;
  wire \reset_cnt_reg[0]_i_1_n_2 ;
  wire \reset_cnt_reg[0]_i_1_n_3 ;
  wire \reset_cnt_reg[0]_i_1_n_4 ;
  wire \reset_cnt_reg[0]_i_1_n_5 ;
  wire \reset_cnt_reg[0]_i_1_n_6 ;
  wire \reset_cnt_reg[0]_i_1_n_7 ;
  wire \reset_cnt_reg[12]_i_1_n_0 ;
  wire \reset_cnt_reg[12]_i_1_n_1 ;
  wire \reset_cnt_reg[12]_i_1_n_2 ;
  wire \reset_cnt_reg[12]_i_1_n_3 ;
  wire \reset_cnt_reg[12]_i_1_n_4 ;
  wire \reset_cnt_reg[12]_i_1_n_5 ;
  wire \reset_cnt_reg[12]_i_1_n_6 ;
  wire \reset_cnt_reg[12]_i_1_n_7 ;
  wire \reset_cnt_reg[16]_i_1_n_0 ;
  wire \reset_cnt_reg[16]_i_1_n_1 ;
  wire \reset_cnt_reg[16]_i_1_n_2 ;
  wire \reset_cnt_reg[16]_i_1_n_3 ;
  wire \reset_cnt_reg[16]_i_1_n_4 ;
  wire \reset_cnt_reg[16]_i_1_n_5 ;
  wire \reset_cnt_reg[16]_i_1_n_6 ;
  wire \reset_cnt_reg[16]_i_1_n_7 ;
  wire \reset_cnt_reg[20]_i_1_n_7 ;
  wire \reset_cnt_reg[4]_i_1_n_0 ;
  wire \reset_cnt_reg[4]_i_1_n_1 ;
  wire \reset_cnt_reg[4]_i_1_n_2 ;
  wire \reset_cnt_reg[4]_i_1_n_3 ;
  wire \reset_cnt_reg[4]_i_1_n_4 ;
  wire \reset_cnt_reg[4]_i_1_n_5 ;
  wire \reset_cnt_reg[4]_i_1_n_6 ;
  wire \reset_cnt_reg[4]_i_1_n_7 ;
  wire \reset_cnt_reg[8]_i_1_n_0 ;
  wire \reset_cnt_reg[8]_i_1_n_1 ;
  wire \reset_cnt_reg[8]_i_1_n_2 ;
  wire \reset_cnt_reg[8]_i_1_n_3 ;
  wire \reset_cnt_reg[8]_i_1_n_4 ;
  wire \reset_cnt_reg[8]_i_1_n_5 ;
  wire \reset_cnt_reg[8]_i_1_n_6 ;
  wire \reset_cnt_reg[8]_i_1_n_7 ;
  wire \reset_cnt_reg_n_0_[0] ;
  wire \reset_cnt_reg_n_0_[1] ;
  wire \reset_cnt_reg_n_0_[2] ;
  wire \reset_cnt_reg_n_0_[3] ;
  wire \reset_cnt_reg_n_0_[4] ;
  wire \reset_cnt_reg_n_0_[5] ;
  wire \reset_cnt_reg_n_0_[6] ;
  wire rst_n_o;
  wire rst_o;
  wire rst_o_reg_i_1_n_0;
  wire rst_o_reg_i_2_n_0;
  wire rst_o_reg_i_3_n_0;
  wire rst_o_reg_i_4_n_0;
  wire [3:0]\NLW_reset_cnt_reg[20]_i_1_CO_UNCONNECTED ;
  wire [3:1]\NLW_reset_cnt_reg[20]_i_1_O_UNCONNECTED ;

  LUT1 #(
    .INIT(2'h1)) 
    \reset_cnt[0]_i_2 
       (.I0(\reset_cnt_reg_n_0_[0] ),
        .O(\reset_cnt[0]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \reset_cnt_reg[0] 
       (.C(clk),
        .CE(rst_o_reg_i_1_n_0),
        .D(\reset_cnt_reg[0]_i_1_n_7 ),
        .Q(\reset_cnt_reg_n_0_[0] ),
        .R(1'b0));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \reset_cnt_reg[0]_i_1 
       (.CI(1'b0),
        .CO({\reset_cnt_reg[0]_i_1_n_0 ,\reset_cnt_reg[0]_i_1_n_1 ,\reset_cnt_reg[0]_i_1_n_2 ,\reset_cnt_reg[0]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b1}),
        .O({\reset_cnt_reg[0]_i_1_n_4 ,\reset_cnt_reg[0]_i_1_n_5 ,\reset_cnt_reg[0]_i_1_n_6 ,\reset_cnt_reg[0]_i_1_n_7 }),
        .S({\reset_cnt_reg_n_0_[3] ,\reset_cnt_reg_n_0_[2] ,\reset_cnt_reg_n_0_[1] ,\reset_cnt[0]_i_2_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \reset_cnt_reg[10] 
       (.C(clk),
        .CE(rst_o_reg_i_1_n_0),
        .D(\reset_cnt_reg[8]_i_1_n_5 ),
        .Q(reset_cnt_reg[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \reset_cnt_reg[11] 
       (.C(clk),
        .CE(rst_o_reg_i_1_n_0),
        .D(\reset_cnt_reg[8]_i_1_n_4 ),
        .Q(reset_cnt_reg[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \reset_cnt_reg[12] 
       (.C(clk),
        .CE(rst_o_reg_i_1_n_0),
        .D(\reset_cnt_reg[12]_i_1_n_7 ),
        .Q(reset_cnt_reg[12]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \reset_cnt_reg[12]_i_1 
       (.CI(\reset_cnt_reg[8]_i_1_n_0 ),
        .CO({\reset_cnt_reg[12]_i_1_n_0 ,\reset_cnt_reg[12]_i_1_n_1 ,\reset_cnt_reg[12]_i_1_n_2 ,\reset_cnt_reg[12]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\reset_cnt_reg[12]_i_1_n_4 ,\reset_cnt_reg[12]_i_1_n_5 ,\reset_cnt_reg[12]_i_1_n_6 ,\reset_cnt_reg[12]_i_1_n_7 }),
        .S(reset_cnt_reg[15:12]));
  FDRE #(
    .INIT(1'b0)) 
    \reset_cnt_reg[13] 
       (.C(clk),
        .CE(rst_o_reg_i_1_n_0),
        .D(\reset_cnt_reg[12]_i_1_n_6 ),
        .Q(reset_cnt_reg[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \reset_cnt_reg[14] 
       (.C(clk),
        .CE(rst_o_reg_i_1_n_0),
        .D(\reset_cnt_reg[12]_i_1_n_5 ),
        .Q(reset_cnt_reg[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \reset_cnt_reg[15] 
       (.C(clk),
        .CE(rst_o_reg_i_1_n_0),
        .D(\reset_cnt_reg[12]_i_1_n_4 ),
        .Q(reset_cnt_reg[15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \reset_cnt_reg[16] 
       (.C(clk),
        .CE(rst_o_reg_i_1_n_0),
        .D(\reset_cnt_reg[16]_i_1_n_7 ),
        .Q(reset_cnt_reg[16]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \reset_cnt_reg[16]_i_1 
       (.CI(\reset_cnt_reg[12]_i_1_n_0 ),
        .CO({\reset_cnt_reg[16]_i_1_n_0 ,\reset_cnt_reg[16]_i_1_n_1 ,\reset_cnt_reg[16]_i_1_n_2 ,\reset_cnt_reg[16]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\reset_cnt_reg[16]_i_1_n_4 ,\reset_cnt_reg[16]_i_1_n_5 ,\reset_cnt_reg[16]_i_1_n_6 ,\reset_cnt_reg[16]_i_1_n_7 }),
        .S(reset_cnt_reg[19:16]));
  FDRE #(
    .INIT(1'b0)) 
    \reset_cnt_reg[17] 
       (.C(clk),
        .CE(rst_o_reg_i_1_n_0),
        .D(\reset_cnt_reg[16]_i_1_n_6 ),
        .Q(reset_cnt_reg[17]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \reset_cnt_reg[18] 
       (.C(clk),
        .CE(rst_o_reg_i_1_n_0),
        .D(\reset_cnt_reg[16]_i_1_n_5 ),
        .Q(reset_cnt_reg[18]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \reset_cnt_reg[19] 
       (.C(clk),
        .CE(rst_o_reg_i_1_n_0),
        .D(\reset_cnt_reg[16]_i_1_n_4 ),
        .Q(reset_cnt_reg[19]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \reset_cnt_reg[1] 
       (.C(clk),
        .CE(rst_o_reg_i_1_n_0),
        .D(\reset_cnt_reg[0]_i_1_n_6 ),
        .Q(\reset_cnt_reg_n_0_[1] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \reset_cnt_reg[20] 
       (.C(clk),
        .CE(rst_o_reg_i_1_n_0),
        .D(\reset_cnt_reg[20]_i_1_n_7 ),
        .Q(reset_cnt_reg[20]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \reset_cnt_reg[20]_i_1 
       (.CI(\reset_cnt_reg[16]_i_1_n_0 ),
        .CO(\NLW_reset_cnt_reg[20]_i_1_CO_UNCONNECTED [3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_reset_cnt_reg[20]_i_1_O_UNCONNECTED [3:1],\reset_cnt_reg[20]_i_1_n_7 }),
        .S({1'b0,1'b0,1'b0,reset_cnt_reg[20]}));
  FDRE #(
    .INIT(1'b0)) 
    \reset_cnt_reg[2] 
       (.C(clk),
        .CE(rst_o_reg_i_1_n_0),
        .D(\reset_cnt_reg[0]_i_1_n_5 ),
        .Q(\reset_cnt_reg_n_0_[2] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \reset_cnt_reg[3] 
       (.C(clk),
        .CE(rst_o_reg_i_1_n_0),
        .D(\reset_cnt_reg[0]_i_1_n_4 ),
        .Q(\reset_cnt_reg_n_0_[3] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \reset_cnt_reg[4] 
       (.C(clk),
        .CE(rst_o_reg_i_1_n_0),
        .D(\reset_cnt_reg[4]_i_1_n_7 ),
        .Q(\reset_cnt_reg_n_0_[4] ),
        .R(1'b0));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \reset_cnt_reg[4]_i_1 
       (.CI(\reset_cnt_reg[0]_i_1_n_0 ),
        .CO({\reset_cnt_reg[4]_i_1_n_0 ,\reset_cnt_reg[4]_i_1_n_1 ,\reset_cnt_reg[4]_i_1_n_2 ,\reset_cnt_reg[4]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\reset_cnt_reg[4]_i_1_n_4 ,\reset_cnt_reg[4]_i_1_n_5 ,\reset_cnt_reg[4]_i_1_n_6 ,\reset_cnt_reg[4]_i_1_n_7 }),
        .S({reset_cnt_reg[7],\reset_cnt_reg_n_0_[6] ,\reset_cnt_reg_n_0_[5] ,\reset_cnt_reg_n_0_[4] }));
  FDRE #(
    .INIT(1'b0)) 
    \reset_cnt_reg[5] 
       (.C(clk),
        .CE(rst_o_reg_i_1_n_0),
        .D(\reset_cnt_reg[4]_i_1_n_6 ),
        .Q(\reset_cnt_reg_n_0_[5] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \reset_cnt_reg[6] 
       (.C(clk),
        .CE(rst_o_reg_i_1_n_0),
        .D(\reset_cnt_reg[4]_i_1_n_5 ),
        .Q(\reset_cnt_reg_n_0_[6] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \reset_cnt_reg[7] 
       (.C(clk),
        .CE(rst_o_reg_i_1_n_0),
        .D(\reset_cnt_reg[4]_i_1_n_4 ),
        .Q(reset_cnt_reg[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \reset_cnt_reg[8] 
       (.C(clk),
        .CE(rst_o_reg_i_1_n_0),
        .D(\reset_cnt_reg[8]_i_1_n_7 ),
        .Q(reset_cnt_reg[8]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \reset_cnt_reg[8]_i_1 
       (.CI(\reset_cnt_reg[4]_i_1_n_0 ),
        .CO({\reset_cnt_reg[8]_i_1_n_0 ,\reset_cnt_reg[8]_i_1_n_1 ,\reset_cnt_reg[8]_i_1_n_2 ,\reset_cnt_reg[8]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\reset_cnt_reg[8]_i_1_n_4 ,\reset_cnt_reg[8]_i_1_n_5 ,\reset_cnt_reg[8]_i_1_n_6 ,\reset_cnt_reg[8]_i_1_n_7 }),
        .S(reset_cnt_reg[11:8]));
  FDRE #(
    .INIT(1'b0)) 
    \reset_cnt_reg[9] 
       (.C(clk),
        .CE(rst_o_reg_i_1_n_0),
        .D(\reset_cnt_reg[8]_i_1_n_6 ),
        .Q(reset_cnt_reg[9]),
        .R(1'b0));
  LUT1 #(
    .INIT(2'h1)) 
    rst_n_o_INST_0
       (.I0(rst_o),
        .O(rst_n_o));
  LUT5 #(
    .INIT(32'hFFFF1055)) 
    rst_o_reg_i_1
       (.I0(reset_cnt_reg[16]),
        .I1(rst_o_reg_i_2_n_0),
        .I2(rst_o_reg_i_3_n_0),
        .I3(reset_cnt_reg[15]),
        .I4(rst_o_reg_i_4_n_0),
        .O(rst_o_reg_i_1_n_0));
  LUT4 #(
    .INIT(16'hFFFE)) 
    rst_o_reg_i_2
       (.I0(reset_cnt_reg[12]),
        .I1(reset_cnt_reg[13]),
        .I2(reset_cnt_reg[11]),
        .I3(reset_cnt_reg[14]),
        .O(rst_o_reg_i_2_n_0));
  LUT4 #(
    .INIT(16'h5557)) 
    rst_o_reg_i_3
       (.I0(reset_cnt_reg[10]),
        .I1(reset_cnt_reg[8]),
        .I2(reset_cnt_reg[7]),
        .I3(reset_cnt_reg[9]),
        .O(rst_o_reg_i_3_n_0));
  LUT4 #(
    .INIT(16'h7FFF)) 
    rst_o_reg_i_4
       (.I0(reset_cnt_reg[18]),
        .I1(reset_cnt_reg[19]),
        .I2(reset_cnt_reg[17]),
        .I3(reset_cnt_reg[20]),
        .O(rst_o_reg_i_4_n_0));
  FDRE rst_o_reg_reg
       (.C(clk),
        .CE(1'b1),
        .D(rst_o_reg_i_1_n_0),
        .Q(rst_o),
        .R(1'b0));
endmodule

(* CHECK_LICENSE_TYPE = "system_Reset_Delay_0_0,Reset_Delay,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "package_project" *) 
(* X_CORE_INFO = "Reset_Delay,Vivado 2020.1" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (clk,
    rst_o,
    rst_n_o);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clk CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN system_clk_wiz_1_0_clk_out1, INSERT_VIP 0" *) input clk;
  output rst_o;
  output rst_n_o;

  wire clk;
  wire rst_n_o;
  wire rst_o;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_Reset_Delay inst
       (.clk(clk),
        .rst_n_o(rst_n_o),
        .rst_o(rst_o));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
