new_project \
         -name {top} \
         -location {C:\tcl_update\sf2\dg0516\516_v8\DG0516_SF2_Secure_Webserver_TCP_Demo\Libero_Project\designer\top\top_fp} \
         -mode {chain} \
         -connect_programmers {FALSE}
add_actel_device \
         -device {M2S150TS} \
         -name {M2S150TS}
enable_device \
         -name {M2S150TS} \
         -enable {TRUE}
save_project
close_project
