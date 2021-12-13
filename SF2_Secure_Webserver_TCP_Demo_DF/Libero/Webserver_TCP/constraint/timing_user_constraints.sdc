set_clock_uncertainty -setup 0.32 -from [ get_clocks { SERDES_IF_0/SERDESIF_INST/EPCS_RXCLK[1] } ] -to [ get_clocks { FCCC_0/GL0 } ]
set_clock_uncertainty -hold 0.32 -from [ get_clocks { SERDES_IF_0/SERDESIF_INST/EPCS_RXCLK[1] } ] -to [ get_clocks { FCCC_0/GL0 } ]
set_clock_uncertainty -setup 0.32 -from [ get_clocks { SERDES_IF_0/SERDESIF_INST/EPCS_RXCLK[1] } ] -to [ get_clocks { FCCC_0/GL1 } ]
set_clock_uncertainty -hold 0.32 -from [ get_clocks { SERDES_IF_0/SERDESIF_INST/EPCS_RXCLK[1] } ] -to [ get_clocks { FCCC_0/GL1 } ]


set_min_delay 1.000  -from [ get_clocks { SERDES_IF_0/SERDESIF_INST/EPCS_RXCLK[1] } ]  -to [ get_pins { Webserver_TCP_sb_0/Webserver_TCP_sb_MSS_0/MSS_ADLIB_INST/RCGF[0] Webserver_TCP_sb_0/Webserver_TCP_sb_MSS_0/MSS_ADLIB_INST/RCGF[1] Webserver_TCP_sb_0/Webserver_TCP_sb_MSS_0/MSS_ADLIB_INST/RCGF[2] Webserver_TCP_sb_0/Webserver_TCP_sb_MSS_0/MSS_ADLIB_INST/RCGF[3] Webserver_TCP_sb_0/Webserver_TCP_sb_MSS_0/MSS_ADLIB_INST/RCGF[4] Webserver_TCP_sb_0/Webserver_TCP_sb_MSS_0/MSS_ADLIB_INST/RCGF[5] Webserver_TCP_sb_0/Webserver_TCP_sb_MSS_0/MSS_ADLIB_INST/RCGF[6] Webserver_TCP_sb_0/Webserver_TCP_sb_MSS_0/MSS_ADLIB_INST/RCGF[7] Webserver_TCP_sb_0/Webserver_TCP_sb_MSS_0/MSS_ADLIB_INST/RCGF[8] Webserver_TCP_sb_0/Webserver_TCP_sb_MSS_0/MSS_ADLIB_INST/RCGF[9] } ]

set_multicycle_path -setup_only 3 -from [ get_pins { Webserver_TCP_sb_0/Webserver_TCP_sb_MSS_0/MSS_ADLIB_INST/GTX_CLKPF } ] -to [ get_pins { SERDES_IF_0/SERDESIF_INST/EPCS_TXDATA[20] SERDES_IF_0/SERDESIF_INST/EPCS_TXDATA[21] SERDES_IF_0/SERDESIF_INST/EPCS_TXDATA[22] SERDES_IF_0/SERDESIF_INST/EPCS_TXDATA[23] SERDES_IF_0/SERDESIF_INST/EPCS_TXDATA[24] SERDES_IF_0/SERDESIF_INST/EPCS_TXDATA[25] SERDES_IF_0/SERDESIF_INST/EPCS_TXDATA[26] SERDES_IF_0/SERDESIF_INST/EPCS_TXDATA[27] SERDES_IF_0/SERDESIF_INST/EPCS_TXDATA[28] SERDES_IF_0/SERDESIF_INST/EPCS_TXDATA[29] } ]
set_multicycle_path -hold 0 -from [ get_pins { Webserver_TCP_sb_0/Webserver_TCP_sb_MSS_0/MSS_ADLIB_INST/GTX_CLKPF } ] -to [ get_pins { SERDES_IF_0/SERDESIF_INST/EPCS_TXDATA[20] SERDES_IF_0/SERDESIF_INST/EPCS_TXDATA[21] SERDES_IF_0/SERDESIF_INST/EPCS_TXDATA[22] SERDES_IF_0/SERDESIF_INST/EPCS_TXDATA[23] SERDES_IF_0/SERDESIF_INST/EPCS_TXDATA[24] SERDES_IF_0/SERDESIF_INST/EPCS_TXDATA[25] SERDES_IF_0/SERDESIF_INST/EPCS_TXDATA[26] SERDES_IF_0/SERDESIF_INST/EPCS_TXDATA[27] SERDES_IF_0/SERDESIF_INST/EPCS_TXDATA[28] SERDES_IF_0/SERDESIF_INST/EPCS_TXDATA[29] } ]

set_false_path  -through [ get_pins { Webserver_TCP_sb_0/CORERESETP_0/release_sdif0_core/CLK } ]
set_false_path  -through [ get_pins { Webserver_TCP_sb_0/CORERESETP_0/release_sdif1_core/CLK } ]
set_false_path  -through [ get_pins { Webserver_TCP_sb_0/CORERESETP_0/release_sdif2_core/CLK } ]
set_false_path  -through [ get_pins {Webserver_TCP_sb_0/CORERESETP_0/release_sdif3_core/CLK } ]
set_false_path  -through [ get_pins { Webserver_TCP_sb_0/CORERESETP_0/ddr_settled/CLK } ]
set_false_path -from [ get_pins { Webserver_TCP_sb_0/Webserver_TCP_sb_MSS_0/MSS_ADLIB_INST/GTX_CLKPF } ] -to [ get_pins { SERDES_IF_0/SERDESIF_INST/EPCS_TXDATA[*] } ]
