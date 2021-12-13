//////////////////////////////////////////////////////////////////////
// Created by SmartDesign Fri Jun 11 22:56:33 2021
// Version: v2021.1 2021.1.0.17
//////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

// top
module top(
    // Inputs
    DEVRST_N,
    MDDR_DQS_TMATCH_0_IN,
    MMUART_0_RXD,
    REFCLK1_N,
    REFCLK1_P,
    RXD0_N,
    RXD0_P,
    RXD1_N,
    RXD1_P,
    RXD2_N,
    RXD2_P,
    RXD3_N,
    RXD3_P,
    SPI_0_DI,
    // Outputs
    GPIO_0_M2F,
    GPIO_1_M2F,
    GPIO_2_M2F,
    GPIO_3_M2F,
    GPIO_4_M2F,
    GPIO_5_M2F,
    GPIO_6_M2F,
    GPIO_7_M2F,
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
    PHY_MDC,
    PHY_RST,
    SPI_0_DO,
    TXD0_N,
    TXD0_P,
    TXD1_N,
    TXD1_P,
    TXD2_N,
    TXD2_P,
    TXD3_N,
    TXD3_P,
    // Inouts
    MDDR_DM_RDQS,
    MDDR_DQ,
    MDDR_DQS,
    MDDR_DQS_N,
    PHY_MDIO,
    SPI_0_CLK,
    SPI_0_SS0
);

