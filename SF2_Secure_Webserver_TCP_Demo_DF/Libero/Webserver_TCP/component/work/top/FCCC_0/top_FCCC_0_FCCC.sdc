set_component top_FCCC_0_FCCC
# Microsemi Corp.
# Date: 2021-Jun-11 22:56:09
#

create_clock -period 8 [ get_pins { CCC_INST/CLK0 } ]
create_generated_clock -multiply_by 2 -divide_by 4 -source [ get_pins { CCC_INST/CLK0 } ] -phase 0 [ get_pins { CCC_INST/GL0 } ]
create_generated_clock -invert -multiply_by 2 -divide_by 4 -source [ get_pins { CCC_INST/CLK0 } ] -phase 0 [ get_pins { CCC_INST/GL1 } ]
