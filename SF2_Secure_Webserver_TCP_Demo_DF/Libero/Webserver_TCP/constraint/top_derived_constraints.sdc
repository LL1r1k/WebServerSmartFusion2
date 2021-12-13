# Microsemi Corp.
# Date: 2021-Jun-11 22:56:39
# This file was generated based on the following SDC source files:
#   C:/tcl_update/sf2/dg0516/516_v8/DG0516_SF2_Secure_Webserver_TCP_Demo/Libero_Project/component/work/top/FCCC_0/top_FCCC_0_FCCC.sdc
#   C:/tcl_update/sf2/dg0516/516_v8/DG0516_SF2_Secure_Webserver_TCP_Demo/Libero_Project/component/work/top/FCCC_1/top_FCCC_1_FCCC.sdc
#   C:/tcl_update/sf2/dg0516/516_v8/DG0516_SF2_Secure_Webserver_TCP_Demo/Libero_Project/component/work/top/SERDES_IF_0/top_SERDES_IF_0_SERDES_IF.sdc
#   C:/tcl_update/sf2/dg0516/516_v8/DG0516_SF2_Secure_Webserver_TCP_Demo/Libero_Project/component/work/Webserver_TCP_sb/CCC_0/Webserver_TCP_sb_CCC_0_FCCC.sdc
#   C:/Microsemi/Libero_SoC_v2021.1/Designer/data/aPA4M/cores/constraints/PA4M12000/coreconfigp.sdc
#   C:/Microsemi/Libero_SoC_v2021.1/Designer/data/aPA4M/cores/constraints/coreresetp.sdc
#   C:/tcl_update/sf2/dg0516/516_v8/DG0516_SF2_Secure_Webserver_TCP_Demo/Libero_Project/component/work/Webserver_TCP_sb/FABOSC_0/Webserver_TCP_sb_FABOSC_0_OSC.sdc
#   C:/tcl_update/sf2/dg0516/516_v8/DG0516_SF2_Secure_Webserver_TCP_Demo/Libero_Project/component/work/Webserver_TCP_sb_MSS/Webserver_TCP_sb_MSS.sdc
#   C:/Microsemi/Libero_SoC_v2021.1/Designer/data/aPA4M/cores/constraints/sysreset.sdc
#

