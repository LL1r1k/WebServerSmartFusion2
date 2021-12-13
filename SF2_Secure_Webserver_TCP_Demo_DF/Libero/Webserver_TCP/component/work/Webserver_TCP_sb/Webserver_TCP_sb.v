//////////////////////////////////////////////////////////////////////
// Created by SmartDesign Fri Jun 11 17:55:53 2021
// Version: v2021.1 2021.1.0.17
//////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

// Webserver_TCP_sb
module Webserver_TCP_sb(
    // Inputs
    DEVRST_N,
    FAB_RESET_N,
    MAC_TBI_GTX_CLK,
    MAC_TBI_MDI,
    MAC_TBI_RCGF,
    MAC_TBI_RX_CLKP0,
    MAC_TBI_RX_CLKP1,
    MDDR_DQS_TMATCH_0_IN,
    MMUART_0_RXD,
    SDIF3_PERST_N,
    SDIF3_PRDATA,
    SDIF3_PREADY,
    SDIF3_PSLVERR,
    SDIF3_SPLL_LOCK,
    SPI_0_DI,
    // Outputs
    DDR_READY,
    FAB_CCC_GL0,
    FAB_CCC_GL3,
    FAB_CCC_LOCK,
    GPIO_0_M2F,
    GPIO_1_M2F,
    GPIO_2_M2F,
    GPIO_3_M2F,
    GPIO_4_M2F,
    GPIO_5_M2F,
    GPIO_6_M2F,
    GPIO_7_M2F,
    INIT_APB_S_PCLK,
    INIT_APB_S_PRESET_N,
    INIT_DONE,
    MAC_TBI_MDC,
    MAC_TBI_MDO,
    MAC_TBI_MDO_EN,
    MAC_TBI_TCGF,
    MDDR_ADDR,
    MDDR_BA,
    MDDR_CAS_N,
    MDDR_CKE,
    MDDR_CLK,
    MDDR_CLK_N,
    MDDR_CS_N,
    MDDR_DQS_TMATCH_0_OUT,
    MDDR_ODT,
    MDDR_RAS_N,
    MDDR_RESET_N,
    MDDR_WE_N,
    MMUART_0_TXD,
    MSS_READY,
    POWER_ON_RESET_N,
    SDIF3_CORE_RESET_N,
    SDIF3_PADDR,
    SDIF3_PENABLE,
    SDIF3_PHY_RESET_N,
    SDIF3_PSEL,
    SDIF3_PWDATA,
    SDIF3_PWRITE,
    SDIF_READY,
    SPI_0_DO,
    // Inouts
    MDDR_DM_RDQS,
    MDDR_DQ,
    MDDR_DQS,
    MDDR_DQS_N,
    SPI_0_CLK,
    SPI_0_SS0
);

