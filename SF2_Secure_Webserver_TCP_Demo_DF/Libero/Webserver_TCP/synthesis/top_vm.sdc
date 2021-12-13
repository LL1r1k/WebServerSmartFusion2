# Written by Synplify Pro version map202009act, Build 069R. Synopsys Run ID: sid1623432426 
# Top Level Design Parameters 

# Clocks 
create_clock -period 8.000 -waveform {0.000 4.000} -name {SERDES_IF_0/SERDESIF_INST/EPCS_RXCLK[1]} [get_pins {SERDES_IF_0/SERDESIF_INST/EPCS_RXCLK[1]}] 
create_clock -period 8.000 -waveform {0.000 4.000} -name {SERDES_IF_0/SERDESIF_INST/EPCS_TXCLK[1]} [get_pins {SERDES_IF_0/SERDESIF_INST/EPCS_TXCLK[1]}] 
create_clock -period 20.000 -waveform {0.000 10.000} -name {Webserver_TCP_sb_0/FABOSC_0/I_RCOSC_25_50MHZ/CLKOUT} [get_pins {Webserver_TCP_sb_0/FABOSC_0/I_RCOSC_25_50MHZ/CLKOUT}] 
create_clock -period 40.000 -waveform {0.000 20.000} -name {Webserver_TCP_sb_0/Webserver_TCP_sb_MSS_0/CLK_CONFIG_APB} [get_pins {Webserver_TCP_sb_0/Webserver_TCP_sb_MSS_0/MSS_ADLIB_INST/CLK_CONFIG_APB}] 
create_clock -period 10.000 -waveform {0.000 5.000} -name {top_SERDES_IF_0_SERDES_IF|REFCLK1_OUT_inferred_clock} [get_pins {SERDES_IF_0/refclk1_inbuf_diff/Y}] 

# Virtual Clocks 

# Generated Clocks 
create_generated_clock -name {FCCC_0/GL0} -multiply_by {2} -divide_by {4} -source [get_pins {FCCC_0/CCC_INST/CLK0}]  [get_pins {FCCC_0/CCC_INST/GL0}] 
create_generated_clock -name {FCCC_0/GL1} -invert -multiply_by {2} -divide_by {4} -source [get_pins {FCCC_0/CCC_INST/CLK0}]  [get_pins {FCCC_0/CCC_INST/GL1}] 
create_generated_clock -name {FCCC_1/GL0} -multiply_by {4} -divide_by {4} -source [get_pins {FCCC_1/CCC_INST/CLK0}]  [get_pins {FCCC_1/CCC_INST/GL0}] 
create_generated_clock -name {Webserver_TCP_sb_0/CCC_0/GL0} -multiply_by {20} -divide_by {10} -source [get_pins {Webserver_TCP_sb_0/CCC_0/CCC_INST/RCOSC_25_50MHZ}]  [get_pins {Webserver_TCP_sb_0/CCC_0/CCC_INST/GL0}] 
create_generated_clock -name {Webserver_TCP_sb_0/CCC_0/GL3} -multiply_by {20} -divide_by {8} -source [get_pins {Webserver_TCP_sb_0/CCC_0/CCC_INST/RCOSC_25_50MHZ}]  [get_pins {Webserver_TCP_sb_0/CCC_0/CCC_INST/GL3}] 

# Paths Between Clocks 

# Multicycle Constraints 

# Point-to-point Delay Constraints 