//--------------------------------------------------------------------
// Input
//--------------------------------------------------------------------
input         DEVRST_N;
input         MDDR_DQS_TMATCH_0_IN;
input         MMUART_0_RXD;
input         REFCLK1_N;
input         REFCLK1_P;
input         RXD0_N;
input         RXD0_P;
input         RXD1_N;
input         RXD1_P;
input         RXD2_N;
input         RXD2_P;
input         RXD3_N;
input         RXD3_P;
input         SPI_0_DI;
//--------------------------------------------------------------------
// Output
//--------------------------------------------------------------------
output        GPIO_0_M2F;
output        GPIO_1_M2F;
output        GPIO_2_M2F;
output        GPIO_3_M2F;
output        GPIO_4_M2F;
output        GPIO_5_M2F;
output        GPIO_6_M2F;
output        GPIO_7_M2F;
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
output        PHY_MDC;
output        PHY_RST;
output        SPI_0_DO;
output        TXD0_N;
output        TXD0_P;
output        TXD1_N;
output        TXD1_P;
output        TXD2_N;
output        TXD2_P;
output        TXD3_N;
output        TXD3_P;
//--------------------------------------------------------------------
// Inout
//--------------------------------------------------------------------
inout  [1:0]  MDDR_DM_RDQS;
inout  [15:0] MDDR_DQ;
inout  [1:0]  MDDR_DQS;
inout  [1:0]  MDDR_DQS_N;
inout         PHY_MDIO;
inout         SPI_0_CLK;
inout         SPI_0_SS0;
//--------------------------------------------------------------------
// Nets
//--------------------------------------------------------------------
wire          BIBUF_0_Y;
wire          DEVRST_N;
wire          FCCC_0_GL0;
wire          FCCC_0_GL1;
wire          FCCC_0_LOCK;
wire          FCCC_1_GL0;
wire          FCCC_1_LOCK;
wire          GPIO_0_M2F_net_0;
wire          GPIO_1_M2F_net_0;
wire          GPIO_2_M2F_net_0;
wire          GPIO_3_M2F_net_0;
wire          GPIO_4_M2F_net_0;
wire          GPIO_5_M2F_net_0;
wire          GPIO_6_M2F_net_0;
wire          GPIO_7_M2F_net_0;
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
wire          PHY_MDC_net_0;
wire          PHY_MDIO;
wire          PHY_RST_net_0;
wire          REFCLK1_N;
wire          REFCLK1_P;
wire          RXD0_N;
wire          RXD0_P;
wire          RXD1_N;
wire          RXD1_P;
wire          RXD2_N;
wire          RXD2_P;
wire          RXD3_N;
wire          RXD3_P;
wire          SERDES_IF_0_EPCS_3_RX_CLK;
wire   [9:0]  SERDES_IF_0_EPCS_3_RX_DATA;
wire          SERDES_IF_0_EPCS_3_TX_CLK;
wire          SPI_0_CLK;
wire          SPI_0_DI;
wire          SPI_0_DO_net_0;
wire          SPI_0_SS0;
wire          TXD0_N_net_0;
wire          TXD0_P_net_0;
wire          TXD1_N_net_0;
wire          TXD1_P_net_0;
wire          TXD2_N_net_0;
wire          TXD2_P_net_0;
wire          TXD3_N_net_0;
wire          TXD3_P_net_0;
wire          Webserver_TCP_sb_0_INIT_APB_S_PCLK;
wire          Webserver_TCP_sb_0_INIT_APB_S_PRESET_N;
wire          Webserver_TCP_sb_0_MAC_TBI_MDO;
wire          Webserver_TCP_sb_0_MAC_TBI_MDO_EN;
wire   [9:0]  Webserver_TCP_sb_0_MAC_TBI_TCGF;
wire          Webserver_TCP_sb_0_SDIF3_INIT_APB_PENABLE;
wire   [31:0] Webserver_TCP_sb_0_SDIF3_INIT_APB_PRDATA;
wire          Webserver_TCP_sb_0_SDIF3_INIT_APB_PREADY;
wire          Webserver_TCP_sb_0_SDIF3_INIT_APB_PSELx;
wire          Webserver_TCP_sb_0_SDIF3_INIT_APB_PSLVERR;
wire   [31:0] Webserver_TCP_sb_0_SDIF3_INIT_APB_PWDATA;
wire          Webserver_TCP_sb_0_SDIF3_INIT_APB_PWRITE;
wire          Webserver_TCP_sb_0_SDIF3_PHY_RESET_N;
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
wire          TXD0_P_net_1;
wire          TXD0_N_net_1;
wire          TXD1_P_net_1;
wire          TXD1_N_net_1;
wire          TXD2_P_net_1;
wire          TXD2_N_net_1;
wire          TXD3_P_net_1;
wire          TXD3_N_net_1;
wire          GPIO_0_M2F_net_1;
wire          GPIO_1_M2F_net_1;
wire          GPIO_2_M2F_net_1;
wire          GPIO_3_M2F_net_1;
wire          GPIO_4_M2F_net_1;
wire          GPIO_5_M2F_net_1;
wire          GPIO_6_M2F_net_1;
wire          GPIO_7_M2F_net_1;
wire          PHY_RST_net_1;
wire          PHY_MDC_net_1;
wire   [15:0] MDDR_ADDR_net_1;
wire   [2:0]  MDDR_BA_net_1;
//--------------------------------------------------------------------
// TiedOff Nets
//--------------------------------------------------------------------
wire          GND_net;
wire          VCC_net;
wire   [7:2]  PADDR_const_net_0;
wire   [7:0]  PWDATA_const_net_0;
wire   [7:2]  PADDR_const_net_1;
wire   [7:0]  PWDATA_const_net_1;
wire   [19:0] EPCS_0_TX_DATA_const_net_0;
wire   [19:0] EPCS_1_TX_DATA_const_net_0;
wire   [19:0] EPCS_2_TX_DATA_const_net_0;
wire   [9:0]  SGMII_TX_DATA_const_net_0;
wire   [3:0]  AXI_M_BID_const_net_0;
wire   [1:0]  AXI_M_BRESP_const_net_0;
wire   [3:0]  AXI_M_RID_const_net_0;
wire   [63:0] AXI_M_RDATA_const_net_0;
wire   [1:0]  AXI_M_RRESP_const_net_0;
wire   [3:0]  AXI_S_AWID_const_net_0;
wire   [31:0] AXI_S_AWADDR_const_net_0;
wire   [3:0]  AXI_S_AWLEN_const_net_0;
wire   [1:0]  AXI_S_AWSIZE_const_net_0;
wire   [1:0]  AXI_S_AWBURST_const_net_0;
wire   [1:0]  AXI_S_AWLOCK_const_net_0;
wire   [3:0]  AXI_S_WID_const_net_0;
wire   [7:0]  AXI_S_WSTRB_const_net_0;
wire   [63:0] AXI_S_WDATA_const_net_0;
wire   [3:0]  AXI_S_ARID_const_net_0;
wire   [31:0] AXI_S_ARADDR_const_net_0;
wire   [3:0]  AXI_S_ARLEN_const_net_0;
wire   [1:0]  AXI_S_ARSIZE_const_net_0;
wire   [1:0]  AXI_S_ARBURST_const_net_0;
wire   [1:0]  AXI_S_ARLOCK_const_net_0;
wire   [31:0] AHB_M_HRDATA_const_net_0;
wire   [31:0] AHB_S_HADDR_const_net_0;
wire   [2:0]  AHB_S_HBURST_const_net_0;
wire   [1:0]  AHB_S_HSIZE_const_net_0;
wire   [1:0]  AHB_S_HTRANS_const_net_0;
wire   [31:0] AHB_S_HWDATA_const_net_0;
wire   [4:0]  XAUI_MMD_PRTAD_const_net_0;
wire   [4:0]  XAUI_MMD_DEVID_const_net_0;
wire   [63:0] XAUI_TXD_const_net_0;
wire   [7:0]  XAUI_TXC_const_net_0;
wire   [3:0]  PCIE_INTERRUPT_const_net_0;
//--------------------------------------------------------------------
// Bus Interface Nets Declarations - Unequal Pin Widths
//--------------------------------------------------------------------
wire   [15:2] Webserver_TCP_sb_0_SDIF3_INIT_APB_PADDR;
wire   [13:2] Webserver_TCP_sb_0_SDIF3_INIT_APB_PADDR_0;
wire   [13:2] Webserver_TCP_sb_0_SDIF3_INIT_APB_PADDR_0_13to2;
//--------------------------------------------------------------------
// Constant assignments
//--------------------------------------------------------------------
assign GND_net                    = 1'b0;
assign VCC_net                    = 1'b1;
assign PADDR_const_net_0          = 6'h00;
assign PWDATA_const_net_0         = 8'h00;
assign PADDR_const_net_1          = 6'h00;
assign PWDATA_const_net_1         = 8'h00;
assign EPCS_0_TX_DATA_const_net_0 = 20'h00000;
assign EPCS_1_TX_DATA_const_net_0 = 20'h00000;
assign EPCS_2_TX_DATA_const_net_0 = 20'h00000;
assign SGMII_TX_DATA_const_net_0  = 10'h000;
assign AXI_M_BID_const_net_0      = 4'h0;
assign AXI_M_BRESP_const_net_0    = 2'h0;
assign AXI_M_RID_const_net_0      = 4'h0;
assign AXI_M_RDATA_const_net_0    = 64'h0000000000000000;
assign AXI_M_RRESP_const_net_0    = 2'h0;
assign AXI_S_AWID_const_net_0     = 4'h0;
assign AXI_S_AWADDR_const_net_0   = 32'h00000000;
assign AXI_S_AWLEN_const_net_0    = 4'h0;
assign AXI_S_AWSIZE_const_net_0   = 2'h0;
assign AXI_S_AWBURST_const_net_0  = 2'h0;
assign AXI_S_AWLOCK_const_net_0   = 2'h0;
assign AXI_S_WID_const_net_0      = 4'h0;
assign AXI_S_WSTRB_const_net_0    = 8'h00;
assign AXI_S_WDATA_const_net_0    = 64'h0000000000000000;
assign AXI_S_ARID_const_net_0     = 4'h0;
assign AXI_S_ARADDR_const_net_0   = 32'h00000000;
assign AXI_S_ARLEN_const_net_0    = 4'h0;
assign AXI_S_ARSIZE_const_net_0   = 2'h0;
assign AXI_S_ARBURST_const_net_0  = 2'h0;
assign AXI_S_ARLOCK_const_net_0   = 2'h0;
assign AHB_M_HRDATA_const_net_0   = 32'h00000000;
assign AHB_S_HADDR_const_net_0    = 32'h00000000;
assign AHB_S_HBURST_const_net_0   = 3'h0;
assign AHB_S_HSIZE_const_net_0    = 2'h0;
assign AHB_S_HTRANS_const_net_0   = 2'h0;
assign AHB_S_HWDATA_const_net_0   = 32'h00000000;
assign XAUI_MMD_PRTAD_const_net_0 = 5'h00;
assign XAUI_MMD_DEVID_const_net_0 = 5'h00;
assign XAUI_TXD_const_net_0       = 64'h0000000000000000;
assign XAUI_TXC_const_net_0       = 8'h00;
assign PCIE_INTERRUPT_const_net_0 = 4'h0;
//--------------------------------------------------------------------
// Top level output port assignments
//--------------------------------------------------------------------
assign SPI_0_DO_net_1              = SPI_0_DO_net_0;
assign SPI_0_DO                    = SPI_0_DO_net_1;
assign MMUART_0_TXD_net_1          = MMUART_0_TXD_net_0;
assign MMUART_0_TXD                = MMUART_0_TXD_net_1;
assign MDDR_DQS_TMATCH_0_OUT_net_1 = MDDR_DQS_TMATCH_0_OUT_net_0;
assign MDDR_DQS_TMATCH_0_OUT       = MDDR_DQS_TMATCH_0_OUT_net_1;
assign MDDR_CAS_N_net_1            = MDDR_CAS_N_net_0;
assign MDDR_CAS_N                  = MDDR_CAS_N_net_1;
assign MDDR_CLK_net_1              = MDDR_CLK_net_0;
assign MDDR_CLK                    = MDDR_CLK_net_1;
assign MDDR_CLK_N_net_1            = MDDR_CLK_N_net_0;
assign MDDR_CLK_N                  = MDDR_CLK_N_net_1;
assign MDDR_CKE_net_1              = MDDR_CKE_net_0;
assign MDDR_CKE                    = MDDR_CKE_net_1;
assign MDDR_CS_N_net_1             = MDDR_CS_N_net_0;
assign MDDR_CS_N                   = MDDR_CS_N_net_1;
assign MDDR_ODT_net_1              = MDDR_ODT_net_0;
assign MDDR_ODT                    = MDDR_ODT_net_1;
assign MDDR_RAS_N_net_1            = MDDR_RAS_N_net_0;
assign MDDR_RAS_N                  = MDDR_RAS_N_net_1;
assign MDDR_RESET_N_net_1          = MDDR_RESET_N_net_0;
assign MDDR_RESET_N                = MDDR_RESET_N_net_1;
assign MDDR_WE_N_net_1             = MDDR_WE_N_net_0;
assign MDDR_WE_N                   = MDDR_WE_N_net_1;
assign TXD0_P_net_1                = TXD0_P_net_0;
assign TXD0_P                      = TXD0_P_net_1;
assign TXD0_N_net_1                = TXD0_N_net_0;
assign TXD0_N                      = TXD0_N_net_1;
assign TXD1_P_net_1                = TXD1_P_net_0;
assign TXD1_P                      = TXD1_P_net_1;
assign TXD1_N_net_1                = TXD1_N_net_0;
assign TXD1_N                      = TXD1_N_net_1;
assign TXD2_P_net_1                = TXD2_P_net_0;
assign TXD2_P                      = TXD2_P_net_1;
assign TXD2_N_net_1                = TXD2_N_net_0;
assign TXD2_N                      = TXD2_N_net_1;
assign TXD3_P_net_1                = TXD3_P_net_0;
assign TXD3_P                      = TXD3_P_net_1;
assign TXD3_N_net_1                = TXD3_N_net_0;
assign TXD3_N                      = TXD3_N_net_1;
assign GPIO_0_M2F_net_1            = GPIO_0_M2F_net_0;
assign GPIO_0_M2F                  = GPIO_0_M2F_net_1;
assign GPIO_1_M2F_net_1            = GPIO_1_M2F_net_0;
assign GPIO_1_M2F                  = GPIO_1_M2F_net_1;
assign GPIO_2_M2F_net_1            = GPIO_2_M2F_net_0;
assign GPIO_2_M2F                  = GPIO_2_M2F_net_1;
assign GPIO_3_M2F_net_1            = GPIO_3_M2F_net_0;
assign GPIO_3_M2F                  = GPIO_3_M2F_net_1;
assign GPIO_4_M2F_net_1            = GPIO_4_M2F_net_0;
assign GPIO_4_M2F                  = GPIO_4_M2F_net_1;
assign GPIO_5_M2F_net_1            = GPIO_5_M2F_net_0;
assign GPIO_5_M2F                  = GPIO_5_M2F_net_1;
assign GPIO_6_M2F_net_1            = GPIO_6_M2F_net_0;
assign GPIO_6_M2F                  = GPIO_6_M2F_net_1;
assign GPIO_7_M2F_net_1            = GPIO_7_M2F_net_0;
assign GPIO_7_M2F                  = GPIO_7_M2F_net_1;
assign PHY_RST_net_1               = PHY_RST_net_0;
assign PHY_RST                     = PHY_RST_net_1;
assign PHY_MDC_net_1               = PHY_MDC_net_0;
assign PHY_MDC                     = PHY_MDC_net_1;
assign MDDR_ADDR_net_1             = MDDR_ADDR_net_0;
assign MDDR_ADDR[15:0]             = MDDR_ADDR_net_1;
assign MDDR_BA_net_1               = MDDR_BA_net_0;
assign MDDR_BA[2:0]                = MDDR_BA_net_1;
//--------------------------------------------------------------------
// Bus Interface Nets Assignments - Unequal Pin Widths
//--------------------------------------------------------------------
assign Webserver_TCP_sb_0_SDIF3_INIT_APB_PADDR_0 = { Webserver_TCP_sb_0_SDIF3_INIT_APB_PADDR_0_13to2 };
assign Webserver_TCP_sb_0_SDIF3_INIT_APB_PADDR_0_13to2 = Webserver_TCP_sb_0_SDIF3_INIT_APB_PADDR[13:2];