//--------------------------------------------------------------------
// Input
//--------------------------------------------------------------------
input         DEVRST_N;
input         FAB_RESET_N;
input         MAC_TBI_GTX_CLK;
input         MAC_TBI_MDI;
input  [9:0]  MAC_TBI_RCGF;
input         MAC_TBI_RX_CLKP0;
input         MAC_TBI_RX_CLKP1;
input         MDDR_DQS_TMATCH_0_IN;
input         MMUART_0_RXD;
input         SDIF3_PERST_N;
input  [31:0] SDIF3_PRDATA;
input         SDIF3_PREADY;
input         SDIF3_PSLVERR;
input         SDIF3_SPLL_LOCK;
input         SPI_0_DI;
//--------------------------------------------------------------------
// Output
//--------------------------------------------------------------------
output        DDR_READY;
output        FAB_CCC_GL0;
output        FAB_CCC_GL3;
output        FAB_CCC_LOCK;
output        GPIO_0_M2F;
output        GPIO_1_M2F;
output        GPIO_2_M2F;
output        GPIO_3_M2F;
output        GPIO_4_M2F;
output        GPIO_5_M2F;
output        GPIO_6_M2F;
output        GPIO_7_M2F;
output        INIT_APB_S_PCLK;
output        INIT_APB_S_PRESET_N;
output        INIT_DONE;
output        MAC_TBI_MDC;
output        MAC_TBI_MDO;
output        MAC_TBI_MDO_EN;
output [9:0]  MAC_TBI_TCGF;
output [15:0] MDDR_ADDR;
output [2:0]  MDDR_BA;
output        MDDR_CAS_N;
output        MDDR_CKE;
output        MDDR_CLK;
output        MDDR_CLK_N;
output        MDDR_CS_N;
output        MDDR_DQS_TMATCH_0_OUT;
output        MDDR_ODT;
output        MDDR_RAS_N;
output        MDDR_RESET_N;
output        MDDR_WE_N;
output        MMUART_0_TXD;
output        MSS_READY;
output        POWER_ON_RESET_N;
output        SDIF3_CORE_RESET_N;
output [15:2] SDIF3_PADDR;
output        SDIF3_PENABLE;
output        SDIF3_PHY_RESET_N;
output        SDIF3_PSEL;
output [31:0] SDIF3_PWDATA;
output        SDIF3_PWRITE;
output        SDIF_READY;
output        SPI_0_DO;
//--------------------------------------------------------------------
// Inout
//--------------------------------------------------------------------
inout  [1:0]  MDDR_DM_RDQS;
inout  [15:0] MDDR_DQ;
inout  [1:0]  MDDR_DQS;
inout  [1:0]  MDDR_DQS_N;
inout         SPI_0_CLK;
inout         SPI_0_SS0;
//--------------------------------------------------------------------
// Nets
//--------------------------------------------------------------------
wire   [31:0] CoreAHBLite_0_AHBmslave0_HADDR;
wire   [2:0]  CoreAHBLite_0_AHBmslave0_HBURST;
wire          CoreAHBLite_0_AHBmslave0_HMASTLOCK;
wire   [3:0]  CoreAHBLite_0_AHBmslave0_HPROT;
wire   [31:0] CoreAHBLite_0_AHBmslave0_HRDATA;
wire          CoreAHBLite_0_AHBmslave0_HREADY;
wire          CoreAHBLite_0_AHBmslave0_HREADYOUT;
wire   [1:0]  CoreAHBLite_0_AHBmslave0_HRESP;
wire          CoreAHBLite_0_AHBmslave0_HSELx;
wire   [2:0]  CoreAHBLite_0_AHBmslave0_HSIZE;
wire   [1:0]  CoreAHBLite_0_AHBmslave0_HTRANS;
wire   [31:0] CoreAHBLite_0_AHBmslave0_HWDATA;
wire          CoreAHBLite_0_AHBmslave0_HWRITE;
wire          CORECONFIGP_0_CONFIG1_DONE;
wire          CORECONFIGP_0_CONFIG2_DONE;
wire          CORECONFIGP_0_MDDR_APBmslave_PENABLE;
wire          CORECONFIGP_0_MDDR_APBmslave_PREADY;
wire          CORECONFIGP_0_MDDR_APBmslave_PSELx;
wire          CORECONFIGP_0_MDDR_APBmslave_PSLVERR;
wire          CORECONFIGP_0_MDDR_APBmslave_PWRITE;
wire   [31:0] CORECONFIGP_0_R_SDIF3_PRDATA;
wire          CORECONFIGP_0_R_SDIF3_PSEL;
wire          CORECONFIGP_0_R_SDIF3_PWRITE;
wire          CORECONFIGP_0_SOFT_EXT_RESET_OUT;
wire          CORECONFIGP_0_SOFT_M3_RESET;
wire          CORECONFIGP_0_SOFT_MDDR_DDR_AXI_S_CORE_RESET;
wire          CORECONFIGP_0_SOFT_RESET_F2M;
wire          CORECONFIGP_0_SOFT_SDIF3_CORE_RESET;
wire          CORECONFIGP_0_SOFT_SDIF3_PHY_RESET;
wire          CORERESETP_0_M3_RESET_N;
wire          CORERESETP_0_RESET_N_F2M;
wire          CORERESETP_0_SDIF_RELEASED;
wire          DDR_READY_net_0;
wire          DEVRST_N;
wire          FAB_CCC_GL0_net_0;
wire          FAB_CCC_GL3_net_0;
wire          FAB_CCC_LOCK_net_0;
wire          FAB_RESET_N;
wire          FABOSC_0_RCOSC_25_50MHZ_CCC_OUT_RCOSC_25_50MHZ_CCC;
wire          FABOSC_0_RCOSC_25_50MHZ_O2F;
wire          GPIO_0_M2F_net_0;
wire          GPIO_1_M2F_net_0;
wire          GPIO_2_M2F_net_0;
wire          GPIO_3_M2F_net_0;
wire          GPIO_4_M2F_net_0;
wire          GPIO_5_M2F_net_0;
wire          GPIO_6_M2F_net_0;
wire          GPIO_7_M2F_net_0;
wire          INIT_APB_S_PCLK_net_0;
wire          INIT_APB_S_PRESET_N_net_0;
wire          INIT_DONE_net_0;
wire          MAC_TBI_GTX_CLK;
wire          MAC_TBI_MDC_net_0;
wire          MAC_TBI_MDI;
wire          MAC_TBI_MDO_net_0;
wire          MAC_TBI_MDO_EN_net_0;
wire   [9:0]  MAC_TBI_RCGF;
wire          MAC_TBI_RX_CLKP0;
wire          MAC_TBI_RX_CLKP1;
wire   [9:0]  MAC_TBI_TCGF_net_0;
wire   [15:0] MDDR_ADDR_net_0;
wire   [2:0]  MDDR_BA_net_0;
wire          MDDR_CAS_N_net_0;
wire          MDDR_CKE_net_0;
wire          MDDR_CLK_net_0;
wire          MDDR_CLK_N_net_0;
wire          MDDR_CS_N_net_0;
wire   [1:0]  MDDR_DM_RDQS;
wire   [15:0] MDDR_DQ;
wire   [1:0]  MDDR_DQS;
wire   [1:0]  MDDR_DQS_N;
wire          MDDR_DQS_TMATCH_0_IN;
wire          MDDR_DQS_TMATCH_0_OUT_net_0;
wire          MDDR_ODT_net_0;
wire          MDDR_RAS_N_net_0;
wire          MDDR_RESET_N_net_0;
wire          MDDR_WE_N_net_0;
wire          MMUART_0_RXD;
wire          MMUART_0_TXD_net_0;
wire          MSS_READY_net_0;
wire          POWER_ON_RESET_N_net_0;
wire          SDIF3_CORE_RESET_N_net_0;
wire   [15:2] SDIF3_INIT_APB_PADDR;
wire          SDIF3_INIT_APB_PENABLE;
wire   [31:0] SDIF3_PRDATA;
wire          SDIF3_PREADY;
wire          SDIF3_INIT_APB_PSELx;
wire          SDIF3_PSLVERR;
wire   [31:0] SDIF3_INIT_APB_PWDATA;
wire          SDIF3_INIT_APB_PWRITE;
wire          SDIF3_PERST_N;
wire          SDIF3_PHY_RESET_N_net_0;
wire          SDIF3_SPLL_LOCK;
wire          SDIF_READY_net_0;
wire          SPI_0_CLK;
wire          SPI_0_DI;
wire          SPI_0_DO_net_0;
wire          SPI_0_SS0;
wire   [31:0] Webserver_TCP_sb_MSS_TMP_0_FIC_0_AHB_MASTER_HADDR;
wire   [31:0] Webserver_TCP_sb_MSS_TMP_0_FIC_0_AHB_MASTER_HRDATA;
wire          Webserver_TCP_sb_MSS_TMP_0_FIC_0_AHB_MASTER_HREADY;
wire   [1:0]  Webserver_TCP_sb_MSS_TMP_0_FIC_0_AHB_MASTER_HTRANS;
wire   [31:0] Webserver_TCP_sb_MSS_TMP_0_FIC_0_AHB_MASTER_HWDATA;
wire          Webserver_TCP_sb_MSS_TMP_0_FIC_0_AHB_MASTER_HWRITE;
wire          Webserver_TCP_sb_MSS_TMP_0_FIC_2_APB_M_PCLK;
wire          Webserver_TCP_sb_MSS_TMP_0_FIC_2_APB_M_PRESET_N;
wire   [16:2] Webserver_TCP_sb_MSS_TMP_0_FIC_2_APB_MASTER_PADDR;
wire          Webserver_TCP_sb_MSS_TMP_0_FIC_2_APB_MASTER_PENABLE;
wire   [31:0] Webserver_TCP_sb_MSS_TMP_0_FIC_2_APB_MASTER_PRDATA;
wire          Webserver_TCP_sb_MSS_TMP_0_FIC_2_APB_MASTER_PREADY;
wire          Webserver_TCP_sb_MSS_TMP_0_FIC_2_APB_MASTER_PSELx;
wire          Webserver_TCP_sb_MSS_TMP_0_FIC_2_APB_MASTER_PSLVERR;
wire   [31:0] Webserver_TCP_sb_MSS_TMP_0_FIC_2_APB_MASTER_PWDATA;
wire          Webserver_TCP_sb_MSS_TMP_0_FIC_2_APB_MASTER_PWRITE;
wire          Webserver_TCP_sb_MSS_TMP_0_MSS_RESET_N_M2F;
wire          SPI_0_DO_net_1;
wire          MMUART_0_TXD_net_1;
wire          MDDR_DQS_TMATCH_0_OUT_net_1;
wire          MDDR_CAS_N_net_1;
wire          MDDR_CLK_net_1;
wire          MDDR_CLK_N_net_1;
wire          MDDR_CKE_net_1;
wire          MDDR_CS_N_net_1;
wire          MDDR_ODT_net_1;
wire          MDDR_RAS_N_net_1;
wire          MDDR_RESET_N_net_1;
wire          MDDR_WE_N_net_1;
wire   [15:0] MDDR_ADDR_net_1;
wire   [2:0]  MDDR_BA_net_1;
wire          POWER_ON_RESET_N_net_1;
wire          INIT_DONE_net_1;
wire          DDR_READY_net_1;
wire          SDIF_READY_net_1;
wire   [15:2] SDIF3_INIT_APB_PADDR_net_0;
wire          SDIF3_INIT_APB_PSELx_net_0;
wire          SDIF3_INIT_APB_PENABLE_net_0;
wire          SDIF3_INIT_APB_PWRITE_net_0;
wire   [31:0] SDIF3_INIT_APB_PWDATA_net_0;
wire          INIT_APB_S_PCLK_net_1;
wire          INIT_APB_S_PRESET_N_net_1;
wire          SDIF3_PHY_RESET_N_net_1;
wire          SDIF3_CORE_RESET_N_net_1;
wire          FAB_CCC_GL0_net_1;
wire          FAB_CCC_GL3_net_1;
wire          FAB_CCC_LOCK_net_1;
wire          MSS_READY_net_1;
wire          GPIO_0_M2F_net_1;
wire          GPIO_1_M2F_net_1;
wire          GPIO_2_M2F_net_1;
wire          GPIO_3_M2F_net_1;
wire          GPIO_4_M2F_net_1;
wire          GPIO_5_M2F_net_1;
wire          GPIO_6_M2F_net_1;
wire          GPIO_7_M2F_net_1;
wire          MAC_TBI_MDC_net_1;
wire          MAC_TBI_MDO_EN_net_1;
wire          MAC_TBI_MDO_net_1;
wire   [9:0]  MAC_TBI_TCGF_net_1;
//--------------------------------------------------------------------
// TiedOff Nets
//--------------------------------------------------------------------
wire          GND_net;
wire   [7:2]  PADDR_const_net_0;
wire   [7:0]  PWDATA_const_net_0;
wire   [31:0] FDDR_PRDATA_const_net_0;
wire          VCC_net;
wire   [31:0] SDIF0_PRDATA_const_net_0;
wire   [31:0] SDIF1_PRDATA_const_net_0;
wire   [31:0] SDIF2_PRDATA_const_net_0;
wire   [31:0] SDIF0_PRDATA_const_net_1;
wire   [31:0] SDIF1_PRDATA_const_net_1;
wire   [31:0] SDIF2_PRDATA_const_net_1;
wire   [2:0]  HBURST_M0_const_net_0;
wire   [3:0]  HPROT_M0_const_net_0;
wire   [31:0] HADDR_M1_const_net_0;
wire   [1:0]  HTRANS_M1_const_net_0;
wire   [2:0]  HSIZE_M1_const_net_0;
wire   [2:0]  HBURST_M1_const_net_0;
wire   [3:0]  HPROT_M1_const_net_0;
wire   [31:0] HWDATA_M1_const_net_0;
wire   [31:0] HADDR_M2_const_net_0;
wire   [1:0]  HTRANS_M2_const_net_0;
wire   [2:0]  HSIZE_M2_const_net_0;
wire   [2:0]  HBURST_M2_const_net_0;
wire   [3:0]  HPROT_M2_const_net_0;
wire   [31:0] HWDATA_M2_const_net_0;
wire   [31:0] HADDR_M3_const_net_0;
wire   [1:0]  HTRANS_M3_const_net_0;
wire   [2:0]  HSIZE_M3_const_net_0;
wire   [2:0]  HBURST_M3_const_net_0;
wire   [3:0]  HPROT_M3_const_net_0;
wire   [31:0] HWDATA_M3_const_net_0;
wire   [31:0] HRDATA_S1_const_net_0;
wire   [1:0]  HRESP_S1_const_net_0;
wire   [31:0] HRDATA_S2_const_net_0;
wire   [1:0]  HRESP_S2_const_net_0;
wire   [31:0] HRDATA_S3_const_net_0;
wire   [1:0]  HRESP_S3_const_net_0;
wire   [31:0] HRDATA_S4_const_net_0;
wire   [1:0]  HRESP_S4_const_net_0;
wire   [31:0] HRDATA_S5_const_net_0;
wire   [1:0]  HRESP_S5_const_net_0;
wire   [31:0] HRDATA_S6_const_net_0;
wire   [1:0]  HRESP_S6_const_net_0;
wire   [31:0] HRDATA_S7_const_net_0;
wire   [1:0]  HRESP_S7_const_net_0;
wire   [31:0] HRDATA_S8_const_net_0;
wire   [1:0]  HRESP_S8_const_net_0;
wire   [31:0] HRDATA_S9_const_net_0;
wire   [1:0]  HRESP_S9_const_net_0;
wire   [31:0] HRDATA_S10_const_net_0;
wire   [1:0]  HRESP_S10_const_net_0;
wire   [31:0] HRDATA_S11_const_net_0;
wire   [1:0]  HRESP_S11_const_net_0;
wire   [31:0] HRDATA_S12_const_net_0;
wire   [1:0]  HRESP_S12_const_net_0;
wire   [31:0] HRDATA_S13_const_net_0;
wire   [1:0]  HRESP_S13_const_net_0;
wire   [31:0] HRDATA_S14_const_net_0;
wire   [1:0]  HRESP_S14_const_net_0;
wire   [31:0] HRDATA_S15_const_net_0;
wire   [1:0]  HRESP_S15_const_net_0;
wire   [31:0] HRDATA_S16_const_net_0;
wire   [1:0]  HRESP_S16_const_net_0;
//--------------------------------------------------------------------
// Bus Interface Nets Declarations - Unequal Pin Widths
//--------------------------------------------------------------------
wire   [15:2] CORECONFIGP_0_MDDR_APBmslave_PADDR;
wire   [10:2] CORECONFIGP_0_MDDR_APBmslave_PADDR_0;
wire   [10:2] CORECONFIGP_0_MDDR_APBmslave_PADDR_0_10to2;
wire   [15:0] CORECONFIGP_0_MDDR_APBmslave_PRDATA;
wire   [31:0] CORECONFIGP_0_MDDR_APBmslave_PRDATA_0;
wire   [15:0] CORECONFIGP_0_MDDR_APBmslave_PRDATA_0_15to0;
wire   [31:16]CORECONFIGP_0_MDDR_APBmslave_PRDATA_0_31to16;
wire   [31:0] CORECONFIGP_0_MDDR_APBmslave_PWDATA;
wire   [15:0] CORECONFIGP_0_MDDR_APBmslave_PWDATA_0;
wire   [15:0] CORECONFIGP_0_MDDR_APBmslave_PWDATA_0_15to0;
wire   [1:0]  Webserver_TCP_sb_MSS_TMP_0_FIC_0_AHB_MASTER_HRESP;
wire          Webserver_TCP_sb_MSS_TMP_0_FIC_0_AHB_MASTER_HRESP_0;
wire   [0:0]  Webserver_TCP_sb_MSS_TMP_0_FIC_0_AHB_MASTER_HRESP_0_0to0;
wire   [1:0]  Webserver_TCP_sb_MSS_TMP_0_FIC_0_AHB_MASTER_HSIZE;
wire   [2:0]  Webserver_TCP_sb_MSS_TMP_0_FIC_0_AHB_MASTER_HSIZE_0;
wire   [1:0]  Webserver_TCP_sb_MSS_TMP_0_FIC_0_AHB_MASTER_HSIZE_0_1to0;
wire   [2:2]  Webserver_TCP_sb_MSS_TMP_0_FIC_0_AHB_MASTER_HSIZE_0_2to2;
//--------------------------------------------------------------------
// Constant assignments
//--------------------------------------------------------------------
assign GND_net                  = 1'b0;
assign PADDR_const_net_0        = 6'h00;
assign PWDATA_const_net_0       = 8'h00;
assign FDDR_PRDATA_const_net_0  = 32'h00000000;
assign VCC_net                  = 1'b1;
assign SDIF0_PRDATA_const_net_0 = 32'h00000000;
assign SDIF1_PRDATA_const_net_0 = 32'h00000000;
assign SDIF2_PRDATA_const_net_0 = 32'h00000000;
assign SDIF0_PRDATA_const_net_1 = 32'h00000000;
assign SDIF1_PRDATA_const_net_1 = 32'h00000000;
assign SDIF2_PRDATA_const_net_1 = 32'h00000000;
assign HBURST_M0_const_net_0    = 3'h0;
assign HPROT_M0_const_net_0     = 4'h0;
assign HADDR_M1_const_net_0     = 32'h00000000;
assign HTRANS_M1_const_net_0    = 2'h0;
assign HSIZE_M1_const_net_0     = 3'h0;
assign HBURST_M1_const_net_0    = 3'h0;
assign HPROT_M1_const_net_0     = 4'h0;
assign HWDATA_M1_const_net_0    = 32'h00000000;
assign HADDR_M2_const_net_0     = 32'h00000000;
assign HTRANS_M2_const_net_0    = 2'h0;
assign HSIZE_M2_const_net_0     = 3'h0;
assign HBURST_M2_const_net_0    = 3'h0;
assign HPROT_M2_const_net_0     = 4'h0;
assign HWDATA_M2_const_net_0    = 32'h00000000;
assign HADDR_M3_const_net_0     = 32'h00000000;
assign HTRANS_M3_const_net_0    = 2'h0;
assign HSIZE_M3_const_net_0     = 3'h0;
assign HBURST_M3_const_net_0    = 3'h0;
assign HPROT_M3_const_net_0     = 4'h0;
assign HWDATA_M3_const_net_0    = 32'h00000000;
assign HRDATA_S1_const_net_0    = 32'h00000000;
assign HRESP_S1_const_net_0     = 2'h0;
assign HRDATA_S2_const_net_0    = 32'h00000000;
assign HRESP_S2_const_net_0     = 2'h0;
assign HRDATA_S3_const_net_0    = 32'h00000000;
assign HRESP_S3_const_net_0     = 2'h0;
assign HRDATA_S4_const_net_0    = 32'h00000000;
assign HRESP_S4_const_net_0     = 2'h0;
assign HRDATA_S5_const_net_0    = 32'h00000000;
assign HRESP_S5_const_net_0     = 2'h0;
assign HRDATA_S6_const_net_0    = 32'h00000000;
assign HRESP_S6_const_net_0     = 2'h0;
assign HRDATA_S7_const_net_0    = 32'h00000000;
assign HRESP_S7_const_net_0     = 2'h0;
assign HRDATA_S8_const_net_0    = 32'h00000000;
assign HRESP_S8_const_net_0     = 2'h0;
assign HRDATA_S9_const_net_0    = 32'h00000000;
assign HRESP_S9_const_net_0     = 2'h0;
assign HRDATA_S10_const_net_0   = 32'h00000000;
assign HRESP_S10_const_net_0    = 2'h0;
assign HRDATA_S11_const_net_0   = 32'h00000000;
assign HRESP_S11_const_net_0    = 2'h0;
assign HRDATA_S12_const_net_0   = 32'h00000000;
assign HRESP_S12_const_net_0    = 2'h0;
assign HRDATA_S13_const_net_0   = 32'h00000000;
assign HRESP_S13_const_net_0    = 2'h0;
assign HRDATA_S14_const_net_0   = 32'h00000000;
assign HRESP_S14_const_net_0    = 2'h0;
assign HRDATA_S15_const_net_0   = 32'h00000000;
assign HRESP_S15_const_net_0    = 2'h0;
assign HRDATA_S16_const_net_0   = 32'h00000000;
assign HRESP_S16_const_net_0    = 2'h0;
//--------------------------------------------------------------------
// Top level output port assignments
//--------------------------------------------------------------------
assign SPI_0_DO_net_1               = SPI_0_DO_net_0;
assign SPI_0_DO                     = SPI_0_DO_net_1;
assign MMUART_0_TXD_net_1           = MMUART_0_TXD_net_0;
assign MMUART_0_TXD                 = MMUART_0_TXD_net_1;
assign MDDR_DQS_TMATCH_0_OUT_net_1  = MDDR_DQS_TMATCH_0_OUT_net_0;
assign MDDR_DQS_TMATCH_0_OUT        = MDDR_DQS_TMATCH_0_OUT_net_1;
assign MDDR_CAS_N_net_1             = MDDR_CAS_N_net_0;
assign MDDR_CAS_N                   = MDDR_CAS_N_net_1;
assign MDDR_CLK_net_1               = MDDR_CLK_net_0;
assign MDDR_CLK                     = MDDR_CLK_net_1;
assign MDDR_CLK_N_net_1             = MDDR_CLK_N_net_0;
assign MDDR_CLK_N                   = MDDR_CLK_N_net_1;
assign MDDR_CKE_net_1               = MDDR_CKE_net_0;
assign MDDR_CKE                     = MDDR_CKE_net_1;
assign MDDR_CS_N_net_1              = MDDR_CS_N_net_0;
assign MDDR_CS_N                    = MDDR_CS_N_net_1;
assign MDDR_ODT_net_1               = MDDR_ODT_net_0;
assign MDDR_ODT                     = MDDR_ODT_net_1;
assign MDDR_RAS_N_net_1             = MDDR_RAS_N_net_0;
assign MDDR_RAS_N                   = MDDR_RAS_N_net_1;
assign MDDR_RESET_N_net_1           = MDDR_RESET_N_net_0;
assign MDDR_RESET_N                 = MDDR_RESET_N_net_1;
assign MDDR_WE_N_net_1              = MDDR_WE_N_net_0;
assign MDDR_WE_N                    = MDDR_WE_N_net_1;
assign MDDR_ADDR_net_1              = MDDR_ADDR_net_0;
assign MDDR_ADDR[15:0]              = MDDR_ADDR_net_1;
assign MDDR_BA_net_1                = MDDR_BA_net_0;
assign MDDR_BA[2:0]                 = MDDR_BA_net_1;
assign POWER_ON_RESET_N_net_1       = POWER_ON_RESET_N_net_0;
assign POWER_ON_RESET_N             = POWER_ON_RESET_N_net_1;
assign INIT_DONE_net_1              = INIT_DONE_net_0;
assign INIT_DONE                    = INIT_DONE_net_1;
assign DDR_READY_net_1              = DDR_READY_net_0;
assign DDR_READY                    = DDR_READY_net_1;
assign SDIF_READY_net_1             = SDIF_READY_net_0;
assign SDIF_READY                   = SDIF_READY_net_1;
assign SDIF3_INIT_APB_PADDR_net_0   = SDIF3_INIT_APB_PADDR;
assign SDIF3_PADDR[15:2]            = SDIF3_INIT_APB_PADDR_net_0;
assign SDIF3_INIT_APB_PSELx_net_0   = SDIF3_INIT_APB_PSELx;
assign SDIF3_PSEL                   = SDIF3_INIT_APB_PSELx_net_0;
assign SDIF3_INIT_APB_PENABLE_net_0 = SDIF3_INIT_APB_PENABLE;
assign SDIF3_PENABLE                = SDIF3_INIT_APB_PENABLE_net_0;
assign SDIF3_INIT_APB_PWRITE_net_0  = SDIF3_INIT_APB_PWRITE;
assign SDIF3_PWRITE                 = SDIF3_INIT_APB_PWRITE_net_0;
assign SDIF3_INIT_APB_PWDATA_net_0  = SDIF3_INIT_APB_PWDATA;
assign SDIF3_PWDATA[31:0]           = SDIF3_INIT_APB_PWDATA_net_0;
assign INIT_APB_S_PCLK_net_1        = INIT_APB_S_PCLK_net_0;
assign INIT_APB_S_PCLK              = INIT_APB_S_PCLK_net_1;
assign INIT_APB_S_PRESET_N_net_1    = INIT_APB_S_PRESET_N_net_0;
assign INIT_APB_S_PRESET_N          = INIT_APB_S_PRESET_N_net_1;
assign SDIF3_PHY_RESET_N_net_1      = SDIF3_PHY_RESET_N_net_0;
assign SDIF3_PHY_RESET_N            = SDIF3_PHY_RESET_N_net_1;
assign SDIF3_CORE_RESET_N_net_1     = SDIF3_CORE_RESET_N_net_0;
assign SDIF3_CORE_RESET_N           = SDIF3_CORE_RESET_N_net_1;
assign FAB_CCC_GL0_net_1            = FAB_CCC_GL0_net_0;
assign FAB_CCC_GL0                  = FAB_CCC_GL0_net_1;
assign FAB_CCC_GL3_net_1            = FAB_CCC_GL3_net_0;
assign FAB_CCC_GL3                  = FAB_CCC_GL3_net_1;
assign FAB_CCC_LOCK_net_1           = FAB_CCC_LOCK_net_0;
assign FAB_CCC_LOCK                 = FAB_CCC_LOCK_net_1;
assign MSS_READY_net_1              = MSS_READY_net_0;
assign MSS_READY                    = MSS_READY_net_1;
assign GPIO_0_M2F_net_1             = GPIO_0_M2F_net_0;
assign GPIO_0_M2F                   = GPIO_0_M2F_net_1;
assign GPIO_1_M2F_net_1             = GPIO_1_M2F_net_0;
assign GPIO_1_M2F                   = GPIO_1_M2F_net_1;
assign GPIO_2_M2F_net_1             = GPIO_2_M2F_net_0;
assign GPIO_2_M2F                   = GPIO_2_M2F_net_1;
assign GPIO_3_M2F_net_1             = GPIO_3_M2F_net_0;
assign GPIO_3_M2F                   = GPIO_3_M2F_net_1;
assign GPIO_4_M2F_net_1             = GPIO_4_M2F_net_0;
assign GPIO_4_M2F                   = GPIO_4_M2F_net_1;
assign GPIO_5_M2F_net_1             = GPIO_5_M2F_net_0;
assign GPIO_5_M2F                   = GPIO_5_M2F_net_1;
assign GPIO_6_M2F_net_1             = GPIO_6_M2F_net_0;
assign GPIO_6_M2F                   = GPIO_6_M2F_net_1;
assign GPIO_7_M2F_net_1             = GPIO_7_M2F_net_0;
assign GPIO_7_M2F                   = GPIO_7_M2F_net_1;
assign MAC_TBI_MDC_net_1            = MAC_TBI_MDC_net_0;
assign MAC_TBI_MDC                  = MAC_TBI_MDC_net_1;
assign MAC_TBI_MDO_EN_net_1         = MAC_TBI_MDO_EN_net_0;
assign MAC_TBI_MDO_EN               = MAC_TBI_MDO_EN_net_1;
assign MAC_TBI_MDO_net_1            = MAC_TBI_MDO_net_0;
assign MAC_TBI_MDO                  = MAC_TBI_MDO_net_1;
assign MAC_TBI_TCGF_net_1           = MAC_TBI_TCGF_net_0;
assign MAC_TBI_TCGF[9:0]            = MAC_TBI_TCGF_net_1;
//--------------------------------------------------------------------
// Bus Interface Nets Assignments - Unequal Pin Widths
//--------------------------------------------------------------------
assign CORECONFIGP_0_MDDR_APBmslave_PADDR_0 = { CORECONFIGP_0_MDDR_APBmslave_PADDR_0_10to2 };
assign CORECONFIGP_0_MDDR_APBmslave_PADDR_0_10to2 = CORECONFIGP_0_MDDR_APBmslave_PADDR[10:2];

