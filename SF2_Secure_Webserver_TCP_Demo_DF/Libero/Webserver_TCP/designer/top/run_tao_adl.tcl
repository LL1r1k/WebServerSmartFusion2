set_device -family {SmartFusion2} -die {M2S150TS} -speed {-1}
read_adl {C:\tcl_update\sf2\dg0516\516_v8\DG0516_SF2_Secure_Webserver_TCP_Demo\Libero_Project\designer\top\top.adl}
read_afl {C:\tcl_update\sf2\dg0516\516_v8\DG0516_SF2_Secure_Webserver_TCP_Demo\Libero_Project\designer\top\top.afl}
map_netlist
read_sdc {C:\tcl_update\sf2\dg0516\516_v8\DG0516_SF2_Secure_Webserver_TCP_Demo\Libero_Project\constraint\top_derived_constraints.sdc}
read_sdc {C:\tcl_update\sf2\dg0516\516_v8\DG0516_SF2_Secure_Webserver_TCP_Demo\Libero_Project\constraint\timing_user_constraints.sdc}
check_constraints {C:\tcl_update\sf2\dg0516\516_v8\DG0516_SF2_Secure_Webserver_TCP_Demo\Libero_Project\constraint\placer_sdc_errors.log}
write_sdc -mode layout {C:\tcl_update\sf2\dg0516\516_v8\DG0516_SF2_Secure_Webserver_TCP_Demo\Libero_Project\designer\top\place_route.sdc}