//--------------------------------------------------------------------
// Component instances
//--------------------------------------------------------------------
//--------AND2
AND2 AND2_0(
        // Inputs
        .A ( FCCC_0_LOCK ),
        .B ( FCCC_1_LOCK ),
        // Outputs
        .Y ( PHY_RST_net_0 ) 
        );

//--------BIBUF
BIBUF BIBUF_0(
        // Inputs
        .D   ( Webserver_TCP_sb_0_MAC_TBI_MDO ),
        .E   ( Webserver_TCP_sb_0_MAC_TBI_MDO_EN ),
        // Outputs
        .Y   ( BIBUF_0_Y ),
        // Inouts
        .PAD ( PHY_MDIO ) 
        );

//--------top_FCCC_0_FCCC   -   Actel:SgCore:FCCC:2.0.201
top_FCCC_0_FCCC FCCC_0(
        // Inputs
        .CLK0 ( SERDES_IF_0_EPCS_3_RX_CLK ),
        // Outputs
        .GL0  ( FCCC_0_GL0 ),
        .GL1  ( FCCC_0_GL1 ),
        .LOCK ( FCCC_0_LOCK ) 
        );

//--------top_FCCC_1_FCCC   -   Actel:SgCore:FCCC:2.0.201
top_FCCC_1_FCCC FCCC_1(
        // Inputs
        .CLK0 ( SERDES_IF_0_EPCS_3_TX_CLK ),
        // Outputs
        .GL0  ( FCCC_1_GL0 ),
        .LOCK ( FCCC_1_LOCK ) 
        );