assign CORECONFIGP_0_MDDR_APBmslave_PRDATA_0 = { CORECONFIGP_0_MDDR_APBmslave_PRDATA_0_31to16, CORECONFIGP_0_MDDR_APBmslave_PRDATA_0_15to0 };
assign CORECONFIGP_0_MDDR_APBmslave_PRDATA_0_15to0 = CORECONFIGP_0_MDDR_APBmslave_PRDATA[15:0];
assign CORECONFIGP_0_MDDR_APBmslave_PRDATA_0_31to16 = 16'h0;

assign CORECONFIGP_0_MDDR_APBmslave_PWDATA_0 = { CORECONFIGP_0_MDDR_APBmslave_PWDATA_0_15to0 };
assign CORECONFIGP_0_MDDR_APBmslave_PWDATA_0_15to0 = CORECONFIGP_0_MDDR_APBmslave_PWDATA[15:0];

assign Webserver_TCP_sb_MSS_TMP_0_FIC_0_AHB_MASTER_HRESP_0 = { Webserver_TCP_sb_MSS_TMP_0_FIC_0_AHB_MASTER_HRESP_0_0to0 };
assign Webserver_TCP_sb_MSS_TMP_0_FIC_0_AHB_MASTER_HRESP_0_0to0 = Webserver_TCP_sb_MSS_TMP_0_FIC_0_AHB_MASTER_HRESP[0:0];

