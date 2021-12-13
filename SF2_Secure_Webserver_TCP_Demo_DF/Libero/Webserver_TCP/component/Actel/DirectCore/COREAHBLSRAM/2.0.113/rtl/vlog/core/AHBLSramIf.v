// ********************************************************************/
// Actel Corporation Proprietary and Confidential
//  Copyright 2011 Actel Corporation.  All rights reserved.
//
// ANY USE OR REDISTRIBUTION IN PART OR IN WHOLE MUST BE HANDLED IN
// ACCORDANCE WITH THE ACTEL LICENSE AGREEMENT AND MUST BE APPROVED
// IN ADVANCE IN WRITING.
//
// Description:  AHBLSramIf
//               Provides AHB interface to embedded Large SRAM.
//
//
// Revision Information:
// Date     Description
//
// SVN Revision Information:
// SVN $Revision: 4805 $
// SVN $Date: 2008-11-27 17:48:48 +0530 (Thu, 27 Nov 2008) $
//
// Resolved SARs
// SAR      Date     Who   Description
//
// Notes:
//
// ********************************************************************/

`timescale 1ns/100ps

module AHBLSramIf (
                   HCLK,
                   HRESETN,
                   HSEL,
                   HTRANS,
                   HBURST,
                   HWRITE,
                   HSIZE,
                   HADDR,
                   HWDATA,
                   HREADYIN,
                   // SRAM Control signals
                   sramahb_ack,
                   sramahb_rdata,
                   // Outputs
                   HRESP,
                   HREADYOUT,
                   HRDATA,
                   // SRAM Control signals
                   ahbsram_req,
                   ahbsram_write,
                   ahbsram_wdata,
                   ahbsram_size,
                   ahbsram_addr,
                   BUSY
                         
                   );

   

////////////////////////////////////////////////////////////////////////////////
// Parameter Declarations
////////////////////////////////////////////////////////////////////////////////

   // State Machine parameters
   localparam IDLE = 2'b00;
   localparam AHB_WR = 2'b01;
   localparam AHB_RD = 2'b10;

   parameter AHB_DWIDTH = 32;
   parameter AHB_AWIDTH = 32;
   
   parameter RESP_OKAY = 2'b00;
   parameter RESP_ERROR = 2'b01;

   // AHB HTRANS definition
   parameter TRN_IDLE = 2'b00;
   parameter TRN_BUSY = 2'b01;
   parameter TRN_SEQ  = 2'b11;
   parameter TRN_NONSEQ = 2'b10;
   
   
////////////////////////////////////////////////////////////////////////////////
// I/O Declarations
////////////////////////////////////////////////////////////////////////////////
// Inputs
   input HCLK;
   input HRESETN;
   input HSEL;
   input HREADYIN;
   input [1:0] HTRANS;
   input [2:0] HBURST;
   input [2:0] HSIZE;
   input [19:0] HADDR;
   input [AHB_DWIDTH - 1:0] HWDATA;
   input                    HWRITE;
   input                    sramahb_ack;
   input [AHB_DWIDTH - 1:0] sramahb_rdata;
   input                    BUSY;
   
// Outputs
   output                    HREADYOUT;
   output [1:0]              HRESP;
   output [AHB_DWIDTH - 1:0] HRDATA;
   
   output                    ahbsram_req;
   output                    ahbsram_write;
   output [AHB_AWIDTH - 1:0] ahbsram_wdata;
   
   output [2:0]              ahbsram_size;
   output [19:0]             ahbsram_addr;
   
////////////////////////////////////////////////////////////////////////////////
// Register Declarations
////////////////////////////////////////////////////////////////////////////////
   reg [1:0] HTRANS_d;
   reg [2:0] HBURST_d;
   reg [2:0] HSIZE_d;
   reg [19:0] HADDR_d;
   reg [AHB_DWIDTH - 1:0] HWDATA_d;
   reg                    HWRITE_d;
   reg                    HSEL_d;
   reg                    HREADYIN_d;
   reg [1:0]              ahbcurr_state;
   reg [1:0]              ahbnext_state;

   reg                    latchahbcmd;
   reg                    ahbsram_req_int;
   reg                    ahbsram_req_d1;   
   reg [AHB_DWIDTH - 1:0] HWDATA_cal;
   reg [AHB_DWIDTH - 1:0] HRDATA;
////////////////////////////////////////////////////////////////////////////////
// Wire Declarations
////////////////////////////////////////////////////////////////////////////////
   wire                   HREADYOUT;
   wire                   ahbsram_req;
   wire                   validahbcmd;
   wire [1:0]             HRESP;
   wire                   ahbsram_write;
   wire [2:0]             ahbsram_size;
   wire [19:0]            ahbsram_addr;


   
////////////////////////////////////////////////////////////////////////////////
// Main body of code
////////////////////////////////////////////////////////////////////////////////


// Generation of valid AHB Command which triggers the AHB Slave State Machine
   assign validahbcmd = HREADYIN & HSEL & (HTRANS == TRN_NONSEQ);


// Generation of HRESP
   assign HRESP = RESP_OKAY;

   always @(*) begin
      HWDATA_cal = HWDATA;
   end
   
   
// Latch all the AHB signals
   always @(posedge HCLK or negedge HRESETN) begin
      if(HRESETN == 1'b0) begin
         HADDR_d    <= {20{1'b0}};
         HWDATA_d   <= {32{1'b0}};
         HTRANS_d   <= 2'b00;
         HSIZE_d    <= 2'b00;
         HBURST_d   <= 3'b000;
         HWRITE_d   <= 1'b0;
         HSEL_d     <= 1'b0;
         HREADYIN_d <= 1'b0;
      end
      else if(latchahbcmd == 1'b1) begin
         HADDR_d    <= HADDR;
         HTRANS_d   <= HTRANS;
         HSIZE_d    <= HSIZE;
         HBURST_d   <= HBURST;
         HWRITE_d   <= HWRITE;
         HWDATA_d   <= HWDATA_cal;         
         HSEL_d     <= HSEL;
         HREADYIN_d <= HREADYIN;
      end
    end
   
// Current State generation
   always @(posedge HCLK or negedge HRESETN) begin
      if(HRESETN == 1'b0) begin
         ahbcurr_state <= IDLE;
      end
      else begin
         ahbcurr_state <= ahbnext_state;
      end
   end
   
// Next State and output decoder logic
   always @(*) begin
      latchahbcmd = 1'b0;
      ahbsram_req_int = 1'b0;
      ahbnext_state = ahbcurr_state;
      
      case (ahbcurr_state)
        IDLE : begin
           if(validahbcmd == 1'b1) begin
              latchahbcmd = 1'b1;
              if(HWRITE == 1'b1) begin
                 ahbnext_state = AHB_WR;           
              end
              else begin
                 ahbnext_state = AHB_RD;           
              end
           end
        end

        AHB_WR : begin
           latchahbcmd = 1'b0;
           ahbsram_req_int = 1'b1;
           
           if(sramahb_ack == 1'b1) begin
              ahbnext_state = IDLE;
           end           

        end
        
        AHB_RD : begin
           latchahbcmd = 1'b0;
           ahbsram_req_int = 1'b1;
           if(sramahb_ack == 1'b1) begin
              ahbnext_state = IDLE;
           end

        end

        default : begin
           ahbnext_state = IDLE;
        end
      endcase // case (ahbcurr_state)
      
   end

//Generation of HREADYOUT
   assign HREADYOUT = !ahbsram_req_int;

// Changes to be done when BUSY signal from RAM is used to block UII transactions indicating that SII needs to access the RAMs   
//   assign HREADYOUT = !ahbsram_req_int & !BUSY;
   
// Generation of signals required for SRAM
   assign ahbsram_write = (ahbsram_req & !sramahb_ack) ? HWRITE_d : 1'b0;   
   assign ahbsram_wdata = HWDATA;      // Added by AP - 2/08/12
   assign ahbsram_addr = (ahbsram_req_int & !sramahb_ack) ? HADDR_d : HADDR_d;     // Added by AP - 3/08/12
   assign ahbsram_size = (ahbsram_req_int & !sramahb_ack) ? HSIZE_d : HSIZE;  // Added by AP - 23/11/11

   always @(posedge HCLK or negedge HRESETN) begin
      if(HRESETN == 1'b0) begin
         ahbsram_req_d1 <= 1'b0;
      end
      else begin
         ahbsram_req_d1 <= ahbsram_req_int;
      end
   end

// Generate the request to the SRAM contol logic when there is AHB read or write request
   assign ahbsram_req = ahbsram_req_int & !ahbsram_req_d1 & (HBURST_d == 3'b000);

// HRDATA generation   
   always @(*) begin
      if(HREADYOUT && HREADYIN) begin
         HRDATA = sramahb_rdata;
      end  // if (HREADYOUT && HREADYIN)
      else begin
         HRDATA = sramahb_rdata;
      end
   end
   
   
endmodule // AHBLSramIf