create_clock -name {SERDES_IF_0/SERDESIF_INST/EPCS_RXCLK[1]} -period 8 [ get_pins { SERDES_IF_0/SERDESIF_INST/EPCS_RXCLK[1] } ]
create_clock -name {SERDES_IF_0/SERDESIF_INST/EPCS_TXCLK[1]} -period 8 [ get_pins { SERDES_IF_0/SERDESIF_INST/EPCS_TXCLK[1] } ]
create_clock -name {Webserver_TCP_sb_0/FABOSC_0/I_RCOSC_25_50MHZ/CLKOUT} -period 20 [ get_pins { Webserver_TCP_sb_0/FABOSC_0/I_RCOSC_25_50MHZ/CLKOUT } ]
create_clock -name {Webserver_TCP_sb_0/Webserver_TCP_sb_MSS_0/CLK_CONFIG_APB} -period 40 [ get_pins { Webserver_TCP_sb_0/Webserver_TCP_sb_MSS_0/MSS_ADLIB_INST/CLK_CONFIG_APB } ]
create_generated_clock -name {FCCC_0/GL0} -multiply_by 2 -divide_by 4 -source [ get_pins { FCCC_0/CCC_INST/CLK0 } ] -phase 0 [ get_pins { FCCC_0/CCC_INST/GL0 } ]
create_generated_clock -name {FCCC_0/GL1} -invert -multiply_by 2 -divide_by 4 -source [ get_pins { FCCC_0/CCC_INST/CLK0 } ] -phase 0 [ get_pins { FCCC_0/CCC_INST/GL1 } ]
create_generated_clock -name {FCCC_1/GL0} -multiply_by 4 -divide_by 4 -source [ get_pins { FCCC_1/CCC_INST/CLK0 } ] -phase 0 [ get_pins { FCCC_1/CCC_INST/GL0 } ]
create_generated_clock -name {Webserver_TCP_sb_0/CCC_0/GL0} -multiply_by 20 -divide_by 10 -source [ get_pins { Webserver_TCP_sb_0/CCC_0/CCC_INST/RCOSC_25_50MHZ } ] -phase 0 [ get_pins { Webserver_TCP_sb_0/CCC_0/CCC_INST/GL0 } ]
create_generated_clock -name {Webserver_TCP_sb_0/CCC_0/GL3} -multiply_by 20 -divide_by 8 -source [ get_pins { Webserver_TCP_sb_0/CCC_0/CCC_INST/RCOSC_25_50MHZ } ] -phase 0 [ get_pins { Webserver_TCP_sb_0/CCC_0/CCC_INST/GL3 } ]
set_false_path -ignore_errors -through [ get_nets { Webserver_TCP_sb_0/CORECONFIGP_0/INIT_DONE Webserver_TCP_sb_0/CORECONFIGP_0/SDIF_RELEASED } ]
set_false_path -ignore_errors -through [ get_nets { Webserver_TCP_sb_0/CORERESETP_0/ddr_settled Webserver_TCP_sb_0/CORERESETP_0/count_ddr_enable Webserver_TCP_sb_0/CORERESETP_0/release_sdif*_core Webserver_TCP_sb_0/CORERESETP_0/count_sdif*_enable } ]
set_false_path -ignore_errors -from [ get_cells { Webserver_TCP_sb_0/CORERESETP_0/MSS_HPMS_READY_int } ] -to [ get_cells { Webserver_TCP_sb_0/CORERESETP_0/sm0_areset_n_rcosc Webserver_TCP_sb_0/CORERESETP_0/sm0_areset_n_rcosc_q1 } ]
set_false_path -ignore_errors -from [ get_cells { Webserver_TCP_sb_0/CORERESETP_0/MSS_HPMS_READY_int Webserver_TCP_sb_0/CORERESETP_0/SDIF*_PERST_N_re } ] -to [ get_cells { Webserver_TCP_sb_0/CORERESETP_0/sdif*_areset_n_rcosc* } ]
set_false_path -ignore_errors -through [ get_nets { Webserver_TCP_sb_0/CORERESETP_0/*sdif*_phr/hot_reset_n Webserver_TCP_sb_0/CORERESETP_0/*sdif*_phr/sdif_core_reset_n_0 } ]
set_false_path -ignore_errors -to [ get_cells { Webserver_TCP_sb_0/CORERESETP_0/*sdif*_phr/ltssm_q1[*] Webserver_TCP_sb_0/CORERESETP_0/*sdif*_phr/psel_q1 Webserver_TCP_sb_0/CORERESETP_0/*sdif*_phr/pwrite_q1 } ]
set_false_path -ignore_errors -through [ get_nets { Webserver_TCP_sb_0/CORERESETP_0/CONFIG1_DONE Webserver_TCP_sb_0/CORERESETP_0/CONFIG2_DONE Webserver_TCP_sb_0/CORERESETP_0/SDIF*_PERST_N Webserver_TCP_sb_0/CORERESETP_0/SDIF*_PSEL Webserver_TCP_sb_0/CORERESETP_0/SDIF*_PWRITE Webserver_TCP_sb_0/CORERESETP_0/SDIF*_PRDATA[*] Webserver_TCP_sb_0/CORERESETP_0/SOFT_EXT_RESET_OUT Webserver_TCP_sb_0/CORERESETP_0/SOFT_RESET_F2M Webserver_TCP_sb_0/CORERESETP_0/SOFT_M3_RESET Webserver_TCP_sb_0/CORERESETP_0/SOFT_MDDR_DDR_AXI_S_CORE_RESET Webserver_TCP_sb_0/CORERESETP_0/SOFT_FDDR_CORE_RESET Webserver_TCP_sb_0/CORERESETP_0/SOFT_SDIF*_PHY_RESET Webserver_TCP_sb_0/CORERESETP_0/SOFT_SDIF*_CORE_RESET Webserver_TCP_sb_0/CORERESETP_0/SOFT_SDIF0_0_CORE_RESET Webserver_TCP_sb_0/CORERESETP_0/SOFT_SDIF0_1_CORE_RESET } ]
set_false_path -ignore_errors -through [ get_pins { Webserver_TCP_sb_0/Webserver_TCP_sb_MSS_0/MSS_ADLIB_INST/CONFIG_PRESET_N } ]
set_false_path -ignore_errors -through [ get_pins { Webserver_TCP_sb_0/SYSRESET_POR/POWER_ON_RESET_N } ]
set_max_delay 0 -through [ get_nets { Webserver_TCP_sb_0/CORECONFIGP_0/FIC_2_APB_M_PSEL Webserver_TCP_sb_0/CORECONFIGP_0/FIC_2_APB_M_PENABLE } ] -to [ get_cells { Webserver_TCP_sb_0/CORECONFIGP_0/FIC_2_APB_M_PREADY* Webserver_TCP_sb_0/CORECONFIGP_0/state[0] } ]
set_min_delay -24 -through [ get_nets { Webserver_TCP_sb_0/CORECONFIGP_0/FIC_2_APB_M_PWRITE Webserver_TCP_sb_0/CORECONFIGP_0/FIC_2_APB_M_PADDR[*] Webserver_TCP_sb_0/CORECONFIGP_0/FIC_2_APB_M_PWDATA[*] Webserver_TCP_sb_0/CORECONFIGP_0/FIC_2_APB_M_PSEL Webserver_TCP_sb_0/CORECONFIGP_0/FIC_2_APB_M_PENABLE } ]