# False Path Constraints 
set_false_path -through [get_pins {Webserver_TCP_sb_0/CORERESETP_0/SDIF_RELEASED_int/Q Webserver_TCP_sb_0/CORERESETP_0/INIT_DONE_int/Q}] 
set_false_path -through [get_pins {Webserver_TCP_sb_0/CORECONFIGP_0/soft_reset_reg[1]/Q Webserver_TCP_sb_0/CORECONFIGP_0/soft_reset_reg[2]/Q Webserver_TCP_sb_0/CORECONFIGP_0/control_reg_1[1]/Q Webserver_TCP_sb_0/CORECONFIGP_0/control_reg_1[0]/Q Webserver_TCP_sb_0/CORECONFIGP_0/soft_reset_reg[13]/Q}] 
set_false_path -through [get_pins {Webserver_TCP_sb_0/CORERESETP_0/release_sdif2_core/Q Webserver_TCP_sb_0/CORERESETP_0/release_sdif1_core/Q Webserver_TCP_sb_0/CORERESETP_0/release_sdif0_core/Q Webserver_TCP_sb_0/CORERESETP_0/ddr_settled/Q Webserver_TCP_sb_0/CORERESETP_0/count_sdif3_enable/Q Webserver_TCP_sb_0/CORERESETP_0/count_ddr_enable/Q Webserver_TCP_sb_0/CORERESETP_0/release_sdif3_core/Q}] 

# Output Load Constraints 

# Driving Cell Constraints 

# Input Delay Constraints 

# Output Delay Constraints 

# Wire Loads 

# Other Constraints 

# syn_hier Attributes 

# set_case Attributes 

# Clock Delay Constraints 
set_clock_groups -asynchronous -group [get_clocks {top_SERDES_IF_0_SERDES_IF|REFCLK1_OUT_inferred_clock}]

# syn_mode Attributes 

# Cells 

# Port DRC Rules 

# Input Transition Constraints 

# Unused constraints (intentionally commented out) 
# set_false_path -from [get_cells { Webserver_TCP_sb_0.CORERESETP_0.MSS_HPMS_READY_int }] -to [get_cells { Webserver_TCP_sb_0.CORERESETP_0.sm0_areset_n_rcosc Webserver_TCP_sb_0.CORERESETP_0.sm0_areset_n_rcosc_q1 }]
# set_false_path -from [get_cells { Webserver_TCP_sb_0.CORERESETP_0.MSS_HPMS_READY_int Webserver_TCP_sb_0.CORERESETP_0.SDIF*_PERST_N_re }] -to [get_cells { Webserver_TCP_sb_0.CORERESETP_0.sdif*_areset_n_rcosc* }]
# set_false_path -through [get_nets { Webserver_TCP_sb_0.CORERESETP_0.*sdif*_phr.hot_reset_n Webserver_TCP_sb_0.CORERESETP_0.*sdif*_phr.sdif_core_reset_n_0 }]
# set_false_path -to [get_cells { Webserver_TCP_sb_0.CORERESETP_0.*sdif*_phr.ltssm_q1[*] Webserver_TCP_sb_0.CORERESETP_0.*sdif*_phr.psel_q1 Webserver_TCP_sb_0.CORERESETP_0.*sdif*_phr.pwrite_q1 }]
# set_false_path -through [get_pins { Webserver_TCP_sb_0.Webserver_TCP_sb_MSS_0.MSS_ADLIB_INST.CONFIG_PRESET_N }]
# set_false_path -through [get_pins { Webserver_TCP_sb_0.SYSRESET_POR.POWER_ON_RESET_N }]
# set_max_delay 0 -through [get_nets { Webserver_TCP_sb_0.CORECONFIGP_0.FIC_2_APB_M_PSEL Webserver_TCP_sb_0.CORECONFIGP_0.FIC_2_APB_M_PENABLE }] -to [get_cells { Webserver_TCP_sb_0.CORECONFIGP_0.FIC_2_APB_M_PREADY* Webserver_TCP_sb_0.CORECONFIGP_0.state[0] }]
# set_min_delay -24 -through [get_nets { Webserver_TCP_sb_0.CORECONFIGP_0.FIC_2_APB_M_PWRITE Webserver_TCP_sb_0.CORECONFIGP_0.FIC_2_APB_M_PADDR[*] Webserver_TCP_sb_0.CORECONFIGP_0.FIC_2_APB_M_PWDATA[*] Webserver_TCP_sb_0.CORECONFIGP_0.FIC_2_APB_M_PSEL Webserver_TCP_sb_0.CORECONFIGP_0.FIC_2_APB_M_PENABLE }]


# Non-forward-annotatable constraints (intentionally commented out) 

# Block Path constraints 

