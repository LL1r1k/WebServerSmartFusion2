set_device \
    -family  SmartFusion2 \
    -die     PA4M12000_TS \
    -package fc1152 \
    -speed   -1 \
    -tempr   {COM} \
    -voltr   {COM}
set_def {VOLTAGE} {1.2}
set_def {VCCI_1.2_VOLTR} {COM}
set_def {VCCI_1.5_VOLTR} {COM}
set_def {VCCI_1.8_VOLTR} {COM}
set_def {VCCI_2.5_VOLTR} {COM}
set_def {VCCI_3.3_VOLTR} {COM}
set_def {RTG4_MITIGATION_ON} {0}
set_def USE_CONSTRAINTS_FLOW 1
set_def NETLIST_TYPE EDIF
set_name top
set_workdir {C:\tcl_update\sf2\dg0516\516_v8\DG0516_SF2_Secure_Webserver_TCP_Demo\Libero_Project\designer\top}
set_log     {C:\tcl_update\sf2\dg0516\516_v8\DG0516_SF2_Secure_Webserver_TCP_Demo\Libero_Project\designer\top\top_sdc.log}
set_design_state pre_layout
