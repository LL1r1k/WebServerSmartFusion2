set_component top_FCCC_1_FCCC
# Microsemi Corp.
# Date: 2021-Jun-11 22:56:11
#

create_clock -period 8 [ get_pins { CCC_INST/CLK0 } ]
create_generated_clock -multiply_by 4 -divide_by 4 -source [ get_pins { CCC_INST/CLK0 } ] -phase 0 [ get_pins { CCC_INST/GL0 } ]
