
Q
Command: %s
53*	vivadotcl2 
route_design2default:defaultZ4-113h px� 
�
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2"
Implementation2default:default2
xc7a35t2default:defaultZ17-347h px� 
�
0Got license for feature '%s' and/or device '%s'
310*common2"
Implementation2default:default2
xc7a35t2default:defaultZ17-349h px� 
p
,Running DRC as a precondition to command %s
22*	vivadotcl2 
route_design2default:defaultZ4-22h px� 
P
Running DRC with %s threads
24*drc2
22default:defaultZ23-27h px� 
V
DRC finished with %s
79*	vivadotcl2
0 Errors2default:defaultZ4-198h px� 
e
BPlease refer to the DRC report (report_drc) for more information.
80*	vivadotclZ4-199h px� 
V

Starting %s Task
103*constraints2
Routing2default:defaultZ18-103h px� 
}
BMultithreading enabled for route_design using a maximum of %s CPUs17*	routeflow2
22default:defaultZ35-254h px� 
p

Phase %s%s
101*constraints2
1 2default:default2#
Build RT Design2default:defaultZ18-101h px� 
B
-Phase 1 Build RT Design | Checksum: d6ba155f
*commonh px� 
�

%s
*constraints2p
\Time (s): cpu = 00:00:19 ; elapsed = 00:00:16 . Memory (MB): peak = 2137.492 ; gain = 45.2582default:defaulth px� 
v

Phase %s%s
101*constraints2
2 2default:default2)
Router Initialization2default:defaultZ18-101h px� 
o

Phase %s%s
101*constraints2
2.1 2default:default2 
Create Timer2default:defaultZ18-101h px� 
A
,Phase 2.1 Create Timer | Checksum: d6ba155f
*commonh px� 
�

%s
*constraints2p
\Time (s): cpu = 00:00:19 ; elapsed = 00:00:16 . Memory (MB): peak = 2169.801 ; gain = 77.5662default:defaulth px� 
{

Phase %s%s
101*constraints2
2.2 2default:default2,
Fix Topology Constraints2default:defaultZ18-101h px� 
M
8Phase 2.2 Fix Topology Constraints | Checksum: d6ba155f
*commonh px� 
�

%s
*constraints2p
\Time (s): cpu = 00:00:19 ; elapsed = 00:00:16 . Memory (MB): peak = 2178.492 ; gain = 86.2582default:defaulth px� 
t

Phase %s%s
101*constraints2
2.3 2default:default2%
Pre Route Cleanup2default:defaultZ18-101h px� 
F
1Phase 2.3 Pre Route Cleanup | Checksum: d6ba155f
*commonh px� 
�

%s
*constraints2p
\Time (s): cpu = 00:00:19 ; elapsed = 00:00:16 . Memory (MB): peak = 2178.492 ; gain = 86.2582default:defaulth px� 
p

Phase %s%s
101*constraints2
2.4 2default:default2!
Update Timing2default:defaultZ18-101h px� 
C
.Phase 2.4 Update Timing | Checksum: 1a384aa3a
*commonh px� 
�

%s
*constraints2q
]Time (s): cpu = 00:00:23 ; elapsed = 00:00:22 . Memory (MB): peak = 2211.312 ; gain = 119.0782default:defaulth px� 
�
Intermediate Timing Summary %s164*route2M
9| WNS=-4.051 | TNS=-1202.910| WHS=-1.356 | THS=-853.626|
2default:defaultZ35-416h px� 
}

Phase %s%s
101*constraints2
2.5 2default:default2.
Update Timing for Bus Skew2default:defaultZ18-101h px� 
r

Phase %s%s
101*constraints2
2.5.1 2default:default2!
Update Timing2default:defaultZ18-101h px� 
E
0Phase 2.5.1 Update Timing | Checksum: 2188cc6f3
*commonh px� 
�

%s
*constraints2q
]Time (s): cpu = 00:00:25 ; elapsed = 00:00:25 . Memory (MB): peak = 2230.457 ; gain = 138.2232default:defaulth px� 
�
Intermediate Timing Summary %s164*route2L
8| WNS=-4.051 | TNS=-1196.692| WHS=N/A    | THS=N/A    |
2default:defaultZ35-416h px� 
P
;Phase 2.5 Update Timing for Bus Skew | Checksum: 1940496db
*commonh px� 
�

