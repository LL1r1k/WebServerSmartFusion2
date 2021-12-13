// ********************************************************************/
// Actel Corporation Proprietary and Confidential
//  Copyright 2011 Actel Corporation.  All rights reserved.
//
// ANY USE OR REDISTRIBUTION IN PART OR IN WHOLE MUST BE HANDLED IN
// ACCORDANCE WITH THE ACTEL LICENSE AGREEMENT AND MUST BE APPROVED
// IN ADVANCE IN WRITING.
//
// Description:  SRAM block, 1 byte wide, 2048 to 141312 deep 
//              (in steps of 2048), used to construct the memory.
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

module Webserver_TCP_sb_COREAHBLSRAM_0_0_lsram_2048to139264x8
(
    writeData,
    readData,
    wen,
    ren,
    writeAddr,
    readAddr,
    clk,
    resetn,
    l_BUSY_all
);

// ---------------------------------------------------------------------
// Parameters
// ---------------------------------------------------------------------
// DEPTH can range from 2048 to 141312, in steps of 2048
   parameter DEPTH = 2048;
   localparam AHB_DWIDTH = 8;


// ---------------------------------------------------------------------
// Port declarations
// ---------------------------------------------------------------------

   // AhbFabric interface
   // Inputs
   input [AHB_DWIDTH - 1:0] writeData;

   // AhbSramIf interface
   // Inputs
   input                  wen;
   input                  ren;
   input [15:0]           writeAddr;
   input [15:0]           readAddr;
   input                  clk;
   input                  resetn;

   // Output
   output [AHB_DWIDTH - 1:0] readData;   
   output                    l_BUSY_all;

// ---------------------------------------------------------------------
// Constant declarations
// ---------------------------------------------------------------------

// ---------------------------------------------------------------------
// Signal declarations
// ---------------------------------------------------------------------
   reg [AHB_DWIDTH-1:0]    readData;
   reg [15:9]              ckRdAddr;

   reg     [2:0]                   width0;
   reg     [2:0]                   width1;
   reg     [2:0]                   width2;
   reg     [2:0]                   width3;
   reg     [2:0]                   width4;
   reg     [2:0]                   width5;
   reg     [2:0]                   width6;
   reg     [2:0]                   width7;
   reg     [2:0]                   width8;
   reg     [2:0]                   width9;
   reg     [2:0]                   width10;
   reg     [2:0]                   width11;
   reg     [2:0]                   width12;
   reg     [2:0]                   width13;
   reg     [2:0]                   width14;
   reg     [2:0]                   width15;
   reg     [2:0]                   width16;

   reg     [1:0]                   wen_a0;
   reg     [1:0]                   wen_a1;
   reg     [1:0]                   wen_a2;
   reg     [1:0]                   wen_a3;
   reg     [1:0]                   wen_a4;
   reg     [1:0]                   wen_a5;
   reg     [1:0]                   wen_a6;
   reg     [1:0]                   wen_a7;
   reg     [1:0]                   wen_a8;
   reg     [1:0]                   wen_a9;
   reg     [1:0]                   wen_a10;
   reg     [1:0]                   wen_a11;
   reg     [1:0]                   wen_a12;
   reg     [1:0]                   wen_a13;
   reg     [1:0]                   wen_a14;
   reg     [1:0]                   wen_a15;
   reg     [1:0]                   wen_a16;

   reg     [1:0]                   wen_b0;
   reg     [1:0]                   wen_b1;
   reg     [1:0]                   wen_b2;
   reg     [1:0]                   wen_b3;
   reg     [1:0]                   wen_b4;
   reg     [1:0]                   wen_b5;
   reg     [1:0]                   wen_b6;
   reg     [1:0]                   wen_b7;
   reg     [1:0]                   wen_b8;
   reg     [1:0]                   wen_b9;
   reg     [1:0]                   wen_b10;
   reg     [1:0]                   wen_b11;
   reg     [1:0]                   wen_b12;
   reg     [1:0]                   wen_b13;
   reg     [1:0]                   wen_b14;
   reg     [1:0]                   wen_b15;
   reg     [1:0]                   wen_b16;

   reg     [17:0]                   writeData0;
   reg     [17:0]                   writeData1;
   reg     [17:0]                   writeData2;
   reg     [17:0]                   writeData3;
   reg     [17:0]                   writeData4;
   reg     [17:0]                   writeData5;
   reg     [17:0]                   writeData6;
   reg     [17:0]                   writeData7;
   reg     [17:0]                   writeData8;
   reg     [17:0]                   writeData9;
   reg     [17:0]                   writeData10;
   reg     [17:0]                   writeData11;
   reg     [17:0]                   writeData12;
   reg     [17:0]                   writeData13;
   reg     [17:0]                   writeData14;
   reg     [17:0]                   writeData15;
   reg     [17:0]                   writeData16;

   wire    [17:0]                   readData0;
   wire    [17:0]                   readData1;
   wire    [17:0]                   readData2;
   wire    [17:0]                   readData3;
   wire    [17:0]                   readData4;
   wire    [17:0]                   readData5;
   wire    [17:0]                   readData6;
   wire    [17:0]                   readData7;
   wire    [17:0]                   readData8;
   wire    [17:0]                   readData9;
   wire    [17:0]                   readData10;
   wire    [17:0]                   readData11;
   wire    [17:0]                   readData12;
   wire    [17:0]                   readData13;
   wire    [17:0]                   readData14;
   wire    [17:0]                   readData15;
   wire    [17:0]                   readData16;

   reg     [13:0]                  writeAddr0;
   reg     [13:0]                  writeAddr1;
   reg     [13:0]                  writeAddr2;
   reg     [13:0]                  writeAddr3;
   reg     [13:0]                  writeAddr4;
   reg     [13:0]                  writeAddr5;
   reg     [13:0]                  writeAddr6;
   reg     [13:0]                  writeAddr7;
   reg     [13:0]                  writeAddr8;
   reg     [13:0]                  writeAddr9;
   reg     [13:0]                  writeAddr10;
   reg     [13:0]                  writeAddr11;
   reg     [13:0]                  writeAddr12;
   reg     [13:0]                  writeAddr13;
   reg     [13:0]                  writeAddr14;
   reg     [13:0]                  writeAddr15;
   reg     [13:0]                  writeAddr16;

   reg     [13:0]                  readAddr0;
   reg     [13:0]                  readAddr1;
   reg     [13:0]                  readAddr2;
   reg     [13:0]                  readAddr3;
   reg     [13:0]                  readAddr4;
   reg     [13:0]                  readAddr5;
   reg     [13:0]                  readAddr6;
   reg     [13:0]                  readAddr7;
   reg     [13:0]                  readAddr8;
   reg     [13:0]                  readAddr9;
   reg     [13:0]                  readAddr10;
   reg     [13:0]                  readAddr11;
   reg     [13:0]                  readAddr12;
   reg     [13:0]                  readAddr13;
   reg     [13:0]                  readAddr14;
   reg     [13:0]                  readAddr15;
   reg     [13:0]                  readAddr16;

   wire                                 l_BUSY_all;
   wire                                 lsram_2k_BUSY_16;
   wire                                 lsram_2k_BUSY_15;
   wire                                 lsram_2k_BUSY_14;
   wire                                 lsram_2k_BUSY_13;
   wire                                 lsram_2k_BUSY_12;
   wire                                 lsram_2k_BUSY_11;
   wire                                 lsram_2k_BUSY_10;
   wire                                 lsram_2k_BUSY_9;
   wire                                 lsram_2k_BUSY_8;
   wire                                 lsram_2k_BUSY_7;
   wire                                 lsram_2k_BUSY_6;
   wire                                 lsram_2k_BUSY_5;
   wire                                 lsram_2k_BUSY_4;
   wire                                 lsram_2k_BUSY_3;
   wire                                 lsram_2k_BUSY_2;
   wire                                 lsram_2k_BUSY_1;
   wire                                 lsram_2k_BUSY_0;