assign Webserver_TCP_sb_MSS_TMP_0_FIC_0_AHB_MASTER_HSIZE_0 = { Webserver_TCP_sb_MSS_TMP_0_FIC_0_AHB_MASTER_HSIZE_0_2to2, Webserver_TCP_sb_MSS_TMP_0_FIC_0_AHB_MASTER_HSIZE_0_1to0 };
assign Webserver_TCP_sb_MSS_TMP_0_FIC_0_AHB_MASTER_HSIZE_0_1to0 = Webserver_TCP_sb_MSS_TMP_0_FIC_0_AHB_MASTER_HSIZE[1:0];
assign Webserver_TCP_sb_MSS_TMP_0_FIC_0_AHB_MASTER_HSIZE_0_2to2 = 1'b0;

//--------------------------------------------------------------------
// Component instances
//--------------------------------------------------------------------
//--------Webserver_TCP_sb_CCC_0_FCCC   -   Actel:SgCore:FCCC:2.0.201
Webserver_TCP_sb_CCC_0_FCCC CCC_0(
        // Inputs
        .RCOSC_25_50MHZ ( FABOSC_0_RCOSC_25_50MHZ_CCC_OUT_RCOSC_25_50MHZ_CCC ),
        // Outputs
        .GL0            ( FAB_CCC_GL0_net_0 ),
        .GL3            ( FAB_CCC_GL3_net_0 ),
        .LOCK           ( FAB_CCC_LOCK_net_0 ) 
        );

//--------CoreAHBLite   -   Actel:DirectCore:CoreAHBLite:5.2.100
CoreAHBLite #( 
        .FAMILY             ( 19 ),
        .HADDR_SHG_CFG      ( 1 ),
        .M0_AHBSLOT0ENABLE  ( 1 ),
        .M0_AHBSLOT1ENABLE  ( 0 ),
        .M0_AHBSLOT2ENABLE  ( 0 ),
        .M0_AHBSLOT3ENABLE  ( 0 ),
        .M0_AHBSLOT4ENABLE  ( 0 ),
        .M0_AHBSLOT5ENABLE  ( 0 ),
        .M0_AHBSLOT6ENABLE  ( 0 ),
        .M0_AHBSLOT7ENABLE  ( 0 ),
        .M0_AHBSLOT8ENABLE  ( 0 ),
        .M0_AHBSLOT9ENABLE  ( 0 ),
        .M0_AHBSLOT10ENABLE ( 0 ),
        .M0_AHBSLOT11ENABLE ( 0 ),
        .M0_AHBSLOT12ENABLE ( 0 ),
        .M0_AHBSLOT13ENABLE ( 0 ),
        .M0_AHBSLOT14ENABLE ( 0 ),
        .M0_AHBSLOT15ENABLE ( 0 ),
        .M0_AHBSLOT16ENABLE ( 0 ),
        .M1_AHBSLOT0ENABLE  ( 0 ),
        .M1_AHBSLOT1ENABLE  ( 0 ),
        .M1_AHBSLOT2ENABLE  ( 0 ),
        .M1_AHBSLOT3ENABLE  ( 0 ),
        .M1_AHBSLOT4ENABLE  ( 0 ),
        .M1_AHBSLOT5ENABLE  ( 0 ),
        .M1_AHBSLOT6ENABLE  ( 0 ),
        .M1_AHBSLOT7ENABLE  ( 0 ),
        .M1_AHBSLOT8ENABLE  ( 0 ),
        .M1_AHBSLOT9ENABLE  ( 0 ),
        .M1_AHBSLOT10ENABLE ( 0 ),
        .M1_AHBSLOT11ENABLE ( 0 ),
        .M1_AHBSLOT12ENABLE ( 0 ),
        .M1_AHBSLOT13ENABLE ( 0 ),
        .M1_AHBSLOT14ENABLE ( 0 ),
        .M1_AHBSLOT15ENABLE ( 0 ),
        .M1_AHBSLOT16ENABLE ( 0 ),
        .M2_AHBSLOT0ENABLE  ( 0 ),
        .M2_AHBSLOT1ENABLE  ( 0 ),
        .M2_AHBSLOT2ENABLE  ( 0 ),
        .M2_AHBSLOT3ENABLE  ( 0 ),
        .M2_AHBSLOT4ENABLE  ( 0 ),
        .M2_AHBSLOT5ENABLE  ( 0 ),
        .M2_AHBSLOT6ENABLE  ( 0 ),
        .M2_AHBSLOT7ENABLE  ( 0 ),
        .M2_AHBSLOT8ENABLE  ( 0 ),
        .M2_AHBSLOT9ENABLE  ( 0 ),
        .M2_AHBSLOT10ENABLE ( 0 ),
        .M2_AHBSLOT11ENABLE ( 0 ),
        .M2_AHBSLOT12ENABLE ( 0 ),
        .M2_AHBSLOT13ENABLE ( 0 ),
        .M2_AHBSLOT14ENABLE ( 0 ),
        .M2_AHBSLOT15ENABLE ( 0 ),
        .M2_AHBSLOT16ENABLE ( 0 ),
        .M3_AHBSLOT0ENABLE  ( 0 ),
        .M3_AHBSLOT1ENABLE  ( 0 ),
        .M3_AHBSLOT2ENABLE  ( 0 ),
        .M3_AHBSLOT3ENABLE  ( 0 ),
        .M3_AHBSLOT4ENABLE  ( 0 ),
        .M3_AHBSLOT5ENABLE  ( 0 ),
        .M3_AHBSLOT6ENABLE  ( 0 ),
        .M3_AHBSLOT7ENABLE  ( 0 ),
        .M3_AHBSLOT8ENABLE  ( 0 ),
        .M3_AHBSLOT9ENABLE  ( 0 ),
        .M3_AHBSLOT10ENABLE ( 0 ),
        .M3_AHBSLOT11ENABLE ( 0 ),
        .M3_AHBSLOT12ENABLE ( 0 ),
        .M3_AHBSLOT13ENABLE ( 0 ),
        .M3_AHBSLOT14ENABLE ( 0 ),
        .M3_AHBSLOT15ENABLE ( 0 ),
        .M3_AHBSLOT16ENABLE ( 0 ),
        .MEMSPACE           ( 2 ),
        .SC_0               ( 0 ),
        .SC_1               ( 0 ),
        .SC_2               ( 0 ),
        .SC_3               ( 0 ),
        .SC_4               ( 0 ),
        .SC_5               ( 0 ),
        .SC_6               ( 0 ),
        .SC_7               ( 0 ),
        .SC_8               ( 0 ),
        .SC_9               ( 0 ),
        .SC_10              ( 0 ),
        .SC_11              ( 0 ),
        .SC_12              ( 0 ),
        .SC_13              ( 0 ),
        .SC_14              ( 0 ),
        .SC_15              ( 0 ) )