//--------top_SERDES_IF_0_SERDES_IF   -   Actel:SgCore:SERDES_IF:1.2.210
top_SERDES_IF_0_SERDES_IF SERDES_IF_0(
        // Inputs
        .EPCS_3_TX_DATA       ( Webserver_TCP_sb_0_MAC_TBI_TCGF ),
        .EPCS_3_PWRDN         ( GND_net ),
        .EPCS_3_TX_VAL        ( VCC_net ),
        .EPCS_3_TX_OOB        ( GND_net ),
        .EPCS_3_RX_ERR        ( GND_net ),
        .EPCS_3_RESET_N       ( Webserver_TCP_sb_0_SDIF3_PHY_RESET_N ),
        .APB_S_PADDR          ( Webserver_TCP_sb_0_SDIF3_INIT_APB_PADDR_0 ),
        .APB_S_PENABLE        ( Webserver_TCP_sb_0_SDIF3_INIT_APB_PENABLE ),
        .APB_S_PSEL           ( Webserver_TCP_sb_0_SDIF3_INIT_APB_PSELx ),
        .APB_S_PWDATA         ( Webserver_TCP_sb_0_SDIF3_INIT_APB_PWDATA ),
        .APB_S_PWRITE         ( Webserver_TCP_sb_0_SDIF3_INIT_APB_PWRITE ),
        .APB_S_PRESET_N       ( Webserver_TCP_sb_0_INIT_APB_S_PRESET_N ),
        .APB_S_PCLK           ( Webserver_TCP_sb_0_INIT_APB_S_PCLK ),
        .REFCLK1_P            ( REFCLK1_P ),
        .REFCLK1_N            ( REFCLK1_N ),
        .RXD0_P               ( RXD0_P ),
        .RXD0_N               ( RXD0_N ),
        .RXD1_P               ( RXD1_P ),
        .RXD1_N               ( RXD1_N ),
        .RXD2_P               ( RXD2_P ),
        .RXD2_N               ( RXD2_N ),
        .RXD3_P               ( RXD3_P ),
        .RXD3_N               ( RXD3_N ),
        // Outputs
        .EPCS_3_READY         (  ),
        .EPCS_3_RX_DATA       ( SERDES_IF_0_EPCS_3_RX_DATA ),
        .EPCS_3_RX_VAL        (  ),
        .EPCS_3_RX_IDLE       (  ),
        .EPCS_3_TX_CLK_STABLE (  ),
        .EPCS_3_RX_RESET_N    (  ),
        .EPCS_3_TX_RESET_N    (  ),
        .EPCS_3_RX_CLK        ( SERDES_IF_0_EPCS_3_RX_CLK ),
        .EPCS_3_TX_CLK        ( SERDES_IF_0_EPCS_3_TX_CLK ),
        .APB_S_PRDATA         ( Webserver_TCP_sb_0_SDIF3_INIT_APB_PRDATA ),
        .APB_S_PREADY         ( Webserver_TCP_sb_0_SDIF3_INIT_APB_PREADY ),
        .APB_S_PSLVERR        ( Webserver_TCP_sb_0_SDIF3_INIT_APB_PSLVERR ),
        .REFCLK1_OUT          (  ),
        .TXD0_P               ( TXD0_P_net_0 ),
        .TXD0_N               ( TXD0_N_net_0 ),
        .TXD1_P               ( TXD1_P_net_0 ),
        .TXD1_N               ( TXD1_N_net_0 ),
        .TXD2_P               ( TXD2_P_net_0 ),
        .TXD2_N               ( TXD2_N_net_0 ),
        .TXD3_P               ( TXD3_P_net_0 ),
        .TXD3_N               ( TXD3_N_net_0 ) 
        );