%s
*constraints2q
]Time (s): cpu = 00:00:25 ; elapsed = 00:00:25 . Memory (MB): peak = 2242.543 ; gain = 150.3092default:defaulth px� 
I
4Phase 2 Router Initialization | Checksum: 241dd765f
*commonh px� 
�

%s
*constraints2q
]Time (s): cpu = 00:00:25 ; elapsed = 00:00:25 . Memory (MB): peak = 2242.543 ; gain = 150.3092default:defaulth px� 
p

Phase %s%s
101*constraints2
3 2default:default2#
Initial Routing2default:defaultZ18-101h px� 
C
.Phase 3 Initial Routing | Checksum: 1edc0f71d
*commonh px� 
�

%s
*constraints2q
]Time (s): cpu = 00:00:33 ; elapsed = 00:00:31 . Memory (MB): peak = 2279.000 ; gain = 186.7662default:defaulth px� 
�
>Design has %s pins with tight setup and hold constraints.

%s
244*route2
82default:default2�
�The top 5 pins with tight setup and hold constraints:

+--------------------------+--------------------------+----------------------------------------------------------------------------------------------------------+
|       Launch Clock       |      Capture Clock       |                                                 Pin                                                      |
+--------------------------+--------------------------+----------------------------------------------------------------------------------------------------------+
|       clk_out4_clk_wiz_0 |                clk_pll_i |                                                                     u_ddr3_top/u_ddr3_rw/rd_load_d0_reg/D|
|       clk_out4_clk_wiz_0 |                clk_pll_i |                                                              u_ddr3_top/u_ddr3_fifo_ctrl/rd_load_d0_reg/D|
|       clk_out2_clk_wiz_0 |       clk_out3_clk_wiz_0 |                                               u_ila_0/inst/ila_core_inst/shifted_data_in_reg[7][0]_srl8/D|
|       clk_out2_clk_wiz_0 |       clk_out3_clk_wiz_0 |u_ila_0/inst/ila_core_inst/u_trig/U_TM/N_DDR_MODE.G_NMU[0].U_M/allx_typeA_match_detection.ltlib_v1_0_0_allx_typeA_inst/probeDelay1_reg[0]/D|
|                sys_clk_p |       clk_out3_clk_wiz_0 |                                               u_ila_0/inst/ila_core_inst/shifted_data_in_reg[7][4]_srl8/D|
+--------------------------+--------------------------+----------------------------------------------------------------------------------------------------------+

File with complete list of pins: tight_setup_hold_pins.txt
2default:defaultZ35-580h px� 
s

Phase %s%s
101*constraints2
4 2default:default2&
Rip-up And Reroute2default:defaultZ18-101h px� 
u

Phase %s%s
101*constraints2
4.1 2default:default2&
Global Iteration 02default:defaultZ18-101h px� 
�
Intermediate Timing Summary %s164*route2L
8| WNS=-4.312 | TNS=-1372.823| WHS=N/A    | THS=N/A    |
2default:defaultZ35-416h px� 
H
3Phase 4.1 Global Iteration 0 | Checksum: 20b20b6f9
*commonh px� 
�

%s
*constraints2q
]Time (s): cpu = 00:02:21 ; elapsed = 00:02:07 . Memory (MB): peak = 2310.816 ; gain = 218.5822default:defaulth px� 
u

Phase %s%s
101*constraints2
4.2 2default:default2&
Global Iteration 12default:defaultZ18-101h px� 
�
Intermediate Timing Summary %s164*route2L
8| WNS=-4.365 | TNS=-1368.448| WHS=N/A    | THS=N/A    |
2default:defaultZ35-416h px� 
H
3Phase 4.2 Global Iteration 1 | Checksum: 178c3afb9
*commonh px� 
�

%s
*constraints2q
]Time (s): cpu = 00:02:21 ; elapsed = 00:02:08 . Memory (MB): peak = 2310.816 ; gain = 218.5822default:defaulth px� 
F
1Phase 4 Rip-up And Reroute | Checksum: 178c3afb9
*commonh px� 
�

%s
*constraints2q
]Time (s): cpu = 00:02:21 ; elapsed = 00:02:08 . Memory (MB): peak = 2310.816 ; gain = 218.5822default:defaulth px� 
|