CoreAHBLite_0(
        // Inputs
        .HCLK          ( FAB_CCC_GL0_net_0 ),
        .HRESETN       ( MSS_READY_net_0 ),
        .REMAP_M0      ( GND_net ),
        .HADDR_M0      ( Webserver_TCP_sb_MSS_TMP_0_FIC_0_AHB_MASTER_HADDR ),
        .HMASTLOCK_M0  ( GND_net ), // tied to 1'b0 from definition
        .HSIZE_M0      ( Webserver_TCP_sb_MSS_TMP_0_FIC_0_AHB_MASTER_HSIZE_0 ),
        .HTRANS_M0     ( Webserver_TCP_sb_MSS_TMP_0_FIC_0_AHB_MASTER_HTRANS ),
        .HWRITE_M0     ( Webserver_TCP_sb_MSS_TMP_0_FIC_0_AHB_MASTER_HWRITE ),
        .HWDATA_M0     ( Webserver_TCP_sb_MSS_TMP_0_FIC_0_AHB_MASTER_HWDATA ),
        .HBURST_M0     ( HBURST_M0_const_net_0 ), // tied to 3'h0 from definition
        .HPROT_M0      ( HPROT_M0_const_net_0 ), // tied to 4'h0 from definition
        .HADDR_M1      ( HADDR_M1_const_net_0 ), // tied to 32'h00000000 from definition
        .HMASTLOCK_M1  ( GND_net ), // tied to 1'b0 from definition
        .HSIZE_M1      ( HSIZE_M1_const_net_0 ), // tied to 3'h0 from definition
        .HTRANS_M1     ( HTRANS_M1_const_net_0 ), // tied to 2'h0 from definition
        .HWRITE_M1     ( GND_net ), // tied to 1'b0 from definition
        .HWDATA_M1     ( HWDATA_M1_const_net_0 ), // tied to 32'h00000000 from definition
        .HBURST_M1     ( HBURST_M1_const_net_0 ), // tied to 3'h0 from definition
        .HPROT_M1      ( HPROT_M1_const_net_0 ), // tied to 4'h0 from definition
        .HADDR_M2      ( HADDR_M2_const_net_0 ), // tied to 32'h00000000 from definition
        .HMASTLOCK_M2  ( GND_net ), // tied to 1'b0 from definition
        .HSIZE_M2      ( HSIZE_M2_const_net_0 ), // tied to 3'h0 from definition
        .HTRANS_M2     ( HTRANS_M2_const_net_0 ), // tied to 2'h0 from definition
        .HWRITE_M2     ( GND_net ), // tied to 1'b0 from definition
        .HWDATA_M2     ( HWDATA_M2_const_net_0 ), // tied to 32'h00000000 from definition
        .HBURST_M2     ( HBURST_M2_const_net_0 ), // tied to 3'h0 from definition
        .HPROT_M2      ( HPROT_M2_const_net_0 ), // tied to 4'h0 from definition
        .HADDR_M3      ( HADDR_M3_const_net_0 ), // tied to 32'h00000000 from definition
        .HMASTLOCK_M3  ( GND_net ), // tied to 1'b0 from definition
        .HSIZE_M3      ( HSIZE_M3_const_net_0 ), // tied to 3'h0 from definition
        .HTRANS_M3     ( HTRANS_M3_const_net_0 ), // tied to 2'h0 from definition
        .HWRITE_M3     ( GND_net ), // tied to 1'b0 from definition
        .HWDATA_M3     ( HWDATA_M3_const_net_0 ), // tied to 32'h00000000 from definition
        .HBURST_M3     ( HBURST_M3_const_net_0 ), // tied to 3'h0 from definition
        .HPROT_M3      ( HPROT_M3_const_net_0 ), // tied to 4'h0 from definition
        .HRDATA_S0     ( CoreAHBLite_0_AHBmslave0_HRDATA ),
        .HREADYOUT_S0  ( CoreAHBLite_0_AHBmslave0_HREADYOUT ),
        .HRESP_S0      ( CoreAHBLite_0_AHBmslave0_HRESP ),
        .HRDATA_S1     ( HRDATA_S1_const_net_0 ), // tied to 32'h00000000 from definition
        .HREADYOUT_S1  ( VCC_net ), // tied to 1'b1 from definition
        .HRESP_S1      ( HRESP_S1_const_net_0 ), // tied to 2'h0 from definition
        .HRDATA_S2     ( HRDATA_S2_const_net_0 ), // tied to 32'h00000000 from definition
        .HREADYOUT_S2  ( VCC_net ), // tied to 1'b1 from definition
        .HRESP_S2      ( HRESP_S2_const_net_0 ), // tied to 2'h0 from definition
        .HRDATA_S3     ( HRDATA_S3_const_net_0 ), // tied to 32'h00000000 from definition
        .HREADYOUT_S3  ( VCC_net ), // tied to 1'b1 from definition
        .HRESP_S3      ( HRESP_S3_const_net_0 ), // tied to 2'h0 from definition
        .HRDATA_S4     ( HRDATA_S4_const_net_0 ), // tied to 32'h00000000 from definition
        .HREADYOUT_S4  ( VCC_net ), // tied to 1'b1 from definition
        .HRESP_S4      ( HRESP_S4_const_net_0 ), // tied to 2'h0 from definition
        .HRDATA_S5     ( HRDATA_S5_const_net_0 ), // tied to 32'h00000000 from definition
        .HREADYOUT_S5  ( VCC_net ), // tied to 1'b1 from definition
        .HRESP_S5      ( HRESP_S5_const_net_0 ), // tied to 2'h0 from definition
        .HRDATA_S6     ( HRDATA_S6_const_net_0 ), // tied to 32'h00000000 from definition
        .HREADYOUT_S6  ( VCC_net ), // tied to 1'b1 from definition
        .HRESP_S6      ( HRESP_S6_const_net_0 ), // tied to 2'h0 from definition
        .HRDATA_S7     ( HRDATA_S7_const_net_0 ), // tied to 32'h00000000 from definition
        .HREADYOUT_S7  ( VCC_net ), // tied to 1'b1 from definition
        .HRESP_S7      ( HRESP_S7_const_net_0 ), // tied to 2'h0 from definition
        .HRDATA_S8     ( HRDATA_S8_const_net_0 ), // tied to 32'h00000000 from definition
        .HREADYOUT_S8  ( VCC_net ), // tied to 1'b1 from definition
        .HRESP_S8      ( HRESP_S8_const_net_0 ), // tied to 2'h0 from definition
        .HRDATA_S9     ( HRDATA_S9_const_net_0 ), // tied to 32'h00000000 from definition
        .HREADYOUT_S9  ( VCC_net ), // tied to 1'b1 from definition
        .HRESP_S9      ( HRESP_S9_const_net_0 ), // tied to 2'h0 from definition
        .HRDATA_S10    ( HRDATA_S10_const_net_0 ), // tied to 32'h00000000 from definition
        .HREADYOUT_S10 ( VCC_net ), // tied to 1'b1 from definition
        .HRESP_S10     ( HRESP_S10_const_net_0 ), // tied to 2'h0 from definition
        .HRDATA_S11    ( HRDATA_S11_const_net_0 ), // tied to 32'h00000000 from definition
        .HREADYOUT_S11 ( VCC_net ), // tied to 1'b1 from definition
        .HRESP_S11     ( HRESP_S11_const_net_0 ), // tied to 2'h0 from definition
        .HRDATA_S12    ( HRDATA_S12_const_net_0 ), // tied to 32'h00000000 from definition
        .HREADYOUT_S12 ( VCC_net ), // tied to 1'b1 from definition
        .HRESP_S12     ( HRESP_S12_const_net_0 ), // tied to 2'h0 from definition
        .HRDATA_S13    ( HRDATA_S13_const_net_0 ), // tied to 32'h00000000 from definition
        .HREADYOUT_S13 ( VCC_net ), // tied to 1'b1 from definition
        .HRESP_S13     ( HRESP_S13_const_net_0 ), // tied to 2'h0 from definition
        .HRDATA_S14    ( HRDATA_S14_const_net_0 ), // tied to 32'h00000000 from definition
        .HREADYOUT_S14 ( VCC_net ), // tied to 1'b1 from definition
        .HRESP_S14     ( HRESP_S14_const_net_0 ), // tied to 2'h0 from definition
        .HRDATA_S15    ( HRDATA_S15_const_net_0 ), // tied to 32'h00000000 from definition
        .HREADYOUT_S15 ( VCC_net ), // tied to 1'b1 from definition
        .HRESP_S15     ( HRESP_S15_const_net_0 ), // tied to 2'h0 from definition
        .HRDATA_S16    ( HRDATA_S16_const_net_0 ), // tied to 32'h00000000 from definition
        .HREADYOUT_S16 ( VCC_net ), // tied to 1'b1 from definition
        .HRESP_S16     ( HRESP_S16_const_net_0 ), // tied to 2'h0 from definition
        // Outputs
        .HRESP_M0      ( Webserver_TCP_sb_MSS_TMP_0_FIC_0_AHB_MASTER_HRESP ),
        .HRDATA_M0     ( Webserver_TCP_sb_MSS_TMP_0_FIC_0_AHB_MASTER_HRDATA ),
        .HREADY_M0     ( Webserver_TCP_sb_MSS_TMP_0_FIC_0_AHB_MASTER_HREADY ),
        .HRESP_M1      (  ),
        .HRDATA_M1     (  ),
        .HREADY_M1     (  ),
        .HRESP_M2      (  ),
        .HRDATA_M2     (  ),
        .HREADY_M2     (  ),
        .HRESP_M3      (  ),
        .HRDATA_M3     (  ),
        .HREADY_M3     (  ),
        .HSEL_S0       ( CoreAHBLite_0_AHBmslave0_HSELx ),
        .HADDR_S0      ( CoreAHBLite_0_AHBmslave0_HADDR ),
        .HSIZE_S0      ( CoreAHBLite_0_AHBmslave0_HSIZE ),
        .HTRANS_S0     ( CoreAHBLite_0_AHBmslave0_HTRANS ),
        .HWRITE_S0     ( CoreAHBLite_0_AHBmslave0_HWRITE ),
        .HWDATA_S0     ( CoreAHBLite_0_AHBmslave0_HWDATA ),
        .HREADY_S0     ( CoreAHBLite_0_AHBmslave0_HREADY ),
        .HMASTLOCK_S0  ( CoreAHBLite_0_AHBmslave0_HMASTLOCK ),
        .HBURST_S0     ( CoreAHBLite_0_AHBmslave0_HBURST ),
        .HPROT_S0      ( CoreAHBLite_0_AHBmslave0_HPROT ),
        .HSEL_S1       (  ),
        .HADDR_S1      (  ),
        .HSIZE_S1      (  ),
        .HTRANS_S1     (  ),
        .HWRITE_S1     (  ),
        .HWDATA_S1     (  ),
        .HREADY_S1     (  ),
        .HMASTLOCK_S1  (  ),
        .HBURST_S1     (  ),
        .HPROT_S1      (  ),
        .HSEL_S2       (  ),
        .HADDR_S2      (  ),
        .HSIZE_S2      (  ),
        .HTRANS_S2     (  ),
        .HWRITE_S2     (  ),
        .HWDATA_S2     (  ),
        .HREADY_S2     (  ),
        .HMASTLOCK_S2  (  ),
        .HBURST_S2     (  ),
        .HPROT_S2      (  ),
        .HSEL_S3       (  ),
        .HADDR_S3      (  ),
        .HSIZE_S3      (  ),
        .HTRANS_S3     (  ),
        .HWRITE_S3     (  ),
        .HWDATA_S3     (  ),
        .HREADY_S3     (  ),
        .HMASTLOCK_S3  (  ),
        .HBURST_S3     (  ),
        .HPROT_S3      (  ),
        .HSEL_S4       (  ),
        .HADDR_S4      (  ),
        .HSIZE_S4      (  ),
        .HTRANS_S4     (  ),
        .HWRITE_S4     (  ),
        .HWDATA_S4     (  ),
        .HREADY_S4     (  ),
        .HMASTLOCK_S4  (  ),
        .HBURST_S4     (  ),
        .HPROT_S4      (  ),
        .HSEL_S5       (  ),
        .HADDR_S5      (  ),
        .HSIZE_S5      (  ),
        .HTRANS_S5     (  ),
        .HWRITE_S5     (  ),
        .HWDATA_S5     (  ),
        .HREADY_S5     (  ),
        .HMASTLOCK_S5  (  ),
        .HBURST_S5     (  ),
        .HPROT_S5      (  ),
        .HSEL_S6       (  ),
        .HADDR_S6      (  ),
        .HSIZE_S6      (  ),
        .HTRANS_S6     (  ),
        .HWRITE_S6     (  ),
        .HWDATA_S6     (  ),
        .HREADY_S6     (  ),
        .HMASTLOCK_S6  (  ),
        .HBURST_S6     (  ),
        .HPROT_S6      (  ),
        .HSEL_S7       (  ),
        .HADDR_S7      (  ),
        .HSIZE_S7      (  ),
        .HTRANS_S7     (  ),
        .HWRITE_S7     (  ),
        .HWDATA_S7     (  ),
        .HREADY_S7     (  ),
        .HMASTLOCK_S7  (  ),
        .HBURST_S7     (  ),
        .HPROT_S7      (  ),
        .HSEL_S8       (  ),
        .HADDR_S8      (  ),
        .HSIZE_S8      (  ),
        .HTRANS_S8     (  ),
        .HWRITE_S8     (  ),
        .HWDATA_S8     (  ),
        .HREADY_S8     (  ),
        .HMASTLOCK_S8  (  ),
        .HBURST_S8     (  ),
        .HPROT_S8      (  ),
        .HSEL_S9       (  ),
        .HADDR_S9      (  ),
        .HSIZE_S9      (  ),
        .HTRANS_S9     (  ),
        .HWRITE_S9     (  ),
        .HWDATA_S9     (  ),
        .HREADY_S9     (  ),
        .HMASTLOCK_S9  (  ),
        .HBURST_S9     (  ),
        .HPROT_S9      (  ),
        .HSEL_S10      (  ),
        .HADDR_S10     (  ),
        .HSIZE_S10     (  ),
        .HTRANS_S10    (  ),
        .HWRITE_S10    (  ),
        .HWDATA_S10    (  ),
        .HREADY_S10    (  ),
        .HMASTLOCK_S10 (  ),
        .HBURST_S10    (  ),
        .HPROT_S10     (  ),
        .HSEL_S11      (  ),
        .HADDR_S11     (  ),
        .HSIZE_S11     (  ),
        .HTRANS_S11    (  ),
        .HWRITE_S11    (  ),
        .HWDATA_S11    (  ),
        .HREADY_S11    (  ),
        .HMASTLOCK_S11 (  ),
        .HBURST_S11    (  ),
        .HPROT_S11     (  ),
        .HSEL_S12      (  ),
        .HADDR_S12     (  ),
        .HSIZE_S12     (  ),
        .HTRANS_S12    (  ),
        .HWRITE_S12    (  ),
        .HWDATA_S12    (  ),
        .HREADY_S12    (  ),
        .HMASTLOCK_S12 (  ),
        .HBURST_S12    (  ),
        .HPROT_S12     (  ),
        .HSEL_S13      (  ),
        .HADDR_S13     (  ),
        .HSIZE_S13     (  ),
        .HTRANS_S13    (  ),
        .HWRITE_S13    (  ),
        .HWDATA_S13    (  ),
        .HREADY_S13    (  ),
        .HMASTLOCK_S13 (  ),
        .HBURST_S13    (  ),
        .HPROT_S13     (  ),
        .HSEL_S14      (  ),
        .HADDR_S14     (  ),
        .HSIZE_S14     (  ),
        .HTRANS_S14    (  ),
        .HWRITE_S14    (  ),
        .HWDATA_S14    (  ),
        .HREADY_S14    (  ),
        .HMASTLOCK_S14 (  ),
        .HBURST_S14    (  ),
        .HPROT_S14     (  ),
        .HSEL_S15      (  ),
        .HADDR_S15     (  ),
        .HSIZE_S15     (  ),
        .HTRANS_S15    (  ),
        .HWRITE_S15    (  ),
        .HWDATA_S15    (  ),
        .HREADY_S15    (  ),
        .HMASTLOCK_S15 (  ),
        .HBURST_S15    (  ),
        .HPROT_S15     (  ),
        .HSEL_S16      (  ),
        .HADDR_S16     (  ),
        .HSIZE_S16     (  ),
        .HTRANS_S16    (  ),
        .HWRITE_S16    (  ),
        .HWDATA_S16    (  ),
        .HREADY_S16    (  ),
        .HMASTLOCK_S16 (  ),
        .HBURST_S16    (  ),
        .HPROT_S16     (  ) 
        );