//----------------------------------------------------------------------
// Main body of code
//----------------------------------------------------------------------

    always @ (posedge clk or negedge resetn)
    begin
        if (!resetn)
            ckRdAddr[15:9] <= 7'b0000000;
        else
            ckRdAddr[15:9] <= readAddr[15:9];
    end

    //----------------------------------------------------------------------------------------
    // Assign values to various signals based on DEPTH and RAM4K9_WIDTH settings.
    // Default is to build the (byte wide) memory from RAM blocks which are configured to
    // be tall and narrow.
    //----------------------------------------------------------------------------------------
    always @(*)
    begin
        width0  = 2'b0;
        width1  = 2'b0;
        width2  = 2'b0;
        width3  = 2'b0;
        width4  = 2'b0;
        width5  = 2'b0;
        width6  = 2'b0;
        width7  = 2'b0;
        width8  = 2'b0;
        width9  = 2'b0;
        width10 = 2'b0;
        width11 = 2'b0;
        width12 = 2'b0;
        width13 = 2'b0;
        width14 = 2'b0;
        width15 = 2'b0;
        width16 = 2'b0;

        wen_a0  = 2'b0;
        wen_a1  = 2'b0;
        wen_a2  = 2'b0;
        wen_a3  = 2'b0;
        wen_a4  = 2'b0;
        wen_a5  = 2'b0;
        wen_a6  = 2'b0;
        wen_a7  = 2'b0;
        wen_a8  = 2'b0;
        wen_a9  = 2'b0;
        wen_a10 = 2'b0;
        wen_a11 = 2'b0;
        wen_a12 = 2'b0;
        wen_a13 = 2'b0;
        wen_a14 = 2'b0;
        wen_a15 = 2'b0;
        wen_a16 = 2'b0;

        wen_b0  = 2'b0;
        wen_b1  = 2'b0;
        wen_b2  = 2'b0;
        wen_b3  = 2'b0;
        wen_b4  = 2'b0;
        wen_b5  = 2'b0;
        wen_b6  = 2'b0;
        wen_b7  = 2'b0;
        wen_b8  = 2'b0;
        wen_b9  = 2'b0;
        wen_b10 = 2'b0;
        wen_b11 = 2'b0;
        wen_b12 = 2'b0;
        wen_b13 = 2'b0;
        wen_b14 = 2'b0;
        wen_b15 = 2'b0;
        wen_b16 = 2'b0;

        writeData0  = 36'b0;
        writeData1  = 18'b0;
        writeData2  = 18'b0;
        writeData3  = 18'b0;
        writeData4  = 18'b0;
        writeData5  = 18'b0;
        writeData6  = 18'b0;
        writeData7  = 18'b0;
        writeData8  = 18'b0;
        writeData9  = 18'b0;
        writeData10 = 18'b0;
        writeData11 = 18'b0;
        writeData12 = 18'b0;
        writeData13 = 18'b0;
        writeData14 = 18'b0;
        writeData15 = 18'b0;
        writeData16 = 18'b0;

        writeAddr0  = 14'b0;
        writeAddr1  = 14'b0;
        writeAddr2  = 14'b0;
        writeAddr3  = 14'b0;
        writeAddr4  = 14'b0;
        writeAddr5  = 14'b0;
        writeAddr6  = 14'b0;
        writeAddr7  = 14'b0;
        writeAddr8  = 14'b0;
        writeAddr9  = 14'b0;
        writeAddr10 = 14'b0;
        writeAddr11 = 14'b0;
        writeAddr12 = 14'b0;
        writeAddr13 = 14'b0;
        writeAddr14 = 14'b0;
        writeAddr15 = 14'b0;
        writeAddr16 = 14'b0;

        readAddr0  = 14'b0;
        readAddr1  = 14'b0;
        readAddr2  = 14'b0;
        readAddr3  = 14'b0;
        readAddr4  = 14'b0;
        readAddr5  = 14'b0;
        readAddr6  = 14'b0;
        readAddr7  = 14'b0;
        readAddr8  = 14'b0;
        readAddr9  = 14'b0;
        readAddr10 = 14'b0;
        readAddr11 = 14'b0;
        readAddr12 = 14'b0;
        readAddr13 = 14'b0;
        readAddr14 = 14'b0;
        readAddr15 = 14'b0;
        readAddr16 = 14'b0;

       readData = {AHB_DWIDTH{1'b0}};
       
        case (DEPTH)


            // RAM2K-8K
            512, 1024, 1536, 2048: begin
                width1  = 3'b011;

                writeAddr1  = {writeAddr[10:0], 3'b0};

                readAddr1   = {readAddr[10:0],  3'b0};

                writeData1  = {10'b0, writeData[7:0]};

                wen_a1      = {1'b0, wen};

                readData    = {
                                readData1[7:0]
                               };
            end


            // RAM16K
            2560,3072,3584,4096: begin
                width1  = 3'b011;
                width0  = 3'b011;

                writeAddr1  = {writeAddr[10:0], 3'b0};
                writeAddr0  = {writeAddr[10:0], 3'b0};

                readAddr1   = {readAddr[10:0],  3'b0};
                readAddr0   = {readAddr[10:0],  3'b0};

                writeData1  = {10'b0, writeData[7:0]};
                writeData0  = {10'b0, writeData[7:0]};


               case(writeAddr[13:10])
                 4'b0000,4'b0001  : begin 
                    wen_a1  = {1'b0, 1'b0};
                    wen_a0  = {1'b0, wen};
                 end
                 4'b0010,4'b0011 : begin
                    wen_a1  = {1'b0, wen};
                    wen_a0  = {1'b0, 1'b0};
                 end
                 default : begin
                    wen_a1  = {1'b0, 1'b0};
                    wen_a0  = {1'b0, 1'b0};
                 end
               endcase // case (writeAddr[13:12])
               
               case(ckRdAddr[13:10])
                 4'b0000,4'b0001  : begin 
                    readData = readData0[7:0];
                 end
                 4'b0010,4'b0011 : begin
                    readData = readData1[7:0];                   
                 end
                 default : begin
                    readData =  8'b0;
                 end
               endcase // case (ckRdAddr[13:12])               

            end


            // RAM24K
            4608, 5120, 5632, 6144: begin
                width2  = 3'b011;
                width1  = 3'b011;
                width0  = 3'b011;

                writeAddr2  = {writeAddr[10:0], 3'b0};
                writeAddr1  = {writeAddr[10:0], 3'b0};
                writeAddr0  = {writeAddr[10:0], 3'b0};

                readAddr2   = {readAddr[10:0],  3'b0};
                readAddr1   = {readAddr[10:0],  3'b0};
                readAddr0   = {readAddr[10:0],  3'b0};

                writeData2  = {10'b0, writeData[7:0]};
                writeData1  = {10'b0, writeData[7:0]};
                writeData0  = {10'b0, writeData[7:0]};


               case(writeAddr[13:10])
                 4'b0000,4'b0001  : begin 
                    wen_a2  = {1'b0, 1'b0};
                    wen_a1  = {1'b0, 1'b0};
                    wen_a0  = {1'b0, wen};
                 end
                 4'b0010,4'b0011  : begin 
                    wen_a2  = {1'b0, 1'b0};
                    wen_a1  = {1'b0, wen};
                    wen_a0  = {1'b0, 1'b0};
                 end
                 4'b0100,4'b0101  : begin 
                    wen_a2  = {1'b0, wen};
                    wen_a1  = {1'b0, 1'b0};
                    wen_a0  = {1'b0, 1'b0};
                 end
                 default : begin
                    wen_a2  = {1'b0, 1'b0};
                    wen_a1  = {1'b0, 1'b0};
                    wen_a0  = {1'b0, 1'b0};
                 end
               endcase // case (writeAddr[13:12])
               
               case(ckRdAddr[13:10])
                 4'b0000,4'b0001  : begin 
                    readData = readData0[7:0];
                 end
                 4'b0010,4'b0011  : begin 
                    readData = readData1[7:0];
                 end
                 4'b0100,4'b0101  : begin 
                    readData = readData2[7:0];
                 end
                 default : begin
                    readData =  8'b0;
                 end
               endcase // case (writeAddr[13:12])

            end

            // RAM7K
            6656, 7168, 7680, 8192: begin
                width3  = 3'b011;
                width2  = 3'b011;
                width1  = 3'b011;
                width0  = 3'b011;

                writeAddr3  = {writeAddr[10:0], 3'b0};
                writeAddr2  = {writeAddr[10:0], 3'b0};
                writeAddr1  = {writeAddr[10:0], 3'b0};
                writeAddr0  = {writeAddr[10:0], 3'b0};

                readAddr3   = {readAddr[10:0],  3'b0};
                readAddr2   = {readAddr[10:0],  3'b0};
                readAddr1   = {readAddr[10:0],  3'b0};
                readAddr0   = {readAddr[10:0],  3'b0};

                writeData3  = {10'b0, writeData[7:0]};
                writeData2  = {10'b0, writeData[7:0]};
                writeData1  = {10'b0, writeData[7:0]};
                writeData0  = {10'b0, writeData[7:0]};


               case(writeAddr[13:10])
                 4'b0110,4'b0111  : begin 
                    wen_a3  = {1'b0, wen};
                    wen_a2  = {1'b0, 1'b0};
                    wen_a1  = {1'b0, 1'b0};
                    wen_a0  = {1'b0, 1'b0};
                 end
                 4'b0100,4'b0101  : begin 
                    wen_a3  = {1'b0, 1'b0};
                    wen_a2  = {1'b0, wen};
                    wen_a1  = {1'b0, 1'b0};
                    wen_a0  = {1'b0, 1'b0};
                 end
                 4'b0010,4'b0011  : begin 
                    wen_a3  = {1'b0, 1'b0};
                    wen_a2  = {1'b0, 1'b0};
                    wen_a1  = {1'b0, wen};
                    wen_a0  = {1'b0, 1'b0};
                 end
                 4'b0000,4'b0001  : begin 
                    wen_a3  = {1'b0, 1'b0};
                    wen_a2  = {1'b0, 1'b0};
                    wen_a1  = {1'b0, 1'b0};
                    wen_a0  = {1'b0, wen};
                 end
                 default : begin
                    wen_a3  = {1'b0, 1'b0};
                    wen_a2  = {1'b0, 1'b0};
                    wen_a1  = {1'b0, 1'b0};
                    wen_a0  = {1'b0, 1'b0};
                 end
               endcase // case (writeAddr[13:12])
               
               case(writeAddr[13:10])
                 4'b0110,4'b0111  : begin 
                    readData = readData3[7:0];
                 end
                 4'b0100,4'b0101  : begin 
                    readData = readData2[7:0];
                 end
                 4'b0010,4'b0011  : begin 
                    readData = readData1[7:0];
                 end
                 4'b0000,4'b0001  : begin 
                    readData = readData0[7:0];
                 end
                 default : begin
                    readData =  8'b0;
                 end
               endcase // case (writeAddr[13:12])
            end

            // RAM10K
            8704, 9216, 9728, 10240: begin

                width4  = 3'b011;
                width3  = 3'b011;
                width2  = 3'b011;
                width1  = 3'b011;
                width0  = 3'b011;

                writeAddr4  = {writeAddr[10:0], 3'b0};
                writeAddr3  = {writeAddr[10:0], 3'b0};
                writeAddr2  = {writeAddr[10:0], 3'b0};
                writeAddr1  = {writeAddr[10:0], 3'b0};
                writeAddr0  = {writeAddr[10:0], 3'b0};

                readAddr4   = {readAddr[10:0],  3'b0};
                readAddr3   = {readAddr[10:0],  3'b0};
                readAddr2   = {readAddr[10:0],  3'b0};
                readAddr1   = {readAddr[10:0],  3'b0};
                readAddr0   = {readAddr[10:0],  3'b0};

                writeData4  = {10'b0, writeData[7:0]};
                writeData3  = {10'b0, writeData[7:0]};
                writeData2  = {10'b0, writeData[7:0]};
                writeData1  = {10'b0, writeData[7:0]};
                writeData0  = {10'b0, writeData[7:0]};


               case(writeAddr[13:10])
                 4'b1000,4'b1001  : begin 
                    wen_a4  = {1'b0, wen};
                    wen_a3  = {1'b0, 1'b0};
                    wen_a2  = {1'b0, 1'b0};
                    wen_a1  = {1'b0, 1'b0};
                    wen_a0  = {1'b0, 1'b0};
                 end
                 4'b0110,4'b0111  : begin 
                    wen_a4  = {1'b0, 1'b0};
                    wen_a3  = {1'b0, wen};
                    wen_a2  = {1'b0, 1'b0};
                    wen_a1  = {1'b0, 1'b0};
                    wen_a0  = {1'b0, 1'b0};
                 end
                 4'b0100,4'b0101  : begin 
                    wen_a4  = {1'b0, 1'b0};
                    wen_a3  = {1'b0, 1'b0};
                    wen_a2  = {1'b0, wen};
                    wen_a1  = {1'b0, 1'b0};
                    wen_a0  = {1'b0, 1'b0};
                 end
                 4'b0010,4'b0011  : begin 
                    wen_a4  = {1'b0, 1'b0};
                    wen_a3  = {1'b0, 1'b0};
                    wen_a2  = {1'b0, 1'b0};
                    wen_a1  = {1'b0, wen};
                    wen_a0  = {1'b0, 1'b0};
                 end
                 4'b0000,4'b0001  : begin 
                    wen_a4  = {1'b0, 1'b0};
                    wen_a3  = {1'b0, 1'b0};
                    wen_a2  = {1'b0, 1'b0};
                    wen_a1  = {1'b0, 1'b0};
                    wen_a0  = {1'b0, wen};
                 end
                 default : begin
                    wen_a4  = {1'b0, 1'b0};
                    wen_a3  = {1'b0, 1'b0};
                    wen_a2  = {1'b0, 1'b0};
                    wen_a1  = {1'b0, 1'b0};
                    wen_a0  = {1'b0, 1'b0};
                 end
               endcase // case (writeAddr[13:10])
               
               case(ckRdAddr[13:10])
                 4'b1000,4'b1001  : begin 
                    readData = readData4[7:0];
                 end
                 4'b0110,4'b0111  : begin 
                    readData = readData3[7:0];
                 end
                 4'b0100,4'b0101  : begin 
                    readData = readData2[7:0];
                 end
                 4'b0010,4'b0011  : begin 
                    readData = readData1[7:0];
                 end
                 4'b0000,4'b0001  : begin 
                    readData = readData0[7:0];
                 end
                 default : begin
                    readData =  8'b0;
                 end
               endcase // case (writeAddr[13:10])

            end


            // RAM12K
            10752, 11264, 11776, 12288: begin

                width5  = 3'b011;
                width4  = 3'b011;
                width3  = 3'b011;
                width2  = 3'b011;
                width1  = 3'b011;
                width0  = 3'b011;

                writeAddr5  = {writeAddr[10:0], 3'b0};
                writeAddr4  = {writeAddr[10:0], 3'b0};
                writeAddr3  = {writeAddr[10:0], 3'b0};
                writeAddr2  = {writeAddr[10:0], 3'b0};
                writeAddr1  = {writeAddr[10:0], 3'b0};
                writeAddr0  = {writeAddr[10:0], 3'b0};

                readAddr5   = {readAddr[10:0],  3'b0};
                readAddr4   = {readAddr[10:0],  3'b0};
                readAddr3   = {readAddr[10:0],  3'b0};
                readAddr2   = {readAddr[10:0],  3'b0};
                readAddr1   = {readAddr[10:0],  3'b0};
                readAddr0   = {readAddr[10:0],  3'b0};

                writeData5  = {10'b0, writeData[7:0]};
                writeData4  = {10'b0, writeData[7:0]};
                writeData3  = {10'b0, writeData[7:0]};
                writeData2  = {10'b0, writeData[7:0]};
                writeData1  = {10'b0, writeData[7:0]};
                writeData0  = {10'b0, writeData[7:0]};


               case(writeAddr[13:10])
                 4'b1010,4'b1011  : begin 
                    wen_a5  = {1'b0, wen};
                    wen_a4  = {1'b0, 1'b0};
                    wen_a3  = {1'b0, 1'b0};
                    wen_a2  = {1'b0, 1'b0};
                    wen_a1  = {1'b0, 1'b0};
                    wen_a0  = {1'b0, 1'b0};
                 end
                 4'b1000,4'b1001  : begin 
                    wen_a5  = {1'b0, 1'b0};
                    wen_a4  = {1'b0, wen};
                    wen_a3  = {1'b0, 1'b0};
                    wen_a2  = {1'b0, 1'b0};
                    wen_a1  = {1'b0, 1'b0};
                    wen_a0  = {1'b0, 1'b0};
                 end
                 4'b0110,4'b0111  : begin 
                    wen_a5  = {1'b0, 1'b0};
                    wen_a4  = {1'b0, 1'b0};
                    wen_a3  = {1'b0, wen};
                    wen_a2  = {1'b0, 1'b0};
                    wen_a1  = {1'b0, 1'b0};
                    wen_a0  = {1'b0, 1'b0};
                 end
                 4'b0100,4'b0101  : begin 
                    wen_a5  = {1'b0, 1'b0};
                    wen_a4  = {1'b0, 1'b0};
                    wen_a3  = {1'b0, 1'b0};
                    wen_a2  = {1'b0, wen};
                    wen_a1  = {1'b0, 1'b0};
                    wen_a0  = {1'b0, 1'b0};
                 end
                 4'b0010,4'b0011  : begin 
                    wen_a5  = {1'b0, 1'b0};
                    wen_a4  = {1'b0, 1'b0};
                    wen_a3  = {1'b0, 1'b0};
                    wen_a2  = {1'b0, 1'b0};
                    wen_a1  = {1'b0, wen};
                    wen_a0  = {1'b0, 1'b0};
                 end
                 4'b0000,4'b0001  : begin 
                    wen_a5  = {1'b0, 1'b0};
                    wen_a4  = {1'b0, 1'b0};
                    wen_a3  = {1'b0, 1'b0};
                    wen_a2  = {1'b0, 1'b0};
                    wen_a1  = {1'b0, 1'b0};
                    wen_a0  = {1'b0, wen};
                 end
                 default : begin
                    wen_a5  = {1'b0, 1'b0};
                    wen_a4  = {1'b0, 1'b0};
                    wen_a3  = {1'b0, 1'b0};
                    wen_a2  = {1'b0, 1'b0};
                    wen_a1  = {1'b0, 1'b0};
                    wen_a0  = {1'b0, 1'b0};
                 end
               endcase // case (writeAddr[13:10])
               
               case(ckRdAddr[13:10])
                 4'b1010,4'b1011  : begin 
                    readData = readData5[7:0];
                 end
                 4'b1000,4'b1001  : begin 
                    readData = readData4[7:0];
                 end
                 4'b0110,4'b0111  : begin 
                    readData = readData3[7:0];
                 end
                 4'b0100,4'b0101  : begin 
                    readData = readData2[7:0];
                 end
                 4'b0010,4'b0011  : begin 
                    readData = readData1[7:0];
                 end
                 4'b0000,4'b0001  : begin 
                    readData = readData0[7:0];
                 end
                 default : begin
                    readData =  8'b0;
                 end
               endcase // case (writeAddr[13:10])

            end


            // RAM56K
            12800, 13312, 13824, 14336: begin

                width6  = 3'b011;
                width5  = 3'b011;
                width4  = 3'b011;
                width3  = 3'b011;
                width2  = 3'b011;
                width1  = 3'b011;
                width0  = 3'b011;

                writeAddr6  = {writeAddr[10:0], 3'b0};
                writeAddr5  = {writeAddr[10:0], 3'b0};
                writeAddr4  = {writeAddr[10:0], 3'b0};
                writeAddr3  = {writeAddr[10:0], 3'b0};
                writeAddr2  = {writeAddr[10:0], 3'b0};
                writeAddr1  = {writeAddr[10:0], 3'b0};
                writeAddr0  = {writeAddr[10:0], 3'b0};

                readAddr6   = {readAddr[10:0],  3'b0};
                readAddr5   = {readAddr[10:0],  3'b0};
                readAddr4   = {readAddr[10:0],  3'b0};
                readAddr3   = {readAddr[10:0],  3'b0};
                readAddr2   = {readAddr[10:0],  3'b0};
                readAddr1   = {readAddr[10:0],  3'b0};
                readAddr0   = {readAddr[10:0],  3'b0};

                writeData6  = {10'b0, writeData[7:0]};
                writeData5  = {10'b0, writeData[7:0]};
                writeData4  = {10'b0, writeData[7:0]};
                writeData3  = {10'b0, writeData[7:0]};
                writeData2  = {10'b0, writeData[7:0]};
                writeData1  = {10'b0, writeData[7:0]};
                writeData0  = {10'b0, writeData[7:0]};


               case(writeAddr[13:10])
                 4'b1100,4'b1101  : begin 
                    wen_a6  = {1'b0, wen};
                    wen_a5  = {1'b0, 1'b0};
                    wen_a4  = {1'b0, 1'b0};
                    wen_a3  = {1'b0, 1'b0};
                    wen_a2  = {1'b0, 1'b0};
                    wen_a1  = {1'b0, 1'b0};
                    wen_a0  = {1'b0, 1'b0};
                 end
                 4'b1010,4'b1011  : begin 
                    wen_a6  = {1'b0, 1'b0};
                    wen_a5  = {1'b0, wen};
                    wen_a4  = {1'b0, 1'b0};
                    wen_a3  = {1'b0, 1'b0};
                    wen_a2  = {1'b0, 1'b0};
                    wen_a1  = {1'b0, 1'b0};
                    wen_a0  = {1'b0, 1'b0};
                 end
                 4'b1000,4'b1001  : begin 
                    wen_a6  = {1'b0, 1'b0};
                    wen_a5  = {1'b0, 1'b0};
                    wen_a4  = {1'b0, wen};
                    wen_a3  = {1'b0, 1'b0};
                    wen_a2  = {1'b0, 1'b0};
                    wen_a1  = {1'b0, 1'b0};
                    wen_a0  = {1'b0, 1'b0};
                 end
                 4'b0110,4'b0111  : begin 
                    wen_a6  = {1'b0, 1'b0};
                    wen_a5  = {1'b0, 1'b0};
                    wen_a4  = {1'b0, 1'b0};
                    wen_a3  = {1'b0, wen};
                    wen_a2  = {1'b0, 1'b0};
                    wen_a1  = {1'b0, 1'b0};
                    wen_a0  = {1'b0, 1'b0};
                 end
                 4'b0100,4'b0101  : begin 
                    wen_a6  = {1'b0, 1'b0};
                    wen_a5  = {1'b0, 1'b0};
                    wen_a4  = {1'b0, 1'b0};
                    wen_a3  = {1'b0, 1'b0};
                    wen_a2  = {1'b0, wen};
                    wen_a1  = {1'b0, 1'b0};
                    wen_a0  = {1'b0, 1'b0};
                 end
                 4'b0010,4'b0011  : begin 
                    wen_a6  = {1'b0, 1'b0};
                    wen_a5  = {1'b0, 1'b0};
                    wen_a4  = {1'b0, 1'b0};
                    wen_a3  = {1'b0, 1'b0};
                    wen_a2  = {1'b0, 1'b0};
                    wen_a1  = {1'b0, wen};
                    wen_a0  = {1'b0, 1'b0};
                 end
                 4'b0000,4'b0001  : begin 
                    wen_a6  = {1'b0, 1'b0};
                    wen_a5  = {1'b0, 1'b0};
                    wen_a4  = {1'b0, 1'b0};
                    wen_a3  = {1'b0, 1'b0};
                    wen_a2  = {1'b0, 1'b0};
                    wen_a1  = {1'b0, 1'b0};
                    wen_a0  = {1'b0, wen};
                 end
                 default : begin
                    wen_a6  = {1'b0, 1'b0};
                    wen_a5  = {1'b0, 1'b0};
                    wen_a4  = {1'b0, 1'b0};
                    wen_a3  = {1'b0, 1'b0};
                    wen_a2  = {1'b0, 1'b0};
                    wen_a1  = {1'b0, 1'b0};
                    wen_a0  = {1'b0, 1'b0};
                 end
               endcase // case (writeAddr[13:10])
               
               case(ckRdAddr[13:10])
                 4'b1100,4'b1101  : begin 
                    readData = readData6[7:0];
                 end
                 4'b1010,4'b1011  : begin 
                    readData = readData5[7:0];
                 end
                 4'b1000,4'b1001  : begin 
                    readData = readData4[7:0];
                 end
                 4'b0110,4'b0111  : begin 
                    readData = readData3[7:0];
                 end
                 4'b0100,4'b0101  : begin 
                    readData = readData2[7:0];
                 end
                 4'b0010,4'b0011  : begin 
                    readData = readData1[7:0];
                 end
                 4'b0000,4'b0001  : begin 
                    readData = readData0[7:0];
                 end
                 default : begin
                    readData =  8'b0;
                 end
               endcase // case (writeAddr[13:10])

            end


            // RAM64K
            14848, 15360, 15872, 16384: begin

                width7  = 3'b011;
                width6  = 3'b011;
                width5  = 3'b011;
                width4  = 3'b011;
                width3  = 3'b011;
                width2  = 3'b011;
                width1  = 3'b011;
                width0  = 3'b011;

                writeAddr7  = {writeAddr[10:0], 3'b0};
                writeAddr6  = {writeAddr[10:0], 3'b0};
                writeAddr5  = {writeAddr[10:0], 3'b0};
                writeAddr4  = {writeAddr[10:0], 3'b0};
                writeAddr3  = {writeAddr[10:0], 3'b0};
                writeAddr2  = {writeAddr[10:0], 3'b0};
                writeAddr1  = {writeAddr[10:0], 3'b0};
                writeAddr0  = {writeAddr[10:0], 3'b0};

                readAddr7   = {readAddr[10:0],  3'b0};
                readAddr6   = {readAddr[10:0],  3'b0};
                readAddr5   = {readAddr[10:0],  3'b0};
                readAddr4   = {readAddr[10:0],  3'b0};
                readAddr3   = {readAddr[10:0],  3'b0};
                readAddr2   = {readAddr[10:0],  3'b0};
                readAddr1   = {readAddr[10:0],  3'b0};
                readAddr0   = {readAddr[10:0],  3'b0};

                writeData7  = {10'b0, writeData[7:0]};
                writeData6  = {10'b0, writeData[7:0]};
                writeData5  = {10'b0, writeData[7:0]};
                writeData4  = {10'b0, writeData[7:0]};
                writeData3  = {10'b0, writeData[7:0]};
                writeData2  = {10'b0, writeData[7:0]};
                writeData1  = {10'b0, writeData[7:0]};
                writeData0  = {10'b0, writeData[7:0]};


               case(writeAddr[13:10])
                 4'b1110,4'b1111  : begin 
                    wen_a7  = {1'b0, wen};
                    wen_a6  = {1'b0, 1'b0};
                    wen_a5  = {1'b0, 1'b0};
                    wen_a4  = {1'b0, 1'b0};
                    wen_a3  = {1'b0, 1'b0};
                    wen_a2  = {1'b0, 1'b0};
                    wen_a1  = {1'b0, 1'b0};
                    wen_a0  = {1'b0, 1'b0};
                 end
                 4'b1100,4'b1101  : begin 
                    wen_a7  = {1'b0, 1'b0};
                    wen_a6  = {1'b0, wen};
                    wen_a5  = {1'b0, 1'b0};
                    wen_a4  = {1'b0, 1'b0};
                    wen_a3  = {1'b0, 1'b0};
                    wen_a2  = {1'b0, 1'b0};
                    wen_a1  = {1'b0, 1'b0};
                    wen_a0  = {1'b0, 1'b0};
                 end
                 4'b1010,4'b1011  : begin 
                    wen_a7  = {1'b0, 1'b0};
                    wen_a6  = {1'b0, 1'b0};
                    wen_a5  = {1'b0, wen};
                    wen_a4  = {1'b0, 1'b0};
                    wen_a3  = {1'b0, 1'b0};
                    wen_a2  = {1'b0, 1'b0};
                    wen_a1  = {1'b0, 1'b0};
                    wen_a0  = {1'b0, 1'b0};
                 end
                 4'b1000,4'b1001  : begin 
                    wen_a7  = {1'b0, 1'b0};
                    wen_a6  = {1'b0, 1'b0};
                    wen_a5  = {1'b0, 1'b0};
                    wen_a4  = {1'b0, wen};
                    wen_a3  = {1'b0, 1'b0};
                    wen_a2  = {1'b0, 1'b0};
                    wen_a1  = {1'b0, 1'b0};
                    wen_a0  = {1'b0, 1'b0};
                 end
                 4'b0110,4'b0111  : begin 
                    wen_a7  = {1'b0, 1'b0};
                    wen_a6  = {1'b0, 1'b0};
                    wen_a5  = {1'b0, 1'b0};
                    wen_a4  = {1'b0, 1'b0};
                    wen_a3  = {1'b0, wen};
                    wen_a2  = {1'b0, 1'b0};
                    wen_a1  = {1'b0, 1'b0};
                    wen_a0  = {1'b0, 1'b0};
                 end
                 4'b0100,4'b0101  : begin 
                    wen_a7  = {1'b0, 1'b0};
                    wen_a6  = {1'b0, 1'b0};
                    wen_a5  = {1'b0, 1'b0};
                    wen_a4  = {1'b0, 1'b0};
                    wen_a3  = {1'b0, 1'b0};
                    wen_a2  = {1'b0, wen};
                    wen_a1  = {1'b0, 1'b0};
                    wen_a0  = {1'b0, 1'b0};
                 end
                 4'b0010,4'b0011  : begin 
                    wen_a7  = {1'b0, 1'b0};
                    wen_a6  = {1'b0, 1'b0};
                    wen_a5  = {1'b0, 1'b0};
                    wen_a4  = {1'b0, 1'b0};
                    wen_a3  = {1'b0, 1'b0};
                    wen_a2  = {1'b0, 1'b0};
                    wen_a1  = {1'b0, wen};
                    wen_a0  = {1'b0, 1'b0};
                 end
                 4'b0000,4'b0001  : begin 
                    wen_a7  = {1'b0, 1'b0};
                    wen_a6  = {1'b0, 1'b0};
                    wen_a5  = {1'b0, 1'b0};
                    wen_a4  = {1'b0, 1'b0};
                    wen_a3  = {1'b0, 1'b0};
                    wen_a2  = {1'b0, 1'b0};
                    wen_a1  = {1'b0, 1'b0};
                    wen_a0  = {1'b0, wen};
                 end
                 default : begin
                    wen_a7  = {1'b0, 1'b0};
                    wen_a6  = {1'b0, 1'b0};
                    wen_a5  = {1'b0, 1'b0};
                    wen_a4  = {1'b0, 1'b0};
                    wen_a3  = {1'b0, 1'b0};
                    wen_a2  = {1'b0, 1'b0};
                    wen_a1  = {1'b0, 1'b0};
                    wen_a0  = {1'b0, 1'b0};
                 end
               endcase // case (writeAddr[13:10])
               
               case(ckRdAddr[13:10])
                 4'b1110,4'b1111  : begin 
                    readData = readData7[7:0];
                 end
                 4'b1100,4'b1101  : begin 
                    readData = readData6[7:0];
                 end
                 4'b1010,4'b1011  : begin 
                    readData = readData5[7:0];
                 end
                 4'b1000,4'b1001  : begin 
                    readData = readData4[7:0];
                 end
                 4'b0110,4'b0111  : begin 
                    readData = readData3[7:0];
                 end
                 4'b0100,4'b0101  : begin 
                    readData = readData2[7:0];
                 end
                 4'b0010,4'b0011  : begin 
                    readData = readData1[7:0];
                 end
                 4'b0000,4'b0001  : begin 
                    readData = readData0[7:0];
                 end
                 default : begin
                    readData =  8'b0;
                 end
               endcase // case (writeAddr[13:10])

            end


            // RAM72K
            16896, 17408, 17920, 18432: begin

                width8  = 3'b011;
                width7  = 3'b000;
                width6  = 3'b000;
                width5  = 3'b000;
                width4  = 3'b000;
                width3  = 3'b000;
                width2  = 3'b000;
                width1  = 3'b000;
                width0  = 3'b000;

                writeAddr8  = {writeAddr[10:0],3'b0};
                writeAddr7  = writeAddr[13:0];
                writeAddr6  = writeAddr[13:0];
                writeAddr5  = writeAddr[13:0];
                writeAddr4  = writeAddr[13:0];
                writeAddr3  = writeAddr[13:0];
                writeAddr2  = writeAddr[13:0];
                writeAddr1  = writeAddr[13:0];
                writeAddr0  = writeAddr[13:0];

                readAddr8   = {readAddr[10:0],  3'b0};
                readAddr7   = readAddr[13:0];
                readAddr6   = readAddr[13:0];
                readAddr5   = readAddr[13:0];
                readAddr4   = readAddr[13:0];
                readAddr3   = readAddr[13:0];
                readAddr2   = readAddr[13:0];
                readAddr1   = readAddr[13:0];
                readAddr0   = readAddr[13:0];

                writeData8  = {10'b0, writeData[7:0]};
                writeData7  = {17'b0, writeData[7]};
                writeData6  = {17'b0, writeData[6]};
                writeData5  = {17'b0, writeData[5]};
                writeData4  = {17'b0, writeData[4]};
                writeData3  = {17'b0, writeData[3]};
                writeData2  = {17'b0, writeData[2]};
                writeData1  = {17'b0, writeData[1]};
                writeData0  = {17'b0, writeData[0]};


               case(writeAddr[14:10])
                 5'b10000, 5'b10001 : begin
                    wen_a8  = {1'b0, wen};
                    wen_a7  = {1'b0, 1'b0};
                    wen_a6  = {1'b0, 1'b0};
                    wen_a5  = {1'b0, 1'b0};
                    wen_a4  = {1'b0, 1'b0};
                    wen_a3  = {1'b0, 1'b0};
                    wen_a2  = {1'b0, 1'b0};
                    wen_a1  = {1'b0, 1'b0};
                    wen_a0  = {1'b0, 1'b0};
                 end
                 5'b00000,5'b00001,5'b00010,5'b00011,5'b00100,5'b00101,5'b00110,5'b00111,5'b01000,
                 5'b01001,5'b01010,5'b01011,5'b01100,5'b01101,5'b01110,5'b01111  : begin 
                    wen_a8  = {1'b0, 1'b0};
                    wen_a7  = {1'b0, wen};
                    wen_a6  = {1'b0, wen};
                    wen_a5  = {1'b0, wen};
                    wen_a4  = {1'b0, wen};
                    wen_a3  = {1'b0, wen};
                    wen_a2  = {1'b0, wen};
                    wen_a1  = {1'b0, wen};
                    wen_a0  = {1'b0, wen};
                 end
                 default : begin
                    wen_a8  = {1'b0, 1'b0};
                    wen_a7  = {1'b0, 1'b0};
                    wen_a6  = {1'b0, 1'b0};
                    wen_a5  = {1'b0, 1'b0};
                    wen_a4  = {1'b0, 1'b0};
                    wen_a3  = {1'b0, 1'b0};
                    wen_a2  = {1'b0, 1'b0};
                    wen_a1  = {1'b0, 1'b0};
                    wen_a0  = {1'b0, 1'b0};
                 end
               endcase // case (writeAddr[13:10])
               
               case(ckRdAddr[14:10])
                 5'b10000,5'b10001  : begin 
                    readData = readData8[7:0];
                 end
                 5'b00000,5'b00001,5'b00010,5'b00011,5'b00100,5'b00101,5'b00110,5'b00111,5'b01000,
                 5'b01001,5'b01010,5'b01011,5'b01100,5'b01101,5'b01110,5'b01111  : begin 
                    readData = {
                                readData7[0],
                                readData6[0],
                                readData5[0],
                                readData4[0],
                                readData3[0],
                                readData2[0],
                                readData1[0],
                                readData0[0]
                                };
                 end
                 default : begin
                    readData =  8'b0;
                 end
               endcase // case (writeAddr[13:10])

            end

            // RAM80K
            18944, 19456, 19968, 20480: begin

                width9  = 3'b011;
                width8  = 3'b011;
                width7  = 3'b000;
                width6  = 3'b000;
                width5  = 3'b000;
                width4  = 3'b000;
                width3  = 3'b000;
                width2  = 3'b000;
                width1  = 3'b000;
                width0  = 3'b000;

                writeAddr9  = {writeAddr[10:0],3'b0};
                writeAddr8  = {writeAddr[10:0],3'b0};
                writeAddr7  = writeAddr[13:0];
                writeAddr6  = writeAddr[13:0];
                writeAddr5  = writeAddr[13:0];
                writeAddr4  = writeAddr[13:0];
                writeAddr3  = writeAddr[13:0];
                writeAddr2  = writeAddr[13:0];
                writeAddr1  = writeAddr[13:0];
                writeAddr0  = writeAddr[13:0];

                readAddr9   = {readAddr[10:0],  3'b0};
                readAddr8   = {readAddr[10:0],  3'b0};
                readAddr7   = readAddr[13:0];
                readAddr6   = readAddr[13:0];
                readAddr5   = readAddr[13:0];
                readAddr4   = readAddr[13:0];
                readAddr3   = readAddr[13:0];
                readAddr2   = readAddr[13:0];
                readAddr1   = readAddr[13:0];
                readAddr0   = readAddr[13:0];

                writeData9  = {10'b0, writeData[7:0]};
                writeData8  = {10'b0, writeData[7:0]};
                writeData7  = {17'b0, writeData[7]};
                writeData6  = {17'b0, writeData[6]};
                writeData5  = {17'b0, writeData[5]};
                writeData4  = {17'b0, writeData[4]};
                writeData3  = {17'b0, writeData[3]};
                writeData2  = {17'b0, writeData[2]};
                writeData1  = {17'b0, writeData[1]};
                writeData0  = {17'b0, writeData[0]};

               case(writeAddr[14:10])
                 5'b10010, 5'b10011 : begin
                    wen_a9  = {1'b0, wen};
                    wen_a8  = {1'b0, 1'b0};
                    wen_a7  = {1'b0, 1'b0};
                    wen_a6  = {1'b0, 1'b0};
                    wen_a5  = {1'b0, 1'b0};
                    wen_a4  = {1'b0, 1'b0};
                    wen_a3  = {1'b0, 1'b0};
                    wen_a2  = {1'b0, 1'b0};
                    wen_a1  = {1'b0, 1'b0};
                    wen_a0  = {1'b0, 1'b0};
                 end
                 5'b10000, 5'b10001 : begin
                    wen_a9  = {1'b0, 1'b0};
                    wen_a8  = {1'b0, wen};
                    wen_a7  = {1'b0, 1'b0};
                    wen_a6  = {1'b0, 1'b0};
                    wen_a5  = {1'b0, 1'b0};
                    wen_a4  = {1'b0, 1'b0};
                    wen_a3  = {1'b0, 1'b0};
                    wen_a2  = {1'b0, 1'b0};
                    wen_a1  = {1'b0, 1'b0};
                    wen_a0  = {1'b0, 1'b0};
                 end
                 5'b00000,5'b00001,5'b00010,5'b00011,5'b00100,5'b00101,5'b00110,5'b00111,5'b01000,
                 5'b01001,5'b01010,5'b01011,5'b01100,5'b01101,5'b01110,5'b01111  : begin 
                    wen_a9  = {1'b0, 1'b0};
                    wen_a8  = {1'b0, 1'b0};
                    wen_a7  = {1'b0, wen};
                    wen_a6  = {1'b0, wen};
                    wen_a5  = {1'b0, wen};
                    wen_a4  = {1'b0, wen};
                    wen_a3  = {1'b0, wen};
                    wen_a2  = {1'b0, wen};
                    wen_a1  = {1'b0, wen};
                    wen_a0  = {1'b0, wen};
                 end
                 default : begin
                    wen_a9  = {1'b0, 1'b0};
                    wen_a8  = {1'b0, 1'b0};
                    wen_a7  = {1'b0, 1'b0};
                    wen_a6  = {1'b0, 1'b0};
                    wen_a5  = {1'b0, 1'b0};
                    wen_a4  = {1'b0, 1'b0};
                    wen_a3  = {1'b0, 1'b0};
                    wen_a2  = {1'b0, 1'b0};
                    wen_a1  = {1'b0, 1'b0};
                    wen_a0  = {1'b0, 1'b0};
                 end
               endcase // case (writeAddr[13:10])
               
               case(ckRdAddr[14:10])
                 5'b10010,5'b10011  : begin 
                    readData = readData9[7:0];
                 end
                 5'b10000,5'b10001  : begin 
                    readData = readData8[7:0];
                 end
                 5'b00000,5'b00001,5'b00010,5'b00011,5'b00100,5'b00101,5'b00110,5'b00111,5'b01000,
                 5'b01001,5'b01010,5'b01011,5'b01100,5'b01101,5'b01110,5'b01111  : begin 
                    readData = {
                                readData7[0],
                                readData6[0],
                                readData5[0],
                                readData4[0],
                                readData3[0],
                                readData2[0],
                                readData1[0],
                                readData0[0]
                                };
                 end
                 default : begin
                    readData =  8'b0;
                 end
               endcase // case (writeAddr[13:10])

            end

            // RAM88K
            20992, 21504, 22016, 22528: begin

                width10 = 3'b011;
                width9  = 3'b011;
                width8  = 3'b011;
                width7  = 3'b000;
                width6  = 3'b000;
                width5  = 3'b000;
                width4  = 3'b000;
                width3  = 3'b000;
                width2  = 3'b000;
                width1  = 3'b000;
                width0  = 3'b000;

                writeAddr10 = {writeAddr[10:0],3'b0};
                writeAddr9  = {writeAddr[10:0],3'b0};
                writeAddr8  = {writeAddr[10:0],3'b0};
                writeAddr7  = writeAddr[13:0];
                writeAddr6  = writeAddr[13:0];
                writeAddr5  = writeAddr[13:0];
                writeAddr4  = writeAddr[13:0];
                writeAddr3  = writeAddr[13:0];
                writeAddr2  = writeAddr[13:0];
                writeAddr1  = writeAddr[13:0];
                writeAddr0  = writeAddr[13:0];

                readAddr10  = {readAddr[10:0],  3'b0};
                readAddr9   = {readAddr[10:0],  3'b0};
                readAddr8   = {readAddr[10:0],  3'b0};
                readAddr7   = readAddr[13:0];
                readAddr6   = readAddr[13:0];
                readAddr5   = readAddr[13:0];
                readAddr4   = readAddr[13:0];
                readAddr3   = readAddr[13:0];
                readAddr2   = readAddr[13:0];
                readAddr1   = readAddr[13:0];
                readAddr0   = readAddr[13:0];

                writeData10 = {10'b0, writeData[7:0]};
                writeData9  = {10'b0, writeData[7:0]};
                writeData8  = {10'b0, writeData[7:0]};
                writeData7  = {17'b0, writeData[7]};
                writeData6  = {17'b0, writeData[6]};
                writeData5  = {17'b0, writeData[5]};
                writeData4  = {17'b0, writeData[4]};
                writeData3  = {17'b0, writeData[3]};
                writeData2  = {17'b0, writeData[2]};
                writeData1  = {17'b0, writeData[1]};
                writeData0  = {17'b0, writeData[0]};

               case(writeAddr[14:10])
                 5'b10100, 5'b10101 : begin
                    wen_a10 = {1'b0, wen};
                    wen_a9  = {1'b0, 1'b0};
                    wen_a8  = {1'b0, 1'b0};
                    wen_a7  = {1'b0, 1'b0};
                    wen_a6  = {1'b0, 1'b0};
                    wen_a5  = {1'b0, 1'b0};
                    wen_a4  = {1'b0, 1'b0};
                    wen_a3  = {1'b0, 1'b0};
                    wen_a2  = {1'b0, 1'b0};
                    wen_a1  = {1'b0, 1'b0};
                    wen_a0  = {1'b0, 1'b0};
                 end
                 5'b10010, 5'b10011 : begin
                    wen_a10 = {1'b0, 1'b0};
                    wen_a9  = {1'b0, wen};
                    wen_a8  = {1'b0, 1'b0};
                    wen_a7  = {1'b0, 1'b0};
                    wen_a6  = {1'b0, 1'b0};
                    wen_a5  = {1'b0, 1'b0};
                    wen_a4  = {1'b0, 1'b0};
                    wen_a3  = {1'b0, 1'b0};
                    wen_a2  = {1'b0, 1'b0};
                    wen_a1  = {1'b0, 1'b0};
                    wen_a0  = {1'b0, 1'b0};
                 end
                 5'b10000, 5'b10001 : begin
                    wen_a10 = {1'b0, 1'b0};
                    wen_a9  = {1'b0, 1'b0};
                    wen_a8  = {1'b0, wen};
                    wen_a7  = {1'b0, 1'b0};
                    wen_a6  = {1'b0, 1'b0};
                    wen_a5  = {1'b0, 1'b0};
                    wen_a4  = {1'b0, 1'b0};
                    wen_a3  = {1'b0, 1'b0};
                    wen_a2  = {1'b0, 1'b0};
                    wen_a1  = {1'b0, 1'b0};
                    wen_a0  = {1'b0, 1'b0};
                 end
                 5'b00000,5'b00001,5'b00010,5'b00011,5'b00100,5'b00101,5'b00110,5'b00111,5'b01000,
                 5'b01001,5'b01010,5'b01011,5'b01100,5'b01101,5'b01110,5'b01111  : begin 
                    wen_a10 = {1'b0, 1'b0};
                    wen_a9  = {1'b0, 1'b0};
                    wen_a8  = {1'b0, 1'b0};
                    wen_a7  = {1'b0, wen};
                    wen_a6  = {1'b0, wen};
                    wen_a5  = {1'b0, wen};
                    wen_a4  = {1'b0, wen};
                    wen_a3  = {1'b0, wen};
                    wen_a2  = {1'b0, wen};
                    wen_a1  = {1'b0, wen};
                    wen_a0  = {1'b0, wen};
                 end
                 default : begin
                    wen_a10 = {1'b0, 1'b0};
                    wen_a9  = {1'b0, 1'b0};
                    wen_a8  = {1'b0, 1'b0};
                    wen_a7  = {1'b0, 1'b0};
                    wen_a6  = {1'b0, 1'b0};
                    wen_a5  = {1'b0, 1'b0};
                    wen_a4  = {1'b0, 1'b0};
                    wen_a3  = {1'b0, 1'b0};
                    wen_a2  = {1'b0, 1'b0};
                    wen_a1  = {1'b0, 1'b0};
                    wen_a0  = {1'b0, 1'b0};
                 end
               endcase // case (writeAddr[14:10])
               
               case(ckRdAddr[14:10])
                 5'b10100, 5'b10101 : begin
                    readData = readData10[7:0];
                 end
                 5'b10010,5'b10011  : begin 
                    readData = readData9[7:0];
                 end
                 5'b10000,5'b10001  : begin 
                    readData = readData8[7:0];
                 end
                 5'b00000,5'b00001,5'b00010,5'b00011,5'b00100,5'b00101,5'b00110,5'b00111,5'b01000,
                 5'b01001,5'b01010,5'b01011,5'b01100,5'b01101,5'b01110,5'b01111  : begin 
                    readData = {
                                readData7[0],
                                readData6[0],
                                readData5[0],
                                readData4[0],
                                readData3[0],
                                readData2[0],
                                readData1[0],
                                readData0[0]
                                };
                 end
                 default : begin
                    readData =  8'b0;
                 end
               endcase // case (writeAddr[14:10])

            end // case: 20992, 21504, 22016, 22528
          

          // RAM24K
          23040, 23552, 24064, 24576: begin

                width11 = 3'b011;
                width10 = 3'b011;
                width9  = 3'b011;
                width8  = 3'b011;
                width7  = 3'b000;
                width6  = 3'b000;
                width5  = 3'b000;
                width4  = 3'b000;
                width3  = 3'b000;
                width2  = 3'b000;
                width1  = 3'b000;
                width0  = 3'b000;

                writeAddr11 = {writeAddr[10:0],3'b0};
                writeAddr10 = {writeAddr[10:0],3'b0};
                writeAddr9  = {writeAddr[10:0],3'b0};
                writeAddr8  = {writeAddr[10:0],3'b0};
                writeAddr7  = writeAddr[13:0];
                writeAddr6  = writeAddr[13:0];
                writeAddr5  = writeAddr[13:0];
                writeAddr4  = writeAddr[13:0];
                writeAddr3  = writeAddr[13:0];
                writeAddr2  = writeAddr[13:0];
                writeAddr1  = writeAddr[13:0];
                writeAddr0  = writeAddr[13:0];

                readAddr11  = {readAddr[10:0],  3'b0};
                readAddr10  = {readAddr[10:0],  3'b0};
                readAddr9   = {readAddr[10:0],  3'b0};
                readAddr8   = {readAddr[10:0],  3'b0};
                readAddr7   = readAddr[13:0];
                readAddr6   = readAddr[13:0];
                readAddr5   = readAddr[13:0];
                readAddr4   = readAddr[13:0];
                readAddr3   = readAddr[13:0];
                readAddr2   = readAddr[13:0];
                readAddr1   = readAddr[13:0];
                readAddr0   = readAddr[13:0];

                writeData11 = {10'b0, writeData[7:0]};
                writeData10 = {10'b0, writeData[7:0]};
                writeData9  = {10'b0, writeData[7:0]};
                writeData8  = {10'b0, writeData[7:0]};
                writeData7  = {17'b0, writeData[7]};
                writeData6  = {17'b0, writeData[6]};
                writeData5  = {17'b0, writeData[5]};
                writeData4  = {17'b0, writeData[4]};
                writeData3  = {17'b0, writeData[3]};
                writeData2  = {17'b0, writeData[2]};
                writeData1  = {17'b0, writeData[1]};
                writeData0  = {17'b0, writeData[0]};

               case(writeAddr[14:10])
                 5'b10110, 5'b10111 : begin
                    wen_a11 = {1'b0, wen};
                    wen_a10 = {1'b0, 1'b0};
                    wen_a9  = {1'b0, 1'b0};
                    wen_a8  = {1'b0, 1'b0};
                    wen_a7  = {1'b0, 1'b0};
                    wen_a6  = {1'b0, 1'b0};
                    wen_a5  = {1'b0, 1'b0};
                    wen_a4  = {1'b0, 1'b0};
                    wen_a3  = {1'b0, 1'b0};
                    wen_a2  = {1'b0, 1'b0};
                    wen_a1  = {1'b0, 1'b0};
                    wen_a0  = {1'b0, 1'b0};
                 end
                 5'b10100, 5'b10101 : begin
                    wen_a11 = {1'b0, 1'b0};
                    wen_a10 = {1'b0, wen};
                    wen_a9  = {1'b0, 1'b0};
                    wen_a8  = {1'b0, 1'b0};
                    wen_a7  = {1'b0, 1'b0};
                    wen_a6  = {1'b0, 1'b0};
                    wen_a5  = {1'b0, 1'b0};
                    wen_a4  = {1'b0, 1'b0};
                    wen_a3  = {1'b0, 1'b0};
                    wen_a2  = {1'b0, 1'b0};
                    wen_a1  = {1'b0, 1'b0};
                    wen_a0  = {1'b0, 1'b0};
                 end
                 5'b10010, 5'b10011 : begin
                    wen_a11 = {1'b0, 1'b0};
                    wen_a10 = {1'b0, 1'b0};
                    wen_a9  = {1'b0, wen};
                    wen_a8  = {1'b0, 1'b0};
                    wen_a7  = {1'b0, 1'b0};
                    wen_a6  = {1'b0, 1'b0};
                    wen_a5  = {1'b0, 1'b0};
                    wen_a4  = {1'b0, 1'b0};
                    wen_a3  = {1'b0, 1'b0};
                    wen_a2  = {1'b0, 1'b0};
                    wen_a1  = {1'b0, 1'b0};
                    wen_a0  = {1'b0, 1'b0};
                 end
                 5'b10000, 5'b10001 : begin
                    wen_a11 = {1'b0, 1'b0};
                    wen_a10 = {1'b0, 1'b0};
                    wen_a9  = {1'b0, 1'b0};
                    wen_a8  = {1'b0, wen};
                    wen_a7  = {1'b0, 1'b0};
                    wen_a6  = {1'b0, 1'b0};
                    wen_a5  = {1'b0, 1'b0};
                    wen_a4  = {1'b0, 1'b0};
                    wen_a3  = {1'b0, 1'b0};
                    wen_a2  = {1'b0, 1'b0};
                    wen_a1  = {1'b0, 1'b0};
                    wen_a0  = {1'b0, 1'b0};
                 end
                 5'b00000,5'b00001,5'b00010,5'b00011,5'b00100,5'b00101,5'b00110,5'b00111,5'b01000,
                 5'b01001,5'b01010,5'b01011,5'b01100,5'b01101,5'b01110,5'b01111  : begin 
                    wen_a11 = {1'b0, 1'b0};
                    wen_a10 = {1'b0, 1'b0};
                    wen_a9  = {1'b0, 1'b0};
                    wen_a8  = {1'b0, 1'b0};
                    wen_a7  = {1'b0, wen};
                    wen_a6  = {1'b0, wen};
                    wen_a5  = {1'b0, wen};
                    wen_a4  = {1'b0, wen};
                    wen_a3  = {1'b0, wen};
                    wen_a2  = {1'b0, wen};
                    wen_a1  = {1'b0, wen};
                    wen_a0  = {1'b0, wen};
                 end
                 default : begin
                    wen_a11 = {1'b0, 1'b0};
                    wen_a10 = {1'b0, 1'b0};
                    wen_a9  = {1'b0, 1'b0};
                    wen_a8  = {1'b0, 1'b0};
                    wen_a7  = {1'b0, 1'b0};
                    wen_a6  = {1'b0, 1'b0};
                    wen_a5  = {1'b0, 1'b0};
                    wen_a4  = {1'b0, 1'b0};
                    wen_a3  = {1'b0, 1'b0};
                    wen_a2  = {1'b0, 1'b0};
                    wen_a1  = {1'b0, 1'b0};
                    wen_a0  = {1'b0, 1'b0};
                 end
               endcase // case (writeAddr[14:10])
               
               case(ckRdAddr[14:10])
                 5'b10110, 5'b10111 : begin
                    readData = readData11[7:0];
                 end
                 5'b10100, 5'b10101 : begin
                    readData = readData10[7:0];
                 end
                 5'b10010,5'b10011  : begin 
                    readData = readData9[7:0];
                 end
                 5'b10000,5'b10001  : begin 
                    readData = readData8[7:0];
                 end
                 5'b00000,5'b00001,5'b00010,5'b00011,5'b00100,5'b00101,5'b00110,5'b00111,5'b01000,
                 5'b01001,5'b01010,5'b01011,5'b01100,5'b01101,5'b01110,5'b01111  : begin 
                    readData = {
                                readData7[0],
                                readData6[0],
                                readData5[0],
                                readData4[0],
                                readData3[0],
                                readData2[0],
                                readData1[0],
                                readData0[0]
                                };
                 end
                 default : begin
                    readData =  8'b0;
                 end
               endcase // case (writeAddr[14:10])

            end // case: 24576          

          
            // RAM26K
            25088,25600,26112,26624: begin

                width12 = 3'b011;
                width11 = 3'b011;
                width10 = 3'b011;
                width9  = 3'b011;
                width8  = 3'b011;
                width7  = 3'b000;
                width6  = 3'b000;
                width5  = 3'b000;
                width4  = 3'b000;
                width3  = 3'b000;
                width2  = 3'b000;
                width1  = 3'b000;
                width0  = 3'b000;

                writeAddr12 = {writeAddr[10:0],3'b0};
                writeAddr11 = {writeAddr[10:0],3'b0};
                writeAddr10 = {writeAddr[10:0],3'b0};
                writeAddr9  = {writeAddr[10:0],3'b0};
                writeAddr8  = {writeAddr[10:0],3'b0};
                writeAddr7  = writeAddr[13:0];
                writeAddr6  = writeAddr[13:0];
                writeAddr5  = writeAddr[13:0];
                writeAddr4  = writeAddr[13:0];
                writeAddr3  = writeAddr[13:0];
                writeAddr2  = writeAddr[13:0];
                writeAddr1  = writeAddr[13:0];
                writeAddr0  = writeAddr[13:0];

                readAddr12  = {readAddr[10:0],  3'b0};
                readAddr11  = {readAddr[10:0],  3'b0};
                readAddr10  = {readAddr[10:0],  3'b0};
                readAddr9   = {readAddr[10:0],  3'b0};
                readAddr8   = {readAddr[10:0],  3'b0};
                readAddr7   = readAddr[13:0];
                readAddr6   = readAddr[13:0];
                readAddr5   = readAddr[13:0];
                readAddr4   = readAddr[13:0];
                readAddr3   = readAddr[13:0];
                readAddr2   = readAddr[13:0];
                readAddr1   = readAddr[13:0];
                readAddr0   = readAddr[13:0];

                writeData12 = {10'b0, writeData[7:0]};
                writeData11 = {10'b0, writeData[7:0]};
                writeData10 = {10'b0, writeData[7:0]};
                writeData9  = {10'b0, writeData[7:0]};
                writeData8  = {10'b0, writeData[7:0]};
                writeData7  = {17'b0, writeData[7]};
                writeData6  = {17'b0, writeData[6]};
                writeData5  = {17'b0, writeData[5]};
                writeData4  = {17'b0, writeData[4]};
                writeData3  = {17'b0, writeData[3]};
                writeData2  = {17'b0, writeData[2]};
                writeData1  = {17'b0, writeData[1]};
                writeData0  = {17'b0, writeData[0]};

               case(writeAddr[14:10])
                 5'b11000, 5'b11001 : begin
                    wen_a12 = {1'b0, wen};
                    wen_a11 = {1'b0, 1'b0};
                    wen_a10 = {1'b0, 1'b0};
                    wen_a9  = {1'b0, 1'b0};
                    wen_a8  = {1'b0, 1'b0};
                    wen_a7  = {1'b0, 1'b0};
                    wen_a6  = {1'b0, 1'b0};
                    wen_a5  = {1'b0, 1'b0};
                    wen_a4  = {1'b0, 1'b0};
                    wen_a3  = {1'b0, 1'b0};
                    wen_a2  = {1'b0, 1'b0};
                    wen_a1  = {1'b0, 1'b0};
                    wen_a0  = {1'b0, 1'b0};
                 end
                 5'b10110, 5'b10111 : begin
                    wen_a12 = {1'b0, 1'b0};
                    wen_a11 = {1'b0, wen};
                    wen_a10 = {1'b0, 1'b0};
                    wen_a9  = {1'b0, 1'b0};
                    wen_a8  = {1'b0, 1'b0};
                    wen_a7  = {1'b0, 1'b0};
                    wen_a6  = {1'b0, 1'b0};
                    wen_a5  = {1'b0, 1'b0};
                    wen_a4  = {1'b0, 1'b0};
                    wen_a3  = {1'b0, 1'b0};
                    wen_a2  = {1'b0, 1'b0};
                    wen_a1  = {1'b0, 1'b0};
                    wen_a0  = {1'b0, 1'b0};
                 end
                 5'b10100, 5'b10101 : begin
                    wen_a12 = {1'b0, 1'b0};
                    wen_a11 = {1'b0, 1'b0};
                    wen_a10 = {1'b0, wen};
                    wen_a9  = {1'b0, 1'b0};
                    wen_a8  = {1'b0, 1'b0};
                    wen_a7  = {1'b0, 1'b0};
                    wen_a6  = {1'b0, 1'b0};
                    wen_a5  = {1'b0, 1'b0};
                    wen_a4  = {1'b0, 1'b0};
                    wen_a3  = {1'b0, 1'b0};
                    wen_a2  = {1'b0, 1'b0};
                    wen_a1  = {1'b0, 1'b0};
                    wen_a0  = {1'b0, 1'b0};
                 end
                 5'b10010, 5'b10011 : begin
                    wen_a12 = {1'b0, 1'b0};
                    wen_a11 = {1'b0, 1'b0};
                    wen_a10 = {1'b0, 1'b0};
                    wen_a9  = {1'b0, wen};
                    wen_a8  = {1'b0, 1'b0};
                    wen_a7  = {1'b0, 1'b0};
                    wen_a6  = {1'b0, 1'b0};
                    wen_a5  = {1'b0, 1'b0};
                    wen_a4  = {1'b0, 1'b0};
                    wen_a3  = {1'b0, 1'b0};
                    wen_a2  = {1'b0, 1'b0};
                    wen_a1  = {1'b0, 1'b0};
                    wen_a0  = {1'b0, 1'b0};
                 end
                 5'b10000, 5'b10001 : begin
                    wen_a12 = {1'b0, 1'b0};
                    wen_a11 = {1'b0, 1'b0};
                    wen_a10 = {1'b0, 1'b0};
                    wen_a9  = {1'b0, 1'b0};
                    wen_a8  = {1'b0, wen};
                    wen_a7  = {1'b0, 1'b0};
                    wen_a6  = {1'b0, 1'b0};
                    wen_a5  = {1'b0, 1'b0};
                    wen_a4  = {1'b0, 1'b0};
                    wen_a3  = {1'b0, 1'b0};
                    wen_a2  = {1'b0, 1'b0};
                    wen_a1  = {1'b0, 1'b0};
                    wen_a0  = {1'b0, 1'b0};
                 end
                 5'b00000,5'b00001,5'b00010,5'b00011,5'b00100,5'b00101,5'b00110,5'b00111,5'b01000,
                 5'b01001,5'b01010,5'b01011,5'b01100,5'b01101,5'b01110,5'b01111  : begin 
                    wen_a12 = {1'b0, 1'b0};
                    wen_a11 = {1'b0, 1'b0};
                    wen_a10 = {1'b0, 1'b0};
                    wen_a9  = {1'b0, 1'b0};
                    wen_a8  = {1'b0, 1'b0};
                    wen_a7  = {1'b0, wen};
                    wen_a6  = {1'b0, wen};
                    wen_a5  = {1'b0, wen};
                    wen_a4  = {1'b0, wen};
                    wen_a3  = {1'b0, wen};
                    wen_a2  = {1'b0, wen};
                    wen_a1  = {1'b0, wen};
                    wen_a0  = {1'b0, wen};
                 end
                 default : begin
                    wen_a12 = {1'b0, 1'b0};
                    wen_a11 = {1'b0, 1'b0};
                    wen_a10 = {1'b0, 1'b0};
                    wen_a9  = {1'b0, 1'b0};
                    wen_a8  = {1'b0, 1'b0};
                    wen_a7  = {1'b0, 1'b0};
                    wen_a6  = {1'b0, 1'b0};
                    wen_a5  = {1'b0, 1'b0};
                    wen_a4  = {1'b0, 1'b0};
                    wen_a3  = {1'b0, 1'b0};
                    wen_a2  = {1'b0, 1'b0};
                    wen_a1  = {1'b0, 1'b0};
                    wen_a0  = {1'b0, 1'b0};
                 end
               endcase // case (writeAddr[14:10])
               
               case(ckRdAddr[14:10])
                 5'b11000, 5'b11001 : begin
                    readData = readData12[7:0];
                 end
                 5'b10110, 5'b10111 : begin
                    readData = readData11[7:0];
                 end
                 5'b10100, 5'b10101 : begin
                    readData = readData10[7:0];
                 end
                 5'b10010,5'b10011  : begin 
                    readData = readData9[7:0];
                 end
                 5'b10000,5'b10001  : begin 
                    readData = readData8[7:0];
                 end
                 5'b00000,5'b00001,5'b00010,5'b00011,5'b00100,5'b00101,5'b00110,5'b00111,5'b01000,
                 5'b01001,5'b01010,5'b01011,5'b01100,5'b01101,5'b01110,5'b01111  : begin 
                    readData = {
                                readData7[0],
                                readData6[0],
                                readData5[0],
                                readData4[0],
                                readData3[0],
                                readData2[0],
                                readData1[0],
                                readData0[0]
                                };
                 end
                 default : begin
                    readData =  8'b0;
                 end
               endcase // case (writeAddr[14:10])

            end // case: 26624          

            // RAM28K
            27136,27648,28160,28672: begin

                width13 = 3'b011;
                width12 = 3'b011;
                width11 = 3'b011;
                width10 = 3'b011;
                width9  = 3'b011;
                width8  = 3'b011;
                width7  = 3'b000;
                width6  = 3'b000;
                width5  = 3'b000;
                width4  = 3'b000;
                width3  = 3'b000;
                width2  = 3'b000;
                width1  = 3'b000;
                width0  = 3'b000;

                writeAddr13 = {writeAddr[10:0],3'b0};
                writeAddr12 = {writeAddr[10:0],3'b0};
                writeAddr11 = {writeAddr[10:0],3'b0};
                writeAddr10 = {writeAddr[10:0],3'b0};
                writeAddr9  = {writeAddr[10:0],3'b0};
                writeAddr8  = {writeAddr[10:0],3'b0};
                writeAddr7  = writeAddr[13:0];
                writeAddr6  = writeAddr[13:0];
                writeAddr5  = writeAddr[13:0];
                writeAddr4  = writeAddr[13:0];
                writeAddr3  = writeAddr[13:0];
                writeAddr2  = writeAddr[13:0];
                writeAddr1  = writeAddr[13:0];
                writeAddr0  = writeAddr[13:0];

                readAddr13  = {readAddr[10:0],  3'b0};
                readAddr12  = {readAddr[10:0],  3'b0};
                readAddr11  = {readAddr[10:0],  3'b0};
                readAddr10  = {readAddr[10:0],  3'b0};
                readAddr9   = {readAddr[10:0],  3'b0};
                readAddr8   = {readAddr[10:0],  3'b0};
                readAddr7   = readAddr[13:0];
                readAddr6   = readAddr[13:0];
                readAddr5   = readAddr[13:0];
                readAddr4   = readAddr[13:0];
                readAddr3   = readAddr[13:0];
                readAddr2   = readAddr[13:0];
                readAddr1   = readAddr[13:0];
                readAddr0   = readAddr[13:0];

                writeData13 = {10'b0, writeData[7:0]};
                writeData12 = {10'b0, writeData[7:0]};
                writeData11 = {10'b0, writeData[7:0]};
                writeData10 = {10'b0, writeData[7:0]};
                writeData9  = {10'b0, writeData[7:0]};
                writeData8  = {10'b0, writeData[7:0]};
                writeData7  = {17'b0, writeData[7]};
                writeData6  = {17'b0, writeData[6]};
                writeData5  = {17'b0, writeData[5]};
                writeData4  = {17'b0, writeData[4]};
                writeData3  = {17'b0, writeData[3]};
                writeData2  = {17'b0, writeData[2]};
                writeData1  = {17'b0, writeData[1]};
                writeData0  = {17'b0, writeData[0]};


               case(writeAddr[14:10])
                 5'b11010, 5'b11011 : begin
                    wen_a13 = {1'b0, wen};
                    wen_a12 = {1'b0, 1'b0};
                    wen_a11 = {1'b0, 1'b0};
                    wen_a10 = {1'b0, 1'b0};
                    wen_a9  = {1'b0, 1'b0};
                    wen_a8  = {1'b0, 1'b0};
                    wen_a7  = {1'b0, 1'b0};
                    wen_a6  = {1'b0, 1'b0};
                    wen_a5  = {1'b0, 1'b0};
                    wen_a4  = {1'b0, 1'b0};
                    wen_a3  = {1'b0, 1'b0};
                    wen_a2  = {1'b0, 1'b0};
                    wen_a1  = {1'b0, 1'b0};
                    wen_a0  = {1'b0, 1'b0};
                 end
                 5'b11000, 5'b11001 : begin
                    wen_a13 = {1'b0, 1'b0};
                    wen_a12 = {1'b0, wen};
                    wen_a11 = {1'b0, 1'b0};
                    wen_a10 = {1'b0, 1'b0};
                    wen_a9  = {1'b0, 1'b0};
                    wen_a8  = {1'b0, 1'b0};
                    wen_a7  = {1'b0, 1'b0};
                    wen_a6  = {1'b0, 1'b0};
                    wen_a5  = {1'b0, 1'b0};
                    wen_a4  = {1'b0, 1'b0};
                    wen_a3  = {1'b0, 1'b0};
                    wen_a2  = {1'b0, 1'b0};
                    wen_a1  = {1'b0, 1'b0};
                    wen_a0  = {1'b0, 1'b0};
                 end
                 5'b10110, 5'b10111 : begin
                    wen_a13 = {1'b0, 1'b0};
                    wen_a12 = {1'b0, 1'b0};
                    wen_a11 = {1'b0, wen};
                    wen_a10 = {1'b0, 1'b0};
                    wen_a9  = {1'b0, 1'b0};
                    wen_a8  = {1'b0, 1'b0};
                    wen_a7  = {1'b0, 1'b0};
                    wen_a6  = {1'b0, 1'b0};
                    wen_a5  = {1'b0, 1'b0};
                    wen_a4  = {1'b0, 1'b0};
                    wen_a3  = {1'b0, 1'b0};
                    wen_a2  = {1'b0, 1'b0};
                    wen_a1  = {1'b0, 1'b0};
                    wen_a0  = {1'b0, 1'b0};
                 end
                 5'b10100, 5'b10101 : begin
                    wen_a13 = {1'b0, 1'b0};
                    wen_a12 = {1'b0, 1'b0};
                    wen_a11 = {1'b0, 1'b0};
                    wen_a10 = {1'b0, wen};
                    wen_a9  = {1'b0, 1'b0};
                    wen_a8  = {1'b0, 1'b0};
                    wen_a7  = {1'b0, 1'b0};
                    wen_a6  = {1'b0, 1'b0};
                    wen_a5  = {1'b0, 1'b0};
                    wen_a4  = {1'b0, 1'b0};
                    wen_a3  = {1'b0, 1'b0};
                    wen_a2  = {1'b0, 1'b0};
                    wen_a1  = {1'b0, 1'b0};
                    wen_a0  = {1'b0, 1'b0};
                 end
                 5'b10010, 5'b10011 : begin
                    wen_a13 = {1'b0, 1'b0};
                    wen_a12 = {1'b0, 1'b0};
                    wen_a11 = {1'b0, 1'b0};
                    wen_a10 = {1'b0, 1'b0};
                    wen_a9  = {1'b0, wen};
                    wen_a8  = {1'b0, 1'b0};
                    wen_a7  = {1'b0, 1'b0};
                    wen_a6  = {1'b0, 1'b0};
                    wen_a5  = {1'b0, 1'b0};
                    wen_a4  = {1'b0, 1'b0};
                    wen_a3  = {1'b0, 1'b0};
                    wen_a2  = {1'b0, 1'b0};
                    wen_a1  = {1'b0, 1'b0};
                    wen_a0  = {1'b0, 1'b0};
                 end
                 5'b10000, 5'b10001 : begin
                    wen_a13 = {1'b0, 1'b0};
                    wen_a12 = {1'b0, 1'b0};
                    wen_a11 = {1'b0, 1'b0};
                    wen_a10 = {1'b0, 1'b0};
                    wen_a9  = {1'b0, 1'b0};
                    wen_a8  = {1'b0, wen};
                    wen_a7  = {1'b0, 1'b0};
                    wen_a6  = {1'b0, 1'b0};
                    wen_a5  = {1'b0, 1'b0};
                    wen_a4  = {1'b0, 1'b0};
                    wen_a3  = {1'b0, 1'b0};
                    wen_a2  = {1'b0, 1'b0};
                    wen_a1  = {1'b0, 1'b0};
                    wen_a0  = {1'b0, 1'b0};
                 end
                 5'b00000,5'b00001,5'b00010,5'b00011,5'b00100,5'b00101,5'b00110,5'b00111,5'b01000,
                 5'b01001,5'b01010,5'b01011,5'b01100,5'b01101,5'b01110,5'b01111  : begin 
                    wen_a13 = {1'b0, 1'b0};
                    wen_a12 = {1'b0, 1'b0};
                    wen_a11 = {1'b0, 1'b0};
                    wen_a10 = {1'b0, 1'b0};
                    wen_a9  = {1'b0, 1'b0};
                    wen_a8  = {1'b0, 1'b0};
                    wen_a7  = {1'b0, wen};
                    wen_a6  = {1'b0, wen};
                    wen_a5  = {1'b0, wen};
                    wen_a4  = {1'b0, wen};
                    wen_a3  = {1'b0, wen};
                    wen_a2  = {1'b0, wen};
                    wen_a1  = {1'b0, wen};
                    wen_a0  = {1'b0, wen};
                 end
                 default : begin
                    wen_a13 = {1'b0, 1'b0};
                    wen_a12 = {1'b0, 1'b0};
                    wen_a11 = {1'b0, 1'b0};
                    wen_a10 = {1'b0, 1'b0};
                    wen_a9  = {1'b0, 1'b0};
                    wen_a8  = {1'b0, 1'b0};
                    wen_a7  = {1'b0, 1'b0};
                    wen_a6  = {1'b0, 1'b0};
                    wen_a5  = {1'b0, 1'b0};
                    wen_a4  = {1'b0, 1'b0};
                    wen_a3  = {1'b0, 1'b0};
                    wen_a2  = {1'b0, 1'b0};
                    wen_a1  = {1'b0, 1'b0};
                    wen_a0  = {1'b0, 1'b0};
                 end
               endcase // case (writeAddr[14:10])
               
               case(ckRdAddr[14:10])
                 5'b11010, 5'b11011 : begin
                    readData = readData13[7:0];
                 end
                 5'b11000, 5'b11001 : begin
                    readData = readData12[7:0];
                 end
                 5'b10110, 5'b10111 : begin
                    readData = readData11[7:0];
                 end
                 5'b10100, 5'b10101 : begin
                    readData = readData10[7:0];
                 end
                 5'b10010,5'b10011  : begin 
                    readData = readData9[7:0];
                 end
                 5'b10000,5'b10001  : begin 
                    readData = readData8[7:0];
                 end
                 5'b00000,5'b00001,5'b00010,5'b00011,5'b00100,5'b00101,5'b00110,5'b00111,5'b01000,
                 5'b01001,5'b01010,5'b01011,5'b01100,5'b01101,5'b01110,5'b01111  : begin 
                    readData = {
                                readData7[0],
                                readData6[0],
                                readData5[0],
                                readData4[0],
                                readData3[0],
                                readData2[0],
                                readData1[0],
                                readData0[0]
                                };
                 end
                 default : begin
                    readData =  8'b0;
                 end
               endcase // case (writeAddr[14:10])

            end // case: 28672
          

            // RAM30K
            29184,29696,30208,30720: begin

                width14 = 3'b011;
                width13 = 3'b011;
                width12 = 3'b011;
                width11 = 3'b011;
                width10 = 3'b011;
                width9  = 3'b011;
                width8  = 3'b011;
                width7  = 3'b000;
                width6  = 3'b000;
                width5  = 3'b000;
                width4  = 3'b000;
                width3  = 3'b000;
                width2  = 3'b000;
                width1  = 3'b000;
                width0  = 3'b000;

                writeAddr14 = {writeAddr[10:0],3'b0};
                writeAddr13 = {writeAddr[10:0],3'b0};
                writeAddr12 = {writeAddr[10:0],3'b0};
                writeAddr11 = {writeAddr[10:0],3'b0};
                writeAddr10 = {writeAddr[10:0],3'b0};
                writeAddr9  = {writeAddr[10:0],3'b0};
                writeAddr8  = {writeAddr[10:0],3'b0};
                writeAddr7  = writeAddr[13:0];
                writeAddr6  = writeAddr[13:0];
                writeAddr5  = writeAddr[13:0];
                writeAddr4  = writeAddr[13:0];
                writeAddr3  = writeAddr[13:0];
                writeAddr2  = writeAddr[13:0];
                writeAddr1  = writeAddr[13:0];
                writeAddr0  = writeAddr[13:0];

                readAddr14  = {readAddr[10:0],  3'b0};
                readAddr13  = {readAddr[10:0],  3'b0};
                readAddr12  = {readAddr[10:0],  3'b0};
                readAddr11  = {readAddr[10:0],  3'b0};
                readAddr10  = {readAddr[10:0],  3'b0};
                readAddr9   = {readAddr[10:0],  3'b0};
                readAddr8   = {readAddr[10:0],  3'b0};
                readAddr7   = readAddr[13:0];
                readAddr6   = readAddr[13:0];
                readAddr5   = readAddr[13:0];
                readAddr4   = readAddr[13:0];
                readAddr3   = readAddr[13:0];
                readAddr2   = readAddr[13:0];
                readAddr1   = readAddr[13:0];
                readAddr0   = readAddr[13:0];

                writeData14 = {10'b0, writeData[7:0]};
                writeData13 = {10'b0, writeData[7:0]};
                writeData12 = {10'b0, writeData[7:0]};
                writeData11 = {10'b0, writeData[7:0]};
                writeData10 = {10'b0, writeData[7:0]};
                writeData9  = {10'b0, writeData[7:0]};
                writeData8  = {10'b0, writeData[7:0]};
                writeData7  = {17'b0, writeData[7]};
                writeData6  = {17'b0, writeData[6]};
                writeData5  = {17'b0, writeData[5]};
                writeData4  = {17'b0, writeData[4]};
                writeData3  = {17'b0, writeData[3]};
                writeData2  = {17'b0, writeData[2]};
                writeData1  = {17'b0, writeData[1]};
                writeData0  = {17'b0, writeData[0]};


               case(writeAddr[14:10])
                 5'b11100, 5'b11101 : begin
                    wen_a14 = {1'b0, wen};
                    wen_a13 = {1'b0, 1'b0};
                    wen_a12 = {1'b0, 1'b0};
                    wen_a11 = {1'b0, 1'b0};
                    wen_a10 = {1'b0, 1'b0};
                    wen_a9  = {1'b0, 1'b0};
                    wen_a8  = {1'b0, 1'b0};
                    wen_a7  = {1'b0, 1'b0};
                    wen_a6  = {1'b0, 1'b0};
                    wen_a5  = {1'b0, 1'b0};
                    wen_a4  = {1'b0, 1'b0};
                    wen_a3  = {1'b0, 1'b0};
                    wen_a2  = {1'b0, 1'b0};
                    wen_a1  = {1'b0, 1'b0};
                    wen_a0  = {1'b0, 1'b0};
                 end
                 5'b11010, 5'b11011 : begin
                    wen_a14 = {1'b0, 1'b0};
                    wen_a13 = {1'b0, wen};
                    wen_a12 = {1'b0, 1'b0};
                    wen_a11 = {1'b0, 1'b0};
                    wen_a10 = {1'b0, 1'b0};
                    wen_a9  = {1'b0, 1'b0};
                    wen_a8  = {1'b0, 1'b0};
                    wen_a7  = {1'b0, 1'b0};
                    wen_a6  = {1'b0, 1'b0};
                    wen_a5  = {1'b0, 1'b0};
                    wen_a4  = {1'b0, 1'b0};
                    wen_a3  = {1'b0, 1'b0};
                    wen_a2  = {1'b0, 1'b0};
                    wen_a1  = {1'b0, 1'b0};
                    wen_a0  = {1'b0, 1'b0};
                 end
                 5'b11000, 5'b11001 : begin
                    wen_a14 = {1'b0, 1'b0};
                    wen_a13 = {1'b0, 1'b0};
                    wen_a12 = {1'b0, wen};
                    wen_a11 = {1'b0, 1'b0};
                    wen_a10 = {1'b0, 1'b0};
                    wen_a9  = {1'b0, 1'b0};
                    wen_a8  = {1'b0, 1'b0};
                    wen_a7  = {1'b0, 1'b0};
                    wen_a6  = {1'b0, 1'b0};
                    wen_a5  = {1'b0, 1'b0};
                    wen_a4  = {1'b0, 1'b0};
                    wen_a3  = {1'b0, 1'b0};
                    wen_a2  = {1'b0, 1'b0};
                    wen_a1  = {1'b0, 1'b0};
                    wen_a0  = {1'b0, 1'b0};
                 end
                 5'b10110, 5'b10111 : begin
                    wen_a14 = {1'b0, 1'b0};
                    wen_a13 = {1'b0, 1'b0};
                    wen_a12 = {1'b0, 1'b0};
                    wen_a11 = {1'b0, wen};
                    wen_a10 = {1'b0, 1'b0};
                    wen_a9  = {1'b0, 1'b0};
                    wen_a8  = {1'b0, 1'b0};
                    wen_a7  = {1'b0, 1'b0};
                    wen_a6  = {1'b0, 1'b0};
                    wen_a5  = {1'b0, 1'b0};
                    wen_a4  = {1'b0, 1'b0};
                    wen_a3  = {1'b0, 1'b0};
                    wen_a2  = {1'b0, 1'b0};
                    wen_a1  = {1'b0, 1'b0};
                    wen_a0  = {1'b0, 1'b0};
                 end
                 5'b10100, 5'b10101 : begin
                    wen_a14 = {1'b0, 1'b0};
                    wen_a13 = {1'b0, 1'b0};
                    wen_a12 = {1'b0, 1'b0};
                    wen_a11 = {1'b0, 1'b0};
                    wen_a10 = {1'b0, wen};
                    wen_a9  = {1'b0, 1'b0};
                    wen_a8  = {1'b0, 1'b0};
                    wen_a7  = {1'b0, 1'b0};
                    wen_a6  = {1'b0, 1'b0};
                    wen_a5  = {1'b0, 1'b0};
                    wen_a4  = {1'b0, 1'b0};
                    wen_a3  = {1'b0, 1'b0};
                    wen_a2  = {1'b0, 1'b0};
                    wen_a1  = {1'b0, 1'b0};
                    wen_a0  = {1'b0, 1'b0};
                 end
                 5'b10010, 5'b10011 : begin
                    wen_a14 = {1'b0, 1'b0};
                    wen_a13 = {1'b0, 1'b0};
                    wen_a12 = {1'b0, 1'b0};
                    wen_a11 = {1'b0, 1'b0};
                    wen_a10 = {1'b0, 1'b0};
                    wen_a9  = {1'b0, wen};
                    wen_a8  = {1'b0, 1'b0};
                    wen_a7  = {1'b0, 1'b0};
                    wen_a6  = {1'b0, 1'b0};
                    wen_a5  = {1'b0, 1'b0};
                    wen_a4  = {1'b0, 1'b0};
                    wen_a3  = {1'b0, 1'b0};
                    wen_a2  = {1'b0, 1'b0};
                    wen_a1  = {1'b0, 1'b0};
                    wen_a0  = {1'b0, 1'b0};
                 end
                 5'b10000, 5'b10001 : begin
                    wen_a14 = {1'b0, 1'b0};
                    wen_a13 = {1'b0, 1'b0};
                    wen_a12 = {1'b0, 1'b0};
                    wen_a11 = {1'b0, 1'b0};
                    wen_a10 = {1'b0, 1'b0};
                    wen_a9  = {1'b0, 1'b0};
                    wen_a8  = {1'b0, wen};
                    wen_a7  = {1'b0, 1'b0};
                    wen_a6  = {1'b0, 1'b0};
                    wen_a5  = {1'b0, 1'b0};
                    wen_a4  = {1'b0, 1'b0};
                    wen_a3  = {1'b0, 1'b0};
                    wen_a2  = {1'b0, 1'b0};
                    wen_a1  = {1'b0, 1'b0};
                    wen_a0  = {1'b0, 1'b0};
                 end
                 5'b00000,5'b00001,5'b00010,5'b00011,5'b00100,5'b00101,5'b00110,5'b00111,5'b01000,
                 5'b01001,5'b01010,5'b01011,5'b01100,5'b01101,5'b01110,5'b01111  : begin 
                    wen_a14 = {1'b0, 1'b0};
                    wen_a13 = {1'b0, 1'b0};
                    wen_a12 = {1'b0, 1'b0};
                    wen_a11 = {1'b0, 1'b0};
                    wen_a10 = {1'b0, 1'b0};
                    wen_a9  = {1'b0, 1'b0};
                    wen_a8  = {1'b0, 1'b0};
                    wen_a7  = {1'b0, wen};
                    wen_a6  = {1'b0, wen};
                    wen_a5  = {1'b0, wen};
                    wen_a4  = {1'b0, wen};
                    wen_a3  = {1'b0, wen};
                    wen_a2  = {1'b0, wen};
                    wen_a1  = {1'b0, wen};
                    wen_a0  = {1'b0, wen};
                 end
                 default : begin
                    wen_a14 = {1'b0, 1'b0};
                    wen_a13 = {1'b0, 1'b0};
                    wen_a12 = {1'b0, 1'b0};
                    wen_a11 = {1'b0, 1'b0};
                    wen_a10 = {1'b0, 1'b0};
                    wen_a9  = {1'b0, 1'b0};
                    wen_a8  = {1'b0, 1'b0};
                    wen_a7  = {1'b0, 1'b0};
                    wen_a6  = {1'b0, 1'b0};
                    wen_a5  = {1'b0, 1'b0};
                    wen_a4  = {1'b0, 1'b0};
                    wen_a3  = {1'b0, 1'b0};
                    wen_a2  = {1'b0, 1'b0};
                    wen_a1  = {1'b0, 1'b0};
                    wen_a0  = {1'b0, 1'b0};
                 end
               endcase // case (writeAddr[14:10])
               
               case(ckRdAddr[14:10])
                 5'b11100, 5'b11101 : begin
                    readData = readData14[7:0];
                 end
                 5'b11010, 5'b11011 : begin
                    readData = readData13[7:0];
                 end
                 5'b11000, 5'b11001 : begin
                    readData = readData12[7:0];
                 end
                 5'b10110, 5'b10111 : begin
                    readData = readData11[7:0];
                 end
                 5'b10100, 5'b10101 : begin
                    readData = readData10[7:0];
                 end
                 5'b10010,5'b10011  : begin 
                    readData = readData9[7:0];
                 end
                 5'b10000,5'b10001  : begin 
                    readData = readData8[7:0];
                 end
                 5'b00000,5'b00001,5'b00010,5'b00011,5'b00100,5'b00101,5'b00110,5'b00111,5'b01000,
                 5'b01001,5'b01010,5'b01011,5'b01100,5'b01101,5'b01110,5'b01111  : begin 
                    readData = {
                                readData7[0],
                                readData6[0],
                                readData5[0],
                                readData4[0],
                                readData3[0],
                                readData2[0],
                                readData1[0],
                                readData0[0]
                                };
                 end
                 default : begin
                    readData =  8'b0;
                 end
               endcase // case (writeAddr[14:10])

            end // case: 30720
          
            // RAM32K
            31232,31744,32256,32768: begin

                width15 = 3'b000;
                width14 = 3'b000;
                width13 = 3'b000;
                width12 = 3'b000;
                width11 = 3'b000;
                width10 = 3'b000;
                width9  = 3'b000;
                width8  = 3'b000;
                width7  = 3'b000;
                width6  = 3'b000;
                width5  = 3'b000;
                width4  = 3'b000;
                width3  = 3'b000;
                width2  = 3'b000;
                width1  = 3'b000;
                width0  = 3'b000;

                writeAddr15 = writeAddr[13:0];
                writeAddr14 = writeAddr[13:0];
                writeAddr13 = writeAddr[13:0];
                writeAddr12 = writeAddr[13:0];
                writeAddr11 = writeAddr[13:0];
                writeAddr10 = writeAddr[13:0];
                writeAddr9  = writeAddr[13:0];
                writeAddr8  = writeAddr[13:0];
                writeAddr7  = writeAddr[13:0];
                writeAddr6  = writeAddr[13:0];
                writeAddr5  = writeAddr[13:0];
                writeAddr4  = writeAddr[13:0];
                writeAddr3  = writeAddr[13:0];
                writeAddr2  = writeAddr[13:0];
                writeAddr1  = writeAddr[13:0];
                writeAddr0  = writeAddr[13:0];

                readAddr15  = readAddr[13:0];
                readAddr14  = readAddr[13:0];
                readAddr13  = readAddr[13:0];
                readAddr12  = readAddr[13:0];
                readAddr11  = readAddr[13:0];
                readAddr10  = readAddr[13:0];
                readAddr9   = readAddr[13:0];
                readAddr8   = readAddr[13:0];
                readAddr7   = readAddr[13:0];
                readAddr6   = readAddr[13:0];
                readAddr5   = readAddr[13:0];
                readAddr4   = readAddr[13:0];
                readAddr3   = readAddr[13:0];
                readAddr2   = readAddr[13:0];
                readAddr1   = readAddr[13:0];
                readAddr0   = readAddr[13:0];

                writeData15 = {17'b0, writeData[7]};
                writeData14 = {17'b0, writeData[6]};
                writeData13 = {17'b0, writeData[5]};
                writeData12 = {17'b0, writeData[4]};
                writeData11 = {17'b0, writeData[3]};
                writeData10 = {17'b0, writeData[2]};
                writeData9  = {17'b0, writeData[1]};
                writeData8  = {17'b0, writeData[0]};
                writeData7  = {17'b0, writeData[7]};
                writeData6  = {17'b0, writeData[6]};
                writeData5  = {17'b0, writeData[5]};
                writeData4  = {17'b0, writeData[4]};
                writeData3  = {17'b0, writeData[3]};
                writeData2  = {17'b0, writeData[2]};
                writeData1  = {17'b0, writeData[1]};
                writeData0  = {17'b0, writeData[0]};

               case(writeAddr[14:10])
                 5'b10000,5'b10001,5'b10010,5'b10011,5'b10100,5'b10101,5'b10110,5'b10111,5'b11000,
                 5'b11001,5'b11010,5'b11011,5'b11100,5'b11101,5'b11110,5'b11111  : begin 
                    wen_a15 = {1'b0, wen};
                    wen_a14 = {1'b0, wen};
                    wen_a13 = {1'b0, wen};
                    wen_a12 = {1'b0, wen};
                    wen_a11 = {1'b0, wen};
                    wen_a10 = {1'b0, wen};
                    wen_a9  = {1'b0, wen};
                    wen_a8  = {1'b0, wen};
                    wen_a7  = {1'b0, 1'b0};
                    wen_a6  = {1'b0, 1'b0};
                    wen_a5  = {1'b0, 1'b0};
                    wen_a4  = {1'b0, 1'b0};
                    wen_a3  = {1'b0, 1'b0};
                    wen_a2  = {1'b0, 1'b0};
                    wen_a1  = {1'b0, 1'b0};
                    wen_a0  = {1'b0, 1'b0};
                 end
                 5'b00000,5'b00001,5'b00010,5'b00011,5'b00100,5'b00101,5'b00110,5'b00111,5'b01000,
                 5'b01001,5'b01010,5'b01011,5'b01100,5'b01101,5'b01110,5'b01111  : begin 
                    wen_a15 = {1'b0, 1'b0};
                    wen_a14 = {1'b0, 1'b0};
                    wen_a13 = {1'b0, 1'b0};
                    wen_a12 = {1'b0, 1'b0};
                    wen_a11 = {1'b0, 1'b0};
                    wen_a10 = {1'b0, 1'b0};
                    wen_a9  = {1'b0, 1'b0};
                    wen_a8  = {1'b0, 1'b0};
                    wen_a7  = {1'b0, wen};
                    wen_a6  = {1'b0, wen};
                    wen_a5  = {1'b0, wen};
                    wen_a4  = {1'b0, wen};
                    wen_a3  = {1'b0, wen};
                    wen_a2  = {1'b0, wen};
                    wen_a1  = {1'b0, wen};
                    wen_a0  = {1'b0, wen};
                 end
                 default : begin
                    wen_a15 = {1'b0, 1'b0};
                    wen_a14 = {1'b0, 1'b0};
                    wen_a13 = {1'b0, 1'b0};
                    wen_a12 = {1'b0, 1'b0};
                    wen_a11 = {1'b0, 1'b0};
                    wen_a10 = {1'b0, 1'b0};
                    wen_a9  = {1'b0, 1'b0};
                    wen_a8  = {1'b0, 1'b0};
                    wen_a7  = {1'b0, 1'b0};
                    wen_a6  = {1'b0, 1'b0};
                    wen_a5  = {1'b0, 1'b0};
                    wen_a4  = {1'b0, 1'b0};
                    wen_a3  = {1'b0, 1'b0};
                    wen_a2  = {1'b0, 1'b0};
                    wen_a1  = {1'b0, 1'b0};
                    wen_a0  = {1'b0, 1'b0};
                 end
               endcase // case (writeAddr[14:10])
               
               case(ckRdAddr[14:10])
                 5'b10000,5'b10001,5'b10010,5'b10011,5'b10100,5'b10101,5'b10110,5'b10111,5'b11000,
                 5'b11001,5'b11010,5'b11011,5'b11100,5'b11101,5'b11110,5'b11111  : begin 
                    readData = {
                                readData15[0],
                                readData14[0],
                                readData13[0],
                                readData12[0],
                                readData11[0],
                                readData10[0],
                                readData9[0],
                                readData8[0]
                                };
                 end
                 5'b00000,5'b00001,5'b00010,5'b00011,5'b00100,5'b00101,5'b00110,5'b00111,5'b01000,
                 5'b01001,5'b01010,5'b01011,5'b01100,5'b01101,5'b01110,5'b01111  : begin 
                    readData = {
                                readData7[0],
                                readData6[0],
                                readData5[0],
                                readData4[0],
                                readData3[0],
                                readData2[0],
                                readData1[0],
                                readData0[0]
                                };
                 end
                 default : begin
                    readData =  8'b0;
                 end
               endcase // case (writeAddr[14:10])

            end // case: 32768

	    // RAM34K
            33280,33792,34304,34816: begin

                width16 = 3'b011;
                width15 = 3'b000;
                width14 = 3'b000;
                width13 = 3'b000;
                width12 = 3'b000;
                width11 = 3'b000;
                width10 = 3'b000;
                width9  = 3'b000;
                width8  = 3'b000;
                width7  = 3'b000;
                width6  = 3'b000;
                width5  = 3'b000;
                width4  = 3'b000;
                width3  = 3'b000;
                width2  = 3'b000;
                width1  = 3'b000;
                width0  = 3'b000;

                writeAddr16 = {writeAddr[10:0],3'b0};
                writeAddr15 = writeAddr[13:0];
                writeAddr14 = writeAddr[13:0];
                writeAddr13 = writeAddr[13:0];
                writeAddr12 = writeAddr[13:0];
                writeAddr11 = writeAddr[13:0];
                writeAddr10 = writeAddr[13:0];
                writeAddr9  = writeAddr[13:0];
                writeAddr8  = writeAddr[13:0];
                writeAddr7  = writeAddr[13:0];
                writeAddr6  = writeAddr[13:0];
                writeAddr5  = writeAddr[13:0];
                writeAddr4  = writeAddr[13:0];
                writeAddr3  = writeAddr[13:0];
                writeAddr2  = writeAddr[13:0];
                writeAddr1  = writeAddr[13:0];
                writeAddr0  = writeAddr[13:0];

                readAddr16  = {readAddr[10:0],3'b0};
                readAddr15  = readAddr[13:0];
                readAddr14  = readAddr[13:0];
                readAddr13  = readAddr[13:0];
                readAddr12  = readAddr[13:0];
                readAddr11  = readAddr[13:0];
                readAddr10  = readAddr[13:0];
                readAddr9   = readAddr[13:0];
                readAddr8   = readAddr[13:0];
                readAddr7   = readAddr[13:0];
                readAddr6   = readAddr[13:0];
                readAddr5   = readAddr[13:0];
                readAddr4   = readAddr[13:0];
                readAddr3   = readAddr[13:0];
                readAddr2   = readAddr[13:0];
                readAddr1   = readAddr[13:0];
                readAddr0   = readAddr[13:0];

                writeData16 = {10'b0, writeData[7:0]};
                writeData15 = {17'b0, writeData[7]};
                writeData14 = {17'b0, writeData[6]};
                writeData13 = {17'b0, writeData[5]};
                writeData12 = {17'b0, writeData[4]};
                writeData11 = {17'b0, writeData[3]};
                writeData10 = {17'b0, writeData[2]};
                writeData9  = {17'b0, writeData[1]};
                writeData8  = {17'b0, writeData[0]};
                writeData7  = {17'b0, writeData[7]};
                writeData6  = {17'b0, writeData[6]};
                writeData5  = {17'b0, writeData[5]};
                writeData4  = {17'b0, writeData[4]};
                writeData3  = {17'b0, writeData[3]};
                writeData2  = {17'b0, writeData[2]};
                writeData1  = {17'b0, writeData[1]};
                writeData0  = {17'b0, writeData[0]};


               case(writeAddr[15:10])
                 6'b100000,6'b100001  : begin 
                    wen_a16 = {1'b0, wen};
                    wen_a15 = {1'b0, 1'b0};
                    wen_a14 = {1'b0, 1'b0};
                    wen_a13 = {1'b0, 1'b0};
                    wen_a12 = {1'b0, 1'b0};
                    wen_a11 = {1'b0, 1'b0};
                    wen_a10 = {1'b0, 1'b0};
                    wen_a9  = {1'b0, 1'b0};
                    wen_a8  = {1'b0, 1'b0};
                    wen_a7  = {1'b0, 1'b0};
                    wen_a6  = {1'b0, 1'b0};
                    wen_a5  = {1'b0, 1'b0};
                    wen_a4  = {1'b0, 1'b0};
                    wen_a3  = {1'b0, 1'b0};
                    wen_a2  = {1'b0, 1'b0};
                    wen_a1  = {1'b0, 1'b0};
                    wen_a0  = {1'b0, 1'b0};
                 end
                 6'b010000,6'b010001,6'b010010,6'b010011,6'b010100,6'b010101,6'b010110,6'b010111,6'b011000,
                 6'b011001,6'b011010,6'b011011,6'b011100,6'b011101,6'b011110,6'b011111  : begin 
                    wen_a16 = {1'b0, 1'b0};
                    wen_a15 = {1'b0, wen};
                    wen_a14 = {1'b0, wen};
                    wen_a13 = {1'b0, wen};
                    wen_a12 = {1'b0, wen};
                    wen_a11 = {1'b0, wen};
                    wen_a10 = {1'b0, wen};
                    wen_a9  = {1'b0, wen};
                    wen_a8  = {1'b0, wen};
                    wen_a7  = {1'b0, 1'b0};
                    wen_a6  = {1'b0, 1'b0};
                    wen_a5  = {1'b0, 1'b0};
                    wen_a4  = {1'b0, 1'b0};
                    wen_a3  = {1'b0, 1'b0};
                    wen_a2  = {1'b0, 1'b0};
                    wen_a1  = {1'b0, 1'b0};
                    wen_a0  = {1'b0, 1'b0};
                 end
                 6'b000000,6'b000001,6'b000010,6'b000011,6'b000100,6'b000101,6'b000110,6'b000111,6'b001000,
                 6'b001001,6'b001010,6'b001011,6'b001100,6'b001101,6'b001110,6'b001111  : begin 
                    wen_a16 = {1'b0, 1'b0};
                    wen_a15 = {1'b0, 1'b0};
                    wen_a14 = {1'b0, 1'b0};
                    wen_a13 = {1'b0, 1'b0};
                    wen_a12 = {1'b0, 1'b0};
                    wen_a11 = {1'b0, 1'b0};
                    wen_a10 = {1'b0, 1'b0};
                    wen_a9  = {1'b0, 1'b0};
                    wen_a8  = {1'b0, 1'b0};
                    wen_a7  = {1'b0, wen};
                    wen_a6  = {1'b0, wen};
                    wen_a5  = {1'b0, wen};
                    wen_a4  = {1'b0, wen};
                    wen_a3  = {1'b0, wen};
                    wen_a2  = {1'b0, wen};
                    wen_a1  = {1'b0, wen};
                    wen_a0  = {1'b0, wen};
                 end
                 default : begin
                    wen_a16 = {1'b0, 1'b0};
                    wen_a15 = {1'b0, 1'b0};
                    wen_a14 = {1'b0, 1'b0};
                    wen_a13 = {1'b0, 1'b0};
                    wen_a12 = {1'b0, 1'b0};
                    wen_a11 = {1'b0, 1'b0};
                    wen_a10 = {1'b0, 1'b0};
                    wen_a9  = {1'b0, 1'b0};
                    wen_a8  = {1'b0, 1'b0};
                    wen_a7  = {1'b0, 1'b0};
                    wen_a6  = {1'b0, 1'b0};
                    wen_a5  = {1'b0, 1'b0};
                    wen_a4  = {1'b0, 1'b0};
                    wen_a3  = {1'b0, 1'b0};
                    wen_a2  = {1'b0, 1'b0};
                    wen_a1  = {1'b0, 1'b0};
                    wen_a0  = {1'b0, 1'b0};
                 end
               endcase // case (writeAddr[14:10])
               
               case(ckRdAddr[15:10])
                 6'b100000,6'b100001  : begin 
                    readData = readData16[7:0];                    
                 end
                 6'b010000,6'b010001,6'b010010,6'b010011,6'b010100,6'b010101,6'b010110,6'b010111,6'b011000,
                 6'b011001,6'b011010,6'b011011,6'b011100,6'b011101,6'b011110,6'b011111  : begin 
                    readData = {
                                readData15[0],
                                readData14[0],
                                readData13[0],
                                readData12[0],
                                readData11[0],
                                readData10[0],
                                readData9[0],
                                readData8[0]
                                };
                 end
                 6'b000000,6'b000001,6'b000010,6'b000011,6'b000100,6'b000101,6'b000110,6'b000111,6'b001000,
                 6'b001001,6'b001010,6'b001011,6'b001100,6'b001101,6'b001110,6'b001111  : begin 
                    readData = {
                                readData7[0],
                                readData6[0],
                                readData5[0],
                                readData4[0],
                                readData3[0],
                                readData2[0],
                                readData1[0],
                                readData0[0]
                                };
                 end
                 default : begin
                    readData =  8'b0;
                 end
               endcase // case (writeAddr[14:10])

            end // case: 34816

        endcase // case (DEPTH)
    end // always @ (*)
   
          
    //----------------------------------------------------------------------------------------
    // RAM1K18 blocks
    //----------------------------------------------------------------------------------------

    RAM1K18 block16 (
        .A_DOUT (readData16),           .B_DOUT (),
        .A_CLK (clk),                  .B_CLK (clk), 
        .A_ARST_N (resetn),            .B_ARST_N (resetn), 
        .A_BLK (3'b111),               .B_BLK (3'b111), 
        .A_DIN (writeData16),           .B_DIN (writeData16), 
        .A_ADDR (writeAddr16),          .B_ADDR (writeAddr16), 
        .A_WEN (wen_a16),               .B_WEN (wen_b16),
        .A_DOUT_CLK (1'b1),            .B_DOUT_CLK (1'b1), 
        .A_DOUT_EN (1'b1),             .B_DOUT_EN (1'b1), 
        .A_DOUT_ARST_N (1'b1),         .B_DOUT_ARST_N (1'b1), 
        .A_DOUT_SRST_N (1'b1),         .B_DOUT_SRST_N (1'b1), 
        .A_DOUT_LAT (1'b1),            .B_DOUT_LAT (1'b1),
        .A_WIDTH (width16),             .B_WIDTH (width16), 
        .A_WMODE (1'b0),               .B_WMODE (1'b0),
        .A_EN (1'b1),                  .B_EN (1'b1),
        .BUSY (lsram_2k_BUSY_16),
        .SII_LOCK (1'b0)
    );

    RAM1K18 block15 (
        .A_DOUT (readData15),           .B_DOUT (),
        .A_CLK (clk),                  .B_CLK (clk), 
        .A_ARST_N (resetn),            .B_ARST_N (resetn), 
        .A_BLK (3'b111),               .B_BLK (3'b111), 
        .A_DIN (writeData15),           .B_DIN (writeData15), 
        .A_ADDR (writeAddr15),          .B_ADDR (writeAddr15), 
        .A_WEN (wen_a15),               .B_WEN (wen_b15),
        .A_DOUT_CLK (1'b1),            .B_DOUT_CLK (1'b1), 
        .A_DOUT_EN (1'b1),             .B_DOUT_EN (1'b1), 
        .A_DOUT_ARST_N (1'b1),         .B_DOUT_ARST_N (1'b1), 
        .A_DOUT_SRST_N (1'b1),         .B_DOUT_SRST_N (1'b1), 
        .A_DOUT_LAT (1'b1),            .B_DOUT_LAT (1'b1),
        .A_WIDTH (width15),             .B_WIDTH (width15), 
        .A_WMODE (1'b0),               .B_WMODE (1'b0),
        .A_EN (1'b1),                  .B_EN (1'b1),
        .BUSY (lsram_2k_BUSY_15),
        .SII_LOCK (1'b0)
    );

    RAM1K18 block14 (
        .A_DOUT (readData14),           .B_DOUT (),
        .A_CLK (clk),                  .B_CLK (clk), 
        .A_ARST_N (resetn),            .B_ARST_N (resetn), 
        .A_BLK (3'b111),               .B_BLK (3'b111), 
        .A_DIN (writeData14),           .B_DIN (writeData14), 
        .A_ADDR (writeAddr14),          .B_ADDR (writeAddr14), 
        .A_WEN (wen_a14),               .B_WEN (wen_b14),
        .A_DOUT_CLK (1'b1),            .B_DOUT_CLK (1'b1), 
        .A_DOUT_EN (1'b1),             .B_DOUT_EN (1'b1), 
        .A_DOUT_ARST_N (1'b1),         .B_DOUT_ARST_N (1'b1), 
        .A_DOUT_SRST_N (1'b1),         .B_DOUT_SRST_N (1'b1), 
        .A_DOUT_LAT (1'b1),            .B_DOUT_LAT (1'b1),
        .A_WIDTH (width14),             .B_WIDTH (width14), 
        .A_WMODE (1'b0),               .B_WMODE (1'b0),
        .A_EN (1'b1),                  .B_EN (1'b1),
        .BUSY (lsram_2k_BUSY_14),
        .SII_LOCK (1'b0)
    );

    RAM1K18 block13 (
        .A_DOUT (readData13),           .B_DOUT (),
        .A_CLK (clk),                  .B_CLK (clk), 
        .A_ARST_N (resetn),            .B_ARST_N (resetn), 
        .A_BLK (3'b111),               .B_BLK (3'b111), 
        .A_DIN (writeData13),           .B_DIN (writeData13), 
        .A_ADDR (writeAddr13),          .B_ADDR (writeAddr13), 
        .A_WEN (wen_a13),               .B_WEN (wen_b13),
        .A_DOUT_CLK (1'b1),            .B_DOUT_CLK (1'b1), 
        .A_DOUT_EN (1'b1),             .B_DOUT_EN (1'b1), 
        .A_DOUT_ARST_N (1'b1),         .B_DOUT_ARST_N (1'b1), 
        .A_DOUT_SRST_N (1'b1),         .B_DOUT_SRST_N (1'b1), 
        .A_DOUT_LAT (1'b1),            .B_DOUT_LAT (1'b1),
        .A_WIDTH (width13),             .B_WIDTH (width13), 
        .A_WMODE (1'b0),               .B_WMODE (1'b0),
        .A_EN (1'b1),                  .B_EN (1'b1),
        .BUSY (lsram_2k_BUSY_13),
        .SII_LOCK (1'b0)
    );

    RAM1K18 block12 (
        .A_DOUT (readData12),           .B_DOUT (),
        .A_CLK (clk),                  .B_CLK (clk), 
        .A_ARST_N (resetn),            .B_ARST_N (resetn), 
        .A_BLK (3'b111),               .B_BLK (3'b111), 
        .A_DIN (writeData12),           .B_DIN (writeData12), 
        .A_ADDR (writeAddr12),          .B_ADDR (writeAddr12), 
        .A_WEN (wen_a12),               .B_WEN (wen_b12),
        .A_DOUT_CLK (1'b1),            .B_DOUT_CLK (1'b1), 
        .A_DOUT_EN (1'b1),             .B_DOUT_EN (1'b1), 
        .A_DOUT_ARST_N (1'b1),         .B_DOUT_ARST_N (1'b1), 
        .A_DOUT_SRST_N (1'b1),         .B_DOUT_SRST_N (1'b1), 
        .A_DOUT_LAT (1'b1),            .B_DOUT_LAT (1'b1),
        .A_WIDTH (width12),             .B_WIDTH (width12), 
        .A_WMODE (1'b0),               .B_WMODE (1'b0),
        .A_EN (1'b1),                  .B_EN (1'b1),
        .BUSY (lsram_2k_BUSY_12),
        .SII_LOCK (1'b0)
    );

    RAM1K18 block11 (
        .A_DOUT (readData11),           .B_DOUT (),
        .A_CLK (clk),                  .B_CLK (clk), 
        .A_ARST_N (resetn),            .B_ARST_N (resetn), 
        .A_BLK (3'b111),               .B_BLK (3'b111), 
        .A_DIN (writeData11),           .B_DIN (writeData11), 
        .A_ADDR (writeAddr11),          .B_ADDR (writeAddr11), 
        .A_WEN (wen_a11),               .B_WEN (wen_b11),
        .A_DOUT_CLK (1'b1),            .B_DOUT_CLK (1'b1), 
        .A_DOUT_EN (1'b1),             .B_DOUT_EN (1'b1), 
        .A_DOUT_ARST_N (1'b1),         .B_DOUT_ARST_N (1'b1), 
        .A_DOUT_SRST_N (1'b1),         .B_DOUT_SRST_N (1'b1), 
        .A_DOUT_LAT (1'b1),            .B_DOUT_LAT (1'b1),
        .A_WIDTH (width11),             .B_WIDTH (width11), 
        .A_WMODE (1'b0),               .B_WMODE (1'b0),
        .A_EN (1'b1),                  .B_EN (1'b1),
        .BUSY (lsram_2k_BUSY_11),
        .SII_LOCK (1'b0)
    );

    RAM1K18 block10 (
        .A_DOUT (readData10),           .B_DOUT (),
        .A_CLK (clk),                  .B_CLK (clk), 
        .A_ARST_N (resetn),            .B_ARST_N (resetn), 
        .A_BLK (3'b111),               .B_BLK (3'b111), 
        .A_DIN (writeData10),           .B_DIN (writeData10), 
        .A_ADDR (writeAddr10),          .B_ADDR (writeAddr10), 
        .A_WEN (wen_a10),               .B_WEN (wen_b10),
        .A_DOUT_CLK (1'b1),            .B_DOUT_CLK (1'b1), 
        .A_DOUT_EN (1'b1),             .B_DOUT_EN (1'b1), 
        .A_DOUT_ARST_N (1'b1),         .B_DOUT_ARST_N (1'b1), 
        .A_DOUT_SRST_N (1'b1),         .B_DOUT_SRST_N (1'b1), 
        .A_DOUT_LAT (1'b1),            .B_DOUT_LAT (1'b1),
        .A_WIDTH (width10),             .B_WIDTH (width10), 
        .A_WMODE (1'b0),               .B_WMODE (1'b0),
        .A_EN (1'b1),                  .B_EN (1'b1),
        .BUSY (lsram_2k_BUSY_10),
        .SII_LOCK (1'b0)
    );

    RAM1K18 block9 (
        .A_DOUT (readData9),           .B_DOUT (),
        .A_CLK (clk),                  .B_CLK (clk), 
        .A_ARST_N (resetn),            .B_ARST_N (resetn), 
        .A_BLK (3'b111),               .B_BLK (3'b111), 
        .A_DIN (writeData9),           .B_DIN (writeData9), 
        .A_ADDR (writeAddr9),          .B_ADDR (writeAddr9), 
        .A_WEN (wen_a9),               .B_WEN (wen_b9),
        .A_DOUT_CLK (1'b1),            .B_DOUT_CLK (1'b1), 
        .A_DOUT_EN (1'b1),             .B_DOUT_EN (1'b1), 
        .A_DOUT_ARST_N (1'b1),         .B_DOUT_ARST_N (1'b1), 
        .A_DOUT_SRST_N (1'b1),         .B_DOUT_SRST_N (1'b1), 
        .A_DOUT_LAT (1'b1),            .B_DOUT_LAT (1'b1),
        .A_WIDTH (width9),             .B_WIDTH (width9), 
        .A_WMODE (1'b0),               .B_WMODE (1'b0),
        .A_EN (1'b1),                  .B_EN (1'b1),
        .BUSY (lsram_2k_BUSY_9),
        .SII_LOCK (1'b0)
    );

    RAM1K18 block8 (
        .A_DOUT (readData8),           .B_DOUT (),
        .A_CLK (clk),                  .B_CLK (clk), 
        .A_ARST_N (resetn),            .B_ARST_N (resetn), 
        .A_BLK (3'b111),               .B_BLK (3'b111), 
        .A_DIN (writeData8),           .B_DIN (writeData8), 
        .A_ADDR (writeAddr8),          .B_ADDR (writeAddr8), 
        .A_WEN (wen_a8),               .B_WEN (wen_b8),
        .A_DOUT_CLK (1'b1),            .B_DOUT_CLK (1'b1), 
        .A_DOUT_EN (1'b1),             .B_DOUT_EN (1'b1), 
        .A_DOUT_ARST_N (1'b1),         .B_DOUT_ARST_N (1'b1), 
        .A_DOUT_SRST_N (1'b1),         .B_DOUT_SRST_N (1'b1), 
        .A_DOUT_LAT (1'b1),            .B_DOUT_LAT (1'b1),
        .A_WIDTH (width8),             .B_WIDTH (width8), 
        .A_WMODE (1'b0),               .B_WMODE (1'b0),
        .A_EN (1'b1),                  .B_EN (1'b1),
        .BUSY (lsram_2k_BUSY_8),
        .SII_LOCK (1'b0)
    );

    RAM1K18 block7 (
        .A_DOUT (readData7),           .B_DOUT (),
        .A_CLK (clk),                  .B_CLK (clk), 
        .A_ARST_N (resetn),            .B_ARST_N (resetn), 
        .A_BLK (3'b111),               .B_BLK (3'b111), 
        .A_DIN (writeData7),           .B_DIN (writeData7), 
        .A_ADDR (writeAddr7),          .B_ADDR (writeAddr7), 
        .A_WEN (wen_a7),               .B_WEN (wen_b7),
        .A_DOUT_CLK (1'b1),            .B_DOUT_CLK (1'b1), 
        .A_DOUT_EN (1'b1),             .B_DOUT_EN (1'b1), 
        .A_DOUT_ARST_N (1'b1),         .B_DOUT_ARST_N (1'b1), 
        .A_DOUT_SRST_N (1'b1),         .B_DOUT_SRST_N (1'b1), 
        .A_DOUT_LAT (1'b1),            .B_DOUT_LAT (1'b1),
        .A_WIDTH (width7),             .B_WIDTH (width7), 
        .A_WMODE (1'b0),               .B_WMODE (1'b0),
        .A_EN (1'b1),                  .B_EN (1'b1),
        .BUSY (lsram_2k_BUSY_7),
        .SII_LOCK (1'b0)
    );

  RAM1K18 block6 (
        .A_DOUT (readData6),           .B_DOUT (),
        .A_CLK (clk),                  .B_CLK (clk), 
        .A_ARST_N (resetn),            .B_ARST_N (resetn), 
        .A_BLK (3'b111),               .B_BLK (3'b111), 
        .A_DIN (writeData6),           .B_DIN (writeData6), 
        .A_ADDR (writeAddr6),          .B_ADDR (writeAddr6), 
        .A_WEN (wen_a6),               .B_WEN (wen_b6),
        .A_DOUT_CLK (1'b1),            .B_DOUT_CLK (1'b1), 
        .A_DOUT_EN (1'b1),             .B_DOUT_EN (1'b1), 
        .A_DOUT_ARST_N (1'b1),         .B_DOUT_ARST_N (1'b1), 
        .A_DOUT_SRST_N (1'b1),         .B_DOUT_SRST_N (1'b1), 
        .A_DOUT_LAT (1'b1),            .B_DOUT_LAT (1'b1),
        .A_WIDTH (width6),             .B_WIDTH (width6), 
        .A_WMODE (1'b0),               .B_WMODE (1'b0),
        .A_EN (1'b1),                  .B_EN (1'b1),
        .BUSY (lsram_2k_BUSY_6),
        .SII_LOCK (1'b0)
    );

    RAM1K18 block5 (
        .A_DOUT (readData5),           .B_DOUT (),
        .A_CLK (clk),                  .B_CLK (clk), 
        .A_ARST_N (resetn),            .B_ARST_N (resetn), 
        .A_BLK (3'b111),               .B_BLK (3'b111), 
        .A_DIN (writeData5),           .B_DIN (writeData5), 
        .A_ADDR (writeAddr5),          .B_ADDR (writeAddr5), 
        .A_WEN (wen_a5),               .B_WEN (wen_b5),
        .A_DOUT_CLK (1'b1),            .B_DOUT_CLK (1'b1), 
        .A_DOUT_EN (1'b1),             .B_DOUT_EN (1'b1), 
        .A_DOUT_ARST_N (1'b1),         .B_DOUT_ARST_N (1'b1), 
        .A_DOUT_SRST_N (1'b1),         .B_DOUT_SRST_N (1'b1), 
        .A_DOUT_LAT (1'b1),            .B_DOUT_LAT (1'b1),
        .A_WIDTH (width5),             .B_WIDTH (width5), 
        .A_WMODE (1'b0),               .B_WMODE (1'b0),
        .A_EN (1'b1),                  .B_EN (1'b1),
        .BUSY (lsram_2k_BUSY_5),
        .SII_LOCK (1'b0)
    );

    RAM1K18 block4 (
        .A_DOUT (readData4),           .B_DOUT (),
        .A_CLK (clk),                  .B_CLK (clk), 
        .A_ARST_N (resetn),            .B_ARST_N (resetn), 
        .A_BLK (3'b111),               .B_BLK (3'b111), 
        .A_DIN (writeData4),           .B_DIN (writeData4), 
        .A_ADDR (writeAddr4),          .B_ADDR (writeAddr4), 
        .A_WEN (wen_a4),               .B_WEN (wen_b4),
        .A_DOUT_CLK (1'b1),            .B_DOUT_CLK (1'b1), 
        .A_DOUT_EN (1'b1),             .B_DOUT_EN (1'b1), 
        .A_DOUT_ARST_N (1'b1),         .B_DOUT_ARST_N (1'b1), 
        .A_DOUT_SRST_N (1'b1),         .B_DOUT_SRST_N (1'b1), 
        .A_DOUT_LAT (1'b1),            .B_DOUT_LAT (1'b1),
        .A_WIDTH (width4),             .B_WIDTH (width4), 
        .A_WMODE (1'b0),               .B_WMODE (1'b0),
        .A_EN (1'b1),                  .B_EN (1'b1),
        .BUSY (lsram_2k_BUSY_4),
        .SII_LOCK (1'b0)
    );

    RAM1K18 block3 (
        .A_DOUT (readData3),           .B_DOUT (),
        .A_CLK (clk),                  .B_CLK (clk), 
        .A_ARST_N (resetn),            .B_ARST_N (resetn), 
        .A_BLK (3'b111),               .B_BLK (3'b111), 
        .A_DIN (writeData3),           .B_DIN (writeData3), 
        .A_ADDR (writeAddr3),          .B_ADDR (writeAddr3), 
        .A_WEN (wen_a3),               .B_WEN (wen_b3),
        .A_DOUT_CLK (1'b1),            .B_DOUT_CLK (1'b1), 
        .A_DOUT_EN (1'b1),             .B_DOUT_EN (1'b1), 
        .A_DOUT_ARST_N (1'b1),         .B_DOUT_ARST_N (1'b1), 
        .A_DOUT_SRST_N (1'b1),         .B_DOUT_SRST_N (1'b1), 
        .A_DOUT_LAT (1'b1),            .B_DOUT_LAT (1'b1),
        .A_WIDTH (width3),             .B_WIDTH (width3), 
        .A_WMODE (1'b0),               .B_WMODE (1'b0),
        .A_EN (1'b1),                  .B_EN (1'b1),
        .BUSY (lsram_2k_BUSY_3),
        .SII_LOCK (1'b0)
    );

    RAM1K18 block2 (
        .A_DOUT (readData2),           .B_DOUT (),
        .A_CLK (clk),                  .B_CLK (clk), 
        .A_ARST_N (resetn),            .B_ARST_N (resetn), 
        .A_BLK (3'b111),               .B_BLK (3'b111), 
        .A_DIN (writeData2),           .B_DIN (writeData2), 
        .A_ADDR (writeAddr2),          .B_ADDR (writeAddr2), 
        .A_WEN (wen_a2),               .B_WEN (wen_b2),
        .A_DOUT_CLK (1'b1),            .B_DOUT_CLK (1'b1), 
        .A_DOUT_EN (1'b1),             .B_DOUT_EN (1'b1), 
        .A_DOUT_ARST_N (1'b1),         .B_DOUT_ARST_N (1'b1), 
        .A_DOUT_SRST_N (1'b1),         .B_DOUT_SRST_N (1'b1), 
        .A_DOUT_LAT (1'b1),            .B_DOUT_LAT (1'b1),
        .A_WIDTH (width2),             .B_WIDTH (width2), 
        .A_WMODE (1'b0),               .B_WMODE (1'b0),
        .A_EN (1'b1),                  .B_EN (1'b1),
        .BUSY (lsram_2k_BUSY_2),
        .SII_LOCK (1'b0)
    );

    RAM1K18 block1 (
        .A_DOUT (readData1),           .B_DOUT (),
        .A_CLK (clk),                  .B_CLK (clk), 
        .A_ARST_N (resetn),            .B_ARST_N (resetn), 
        .A_BLK (3'b111),               .B_BLK (3'b111), 
        .A_DIN (writeData1),           .B_DIN (writeData1), 
        .A_ADDR (writeAddr1),          .B_ADDR (writeAddr1), 
        .A_WEN (wen_a1),               .B_WEN (wen_b1),
        .A_DOUT_CLK (1'b1),            .B_DOUT_CLK (1'b1), 
        .A_DOUT_EN (1'b1),             .B_DOUT_EN (1'b1), 
        .A_DOUT_ARST_N (1'b1),         .B_DOUT_ARST_N (1'b1), 
        .A_DOUT_SRST_N (1'b1),         .B_DOUT_SRST_N (1'b1), 
        .A_DOUT_LAT (1'b1),            .B_DOUT_LAT (1'b1),
        .A_WIDTH (width1),             .B_WIDTH (width1), 
        .A_WMODE (1'b0),               .B_WMODE (1'b0),
        .A_EN (1'b1),                  .B_EN (1'b1),
        .BUSY (lsram_2k_BUSY_1),
        .SII_LOCK (1'b0)
    );

    RAM1K18 block0 (
        .A_DOUT (readData0),           .B_DOUT (),
        .A_CLK (clk),                  .B_CLK (clk), 
        .A_ARST_N (resetn),            .B_ARST_N (resetn), 
        .A_BLK (3'b111),               .B_BLK (3'b111), 
        .A_DIN (writeData0),           .B_DIN (writeData0), 
        .A_ADDR (writeAddr0),          .B_ADDR (writeAddr0), 
        .A_WEN (wen_a0),               .B_WEN (wen_b0),
        .A_DOUT_CLK (1'b1),            .B_DOUT_CLK (1'b1), 
        .A_DOUT_EN (1'b1),             .B_DOUT_EN (1'b1), 
        .A_DOUT_ARST_N (1'b1),         .B_DOUT_ARST_N (1'b1), 
        .A_DOUT_SRST_N (1'b1),         .B_DOUT_SRST_N (1'b1), 
        .A_DOUT_LAT (1'b1),            .B_DOUT_LAT (1'b1),
        .A_WIDTH (width0),             .B_WIDTH (width0), 
        .A_WMODE (1'b0),               .B_WMODE (1'b0),
        .A_EN (1'b1),                  .B_EN (1'b1),
        .BUSY (lsram_2k_BUSY_0),
        .SII_LOCK (1'b0)
    );

assign l_BUSY_all = lsram_2k_BUSY_0 | lsram_2k_BUSY_1 | lsram_2k_BUSY_2 | lsram_2k_BUSY_3 | lsram_2k_BUSY_4 | lsram_2k_BUSY_5 | 
                            lsram_2k_BUSY_6 | lsram_2k_BUSY_7 | lsram_2k_BUSY_8 | lsram_2k_BUSY_9 | lsram_2k_BUSY_10 | lsram_2k_BUSY_11 | 
                           lsram_2k_BUSY_12 | lsram_2k_BUSY_13 | lsram_2k_BUSY_14 | lsram_2k_BUSY_15 | lsram_2k_BUSY_16;


endmodule // Webserver_TCP_sb_COREAHBLSRAM_0_0_lsram_2048to139264x8



