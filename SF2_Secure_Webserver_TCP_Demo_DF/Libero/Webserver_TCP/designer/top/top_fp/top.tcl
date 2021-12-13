open_project -project {C:\tcl_update\sf2\dg0516\final\m2s_dg0516_df\SF2_Secure_Webserver_TCP_Demo_DF\Libero\Webserver_TCP\designer\top\top_fp\top.pro}\
         -connect_programmers {FALSE}
load_programming_data \
    -name {M2S150TS} \
    -fpga {C:\tcl_update\sf2\dg0516\final\m2s_dg0516_df\SF2_Secure_Webserver_TCP_Demo_DF\Libero\Webserver_TCP\designer\top\top.map} \
    -header {C:\tcl_update\sf2\dg0516\final\m2s_dg0516_df\SF2_Secure_Webserver_TCP_Demo_DF\Libero\Webserver_TCP\designer\top\top.hdr} \
    -envm {C:\tcl_update\sf2\dg0516\final\m2s_dg0516_df\SF2_Secure_Webserver_TCP_Demo_DF\Libero\Webserver_TCP\designer\top\top.efc} \
    -spm {C:\tcl_update\sf2\dg0516\final\m2s_dg0516_df\SF2_Secure_Webserver_TCP_Demo_DF\Libero\Webserver_TCP\designer\top\top.spm} \
    -dca {C:\tcl_update\sf2\dg0516\final\m2s_dg0516_df\SF2_Secure_Webserver_TCP_Demo_DF\Libero\Webserver_TCP\designer\top\top.dca}
export_single_ppd \
    -name {M2S150TS} \
    -file {C:\tcl_update\sf2\dg0516\final\m2s_dg0516_df\SF2_Secure_Webserver_TCP_Demo_DF\Libero\Webserver_TCP\designer\top\export/tempExport\top.ppd}

save_project
close_project