//--------Webserver_TCP_sb_COREAHBLSRAM_0_0_COREAHBLSRAM   -   Actel:DirectCore:COREAHBLSRAM:2.0.113
Webserver_TCP_sb_COREAHBLSRAM_0_0_COREAHBLSRAM #( 
        .AHB_AWIDTH                   ( 32 ),
        .AHB_DWIDTH                   ( 32 ),
        .FAMILY                       ( 19 ),
        .LSRAM_NUM_LOCATIONS_DWIDTH32 ( 32768 ),
        .SEL_SRAM_TYPE                ( 0 ),
        .USRAM_NUM_LOCATIONS_DWIDTH32 ( 512 ) )
COREAHBLSRAM_0_0(
        // Inputs
        .HCLK      ( FAB_CCC_GL0_net_0 ),
        .HRESETN   ( MSS_READY_net_0 ),
        .HSEL      ( CoreAHBLite_0_AHBmslave0_HSELx ),
        .HREADYIN  ( CoreAHBLite_0_AHBmslave0_HREADY ),
        .HSIZE     ( CoreAHBLite_0_AHBmslave0_HSIZE ),
        .HTRANS    ( CoreAHBLite_0_AHBmslave0_HTRANS ),
        .HBURST    ( CoreAHBLite_0_AHBmslave0_HBURST ),
        .HADDR     ( CoreAHBLite_0_AHBmslave0_HADDR ),
        .HWRITE    ( CoreAHBLite_0_AHBmslave0_HWRITE ),
        .HWDATA    ( CoreAHBLite_0_AHBmslave0_HWDATA ),
        // Outputs
        .HREADYOUT ( CoreAHBLite_0_AHBmslave0_HREADYOUT ),
        .HRDATA    ( CoreAHBLite_0_AHBmslave0_HRDATA ),
        .HRESP     ( CoreAHBLite_0_AHBmslave0_HRESP ) 
        );

//--------CoreConfigP   -   Actel:DirectCore:CoreConfigP:7.1.100
CoreConfigP #( 
        .DEVICE_090         ( 0 ),
        .ENABLE_SOFT_RESETS ( 1 ),
        .FDDR_IN_USE        ( 0 ),
        .MDDR_IN_USE        ( 1 ),
        .SDIF0_IN_USE       ( 0 ),
        .SDIF0_PCIE         ( 0 ),
        .SDIF1_IN_USE       ( 0 ),
        .SDIF1_PCIE         ( 0 ),
        .SDIF2_IN_USE       ( 0 ),
        .SDIF2_PCIE         ( 0 ),
        .SDIF3_IN_USE       ( 1 ),
        .SDIF3_PCIE         ( 1 ) )