Phase %s%s
101*constraints2
5 2default:default2/
Delay and Skew Optimization2default:defaultZ18-101h px� 
p

Phase %s%s
101*constraints2
5.1 2default:default2!
Delay CleanUp2default:defaultZ18-101h px� 
r

Phase %s%s
101*constraints2
5.1.1 2default:default2!
Update Timing2default:defaultZ18-101h px� 
E
0Phase 5.1.1 Update Timing | Checksum: 126001434
*commonh px� 
�

%s
*constraints2q
]Time (s): cpu = 00:02:22 ; elapsed = 00:02:09 . Memory (MB): peak = 2310.816 ; gain = 218.5822default:defaulth px� 
�
Intermediate Timing Summary %s164*route2L
8| WNS=-4.312 | TNS=-1355.495| WHS=N/A    | THS=N/A    |
2default:defaultZ35-416h px� 
C
.Phase 5.1 Delay CleanUp | Checksum: 11606869c
*commonh px� 
�

%s
*constraints2q
]Time (s): cpu = 00:02:25 ; elapsed = 00:02:11 . Memory (MB): peak = 2310.816 ; gain = 218.5822default:defaulth px� 
z

Phase %s%s
101*constraints2
5.2 2default:default2+
Clock Skew Optimization2default:defaultZ18-101h px� 
M
8Phase 5.2 Clock Skew Optimization | Checksum: 11606869c
*commonh px� 
�

%s
*constraints2q
]Time (s): cpu = 00:02:25 ; elapsed = 00:02:11 . Memory (MB): peak = 2310.816 ; gain = 218.5822default:defaulth px� 
O
:Phase 5 Delay and Skew Optimization | Checksum: 11606869c
*commonh px� 
�

%s
*constraints2q
]Time (s): cpu = 00:02:25 ; elapsed = 00:02:11 . Memory (MB): peak = 2310.816 ; gain = 218.5822default:defaulth px� 
n

Phase %s%s
101*constraints2
6 2default:default2!
Post Hold Fix2default:defaultZ18-101h px� 
p

Phase %s%s
101*constraints2
6.1 2default:default2!
Hold Fix Iter2default:defaultZ18-101h px� 
r

Phase %s%s
101*constraints2
6.1.1 2default:default2!
Update Timing2default:defaultZ18-101h px� 
D
/Phase 6.1.1 Update Timing | Checksum: 9f10f428
*commonh px� 
�

%s
*constraints2q
]Time (s): cpu = 00:02:26 ; elapsed = 00:02:12 . Memory (MB): peak = 2310.816 ; gain = 218.5822default:defaulth px� 
�
Intermediate Timing Summary %s164*route2L
8| WNS=-4.278 | TNS=-1334.363| WHS=-0.551 | THS=-1.243 |
2default:defaultZ35-416h px� 
�

Phase %s%s
101*constraints2
6.1.2 2default:default25
!Lut RouteThru Assignment for hold2default:defaultZ18-101h px� 
Y
DPhase 6.1.2 Lut RouteThru Assignment for hold | Checksum: 106556913
*commonh px� 
�

%s
*constraints2q
]Time (s): cpu = 00:02:26 ; elapsed = 00:02:12 . Memory (MB): peak = 2310.816 ; gain = 218.5822default:defaulth px� 
C
.Phase 6.1 Hold Fix Iter | Checksum: 106556913
*commonh px� 
�

%s
*constraints2q
]Time (s): cpu = 00:02:27 ; elapsed = 00:02:12 . Memory (MB): peak = 2310.816 ; gain = 218.5822default:defaulth px� 
v

Phase %s%s
101*constraints2
6.2 2default:default2'
Additional Hold Fix2default:defaultZ18-101h px� 
�
Intermediate Timing Summary %s164*route2L
8| WNS=-4.278 | TNS=-1334.363| WHS=-0.551 | THS=-1.243 |
2default:defaultZ35-416h px� 
H
3Phase 6.2 Additional Hold Fix | Checksum: f6a3b541
*commonh px� 
�

%s
*constraints2q
]Time (s): cpu = 00:02:28 ; elapsed = 00:02:14 . Memory (MB): peak = 2310.816 ; gain = 218.5822default:defaulth px� 
�
�The router encountered %s pins that are both setup-critical and hold-critical and tried to fix hold violations at the expense of setup slack. Such pins are:
%s201*route2
122default:default2�
�	u_ila_0/inst/ila_core_inst/shifted_data_in_reg[7][4]_srl8/D
	u_hdmi_top/u_video_driver/video_vs_INST_0_i_1/I3
	u_hdmi_top/u_video_driver/video_vs_INST_0_i_1/I2
	u_ddr3_top/u_ddr3_rw/rd_load_d0_reg/D
	u_hdmi_top/u_video_driver/video_vs_INST_0/I0
	u_hdmi_top/u_video_driver/video_vs_INST_0_i_1/I4
	u_hdmi_top/u_video_driver/video_vs_INST_0/I1
	u_hdmi_top/u_video_driver/video_vs_INST_0_i_1/I0
	u_hdmi_top/u_video_driver/video_vs_INST_0/I2
	u_hdmi_top/u_video_driver/video_vs_INST_0_i_1/I1
	.. and 2 more pins.
2default:defaultZ35-468h px� 
A
,Phase 6 Post Hold Fix | Checksum: 191bf07f1
*commonh px� 
�

%s
*constraints2q
]Time (s): cpu = 00:02:28 ; elapsed = 00:02:15 . Memory (MB): peak = 2310.816 ; gain = 218.5822default:defaulth px� 
o

Phase %s%s
101*constraints2
7 2default:default2"
Route finalize2default:defaultZ18-101h px� 
B
-Phase 7 Route finalize | Checksum: 1a5e0cbc1
*commonh px� 
�

%s
*constraints2q
]Time (s): cpu = 00:02:28 ; elapsed = 00:02:15 . Memory (MB): peak = 2310.816 ; gain = 218.5822default:defaulth px� 
v

Phase %s%s
101*constraints2
8 2default:default2)
Verifying routed nets2default:defaultZ18-101h px� 
I
4Phase 8 Verifying routed nets | Checksum: 1a5e0cbc1
*commonh px� 
�

%s
*constraints2q
]Time (s): cpu = 00:02:28 ; elapsed = 00:02:15 . Memory (MB): peak = 2310.816 ; gain = 218.5822default:defaulth px� 
r

Phase %s%s
101*constraints2
9 2default:default2%
Depositing Routes2default:defaultZ18-101h px� 
E
0Phase 9 Depositing Routes | Checksum: 168b85423
*commonh px� 
�

%s
*constraints2q
]Time (s): cpu = 00:02:29 ; elapsed = 00:02:17 . Memory (MB): peak = 2310.816 ; gain = 218.5822default:defaulth px� 
�
SRouter was unable to fix hold violation on pin %s driven by global clock buffer %s.167*route2O
;u_ila_0/inst/ila_core_inst/shifted_data_in_reg[7][0]_srl8/D2default:default2!
BUFGCTRL_X0Y42default:defaultZ35-419h px� 
�
SRouter was unable to fix hold violation on pin %s driven by global clock buffer %s.167*route2O
;u_ila_0/inst/ila_core_inst/shifted_data_in_reg[7][2]_srl8/D2default:default2!
BUFGCTRL_X0Y22default:defaultZ35-419h px� 
�
SRouter was unable to fix hold violation on pin %s driven by global clock buffer %s.167*route2�
�u_ila_0/inst/ila_core_inst/u_trig/U_TM/N_DDR_MODE.G_NMU[0].U_M/allx_typeA_match_detection.ltlib_v1_0_0_allx_typeA_inst/probeDelay1[0]_i_1/I22default:default2!
BUFGCTRL_X0Y42default:defaultZ35-419h px� 
t

Phase %s%s
101*constraints2
10 2default:default2&
Post Router Timing2default:defaultZ18-101h px� 
q

Phase %s%s
101*constraints2
10.1 2default:default2!
Update Timing2default:defaultZ18-101h px� 
D
/Phase 10.1 Update Timing | Checksum: 1beb1bb94
*commonh px� 
�

%s
*constraints2q
]Time (s): cpu = 00:02:30 ; elapsed = 00:02:18 . Memory (MB): peak = 2310.816 ; gain = 218.5822default:defaulth px� 
�
Estimated Timing Summary %s
57*route2L
8| WNS=-4.278 | TNS=-1334.363| WHS=-0.551 | THS=-1.243 |
2default:defaultZ35-57h px� 
B
!Router estimated timing not met.
128*routeZ35-328h px� 
G
2Phase 10 Post Router Timing | Checksum: 1beb1bb94
*commonh px� 
�

%s
*constraints2q
]Time (s): cpu = 00:02:30 ; elapsed = 00:02:18 . Memory (MB): peak = 2310.816 ; gain = 218.5822default:defaulth px� 
@
Router Completed Successfully
2*	routeflowZ35-16h px� 
�

%s
*constraints2q
]Time (s): cpu = 00:02:30 ; elapsed = 00:02:18 . Memory (MB): peak = 2310.816 ; gain = 218.5822default:defaulth px� 
Z
Releasing license: %s
83*common2"
Implementation2default:defaultZ17-83h px� 
�
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
1102default:default2
262default:default2
02default:default2
02default:defaultZ4-41h px� 
^
%s completed successfully
29*	vivadotcl2 
route_design2default:defaultZ4-42h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2"
route_design: 2default:default2
00:02:352default:default2
00:02:202default:default2
2310.8162default:default2
218.5822default:defaultZ17-268h px� 
H
&Writing timing data to binary archive.266*timingZ38-480h px� 
D
Writing placer database...
1603*designutilsZ20-1893h px� 
=
Writing XDEF routing.
211*designutilsZ20-211h px� 
J
#Writing XDEF routing logical nets.
209*designutilsZ20-209h px� 
J
#Writing XDEF routing special nets.
210*designutilsZ20-210h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2)
Write XDEF Complete: 2default:default2
00:00:042default:default2
00:00:022default:default2
2310.8162default:default2
0.0002default:defaultZ17-268h px� 
�
 The %s '%s' has been generated.
621*common2

checkpoint2default:default2|
hC:/Users/txzing/Desktop/test/Lattice_A7/A7/33_sd_bmp_hdmi/sd_bmp_hdmi.runs/impl_1/sd_bmp_hdmi_routed.dcp2default:defaultZ17-1381h px� 
�
%s4*runtcl2�
vExecuting : report_drc -file sd_bmp_hdmi_drc_routed.rpt -pb sd_bmp_hdmi_drc_routed.pb -rpx sd_bmp_hdmi_drc_routed.rpx
2default:defaulth px� 
�
Command: %s
53*	vivadotcl2}
ireport_drc -file sd_bmp_hdmi_drc_routed.rpt -pb sd_bmp_hdmi_drc_routed.pb -rpx sd_bmp_hdmi_drc_routed.rpx2default:defaultZ4-113h px� 
>
IP Catalog is up to date.1232*coregenZ19-1839h px� 
P
Running DRC with %s threads
24*drc2
22default:defaultZ23-27h px� 
�
#The results of DRC are in file %s.
168*coretcl2�
lC:/Users/txzing/Desktop/test/Lattice_A7/A7/33_sd_bmp_hdmi/sd_bmp_hdmi.runs/impl_1/sd_bmp_hdmi_drc_routed.rptlC:/Users/txzing/Desktop/test/Lattice_A7/A7/33_sd_bmp_hdmi/sd_bmp_hdmi.runs/impl_1/sd_bmp_hdmi_drc_routed.rpt2default:default8Z2-168h px� 
\
%s completed successfully
29*	vivadotcl2

