set_component Webserver_TCP_sb_MSS
# Microsemi Corp.
# Date: 2021-Jun-11 17:55:46
#

create_clock -period 40 [ get_pins { MSS_ADLIB_INST/CLK_CONFIG_APB } ]
set_false_path -ignore_errors -through [ get_pins { MSS_ADLIB_INST/CONFIG_PRESET_N } ]