CORECONFIGP_0(
        // Inputs
        .FIC_2_APB_M_PRESET_N           ( Webserver_TCP_sb_MSS_TMP_0_FIC_2_APB_M_PRESET_N ),
        .FIC_2_APB_M_PCLK               ( Webserver_TCP_sb_MSS_TMP_0_FIC_2_APB_M_PCLK ),
        .SDIF_RELEASED                  ( CORERESETP_0_SDIF_RELEASED ),
        .INIT_DONE                      ( INIT_DONE_net_0 ),
        .FIC_2_APB_M_PSEL               ( Webserver_TCP_sb_MSS_TMP_0_FIC_2_APB_MASTER_PSELx ),
        .FIC_2_APB_M_PENABLE            ( Webserver_TCP_sb_MSS_TMP_0_FIC_2_APB_MASTER_PENABLE ),
        .FIC_2_APB_M_PWRITE             ( Webserver_TCP_sb_MSS_TMP_0_FIC_2_APB_MASTER_PWRITE ),
        .FIC_2_APB_M_PADDR              ( Webserver_TCP_sb_MSS_TMP_0_FIC_2_APB_MASTER_PADDR ),
        .FIC_2_APB_M_PWDATA             ( Webserver_TCP_sb_MSS_TMP_0_FIC_2_APB_MASTER_PWDATA ),
        .MDDR_PRDATA                    ( CORECONFIGP_0_MDDR_APBmslave_PRDATA_0 ),
        .MDDR_PREADY                    ( CORECONFIGP_0_MDDR_APBmslave_PREADY ),
        .MDDR_PSLVERR                   ( CORECONFIGP_0_MDDR_APBmslave_PSLVERR ),
        .FDDR_PRDATA                    ( FDDR_PRDATA_const_net_0 ), // tied to 32'h00000000 from definition
        .FDDR_PREADY                    ( VCC_net ), // tied to 1'b1 from definition
        .FDDR_PSLVERR                   ( GND_net ), // tied to 1'b0 from definition
        .SDIF0_PRDATA                   ( SDIF0_PRDATA_const_net_0 ), // tied to 32'h00000000 from definition
        .SDIF0_PREADY                   ( VCC_net ), // tied to 1'b1 from definition
        .SDIF0_PSLVERR                  ( GND_net ), // tied to 1'b0 from definition
        .SDIF1_PRDATA                   ( SDIF1_PRDATA_const_net_0 ), // tied to 32'h00000000 from definition
        .SDIF1_PREADY                   ( VCC_net ), // tied to 1'b1 from definition
        .SDIF1_PSLVERR                  ( GND_net ), // tied to 1'b0 from definition
        .SDIF2_PRDATA                   ( SDIF2_PRDATA_const_net_0 ), // tied to 32'h00000000 from definition
        .SDIF2_PREADY                   ( VCC_net ), // tied to 1'b1 from definition
        .SDIF2_PSLVERR                  ( GND_net ), // tied to 1'b0 from definition
        .SDIF3_PRDATA                   ( SDIF3_PRDATA ),
        .SDIF3_PREADY                   ( SDIF3_PREADY ),
        .SDIF3_PSLVERR                  ( SDIF3_PSLVERR ),
        // Outputs
        .APB_S_PCLK                     ( INIT_APB_S_PCLK_net_0 ),
        .APB_S_PRESET_N                 ( INIT_APB_S_PRESET_N_net_0 ),
        .CONFIG1_DONE                   ( CORECONFIGP_0_CONFIG1_DONE ),
        .CONFIG2_DONE                   ( CORECONFIGP_0_CONFIG2_DONE ),
        .FIC_2_APB_M_PRDATA             ( Webserver_TCP_sb_MSS_TMP_0_FIC_2_APB_MASTER_PRDATA ),
        .FIC_2_APB_M_PREADY             ( Webserver_TCP_sb_MSS_TMP_0_FIC_2_APB_MASTER_PREADY ),
        .FIC_2_APB_M_PSLVERR            ( Webserver_TCP_sb_MSS_TMP_0_FIC_2_APB_MASTER_PSLVERR ),
        .MDDR_PSEL                      ( CORECONFIGP_0_MDDR_APBmslave_PSELx ),
        .MDDR_PENABLE                   ( CORECONFIGP_0_MDDR_APBmslave_PENABLE ),
        .MDDR_PWRITE                    ( CORECONFIGP_0_MDDR_APBmslave_PWRITE ),
        .MDDR_PADDR                     ( CORECONFIGP_0_MDDR_APBmslave_PADDR ),
        .MDDR_PWDATA                    ( CORECONFIGP_0_MDDR_APBmslave_PWDATA ),
        .FDDR_PSEL                      (  ),
        .FDDR_PENABLE                   (  ),
        .FDDR_PWRITE                    (  ),
        .FDDR_PADDR                     (  ),
        .FDDR_PWDATA                    (  ),
        .SDIF0_PSEL                     (  ),
        .SDIF0_PENABLE                  (  ),
        .SDIF0_PWRITE                   (  ),
        .SDIF0_PADDR                    (  ),
        .SDIF0_PWDATA                   (  ),
        .SDIF1_PSEL                     (  ),
        .SDIF1_PENABLE                  (  ),
        .SDIF1_PWRITE                   (  ),
        .SDIF1_PADDR                    (  ),
        .SDIF1_PWDATA                   (  ),
        .SDIF2_PSEL                     (  ),
        .SDIF2_PENABLE                  (  ),
        .SDIF2_PWRITE                   (  ),
        .SDIF2_PADDR                    (  ),
        .SDIF2_PWDATA                   (  ),
        .SDIF3_PSEL                     ( SDIF3_INIT_APB_PSELx ),
        .SDIF3_PENABLE                  ( SDIF3_INIT_APB_PENABLE ),
        .SDIF3_PWRITE                   ( SDIF3_INIT_APB_PWRITE ),
        .SDIF3_PADDR                    ( SDIF3_INIT_APB_PADDR ),
        .SDIF3_PWDATA                   ( SDIF3_INIT_APB_PWDATA ),
        .SOFT_EXT_RESET_OUT             ( CORECONFIGP_0_SOFT_EXT_RESET_OUT ),
        .SOFT_RESET_F2M                 ( CORECONFIGP_0_SOFT_RESET_F2M ),
        .SOFT_M3_RESET                  ( CORECONFIGP_0_SOFT_M3_RESET ),
        .SOFT_MDDR_DDR_AXI_S_CORE_RESET ( CORECONFIGP_0_SOFT_MDDR_DDR_AXI_S_CORE_RESET ),
        .SOFT_FDDR_CORE_RESET           (  ),
        .SOFT_SDIF0_PHY_RESET           (  ),
        .SOFT_SDIF0_CORE_RESET          (  ),
        .SOFT_SDIF0_0_CORE_RESET        (  ),
        .SOFT_SDIF0_1_CORE_RESET        (  ),
        .SOFT_SDIF1_PHY_RESET           (  ),
        .SOFT_SDIF1_CORE_RESET          (  ),
        .SOFT_SDIF2_PHY_RESET           (  ),
        .SOFT_SDIF2_CORE_RESET          (  ),
        .SOFT_SDIF3_PHY_RESET           ( CORECONFIGP_0_SOFT_SDIF3_PHY_RESET ),
        .SOFT_SDIF3_CORE_RESET          ( CORECONFIGP_0_SOFT_SDIF3_CORE_RESET ),
        .R_SDIF0_PSEL                   (  ),
        .R_SDIF0_PWRITE                 (  ),
        .R_SDIF0_PRDATA                 (  ),
        .R_SDIF1_PSEL                   (  ),
        .R_SDIF1_PWRITE                 (  ),
        .R_SDIF1_PRDATA                 (  ),
        .R_SDIF2_PSEL                   (  ),
        .R_SDIF2_PWRITE                 (  ),
        .R_SDIF2_PRDATA                 (  ),
        .R_SDIF3_PSEL                   ( CORECONFIGP_0_R_SDIF3_PSEL ),
        .R_SDIF3_PWRITE                 ( CORECONFIGP_0_R_SDIF3_PWRITE ),
        .R_SDIF3_PRDATA                 ( CORECONFIGP_0_R_SDIF3_PRDATA ) 
        );

//--------CoreResetP   -   Actel:DirectCore:CoreResetP:7.1.100
CoreResetP #( 
        .DDR_WAIT            ( 200 ),
        .DEVICE_090          ( 0 ),
        .DEVICE_VOLTAGE      ( 2 ),
        .ENABLE_SOFT_RESETS  ( 1 ),
        .EXT_RESET_CFG       ( 0 ),
        .FDDR_IN_USE         ( 0 ),
        .MDDR_IN_USE         ( 1 ),
        .SDIF0_IN_USE        ( 0 ),
        .SDIF0_PCIE          ( 0 ),
        .SDIF0_PCIE_HOTRESET ( 1 ),
        .SDIF0_PCIE_L2P2     ( 1 ),
        .SDIF1_IN_USE        ( 0 ),
        .SDIF1_PCIE          ( 0 ),
        .SDIF1_PCIE_HOTRESET ( 1 ),
        .SDIF1_PCIE_L2P2     ( 1 ),
        .SDIF2_IN_USE        ( 0 ),
        .SDIF2_PCIE          ( 0 ),
        .SDIF2_PCIE_HOTRESET ( 1 ),
        .SDIF2_PCIE_L2P2     ( 1 ),
        .SDIF3_IN_USE        ( 1 ),
        .SDIF3_PCIE          ( 1 ),
        .SDIF3_PCIE_HOTRESET ( 1 ),
        .SDIF3_PCIE_L2P2     ( 1 ) )
CORERESETP_0(
        // Inputs
        .RESET_N_M2F                    ( Webserver_TCP_sb_MSS_TMP_0_MSS_RESET_N_M2F ),
        .FIC_2_APB_M_PRESET_N           ( Webserver_TCP_sb_MSS_TMP_0_FIC_2_APB_M_PRESET_N ),
        .POWER_ON_RESET_N               ( POWER_ON_RESET_N_net_0 ),
        .FAB_RESET_N                    ( FAB_RESET_N ),
        .RCOSC_25_50MHZ                 ( FABOSC_0_RCOSC_25_50MHZ_O2F ),
        .CLK_BASE                       ( FAB_CCC_GL0_net_0 ),
        .CLK_LTSSM                      ( FAB_CCC_GL3_net_0 ),
        .FPLL_LOCK                      ( VCC_net ), // tied to 1'b1 from definition
        .SDIF0_SPLL_LOCK                ( VCC_net ), // tied to 1'b1 from definition
        .SDIF1_SPLL_LOCK                ( VCC_net ), // tied to 1'b1 from definition
        .SDIF2_SPLL_LOCK                ( VCC_net ), // tied to 1'b1 from definition
        .SDIF3_SPLL_LOCK                ( SDIF3_SPLL_LOCK ),
        .CONFIG1_DONE                   ( CORECONFIGP_0_CONFIG1_DONE ),
        .CONFIG2_DONE                   ( CORECONFIGP_0_CONFIG2_DONE ),
        .SDIF0_PERST_N                  ( VCC_net ), // tied to 1'b1 from definition
        .SDIF1_PERST_N                  ( VCC_net ), // tied to 1'b1 from definition
        .SDIF2_PERST_N                  ( VCC_net ), // tied to 1'b1 from definition
        .SDIF3_PERST_N                  ( SDIF3_PERST_N ),
        .SDIF0_PSEL                     ( GND_net ), // tied to 1'b0 from definition
        .SDIF0_PWRITE                   ( VCC_net ), // tied to 1'b1 from definition
        .SDIF0_PRDATA                   ( SDIF0_PRDATA_const_net_1 ), // tied to 32'h00000000 from definition
        .SDIF1_PSEL                     ( GND_net ), // tied to 1'b0 from definition
        .SDIF1_PWRITE                   ( VCC_net ), // tied to 1'b1 from definition
        .SDIF1_PRDATA                   ( SDIF1_PRDATA_const_net_1 ), // tied to 32'h00000000 from definition
        .SDIF2_PSEL                     ( GND_net ), // tied to 1'b0 from definition
        .SDIF2_PWRITE                   ( VCC_net ), // tied to 1'b1 from definition
        .SDIF2_PRDATA                   ( SDIF2_PRDATA_const_net_1 ), // tied to 32'h00000000 from definition
        .SDIF3_PSEL                     ( CORECONFIGP_0_R_SDIF3_PSEL ),
        .SDIF3_PWRITE                   ( CORECONFIGP_0_R_SDIF3_PWRITE ),
        .SDIF3_PRDATA                   ( CORECONFIGP_0_R_SDIF3_PRDATA ),
        .SOFT_EXT_RESET_OUT             ( CORECONFIGP_0_SOFT_EXT_RESET_OUT ),
        .SOFT_RESET_F2M                 ( CORECONFIGP_0_SOFT_RESET_F2M ),
        .SOFT_M3_RESET                  ( CORECONFIGP_0_SOFT_M3_RESET ),
        .SOFT_MDDR_DDR_AXI_S_CORE_RESET ( CORECONFIGP_0_SOFT_MDDR_DDR_AXI_S_CORE_RESET ),
        .SOFT_FDDR_CORE_RESET           ( GND_net ), // tied to 1'b0 from definition
        .SOFT_SDIF0_PHY_RESET           ( GND_net ), // tied to 1'b0 from definition
        .SOFT_SDIF0_CORE_RESET          ( GND_net ), // tied to 1'b0 from definition
        .SOFT_SDIF0_0_CORE_RESET        ( GND_net ), // tied to 1'b0 from definition
        .SOFT_SDIF0_1_CORE_RESET        ( GND_net ), // tied to 1'b0 from definition
        .SOFT_SDIF1_PHY_RESET           ( GND_net ), // tied to 1'b0 from definition
        .SOFT_SDIF1_CORE_RESET          ( GND_net ), // tied to 1'b0 from definition
        .SOFT_SDIF2_PHY_RESET           ( GND_net ), // tied to 1'b0 from definition
        .SOFT_SDIF2_CORE_RESET          ( GND_net ), // tied to 1'b0 from definition
        .SOFT_SDIF3_PHY_RESET           ( CORECONFIGP_0_SOFT_SDIF3_PHY_RESET ),
        .SOFT_SDIF3_CORE_RESET          ( CORECONFIGP_0_SOFT_SDIF3_CORE_RESET ),
        // Outputs
        .MSS_HPMS_READY                 ( MSS_READY_net_0 ),
        .DDR_READY                      ( DDR_READY_net_0 ),
        .SDIF_READY                     ( SDIF_READY_net_0 ),
        .RESET_N_F2M                    ( CORERESETP_0_RESET_N_F2M ),
        .M3_RESET_N                     ( CORERESETP_0_M3_RESET_N ),
        .EXT_RESET_OUT                  (  ),
        .MDDR_DDR_AXI_S_CORE_RESET_N    (  ),
        .FDDR_CORE_RESET_N              (  ),
        .SDIF0_CORE_RESET_N             (  ),
        .SDIF0_0_CORE_RESET_N           (  ),
        .SDIF0_1_CORE_RESET_N           (  ),
        .SDIF0_PHY_RESET_N              (  ),
        .SDIF1_CORE_RESET_N             (  ),
        .SDIF1_PHY_RESET_N              (  ),
        .SDIF2_CORE_RESET_N             (  ),
        .SDIF2_PHY_RESET_N              (  ),
        .SDIF3_CORE_RESET_N             ( SDIF3_CORE_RESET_N_net_0 ),
        .SDIF3_PHY_RESET_N              ( SDIF3_PHY_RESET_N_net_0 ),
        .SDIF_RELEASED                  ( CORERESETP_0_SDIF_RELEASED ),
        .INIT_DONE                      ( INIT_DONE_net_0 ) 
        );