report_drc2default:defaultZ4-42h px� 
�
%s4*runtcl2�
�Executing : report_methodology -file sd_bmp_hdmi_methodology_drc_routed.rpt -pb sd_bmp_hdmi_methodology_drc_routed.pb -rpx sd_bmp_hdmi_methodology_drc_routed.rpx
2default:defaulth px� 
�
Command: %s
53*	vivadotcl2�
�report_methodology -file sd_bmp_hdmi_methodology_drc_routed.rpt -pb sd_bmp_hdmi_methodology_drc_routed.pb -rpx sd_bmp_hdmi_methodology_drc_routed.rpx2default:defaultZ4-113h px� 
E
%Done setting XDC timing constraints.
35*timingZ38-35h px� 
Y
$Running Methodology with %s threads
74*drc2
22default:defaultZ23-133h px� 
�
2The results of Report Methodology are in file %s.
450*coretcl2�
xC:/Users/txzing/Desktop/test/Lattice_A7/A7/33_sd_bmp_hdmi/sd_bmp_hdmi.runs/impl_1/sd_bmp_hdmi_methodology_drc_routed.rptxC:/Users/txzing/Desktop/test/Lattice_A7/A7/33_sd_bmp_hdmi/sd_bmp_hdmi.runs/impl_1/sd_bmp_hdmi_methodology_drc_routed.rpt2default:default8Z2-1520h px� 
d
%s completed successfully
29*	vivadotcl2&
report_methodology2default:defaultZ4-42h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2(
report_methodology: 2default:default2
00:00:092default:default2
00:00:092default:default2
2329.5352default:default2
18.7192default:defaultZ17-268h px� 
�
%s4*runtcl2�
�Executing : report_power -file sd_bmp_hdmi_power_routed.rpt -pb sd_bmp_hdmi_power_summary_routed.pb -rpx sd_bmp_hdmi_power_routed.rpx
2default:defaulth px� 
�
Command: %s
53*	vivadotcl2�
yreport_power -file sd_bmp_hdmi_power_routed.rpt -pb sd_bmp_hdmi_power_summary_routed.pb -rpx sd_bmp_hdmi_power_routed.rpx2default:defaultZ4-113h px� 
E
%Done setting XDC timing constraints.
35*timingZ38-35h px� 
K
,Running Vector-less Activity Propagation...
51*powerZ33-51h px� 
P
3
Finished Running Vector-less Activity Propagation
1*powerZ33-1h px� 
�
�Detected over-assertion of set/reset/preset/clear net with high fanouts, power estimation might not be accurate. Please run Tool - Power Constraint Wizard to set proper switching activities for control signals.282*powerZ33-332h px� 
�
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
1222default:default2
272default:default2
02default:default2
02default:defaultZ4-41h px� 
^
%s completed successfully
29*	vivadotcl2 
report_power2default:defaultZ4-42h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2"
report_power: 2default:default2
00:00:062default:default2
00:00:072default:default2
2340.6482default:default2
11.1132default:defaultZ17-268h px� 
�
%s4*runtcl2w
cExecuting : report_route_status -file sd_bmp_hdmi_route_status.rpt -pb sd_bmp_hdmi_route_status.pb
2default:defaulth px� 
�
%s4*runtcl2�
�Executing : report_timing_summary -max_paths 10 -file sd_bmp_hdmi_timing_summary_routed.rpt -pb sd_bmp_hdmi_timing_summary_routed.pb -rpx sd_bmp_hdmi_timing_summary_routed.rpx -warn_on_violation 
2default:defaulth px� 
r
UpdateTimingParams:%s.
91*timing29
% Speed grade: -2, Delay Type: min_max2default:defaultZ38-91h px� 
|
CMultithreading enabled for timing update using a maximum of %s CPUs155*timing2
22default:defaultZ38-191h px� 
�
rThe design failed to meet the timing requirements. Please see the %s report for details on the timing violations.
188*timing2"
timing summary2default:defaultZ38-282h px� 
�
}There are set_bus_skew constraint(s) in this design. Please run report_bus_skew to ensure that bus skew requirements are met.223*timingZ38-436h px� 
�
%s4*runtcl2h
TExecuting : report_incremental_reuse -file sd_bmp_hdmi_incremental_reuse_routed.rpt
2default:defaulth px� 
g
BIncremental flow is disabled. No incremental reuse Info to report.423*	vivadotclZ4-1062h px� 
�
%s4*runtcl2h
TExecuting : report_clock_utilization -file sd_bmp_hdmi_clock_utilization_routed.rpt
2default:defaulth px� 
�
%s4*runtcl2�
�Executing : report_bus_skew -warn_on_violation -file sd_bmp_hdmi_bus_skew_routed.rpt -pb sd_bmp_hdmi_bus_skew_routed.pb -rpx sd_bmp_hdmi_bus_skew_routed.rpx
2default:defaulth px� 
r
UpdateTimingParams:%s.
91*timing29
% Speed grade: -2, Delay Type: min_max2default:defaultZ38-91h px� 
|
CMultithreading enabled for timing update using a maximum of %s CPUs155*timing2
22default:defaultZ38-191h px� 


End Record