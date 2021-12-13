
****************************************************************
                LIBERO AND SOFTCONSOLE VERSIONS
****************************************************************

This application is tested with following 
Libero and SoftCosole versions.

Libero SoC   --  Version 2021.1
SoftConsole  --  Version 2021.1 


******************************************
     DESIGN FILE DIRECTORY STRUCTURE
******************************************
m2s_dg0516_df
    |
SF2_Secure_Webserver_TCP_Demo_DF
    |
    |
    |--- Libero
    |	 |
    |    |----Webserver_TCP
    |            |
    |            |----Libero project
    |            |
    |            |----SoftConsole
    |	   
    |---Programming_Job
    |     
    |---readme
  
  
   
 
libero
****************
This folder consists of Libero SOC verilog project for SmartFusion2 Advanced development kit  .


SoftConsole 
*******************
contains the software project.

Programming_Job
****************
This folder consists of programming file (*.job) in release mode that works for SmartFusion2 Advanced development  kit(Rev A or Later) .

--------------------------------------------------------------------------------
    Modifying this example to target other interfaces
--------------------------------------------------------------------------------
Please refer to file 
SoftConsole\Webserver_TCP_MSS_CM3\Webserver_TCP_MSS_CM3_app\lwip-1.4.1\netif\m2sxxx_ethernetif.cfor modifying the
Ethernet MAC configuration. The following code in that file configures the MAC:

    MSS_MAC_cfg_struct_def_init(&g_mac_config);
    g_mac_config.interface = TBI;
    g_mac_config.phy_addr = M88E1340_PHY_ADDR;
    g_mac_config.speed_duplex_select = MSS_MAC_ANEG_ALL_SPEEDS;
    g_mac_config.mac_addr[0] = own_hw_adr[0];
    g_mac_config.mac_addr[1] = own_hw_adr[1];
    g_mac_config.mac_addr[2] = own_hw_adr[2];
    g_mac_config.mac_addr[3] = own_hw_adr[3];
    g_mac_config.mac_addr[4] = own_hw_adr[4];
    g_mac_config.mac_addr[5] = own_hw_adr[5];

You only need to modify these lines to use a different PHY or force the link
speed to a specific speed.