//--------Webserver_TCP_sb
Webserver_TCP_sb Webserver_TCP_sb_0(
        // Inputs
        .SPI_0_DI              ( SPI_0_DI ),
        .MMUART_0_RXD          ( MMUART_0_RXD ),
        .MDDR_DQS_TMATCH_0_IN  ( MDDR_DQS_TMATCH_0_IN ),
        .FAB_RESET_N           ( VCC_net ),
        .SDIF3_PREADY          ( Webserver_TCP_sb_0_SDIF3_INIT_APB_PREADY ),
        .SDIF3_PSLVERR         ( Webserver_TCP_sb_0_SDIF3_INIT_APB_PSLVERR ),
        .DEVRST_N              ( DEVRST_N ),
        .SDIF3_SPLL_LOCK       ( VCC_net ),
        .SDIF3_PERST_N         ( VCC_net ),
        .MAC_TBI_RX_CLKP0      ( FCCC_0_GL0 ),
        .MAC_TBI_RX_CLKP1      ( FCCC_0_GL1 ),
        .MAC_TBI_GTX_CLK       ( FCCC_1_GL0 ),
        .MAC_TBI_MDI           ( BIBUF_0_Y ),
        .SDIF3_PRDATA          ( Webserver_TCP_sb_0_SDIF3_INIT_APB_PRDATA ),
        .MAC_TBI_RCGF          ( SERDES_IF_0_EPCS_3_RX_DATA ),
        // Outputs
        .SPI_0_DO              ( SPI_0_DO_net_0 ),
        .MMUART_0_TXD          ( MMUART_0_TXD_net_0 ),
        .MDDR_DQS_TMATCH_0_OUT ( MDDR_DQS_TMATCH_0_OUT_net_0 ),
        .MDDR_CAS_N            ( MDDR_CAS_N_net_0 ),
        .MDDR_CLK              ( MDDR_CLK_net_0 ),
        .MDDR_CLK_N            ( MDDR_CLK_N_net_0 ),
        .MDDR_CKE              ( MDDR_CKE_net_0 ),
        .MDDR_CS_N             ( MDDR_CS_N_net_0 ),
        .MDDR_ODT              ( MDDR_ODT_net_0 ),
        .MDDR_RAS_N            ( MDDR_RAS_N_net_0 ),
        .MDDR_RESET_N          ( MDDR_RESET_N_net_0 ),
        .MDDR_WE_N             ( MDDR_WE_N_net_0 ),
        .POWER_ON_RESET_N      (  ),
        .INIT_DONE             (  ),
        .DDR_READY             (  ),
        .SDIF_READY            (  ),
        .SDIF3_PSEL            ( Webserver_TCP_sb_0_SDIF3_INIT_APB_PSELx ),
        .SDIF3_PENABLE         ( Webserver_TCP_sb_0_SDIF3_INIT_APB_PENABLE ),
        .SDIF3_PWRITE          ( Webserver_TCP_sb_0_SDIF3_INIT_APB_PWRITE ),
        .INIT_APB_S_PCLK       ( Webserver_TCP_sb_0_INIT_APB_S_PCLK ),
        .INIT_APB_S_PRESET_N   ( Webserver_TCP_sb_0_INIT_APB_S_PRESET_N ),
        .SDIF3_PHY_RESET_N     ( Webserver_TCP_sb_0_SDIF3_PHY_RESET_N ),
        .SDIF3_CORE_RESET_N    (  ),
        .FAB_CCC_GL0           (  ),
        .FAB_CCC_GL3           (  ),
        .FAB_CCC_LOCK          (  ),
        .MSS_READY             (  ),
        .GPIO_0_M2F            ( GPIO_0_M2F_net_0 ),
        .GPIO_1_M2F            ( GPIO_1_M2F_net_0 ),
        .GPIO_2_M2F            ( GPIO_2_M2F_net_0 ),
        .GPIO_3_M2F            ( GPIO_3_M2F_net_0 ),
        .GPIO_4_M2F            ( GPIO_4_M2F_net_0 ),
        .GPIO_5_M2F            ( GPIO_5_M2F_net_0 ),
        .GPIO_6_M2F            ( GPIO_6_M2F_net_0 ),
        .GPIO_7_M2F            ( GPIO_7_M2F_net_0 ),
        .MAC_TBI_MDC           ( PHY_MDC_net_0 ),
        .MAC_TBI_MDO_EN        ( Webserver_TCP_sb_0_MAC_TBI_MDO_EN ),
        .MAC_TBI_MDO           ( Webserver_TCP_sb_0_MAC_TBI_MDO ),
        .MDDR_ADDR             ( MDDR_ADDR_net_0 ),
        .MDDR_BA               ( MDDR_BA_net_0 ),
        .SDIF3_PADDR           ( Webserver_TCP_sb_0_SDIF3_INIT_APB_PADDR ),
        .SDIF3_PWDATA          ( Webserver_TCP_sb_0_SDIF3_INIT_APB_PWDATA ),
        .MAC_TBI_TCGF          ( Webserver_TCP_sb_0_MAC_TBI_TCGF ),
        // Inouts
        .SPI_0_CLK             ( SPI_0_CLK ),
        .SPI_0_SS0             ( SPI_0_SS0 ),
        .MDDR_DM_RDQS          ( MDDR_DM_RDQS ),
        .MDDR_DQ               ( MDDR_DQ ),
        .MDDR_DQS              ( MDDR_DQS ),
        .MDDR_DQS_N            ( MDDR_DQS_N ) 
        );


endmodule