//--------Webserver_TCP_sb_FABOSC_0_OSC   -   Actel:SgCore:OSC:2.0.101
Webserver_TCP_sb_FABOSC_0_OSC FABOSC_0(
        // Inputs
        .XTL                ( GND_net ), // tied to 1'b0 from definition
        // Outputs
        .RCOSC_25_50MHZ_CCC ( FABOSC_0_RCOSC_25_50MHZ_CCC_OUT_RCOSC_25_50MHZ_CCC ),
        .RCOSC_25_50MHZ_O2F ( FABOSC_0_RCOSC_25_50MHZ_O2F ),
        .RCOSC_1MHZ_CCC     (  ),
        .RCOSC_1MHZ_O2F     (  ),
        .XTLOSC_CCC         (  ),
        .XTLOSC_O2F         (  ) 
        );

//--------SYSRESET
SYSRESET SYSRESET_POR(
        // Inputs
        .DEVRST_N         ( DEVRST_N ),
        // Outputs
        .POWER_ON_RESET_N ( POWER_ON_RESET_N_net_0 ) 
        );

//--------Webserver_TCP_sb_MSS
Webserver_TCP_sb_MSS Webserver_TCP_sb_MSS_0(
        // Inputs
        .SPI_0_DI               ( SPI_0_DI ),
        .MCCC_CLK_BASE          ( FAB_CCC_GL0_net_0 ),
        .MMUART_0_RXD           ( MMUART_0_RXD ),
        .MDDR_DQS_TMATCH_0_IN   ( MDDR_DQS_TMATCH_0_IN ),
        .MCCC_CLK_BASE_PLL_LOCK ( FAB_CCC_LOCK_net_0 ),
        .MSS_RESET_N_F2M        ( CORERESETP_0_RESET_N_F2M ),
        .MAC_TBI_RX_CLKP0       ( MAC_TBI_RX_CLKP0 ),
        .MAC_TBI_RX_CLKP1       ( MAC_TBI_RX_CLKP1 ),
        .MAC_TBI_GTX_CLK        ( MAC_TBI_GTX_CLK ),
        .MAC_TBI_MDI            ( MAC_TBI_MDI ),
        .FIC_0_AHB_M_HREADY     ( Webserver_TCP_sb_MSS_TMP_0_FIC_0_AHB_MASTER_HREADY ),
        .FIC_0_AHB_M_HRESP      ( Webserver_TCP_sb_MSS_TMP_0_FIC_0_AHB_MASTER_HRESP_0 ),
        .M3_RESET_N             ( CORERESETP_0_M3_RESET_N ),
        .MDDR_APB_S_PRESET_N    ( INIT_APB_S_PRESET_N_net_0 ),
        .MDDR_APB_S_PCLK        ( INIT_APB_S_PCLK_net_0 ),
        .FIC_2_APB_M_PREADY     ( Webserver_TCP_sb_MSS_TMP_0_FIC_2_APB_MASTER_PREADY ),
        .FIC_2_APB_M_PSLVERR    ( Webserver_TCP_sb_MSS_TMP_0_FIC_2_APB_MASTER_PSLVERR ),
        .MDDR_APB_S_PWRITE      ( CORECONFIGP_0_MDDR_APBmslave_PWRITE ),
        .MDDR_APB_S_PENABLE     ( CORECONFIGP_0_MDDR_APBmslave_PENABLE ),
        .MDDR_APB_S_PSEL        ( CORECONFIGP_0_MDDR_APBmslave_PSELx ),
        .MAC_TBI_RCGF           ( MAC_TBI_RCGF ),
        .FIC_0_AHB_M_HRDATA     ( Webserver_TCP_sb_MSS_TMP_0_FIC_0_AHB_MASTER_HRDATA ),
        .FIC_2_APB_M_PRDATA     ( Webserver_TCP_sb_MSS_TMP_0_FIC_2_APB_MASTER_PRDATA ),
        .MDDR_APB_S_PWDATA      ( CORECONFIGP_0_MDDR_APBmslave_PWDATA_0 ),
        .MDDR_APB_S_PADDR       ( CORECONFIGP_0_MDDR_APBmslave_PADDR_0 ),
        // Outputs
        .SPI_0_DO               ( SPI_0_DO_net_0 ),
        .MMUART_0_TXD           ( MMUART_0_TXD_net_0 ),
        .MDDR_DQS_TMATCH_0_OUT  ( MDDR_DQS_TMATCH_0_OUT_net_0 ),
        .MDDR_CAS_N             ( MDDR_CAS_N_net_0 ),
        .MDDR_CLK               ( MDDR_CLK_net_0 ),
        .MDDR_CLK_N             ( MDDR_CLK_N_net_0 ),
        .MDDR_CKE               ( MDDR_CKE_net_0 ),
        .MDDR_CS_N              ( MDDR_CS_N_net_0 ),
        .MDDR_ODT               ( MDDR_ODT_net_0 ),
        .MDDR_RAS_N             ( MDDR_RAS_N_net_0 ),
        .MDDR_RESET_N           ( MDDR_RESET_N_net_0 ),
        .MDDR_WE_N              ( MDDR_WE_N_net_0 ),
        .MSS_RESET_N_M2F        ( Webserver_TCP_sb_MSS_TMP_0_MSS_RESET_N_M2F ),
        .GPIO_0_M2F             ( GPIO_0_M2F_net_0 ),
        .GPIO_1_M2F             ( GPIO_1_M2F_net_0 ),
        .GPIO_2_M2F             ( GPIO_2_M2F_net_0 ),
        .GPIO_3_M2F             ( GPIO_3_M2F_net_0 ),
        .GPIO_4_M2F             ( GPIO_4_M2F_net_0 ),
        .GPIO_5_M2F             ( GPIO_5_M2F_net_0 ),
        .GPIO_6_M2F             ( GPIO_6_M2F_net_0 ),
        .GPIO_7_M2F             ( GPIO_7_M2F_net_0 ),
        .MAC_TBI_MDC            ( MAC_TBI_MDC_net_0 ),
        .MAC_TBI_MDO_EN         ( MAC_TBI_MDO_EN_net_0 ),
        .MAC_TBI_MDO            ( MAC_TBI_MDO_net_0 ),
        .FIC_0_AHB_M_HWRITE     ( Webserver_TCP_sb_MSS_TMP_0_FIC_0_AHB_MASTER_HWRITE ),
        .FIC_2_APB_M_PRESET_N   ( Webserver_TCP_sb_MSS_TMP_0_FIC_2_APB_M_PRESET_N ),
        .FIC_2_APB_M_PCLK       ( Webserver_TCP_sb_MSS_TMP_0_FIC_2_APB_M_PCLK ),
        .FIC_2_APB_M_PWRITE     ( Webserver_TCP_sb_MSS_TMP_0_FIC_2_APB_MASTER_PWRITE ),
        .FIC_2_APB_M_PENABLE    ( Webserver_TCP_sb_MSS_TMP_0_FIC_2_APB_MASTER_PENABLE ),
        .FIC_2_APB_M_PSEL       ( Webserver_TCP_sb_MSS_TMP_0_FIC_2_APB_MASTER_PSELx ),
        .MDDR_APB_S_PREADY      ( CORECONFIGP_0_MDDR_APBmslave_PREADY ),
        .MDDR_APB_S_PSLVERR     ( CORECONFIGP_0_MDDR_APBmslave_PSLVERR ),
        .MDDR_ADDR              ( MDDR_ADDR_net_0 ),
        .MDDR_BA                ( MDDR_BA_net_0 ),
        .MAC_TBI_TCGF           ( MAC_TBI_TCGF_net_0 ),
        .FIC_0_AHB_M_HADDR      ( Webserver_TCP_sb_MSS_TMP_0_FIC_0_AHB_MASTER_HADDR ),
        .FIC_0_AHB_M_HWDATA     ( Webserver_TCP_sb_MSS_TMP_0_FIC_0_AHB_MASTER_HWDATA ),
        .FIC_0_AHB_M_HSIZE      ( Webserver_TCP_sb_MSS_TMP_0_FIC_0_AHB_MASTER_HSIZE ),
        .FIC_0_AHB_M_HTRANS     ( Webserver_TCP_sb_MSS_TMP_0_FIC_0_AHB_MASTER_HTRANS ),
        .FIC_2_APB_M_PADDR      ( Webserver_TCP_sb_MSS_TMP_0_FIC_2_APB_MASTER_PADDR ),
        .FIC_2_APB_M_PWDATA     ( Webserver_TCP_sb_MSS_TMP_0_FIC_2_APB_MASTER_PWDATA ),
        .MDDR_APB_S_PRDATA      ( CORECONFIGP_0_MDDR_APBmslave_PRDATA ),
        // Inouts
        .SPI_0_CLK              ( SPI_0_CLK ),
        .SPI_0_SS0              ( SPI_0_SS0 ),
        .MDDR_DM_RDQS           ( MDDR_DM_RDQS ),
        .MDDR_DQ                ( MDDR_DQ ),
        .MDDR_DQS               ( MDDR_DQS ),
        .MDDR_DQS_N             ( MDDR_DQS_N ) 
        );


endmodule
