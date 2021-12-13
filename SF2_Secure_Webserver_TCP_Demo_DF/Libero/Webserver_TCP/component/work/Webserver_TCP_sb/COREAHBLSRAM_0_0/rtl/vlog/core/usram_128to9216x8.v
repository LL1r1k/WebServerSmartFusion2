// ********************************************************************/
// Actel Corporation Proprietary and Confidential
//  Copyright 2011 Actel Corporation.  All rights reserved.
//
// ANY USE OR REDISTRIBUTION IN PART OR IN WHOLE MUST BE HANDLED IN
// ACCORDANCE WITH THE ACTEL LICENSE AGREEMENT AND MUST BE APPROVED
// IN ADVANCE IN WRITING.
//
// Description:  SRAM block, 4 byte wide, 64 to 2304 deep (in steps
//               of 64 for Word accesses), 64 to 4608 deep (in steps
//               of 64 for Half-Word accesses) and 64 to 4608 deep (in 
//               steps of 128 for Byte accesses) used to construct 
//               the memory.
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

module Webserver_TCP_sb_COREAHBLSRAM_0_0_usram_128to9216x8
  (
   writeData,
   readData,
   wen,
   ren,
   writeAddr,
   readAddr,
   clk,
   resetn,
   u_BUSY_all
   );

// ---------------------------------------------------------------------
// Parameters
// ---------------------------------------------------------------------
// DEPTH can range from
// 128 to 9216bytes  , in steps of 128bytes

   parameter USRAM_NUM_LOCATIONS_DWIDTH32 = 128;

// ---------------------------------------------------------------------
// Port declarations
// ---------------------------------------------------------------------

   // Inputs
   input [7:0] writeData;

   // Inputs
   input        wen;
   input        ren;
   input [15:0] writeAddr;
   input [15:0] readAddr;
   input        clk;
   input        resetn;
   
    // Output
   output [7:0] readData;
   output                  u_BUSY_all;
   
// ---------------------------------------------------------------------
// Signal declarations
// ---------------------------------------------------------------------
   reg [7:0]    readData;
        reg     [13:6]                  ckRdAddr;

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
        reg     [2:0]                   width17;

        reg                             wen_a0;
        reg                             wen_a1;
        reg                             wen_a2;
        reg                             wen_a3;
        reg                             wen_a4;
        reg                             wen_a5;
        reg                             wen_a6;
        reg                             wen_a7;
        reg                             wen_a8;
        reg                             wen_a9;
        reg                             wen_a10;
        reg                             wen_a11;
        reg                             wen_a12;
        reg                             wen_a13;
        reg                             wen_a14;
        reg                             wen_a15;
        reg                             wen_a16;
        reg                             wen_a17;

        reg                             wen_b0;
        reg                             wen_b1;
        reg                             wen_b2;
        reg                             wen_b3;
        reg                             wen_b4;
        reg                             wen_b5;
        reg                             wen_b6;
        reg                             wen_b7;
        reg                             wen_b8;
        reg                             wen_b9;
        reg                             wen_b10;
        reg                             wen_b11;
        reg                             wen_b12;
        reg                             wen_b13;
        reg                             wen_b14;
        reg                             wen_b15;
        reg                             wen_b16;
        reg                             wen_b17;

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
        reg     [17:0]                   writeData17;

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
        wire    [17:0]                   readData17;

        reg     [9:0]                  writeAddr0;
        reg     [9:0]                  writeAddr1;
        reg     [9:0]                  writeAddr2;
        reg     [9:0]                  writeAddr3;
        reg     [9:0]                  writeAddr4;
        reg     [9:0]                  writeAddr5;
        reg     [9:0]                  writeAddr6;
        reg     [9:0]                  writeAddr7;
        reg     [9:0]                  writeAddr8;
        reg     [9:0]                  writeAddr9;
        reg     [9:0]                  writeAddr10;
        reg     [9:0]                  writeAddr11;
        reg     [9:0]                  writeAddr12;
        reg     [9:0]                  writeAddr13;
        reg     [9:0]                  writeAddr14;
        reg     [9:0]                  writeAddr15;
        reg     [9:0]                  writeAddr16;
        reg     [9:0]                  writeAddr17;

        reg     [9:0]                  readAddr0;
        reg     [9:0]                  readAddr1;
        reg     [9:0]                  readAddr2;
        reg     [9:0]                  readAddr3;
        reg     [9:0]                  readAddr4;
        reg     [9:0]                  readAddr5;
        reg     [9:0]                  readAddr6;
        reg     [9:0]                  readAddr7;
        reg     [9:0]                  readAddr8;
        reg     [9:0]                  readAddr9;
        reg     [9:0]                  readAddr10;
        reg     [9:0]                  readAddr11;
        reg     [9:0]                  readAddr12;
        reg     [9:0]                  readAddr13;
        reg     [9:0]                  readAddr14;
        reg     [9:0]                  readAddr15;
        reg     [9:0]                  readAddr16;
        reg     [9:0]                  readAddr17;

   reg [1:0]                           ablk;
   reg [1:0]                           bblk;

   
   wire                                 u_BUSY_all;

   wire                                 u_BUSY_17;
   wire                                 u_BUSY_16;
   wire                                 u_BUSY_15;
   wire                                 u_BUSY_14;
   wire                                 u_BUSY_13;
   wire                                 u_BUSY_12;
   wire                                 u_BUSY_11;
   wire                                 u_BUSY_10;
   wire                                 u_BUSY_9;
   wire                                 u_BUSY_8;
   wire                                 u_BUSY_7;
   wire                                 u_BUSY_6;
   wire                                 u_BUSY_5;
   wire                                 u_BUSY_4;
   wire                                 u_BUSY_3;
   wire                                 u_BUSY_2;
   wire                                 u_BUSY_1;
   wire                                 u_BUSY_0;
   
   

//----------------------------------------------------------------------
// Main body of code
//----------------------------------------------------------------------

    always @ (posedge clk or negedge resetn)
    begin
       if (!resetn)
         ckRdAddr[13:6] <= 8'b00000000;
       else
         ckRdAddr[13:6] <= readAddr[13:6];
    end

    //----------------------------------------------------------------------------------------
    // Assign values to various signals based on DEPTH and RAM64x16_WIDTH settings.
    // Default is to build the (byte wide) memory from RAM blocks which are configured to
    // be tall and narrow.
    //----------------------------------------------------------------------------------------

   always @ (*)
     begin
        width0  = 3'b0;
        width1  = 3'b0;
        width2  = 3'b0;
        width3  = 3'b0;
        width4  = 3'b0;
        width5  = 3'b0;
        width6  = 3'b0;
        width7  = 3'b0;
        width8  = 3'b0;
        width9  = 3'b0;
        width10 = 3'b0;
        width11 = 3'b0;
        width12 = 3'b0;
        width13 = 3'b0;
        width14 = 3'b0;
        width15 = 3'b0;
        width16 = 3'b0;
        width17 = 3'b0;

        wen_a0  = 1'b0;
        wen_a1  = 1'b0;
        wen_a2  = 1'b0;
        wen_a3  = 1'b0;
        wen_a4  = 1'b0;
        wen_a5  = 1'b0;
        wen_a6  = 1'b0;
        wen_a7  = 1'b0;
        wen_a8  = 1'b0;
        wen_a9  = 1'b0;
        wen_a10 = 1'b0;
        wen_a11 = 1'b0;
        wen_a12 = 1'b0;
        wen_a13 = 1'b0;
        wen_a14 = 1'b0;
        wen_a15 = 1'b0;
        wen_a16 = 1'b0;
        wen_a17 = 1'b0;

        wen_b0  = 1'b0;
        wen_b1  = 1'b0;
        wen_b2  = 1'b0;
        wen_b3  = 1'b0;
        wen_b4  = 1'b0;
        wen_b5  = 1'b0;
        wen_b6  = 1'b0;
        wen_b7  = 1'b0;
        wen_b8  = 1'b0;
        wen_b9  = 1'b0;
        wen_b10 = 1'b0;
        wen_b11 = 1'b0;
        wen_b12 = 1'b0;
        wen_b13 = 1'b0;
        wen_b14 = 1'b0;
        wen_b15 = 1'b0;
        wen_b16 = 1'b0;
        wen_b17 = 1'b0;

        writeData0  = 18'b0;
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
        writeData17 = 18'b0;

        writeAddr0  = 10'b0;
        writeAddr1  = 10'b0;
        writeAddr2  = 10'b0;
        writeAddr3  = 10'b0;
        writeAddr4  = 10'b0;
        writeAddr5  = 10'b0;
        writeAddr6  = 10'b0;
        writeAddr7  = 10'b0;
        writeAddr8  = 10'b0;
        writeAddr9  = 10'b0;
        writeAddr10 = 10'b0;
        writeAddr11 = 10'b0;
        writeAddr12 = 10'b0;
        writeAddr13 = 10'b0;
        writeAddr14 = 10'b0;
        writeAddr15 = 10'b0;
        writeAddr16 = 10'b0;
        writeAddr17 = 10'b0;

        readAddr0  = 10'b0;
        readAddr1  = 10'b0;
        readAddr2  = 10'b0;
        readAddr3  = 10'b0;
        readAddr4  = 10'b0;
        readAddr5  = 10'b0;
        readAddr6  = 10'b0;
        readAddr7  = 10'b0;
        readAddr8  = 10'b0;
        readAddr9  = 10'b0;
        readAddr10 = 10'b0;
        readAddr11 = 10'b0;
        readAddr12 = 10'b0;
        readAddr13 = 10'b0;
        readAddr14 = 10'b0;
        readAddr15 = 10'b0;
        readAddr16 = 10'b0;
        readAddr17 = 10'b0;

//       ablk = 2'b00;
//       bblk = 2'b00;                   

        ablk = 2'b11;
        bblk = 2'b11; 

        case (USRAM_NUM_LOCATIONS_DWIDTH32)
            128: begin // RAM 1 to RAM 4 for 64x32 configuration
                width1 = 3'b011;

                writeAddr1 = {writeAddr[6:0], 3'b0};

                readAddr1  = {readAddr[6:0],  3'b0};

                  writeData1 = {10'b0, writeData[7:0]};  

                wen_a1 = wen;

                readData = readData1[7:0];
            end

            256: begin
                width2 = 3'b010;
                width1 = 3'b010;

                writeAddr2 = {writeAddr[7:0], 2'b0};
                writeAddr1 = {writeAddr[7:0], 2'b0};

                readAddr2 = {readAddr[7:0], 2'b0};
                readAddr1 = {readAddr[7:0], 2'b0};

                  writeData2 = {14'b0, writeData[7:4]};
                  writeData1 = {14'b0, writeData[3:0]};  
 

                wen_a2 = wen;
                wen_a1 = wen;

                readData = 
                            
                            {
                            readData2[3:0],
                            readData1[3:0]
                            };

            end


            384: begin
                width3  = 3'b010;
                width2  = 3'b010;
                width1 = 3'b011;


                writeAddr3 = {writeAddr[7:0], 2'b0};
                writeAddr2 = {writeAddr[7:0], 2'b0};
                writeAddr1 = {writeAddr[6:0], 3'b0};


                readAddr3  = {readAddr[7:0], 2'b0};
                readAddr2  = {readAddr[7:0], 2'b0};
                readAddr1  = {readAddr[6:0],  3'b0};

                writeData3 = {14'b0, writeData[7:4]};
                writeData2 = {14'b0, writeData[3:0]};
                writeData1 = {10'b0, writeData[7:0]};

                case (writeAddr[8:6])
                  3'b000 , 3'b001, 3'b010, 3'b011 : begin
                     wen_a3 = wen;
                     wen_a2 = wen;
                     wen_a1 = 1'b0;
                    end
                  3'b100, 3'b101 : begin
                     wen_a3 = 1'b0;
                     wen_a2 = 1'b0;
                     wen_a1 = wen;
                  end
                  default : begin
                     wen_a3 = 1'b0;
                     wen_a2 = 1'b0;
                     wen_a1 = 1'b0;
                    end
                endcase

                case (ckRdAddr[8:6])
                  3'b000 , 3'b001, 3'b010, 3'b011 : begin
                     readData = {readData3[3:0],readData2[3:0]};
                  end
                  3'b100, 3'b101 : begin
                     readData = readData1[7:0];
                  end
                  default : begin
                     readData = 8'h00;
                  end
                endcase
            end
          
            512: begin
                width4 = 3'b001;
                width3 = 3'b001;
                width2 = 3'b001;
                width1 = 3'b001;

                writeAddr4 = {writeAddr[8:0], 1'b0};
                writeAddr3 = {writeAddr[8:0], 1'b0};
                writeAddr2 = {writeAddr[8:0], 1'b0};
                writeAddr1 = {writeAddr[8:0], 1'b0};

                readAddr4  = {readAddr[8:0],  1'b0};
                readAddr3  = {readAddr[8:0],  1'b0};
                readAddr2  = {readAddr[8:0],  1'b0};
                readAddr1  = {readAddr[8:0],  1'b0};

                writeData4  = {16'b0, writeData[7:6]};
                writeData3  = {16'b0, writeData[5:4]};
                writeData2  = {16'b0, writeData[3:2]};
                writeData1  = {16'b0, writeData[1:0]};  

                wen_a4  = wen;
                wen_a3  = wen;
                wen_a2  = wen;
                wen_a1  = wen;

               readData = {
                           readData4[1:0],
                           readData3[1:0],
                           readData2[1:0],
                           readData1[1:0]
                           };

            end

          640: begin
             //512x2   

             width4 = 3'b001;
             width3 = 3'b001;
             width2 = 3'b001;
             width1 = 3'b001;
             width0  = 3'b011;

             writeAddr4 = {writeAddr[8:0], 1'b0};
             writeAddr3 = {writeAddr[8:0], 1'b0};
             writeAddr2 = {writeAddr[8:0], 1'b0};
             writeAddr1 = {writeAddr[8:0], 1'b0};
             writeAddr0 = {writeAddr[6:0], 3'b0};

             readAddr4 = {readAddr[8:0],  1'b0};
             readAddr3 = {readAddr[8:0],  1'b0};
             readAddr2 = {readAddr[8:0],  1'b0};
             readAddr1 = {readAddr[8:0],  1'b0};
             readAddr0 = {readAddr[6:0], 3'b0};
             
                writeData4 = {16'b0, writeData[7:6]};
                writeData3 = {16'b0, writeData[5:4]};
                writeData2 = {16'b0, writeData[3:2]};
                writeData1 = {16'b0, writeData[1:0]};
                writeData0 = {10'b0, writeData[7:0]};

             case (writeAddr[9:6])
                    4'b0000 ,4'b0001, 4'b0010, 4'b0011, 4'b0100, 4'b0101, 4'b0110, 4'b0111 : begin
                       wen_a4 = wen;
                       wen_a3 = wen;
                       wen_a2 = wen;
                       wen_a1 = wen;
                       wen_a0  = 1'b0;
                    end
                    4'b1000, 4'b1001 : begin
                       wen_a4 = 1'b0;
                       wen_a3 = 1'b0;
                       wen_a2 = 1'b0;
                       wen_a1 = 1'b0;
                       wen_a0  = wen;
                    end
                    default : begin
                       wen_a4 = 1'b0;
                       wen_a3 = 1'b0;
                       wen_a2 = 1'b0;
                       wen_a1 = 1'b0;
                       wen_a0 = 1'b0;
                    end
                endcase

               case (ckRdAddr[9:6])
                  4'b0000 ,4'b0001, 4'b0010, 4'b0011, 4'b0100, 4'b0101, 4'b0110, 4'b0111 : begin
                     readData =                                  
                                 {
                                 readData4[1:0],
                                 readData3[1:0],
                                 readData2[1:0],
                                 readData1[1:0]
                                 };                     
                  end
                    4'b1000, 4'b1001 : begin
                       readData = readData0[7:0];
                  end
                  default : begin
                     readData = 8'h00;
                  end
                endcase
            end

          768: begin
             //512x2   
             width5  = 3'b001;
             width4  = 3'b001;
             width3  = 3'b001;
             width2  = 3'b001;
             width1  = 3'b010;
             width0  = 3'b010;

             writeAddr5  = {writeAddr[8:0], 1'b0};
             writeAddr4  = {writeAddr[8:0], 1'b0};
             writeAddr3  = {writeAddr[8:0], 1'b0};
             writeAddr2  = {writeAddr[8:0], 1'b0};
             writeAddr1 = {writeAddr[7:0], 2'b0};
             writeAddr0 = {writeAddr[7:0], 2'b0};
             
             readAddr5  = {readAddr[8:0],  1'b0};
             readAddr4  = {readAddr[8:0],  1'b0};
             readAddr3  = {readAddr[8:0],  1'b0};
             readAddr2  = {readAddr[8:0],  1'b0};
             readAddr1  = {readAddr[7:0], 2'b0};
             readAddr0  = {readAddr[7:0], 2'b0};

                writeData5 = {16'b0, writeData[7:6]};
                writeData4 = {16'b0, writeData[5:4]};
                writeData3 = {16'b0, writeData[3:2]};
                writeData2 = {16'b0, writeData[1:0]};
                writeData1 = {14'b0, writeData[7:4]};
                writeData0 = {14'b0, writeData[3:0]};

             case (writeAddr[9:6])
                    4'b0000 ,4'b0001, 4'b0010, 4'b0011, 4'b0100, 4'b0101, 4'b0110, 4'b0111 : begin
                       wen_a5  = wen;
                       wen_a4  = wen;
                       wen_a3  = wen;
                       wen_a2  = wen;
                       wen_a1  = 1'b0;
                       wen_a0  = 1'b0;
                    end
               4'b1000, 4'b1001, 4'b1010, 4'b1011 : begin
                  wen_a5  = 1'b0;
                  wen_a4  = 1'b0;
                  wen_a3  = 1'b0;
                  wen_a2  = 1'b0;
                  wen_a1  = wen;
                  wen_a0  = wen;
               end
               default : begin
                  wen_a5  = 1'b0;
                  wen_a4  = 1'b0;
                  wen_a3  = 1'b0;
                  wen_a2  = 1'b0;
                  wen_a1  = 1'b0;
                  wen_a0  = 1'b0;
               end
             endcase

             case (ckRdAddr[9:6])
                  4'b0000 ,4'b0001, 4'b0010, 4'b0011, 4'b0100, 4'b0101, 4'b0110, 4'b0111 : begin
                     readData = 
                                 {
                                 readData5[1:0],
                                 readData4[1:0],
                                 readData3[1:0],
                                 readData2[1:0]
                                 };
                     
                  end
                 4'b1000, 4'b1001,4'b1010, 4'b1011 : begin
                    readData = {readData1[3:0],readData0[3:0]};
                 end
                 default : begin
                    readData = 8'h00;
                 end
               endcase
            end

            896: begin
               //512x2
                width6  = 3'b001;
                width5  = 3'b001;
                width4  = 3'b001;
                width3  = 3'b001;
                width2  = 3'b010;
                width1  = 3'b010;
                width0  = 3'b011;

                writeAddr6  = {writeAddr[8:0], 1'b0};
                writeAddr5  = {writeAddr[8:0], 1'b0};
                writeAddr4  = {writeAddr[8:0], 1'b0};
                writeAddr3  = {writeAddr[8:0], 1'b0};
                writeAddr2  = {writeAddr[7:0], 2'b0};
                writeAddr1  = {writeAddr[7:0], 2'b0};
                writeAddr0  = {writeAddr[6:0], 3'b0};

                readAddr6  = {readAddr[8:0], 1'b0};
                readAddr5  = {readAddr[8:0], 1'b0};
                readAddr4  = {readAddr[8:0], 1'b0};
                readAddr3  = {readAddr[8:0], 1'b0};
                readAddr2  = {readAddr[7:0], 2'b0};
                readAddr1  = {readAddr[7:0], 2'b0};
                readAddr0  = {readAddr[6:0], 3'b0};

                writeData6  = {16'b0, writeData[7:6]};
                writeData5  = {16'b0, writeData[5:4]};
                writeData4  = {16'b0, writeData[3:2]};
                writeData3  = {16'b0, writeData[1:0]};
                writeData2  = {14'b0, writeData[7:4]};
                writeData1  = {14'b0, writeData[3:0]};
                writeData0  = {10'b0, writeData[7:0]};

                  
             case (writeAddr[9:6])
                    4'b0000 ,4'b0001, 4'b0010, 4'b0011, 4'b0100, 4'b0101, 4'b0110, 4'b0111 : begin
                       wen_a6  = wen;
                       wen_a5  = wen;
                       wen_a4  = wen;
                       wen_a3  = wen;
                       wen_a2  = 1'b0;
                       wen_a1  = 1'b0;
                       wen_a0  = 1'b0;
                    end
               4'b1000, 4'b1001, 4'b1010, 4'b1011 : begin
                  wen_a6  = 1'b0;
                  wen_a5  = 1'b0;
                  wen_a4  = 1'b0;
                  wen_a3  = 1'b0;
                  wen_a2  = wen;
                  wen_a1  = wen;
                  wen_a0  = 1'b0;
               end
               4'b1100, 4'b1101 : begin
                  wen_a6  = 1'b0;
                  wen_a5  = 1'b0;
                  wen_a4  = 1'b0;
                  wen_a3  = 1'b0;
                  wen_a2  = 1'b0;
                  wen_a1  = 1'b0;
                  wen_a0  = wen;
               end
               default : begin
                  wen_a6  = 1'b0;
                  wen_a5  = 1'b0;
                  wen_a4  = 1'b0;
                  wen_a3  = 1'b0;
                  wen_a2  = 1'b0;
                  wen_a1  = 1'b0;
                  wen_a0  = 1'b0;
               end
             endcase

             case (ckRdAddr[9:6])
                  4'b0000 ,4'b0001, 4'b0010, 4'b0011, 4'b0100, 4'b0101, 4'b0110, 4'b0111 : begin
                     readData =                                  
                                 {
                                 readData6[1:0],
                                 readData5[1:0],
                                 readData4[1:0],
                                 readData3[1:0]
                                 };                     
                  end
                 4'b1000, 4'b1001,4'b1010, 4'b1011 : begin
                    readData = {readData2[3:0],readData1[3:0]};
                 end
                 4'b1100, 4'b1101 : begin
                    readData = readData0[7:0];
                 end
                 default : begin
                    readData = 8'h00;
                 end
             endcase
            end


            1024: begin
                width7  = 3'b000;
                width6  = 3'b000;
                width5  = 3'b000;
                width4  = 3'b000;
                width3  = 3'b000;
                width2  = 3'b000;
                width1  = 3'b000;
                width0  = 3'b000;

                writeAddr7  = writeAddr[9:0];
                writeAddr6  = writeAddr[9:0];
                writeAddr5  = writeAddr[9:0];
                writeAddr4  = writeAddr[9:0];
                writeAddr3  = writeAddr[9:0];
                writeAddr2  = writeAddr[9:0];
                writeAddr1  = writeAddr[9:0];
                writeAddr0  = writeAddr[9:0];

                readAddr7  = readAddr[9:0];
                readAddr6  = readAddr[9:0];
                readAddr5  = readAddr[9:0];
                readAddr4  = readAddr[9:0];
                readAddr3  = readAddr[9:0];
                readAddr2  = readAddr[9:0];
                readAddr1  = readAddr[9:0];
                readAddr0  = readAddr[9:0]; 

                writeData7  = {17'b0, writeData[7]};
                writeData6  = {17'b0, writeData[6]};
                writeData5  = {17'b0, writeData[5]};
                writeData4  = {17'b0, writeData[4]};
                writeData3  = {17'b0, writeData[3]};
                writeData2  = {17'b0, writeData[2]};
                writeData1  = {17'b0, writeData[1]};
                writeData0  = {17'b0, writeData[0]};  

               wen_a7  = wen;
               wen_a6  = wen;
               wen_a5  = wen;
               wen_a4  = wen;
               wen_a3  = wen;
               wen_a2  = wen;
               wen_a1  = wen;
               wen_a0  = wen;

               readData = 
                           
                           {
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

            1152: begin
                width8  = 3'b000;
                width7  = 3'b000;
                width6  = 3'b000;
                width5  = 3'b000;
                width4  = 3'b000;
                width3  = 3'b000;
                width2  = 3'b000;
                width1  = 3'b000;
                width0  = 3'b011;

                writeAddr8  = writeAddr[9:0];
                writeAddr7  = writeAddr[9:0];
                writeAddr6  = writeAddr[9:0];
                writeAddr5  = writeAddr[9:0];
                writeAddr4  = writeAddr[9:0];
                writeAddr3  = writeAddr[9:0];
                writeAddr2  = writeAddr[9:0];
                writeAddr1  = writeAddr[9:0];
                writeAddr0  = {writeAddr[6:0], 3'b0};

                readAddr8  = readAddr[9:0];
                readAddr7  = readAddr[9:0];
                readAddr6  = readAddr[9:0];
                readAddr5  = readAddr[9:0];
                readAddr4  = readAddr[9:0];
                readAddr3  = readAddr[9:0];
                readAddr2  = readAddr[9:0];
                readAddr1  = readAddr[9:0];
                readAddr0  = {readAddr[6:0],  3'b0};               

                writeData8  = {17'b0, writeData[7]};
                writeData7  = {17'b0, writeData[6]};
                writeData6  = {17'b0, writeData[5]};
                writeData5  = {17'b0, writeData[4]};
                writeData4  = {17'b0, writeData[3]};
                writeData3  = {17'b0, writeData[2]};
                writeData2  = {17'b0, writeData[1]};
                writeData1  = {17'b0, writeData[0]};
                writeData0  = {10'b0, writeData[7:0]};

                case (writeAddr[10:6])
                  5'b00000, 5'b00001,5'b00010, 5'b00011, 5'b00100,
                    5'b00101, 5'b00110,5'b00111, 5'b01000, 5'b01001,
                    5'b01010, 5'b01011,5'b01100, 5'b01101, 5'b01110,
                    5'b01111 : begin
                       wen_a8  = wen;
                       wen_a7  = wen;
                       wen_a6  = wen;
                       wen_a5  = wen;
                       wen_a4  = wen;
                       wen_a3  = wen;
                       wen_a2  = wen;
                       wen_a1  = wen;
                       wen_a0  = 1'b0;
                    end
                    5'b10000, 5'b10001 : begin
                       wen_a8  = 1'b0;
                       wen_a7  = 1'b0;
                       wen_a6  = 1'b0;
                       wen_a5  = 1'b0;
                       wen_a4  = 1'b0;
                       wen_a3  = 1'b0;
                       wen_a2  = 1'b0;
                       wen_a1  = 1'b0;
                       wen_a0  = wen;
                    end
                    default : begin
                       wen_a8  = 1'b0;
                       wen_a7  = 1'b0;
                       wen_a6  = 1'b0;
                       wen_a5  = 1'b0;
                       wen_a4  = 1'b0;
                       wen_a3  = 1'b0;
                       wen_a2  = 1'b0;
                       wen_a1  = 1'b0;
                       wen_a0  = 1'b0;
                    end
                endcase

                case (ckRdAddr[10:6])
                  5'b00000, 5'b00001,5'b00010, 5'b00011, 5'b00100, 5'b00101, 5'b00110,5'b00111, 5'b01000, 5'b01001, 
                    5'b01010, 5'b01011,5'b01100, 5'b01101, 5'b01110, 5'b01111 : begin                       

                       readData = 
                                   
                                   {
                                   readData8[0],
                                   readData7[0],
                                   readData6[0],
                                   readData5[0],
                                   readData4[0],
                                   readData3[0],
                                   readData2[0],
                                   readData1[0]
                                   };
                    end
                  5'b10000, 5'b10001 : begin
                     readData = {readData0[7:0]};
                  end
                  default : begin
                     readData = 8'h00;
                  end
                endcase
            end


            1280: begin
                width9 = 3'b000;
                width8 = 3'b000;
                width7 = 3'b000;
                width6 = 3'b000;
                width5 = 3'b000;
                width4 = 3'b000;
                width3 = 3'b000;
                width2 = 3'b000;
                width1 = 3'b010;
                width0 = 3'b010;

                writeAddr9 = writeAddr[9:0];
                writeAddr8 = writeAddr[9:0];
                writeAddr7 = writeAddr[9:0];
                writeAddr6 = writeAddr[9:0];
                writeAddr5 = writeAddr[9:0];
                writeAddr4 = writeAddr[9:0];
                writeAddr3 = writeAddr[9:0];
                writeAddr2 = writeAddr[9:0];
                writeAddr1 = {writeAddr[7:0], 2'b0};
                writeAddr0 = {writeAddr[7:0], 2'b0};

                readAddr9 = readAddr[9:0];
                readAddr8 = readAddr[9:0];
                readAddr7 = readAddr[9:0];
                readAddr6 = readAddr[9:0];
                readAddr5 = readAddr[9:0];
                readAddr4 = readAddr[9:0];
                readAddr3 = readAddr[9:0];
                readAddr2 = readAddr[9:0];
                readAddr1 = {readAddr[7:0],  2'b0};
                readAddr0 = {readAddr[7:0],  2'b0};               

                writeData9 = {17'b0, writeData[7]};
                writeData8 = {17'b0, writeData[6]};
                writeData7 = {17'b0, writeData[5]};
                writeData6 = {17'b0, writeData[4]};
                writeData5 = {17'b0, writeData[3]};
                writeData4 = {17'b0, writeData[2]};
                writeData3 = {17'b0, writeData[1]};
                writeData2 = {17'b0, writeData[0]};
                writeData1 = {14'b0, writeData[7:4]};   
                writeData0 = {14'b0, writeData[3:0]};   

                case (writeAddr[10:6])
                  5'b00000, 5'b00001,5'b00010, 5'b00011, 5'b00100,
                    5'b00101, 5'b00110,5'b00111, 5'b01000, 5'b01001,
                    5'b01010, 5'b01011,5'b01100, 5'b01101, 5'b01110,
                    5'b01111 : begin
                       wen_a9 = wen;
                       wen_a8 = wen;
                       wen_a7 = wen;
                       wen_a6 = wen;
                       wen_a5 = wen;
                       wen_a4 = wen;
                       wen_a3 = wen;
                       wen_a2 = wen;
                       wen_a1 = 1'b0;
                       wen_a0 = 1'b0;
                    end
                    5'b10000, 5'b10001, 5'b10010, 5'b10011 : begin
                       wen_a9 = 1'b0;
                       wen_a8 = 1'b0;
                       wen_a7 = 1'b0;
                       wen_a6 = 1'b0;
                       wen_a5 = 1'b0;
                       wen_a4 = 1'b0;
                       wen_a3 = 1'b0;
                       wen_a2 = 1'b0;
                       wen_a1 = wen;
                       wen_a0 = wen;
                    end
                    default : begin
                       wen_a9 = 1'b0;
                       wen_a8 = 1'b0;
                       wen_a7 = 1'b0;
                       wen_a6 = 1'b0;
                       wen_a5 = 1'b0;
                       wen_a4 = 1'b0;
                       wen_a3 = 1'b0;
                       wen_a2 = 1'b0;
                       wen_a1 = 1'b0;
                       wen_a0 = 1'b0;
                    end
                endcase

                case (ckRdAddr[10:6])
                  5'b00000, 5'b00001,5'b00010, 5'b00011, 5'b00100, 5'b00101, 5'b00110,5'b00111, 5'b01000, 5'b01001, 
                    5'b01010, 5'b01011,5'b01100, 5'b01101, 5'b01110, 5'b01111 : begin                       

                       readData = 
                                   
                                   {
                                   readData9[0],
                                   readData8[0],
                                   readData7[0],
                                   readData6[0],
                                   readData5[0],
                                   readData4[0],
                                   readData3[0],
                                   readData2[0]
                                   };
                    end
                  5'b10000, 5'b10001, 5'b10010, 5'b10011 : begin
                     readData = 
                                 
                                 {
                                 readData1[3:0],
                                 readData0[3:0]
                                 };
                  end
                  default : begin
                     readData = 8'h00;
                  end
                endcase
            end

            1408: begin
                width10 = 3'b000;
                width9  = 3'b000;
                width8  = 3'b000;
                width7  = 3'b000;
                width6  = 3'b000;
                width5  = 3'b000;
                width4  = 3'b000;
                width3  = 3'b000;
                width2  = 3'b010;
                width1  = 3'b010;
                width0  = 3'b011;

                writeAddr10 = writeAddr[9:0];
                writeAddr9  = writeAddr[9:0];
                writeAddr8  = writeAddr[9:0];
                writeAddr7  = writeAddr[9:0];
                writeAddr6  = writeAddr[9:0];
                writeAddr5  = writeAddr[9:0];
                writeAddr4  = writeAddr[9:0];
                writeAddr3  = writeAddr[9:0];
                writeAddr2  = {writeAddr[7:0], 2'b0};
                writeAddr1  = {writeAddr[7:0], 2'b0};
                writeAddr0  = {writeAddr[6:0], 3'b0};

                readAddr10 = readAddr[9:0];
                readAddr9  = readAddr[9:0];
                readAddr8  = readAddr[9:0];
                readAddr7  = readAddr[9:0];
                readAddr6  = readAddr[9:0];
                readAddr5  = readAddr[9:0];
                readAddr4  = readAddr[9:0];
                readAddr3  = readAddr[9:0];
                readAddr2  = {readAddr[7:0],  2'b0};
                readAddr1  = {readAddr[7:0],  2'b0};
                readAddr0  = {readAddr[6:0],  3'b0};               

                writeData10 = {17'b0, writeData[7]};
                writeData9  = {17'b0, writeData[6]};
                writeData8  = {17'b0, writeData[5]};
                writeData7  = {17'b0, writeData[4]};
                writeData6  = {17'b0, writeData[3]};
                writeData5  = {17'b0, writeData[2]};
                writeData4  = {17'b0, writeData[1]};
                writeData3  = {17'b0, writeData[0]};
                writeData2  = {14'b0, writeData[7:4]};   
                writeData1  = {14'b0, writeData[3:0]};   
                writeData0  = {10'b0, writeData[7:0]};

                case (writeAddr[10:6])
                  5'b00000, 5'b00001,5'b00010, 5'b00011, 5'b00100,
                    5'b00101, 5'b00110,5'b00111, 5'b01000, 5'b01001,
                    5'b01010, 5'b01011,5'b01100, 5'b01101, 5'b01110,
                    5'b01111 : begin
                       wen_a10 = wen;
                       wen_a9  = wen;
                       wen_a8  = wen;
                       wen_a7  = wen;
                       wen_a6  = wen;
                       wen_a5  = wen;
                       wen_a4  = wen;
                       wen_a3  = wen;
                       wen_a2  = 1'b0;
                       wen_a1  = 1'b0;
                       wen_a0  = 1'b0;
                    end
                    5'b10000, 5'b10001, 5'b10010, 5'b10011 : begin
                       wen_a10 = 1'b0;
                       wen_a9  = 1'b0;
                       wen_a8  = 1'b0;
                       wen_a7  = 1'b0;
                       wen_a6  = 1'b0;
                       wen_a5  = 1'b0;
                       wen_a4  = 1'b0;
                       wen_a3  = 1'b0;
                       wen_a2  = wen;
                       wen_a1  = wen;
                       wen_a0  = 1'b0;
                    end
                    5'b10100, 5'b10101 : begin
                       wen_a10 = 1'b0;
                       wen_a9  = 1'b0;
                       wen_a8  = 1'b0;
                       wen_a7  = 1'b0;
                       wen_a6  = 1'b0;
                       wen_a5  = 1'b0;
                       wen_a4  = 1'b0;
                       wen_a3  = 1'b0;
                       wen_a2  = 1'b0;
                       wen_a1  = 1'b0;
                       wen_a0  = wen;
                    end
                    default : begin
                       wen_a10 = 1'b0;
                       wen_a9  = 1'b0;
                       wen_a8  = 1'b0;
                       wen_a7  = 1'b0;
                       wen_a6  = 1'b0;
                       wen_a5  = 1'b0;
                       wen_a4  = 1'b0;
                       wen_a3  = 1'b0;
                       wen_a2  = 1'b0;
                       wen_a1  = 1'b0;
                       wen_a0  = 1'b0;
                    end
                endcase

                case (ckRdAddr[10:6])
                  5'b00000, 5'b00001,5'b00010, 5'b00011, 5'b00100, 5'b00101, 5'b00110,5'b00111, 5'b01000, 5'b01001, 
                    5'b01010, 5'b01011,5'b01100, 5'b01101, 5'b01110, 5'b01111 : begin                       

                       readData = 
                                   
                                   {
                                   readData10[0],
                                   readData9[0],
                                   readData8[0],
                                   readData7[0],
                                   readData6[0],
                                   readData5[0],
                                   readData4[0],
                                   readData3[0]
                                   };
                    end
                  5'b10000, 5'b10001, 5'b10010, 5'b10011 : begin
                     readData = 
                                 
                                 {
                                 readData2[3:0],
                                 readData1[3:0]
                                 };
                  end
                  5'b10100, 5'b10101 : begin
                     readData = readData0[7:0];
                  end
                  default : begin
                     readData = 8'h00;
                  end
                endcase
            end

            1536: begin
                width11 = 3'b000;
                width10 = 3'b000;
                width9  = 3'b000;
                width8  = 3'b000;
                width7  = 3'b000;
                width6  = 3'b000;
                width5  = 3'b000;
                width4  = 3'b000;
                width3  = 3'b001;
                width2  = 3'b001;
                width1  = 3'b001;
                width0  = 3'b001;

                writeAddr11 = writeAddr[9:0];
                writeAddr10 = writeAddr[9:0];
                writeAddr9  = writeAddr[9:0];
                writeAddr8  = writeAddr[9:0];
                writeAddr7  = writeAddr[9:0];
                writeAddr6  = writeAddr[9:0];
                writeAddr5  = writeAddr[9:0];
                writeAddr4  = writeAddr[9:0];
                writeAddr3  = {writeAddr[8:0], 1'b0};
                writeAddr2  = {writeAddr[8:0], 1'b0};
                writeAddr1  = {writeAddr[8:0], 1'b0};
                writeAddr0  = {writeAddr[8:0], 1'b0};

                readAddr11 = readAddr[9:0];
                readAddr10 = readAddr[9:0];
                readAddr9  = readAddr[9:0];
                readAddr8  = readAddr[9:0];
                readAddr7  = readAddr[9:0];
                readAddr6  = readAddr[9:0];
                readAddr5  = readAddr[9:0];
                readAddr4  = readAddr[9:0];
                readAddr3  = {readAddr[8:0], 1'b0};
                readAddr2  = {readAddr[8:0], 1'b0};
                readAddr1  = {readAddr[8:0], 1'b0};
                readAddr0  = {readAddr[8:0], 1'b0};

                writeData11 = {17'b0, writeData[7]};
                writeData10 = {17'b0, writeData[6]};
                writeData9  = {17'b0, writeData[5]};
                writeData8  = {17'b0, writeData[4]};
                writeData7  = {17'b0, writeData[3]};
                writeData6  = {17'b0, writeData[2]};
                writeData5  = {17'b0, writeData[1]};
                writeData4  = {17'b0, writeData[0]}; 
                writeData3  = {16'b0, writeData[7:6]};  
                writeData2  = {16'b0, writeData[5:4]};  
                writeData1  = {16'b0, writeData[3:2]};  
                writeData0  = {16'b0, writeData[1:0]};  
                case (writeAddr[10:6])
                  5'b00000, 5'b00001,5'b00010, 5'b00011, 5'b00100,
                    5'b00101, 5'b00110,5'b00111, 5'b01000, 5'b01001,
                    5'b01010, 5'b01011,5'b01100, 5'b01101, 5'b01110,
                    5'b01111 : begin
                       wen_a11 = wen;
                       wen_a10 = wen;
                       wen_a9  = wen;
                       wen_a8  = wen;
                       wen_a7  = wen;
                       wen_a6  = wen;
                       wen_a5  = wen;
                       wen_a4  = wen;
                       wen_a3  = 1'b0;
                       wen_a2  = 1'b0;
                       wen_a1  = 1'b0;
                       wen_a0  = 1'b0;
                    end
                    5'b10000, 5'b10001, 5'b10010, 5'b10011, 5'b10100, 5'b10101, 5'b10110, 5'b10111 : begin
                       wen_a11 = 1'b0;
                       wen_a10 = 1'b0;
                       wen_a9  = 1'b0;
                       wen_a8  = 1'b0;
                       wen_a7  = 1'b0;
                       wen_a6  = 1'b0;
                       wen_a5  = 1'b0;
                       wen_a4  = 1'b0;
                       wen_a3  = wen;
                       wen_a2  = wen;
                       wen_a1  = wen;
                       wen_a0  = wen;
                    end
                    default : begin
                       wen_a11 = 1'b0;
                       wen_a10 = 1'b0;
                       wen_a9  = 1'b0;
                       wen_a8  = 1'b0;
                       wen_a7  = 1'b0;
                       wen_a6  = 1'b0;
                       wen_a5  = 1'b0;
                       wen_a4  = 1'b0;
                       wen_a3  = 1'b0;
                       wen_a2  = 1'b0;
                       wen_a1  = 1'b0;
                       wen_a0  = 1'b0;
                    end
                endcase

                case (ckRdAddr[10:6])
                  5'b00000, 5'b00001,5'b00010, 5'b00011, 5'b00100, 5'b00101, 5'b00110,5'b00111, 5'b01000, 5'b01001, 
                    5'b01010, 5'b01011,5'b01100, 5'b01101, 5'b01110, 5'b01111 : begin                       

                       readData = 
                                   
                                   {
                                   readData11[0],
                                   readData10[0],
                                   readData9[0],
                                   readData8[0],
                                   readData7[0],
                                   readData6[0],
                                   readData5[0],
                                   readData4[0]
                                   };
                    end
                  5'b10000, 5'b10001, 5'b10010, 5'b10011, 5'b10100, 5'b10101, 5'b10110, 5'b10111 : begin
                     readData = 
                                 
                                 {
                                 readData3[1:0],
                                 readData2[1:0],
                                 readData1[1:0],
                                 readData0[1:0]
                                 };                     
                  end
                  default : begin
                     readData = 8'h00;
                  end
                endcase
            end

            1664: begin
                width12 = 3'b000;
                width11 = 3'b000;
                width10 = 3'b000;
                width9  = 3'b000;
                width8  = 3'b000;
                width7  = 3'b000;
                width6  = 3'b000;
                width5  = 3'b000;
                width4  = 3'b001;
                width3  = 3'b001;
                width2  = 3'b001;
                width1  = 3'b001;
                width0  = 3'b011;

                writeAddr12 = writeAddr[9:0];
                writeAddr11 = writeAddr[9:0];
                writeAddr10 = writeAddr[9:0];
                writeAddr9  = writeAddr[9:0];
                writeAddr8  = writeAddr[9:0];
                writeAddr7  = writeAddr[9:0];
                writeAddr6  = writeAddr[9:0];
                writeAddr5  = writeAddr[9:0];
                writeAddr4  = {writeAddr[8:0], 1'b0};
                writeAddr3  = {writeAddr[8:0], 1'b0};
                writeAddr2  = {writeAddr[8:0], 1'b0};
                writeAddr1  = {writeAddr[8:0], 1'b0};
                writeAddr0  = {writeAddr[6:0], 3'b0};

                readAddr12 = readAddr[9:0];
                readAddr11 = readAddr[9:0];
                readAddr10 = readAddr[9:0];
                readAddr9  = readAddr[9:0];
                readAddr8  = readAddr[9:0];
                readAddr7  = readAddr[9:0];
                readAddr6  = readAddr[9:0];
                readAddr5  = readAddr[9:0];
                readAddr4  = {readAddr[8:0], 1'b0};
                readAddr3  = {readAddr[8:0], 1'b0};
                readAddr2  = {readAddr[8:0], 1'b0};
                readAddr1  = {readAddr[8:0], 1'b0};
                readAddr0  = {readAddr[6:0], 3'b0};

                writeData12 = {17'b0, writeData[7]};
                writeData11 = {17'b0, writeData[6]};
                writeData10 = {17'b0, writeData[5]};
                writeData9  = {17'b0, writeData[4]};
                writeData8  = {17'b0, writeData[3]};
                writeData7  = {17'b0, writeData[2]};
                writeData6  = {17'b0, writeData[1]};
                writeData5  = {17'b0, writeData[0]};
                writeData4  = {16'b0, writeData[7:6]};  
                writeData3  = {16'b0, writeData[5:4]};  
                writeData2  = {16'b0, writeData[3:2]};  
                writeData1  = {16'b0, writeData[1:0]};  
                writeData0  = {10'b0, writeData[7:0]};  

                case (writeAddr[10:6])
                  5'b00000, 5'b00001,5'b00010, 5'b00011, 5'b00100,
                    5'b00101, 5'b00110,5'b00111, 5'b01000, 5'b01001,
                    5'b01010, 5'b01011,5'b01100, 5'b01101, 5'b01110,
                    5'b01111 : begin
                       wen_a12 = wen;
                       wen_a11 = wen;
                       wen_a10 = wen;
                       wen_a9  = wen;
                       wen_a8  = wen;
                       wen_a7  = wen;
                       wen_a6  = wen;
                       wen_a5  = wen;
                       wen_a4  = 1'b0;
                       wen_a3  = 1'b0;
                       wen_a2  = 1'b0;
                       wen_a1  = 1'b0;
                       wen_a0  = 1'b0;
                    end
                    5'b10000, 5'b10001, 5'b10010, 5'b10011, 5'b10100, 5'b10101, 5'b10110, 5'b10111 : begin
                       wen_a12 = 1'b0;
                       wen_a11 = 1'b0;
                       wen_a10 = 1'b0;
                       wen_a9  = 1'b0;
                       wen_a8  = 1'b0;
                       wen_a7  = 1'b0;
                       wen_a6  = 1'b0;
                       wen_a5  = 1'b0;
                       wen_a4  = wen;
                       wen_a3  = wen;
                       wen_a2  = wen;
                       wen_a1  = wen;
                       wen_a0  = 1'b0;
                    end
                    5'b11000, 5'b11001 : begin
                       wen_a12 = 1'b0;
                       wen_a11 = 1'b0;
                       wen_a10 = 1'b0;
                       wen_a9  = 1'b0;
                       wen_a8  = 1'b0;
                       wen_a7  = 1'b0;
                       wen_a6  = 1'b0;
                       wen_a5  = 1'b0;
                       wen_a4  = 1'b0;
                       wen_a3  = 1'b0;
                       wen_a2  = 1'b0;
                       wen_a1  = 1'b0;
                       wen_a0  = wen;
                    end
                    default : begin
                       wen_a12 = 1'b0;
                       wen_a11 = 1'b0;
                       wen_a10 = 1'b0;
                       wen_a9  = 1'b0;
                       wen_a8  = 1'b0;
                       wen_a7  = 1'b0;
                       wen_a6  = 1'b0;
                       wen_a5  = 1'b0;
                       wen_a4  = 1'b0;
                       wen_a3  = 1'b0;
                       wen_a2  = 1'b0;
                       wen_a1  = 1'b0;
                       wen_a0  = 1'b0;
                    end
                endcase

                case (ckRdAddr[10:6])
                  5'b00000, 5'b00001,5'b00010, 5'b00011, 5'b00100, 5'b00101, 5'b00110,5'b00111, 5'b01000, 5'b01001, 
                    5'b01010, 5'b01011,5'b01100, 5'b01101, 5'b01110, 5'b01111 : begin                       

                       readData = 
                                   
                                   {
                                   readData12[0],
                                   readData11[0],
                                   readData10[0],
                                   readData9[0],
                                   readData8[0],
                                   readData7[0],
                                   readData6[0],
                                   readData5[0]
                                   };
                    end
                  5'b10000, 5'b10001, 5'b10010, 5'b10011, 5'b10100, 5'b10101, 5'b10110, 5'b10111 : begin
                     readData = 
                                 
                                 {
                                 readData4[1:0],
                                 readData3[1:0],
                                 readData2[1:0],
                                 readData1[1:0]
                                 };                     
                  end
                  5'b11000, 5'b11001: begin
                     readData = {readData0[7:0]};
                  end
                  default : begin
                     readData = 8'h00;
                  end
                endcase
            end

            1792: begin
                width13 = 3'b000;
                width12 = 3'b000;
                width11 = 3'b000;
                width10 = 3'b000;
                width9  = 3'b000;
                width8  = 3'b000;
                width7  = 3'b000;
                width6  = 3'b000;
                width5  = 3'b001;
                width4  = 3'b001;
                width3  = 3'b001;
                width2  = 3'b001;
                width1  = 3'b010;
                width0  = 3'b010;

                writeAddr13 = writeAddr[9:0];
                writeAddr12 = writeAddr[9:0];
                writeAddr11 = writeAddr[9:0];
                writeAddr10 = writeAddr[9:0];
                writeAddr9  = writeAddr[9:0];
                writeAddr8  = writeAddr[9:0];
                writeAddr7  = writeAddr[9:0];
                writeAddr6  = writeAddr[9:0];
                writeAddr5  = {writeAddr[8:0], 1'b0};
                writeAddr4  = {writeAddr[8:0], 1'b0};
                writeAddr3  = {writeAddr[8:0], 1'b0};
                writeAddr2  = {writeAddr[8:0], 1'b0};
                writeAddr1  = {writeAddr[7:0], 2'b0};
                writeAddr0  = {writeAddr[7:0], 2'b0};

                readAddr13 = readAddr[9:0];
                readAddr12 = readAddr[9:0];
                readAddr11 = readAddr[9:0];
                readAddr10 = readAddr[9:0];
                readAddr9  = readAddr[9:0];
                readAddr8  = readAddr[9:0];
                readAddr7  = readAddr[9:0];
                readAddr6  = readAddr[9:0];
                readAddr5  = {readAddr[8:0], 1'b0};
                readAddr4  = {readAddr[8:0], 1'b0};
                readAddr3  = {readAddr[8:0], 1'b0};
                readAddr2  = {readAddr[8:0], 1'b0};
                readAddr1  = {readAddr[7:0], 2'b0};
                readAddr0  = {readAddr[7:0], 2'b0};

                writeData13 = {17'b0, writeData[7]};
                writeData12 = {17'b0, writeData[6]};
                writeData11 = {17'b0, writeData[5]};
                writeData10 = {17'b0, writeData[4]};
                writeData9  = {17'b0, writeData[3]};
                writeData8  = {17'b0, writeData[2]};
                writeData7  = {17'b0, writeData[1]};
                writeData6  = {17'b0, writeData[0]};
                writeData5  = {16'b0, writeData[7:6]};  
                writeData4  = {16'b0, writeData[5:4]};  
                writeData3  = {16'b0, writeData[3:2]};  
                writeData2  = {16'b0, writeData[1:0]};  
                writeData1  = {14'b0, writeData[7:4]};
                writeData0  = {14'b0, writeData[3:0]};
                case (writeAddr[10:6])
                  5'b00000, 5'b00001,5'b00010, 5'b00011, 5'b00100,
                    5'b00101, 5'b00110,5'b00111, 5'b01000, 5'b01001,
                    5'b01010, 5'b01011,5'b01100, 5'b01101, 5'b01110,
                    5'b01111 : begin
                       wen_a13 = wen;
                       wen_a12 = wen;
                       wen_a11 = wen;
                       wen_a10 = wen;
                       wen_a9  = wen;
                       wen_a8  = wen;
                       wen_a7  = wen;
                       wen_a6  = wen;
                       wen_a5  = 1'b0;
                       wen_a4  = 1'b0;
                       wen_a3  = 1'b0;
                       wen_a2  = 1'b0;
                       wen_a1  = 1'b0;
                       wen_a0  = 1'b0;
                    end
                    5'b10000, 5'b10001, 5'b10010, 5'b10011, 5'b10100, 5'b10101, 5'b10110, 5'b10111 : begin
                       wen_a13 = 1'b0;
                       wen_a12 = 1'b0;
                       wen_a11 = 1'b0;
                       wen_a10 = 1'b0;
                       wen_a9  = 1'b0;
                       wen_a8  = 1'b0;
                       wen_a7  = 1'b0;
                       wen_a6  = 1'b0;
                       wen_a5  = wen;
                       wen_a4  = wen;
                       wen_a3  = wen;
                       wen_a2  = wen;
                       wen_a1  = 1'b0;
                       wen_a0  = 1'b0;
                    end
                    5'b11000, 5'b11001, 5'b11010, 5'b11011 : begin
                       wen_a13 = 1'b0;
                       wen_a12 = 1'b0;
                       wen_a11 = 1'b0;
                       wen_a10 = 1'b0;
                       wen_a9  = 1'b0;
                       wen_a8  = 1'b0;
                       wen_a7  = 1'b0;
                       wen_a6  = 1'b0;
                       wen_a5  = 1'b0;
                       wen_a4  = 1'b0;
                       wen_a3  = 1'b0;
                       wen_a2  = 1'b0;
                       wen_a1  = wen;
                       wen_a0  = wen;
                    end
                    default : begin
                       wen_a13 = 1'b0;
                       wen_a12 = 1'b0;
                       wen_a11 = 1'b0;
                       wen_a10 = 1'b0;
                       wen_a9  = 1'b0;
                       wen_a8  = 1'b0;
                       wen_a7  = 1'b0;
                       wen_a6  = 1'b0;
                       wen_a5  = 1'b0;
                       wen_a4  = 1'b0;
                       wen_a3  = 1'b0;
                       wen_a2  = 1'b0;
                       wen_a1  = 1'b0;
                       wen_a0  = 1'b0;
                    end
                endcase

                case (ckRdAddr[10:6])
                  5'b00000, 5'b00001,5'b00010, 5'b00011, 5'b00100, 5'b00101, 5'b00110,5'b00111, 5'b01000, 5'b01001, 
                    5'b01010, 5'b01011,5'b01100, 5'b01101, 5'b01110, 5'b01111 : begin                       

                       readData = 
                                   
                                   {
                                   readData13[0],
                                   readData12[0],
                                   readData11[0],
                                   readData10[0],
                                   readData9[0],
                                   readData8[0],
                                   readData7[0],
                                   readData6[0]
                                   };
                    end
                  5'b10000, 5'b10001, 5'b10010, 5'b10011, 5'b10100, 5'b10101, 5'b10110, 5'b10111 : begin
                     readData = 
                                 
                                 {
                                 readData5[1:0],
                                 readData4[1:0],
                                 readData3[1:0],
                                 readData2[1:0]
                                 };                     
                  end
                  5'b11000, 5'b11001, 5'b11010, 5'b11011: begin
                     readData = 
                                 
                                 {
                                 readData1[3:0],
                                 readData0[3:0]
                                 };
                  end
                  default : begin
                     readData = 8'h00;
                  end
                endcase
            end

            1920: begin
                width14 = 3'b000;
                width13 = 3'b000;
                width12 = 3'b000;
                width11 = 3'b000;
                width10 = 3'b000;
                width9  = 3'b000;
                width8  = 3'b000;
                width7  = 3'b000;
                width6  = 3'b001;
                width5  = 3'b001;
                width4  = 3'b001;
                width3  = 3'b001;
                width2  = 3'b010;
                width1  = 3'b010;
                width0  = 3'b011;

                writeAddr14 = writeAddr[9:0];
                writeAddr13 = writeAddr[9:0];
                writeAddr12 = writeAddr[9:0];
                writeAddr11 = writeAddr[9:0];
                writeAddr10 = writeAddr[9:0];
                writeAddr9  = writeAddr[9:0];
                writeAddr8  = writeAddr[9:0];
                writeAddr7  = writeAddr[9:0];
                writeAddr6  = {writeAddr[8:0], 1'b0};
                writeAddr5  = {writeAddr[8:0], 1'b0};
                writeAddr4  = {writeAddr[8:0], 1'b0};
                writeAddr3  = {writeAddr[8:0], 1'b0};
                writeAddr2  = {writeAddr[7:0], 2'b0};
                writeAddr1  = {writeAddr[7:0], 2'b0};
                writeAddr0  = {writeAddr[6:0], 3'b0};

                readAddr14 = readAddr[9:0];
                readAddr13 = readAddr[9:0];
                readAddr12 = readAddr[9:0];
                readAddr11 = readAddr[9:0];
                readAddr10 = readAddr[9:0];
                readAddr9  = readAddr[9:0];
                readAddr8  = readAddr[9:0];
                readAddr7  = readAddr[9:0];
                readAddr6  = {readAddr[8:0], 1'b0};
                readAddr5  = {readAddr[8:0], 1'b0};
                readAddr4  = {readAddr[8:0], 1'b0};
                readAddr3  = {readAddr[8:0], 1'b0};
                readAddr2  = {readAddr[7:0], 2'b0};
                readAddr1  = {readAddr[7:0], 2'b0};
                readAddr0  = {readAddr[6:0], 3'b0};

                writeData14 = {17'b0, writeData[7]};
                writeData13 = {17'b0, writeData[6]};
                writeData12 = {17'b0, writeData[5]};
                writeData11 = {17'b0, writeData[4]};
                writeData10 = {17'b0, writeData[3]};
                writeData9  = {17'b0, writeData[2]};
                writeData8  = {17'b0, writeData[1]};
                writeData7  = {17'b0, writeData[0]};
                writeData6  = {16'b0, writeData[7:6]};  
                writeData5  = {16'b0, writeData[5:4]};  
                writeData4  = {16'b0, writeData[3:2]};  
                writeData3  = {16'b0, writeData[1:0]};  
                writeData2  = {14'b0, writeData[7:4]};
                writeData1  = {14'b0, writeData[3:0]};
                writeData0  = {10'b0, writeData[7:0]};  

                case (writeAddr[10:6])
                  5'b00000, 5'b00001,5'b00010, 5'b00011, 5'b00100,
                    5'b00101, 5'b00110,5'b00111, 5'b01000, 5'b01001,
                    5'b01010, 5'b01011,5'b01100, 5'b01101, 5'b01110,
                    5'b01111 : begin
                       wen_a14 = wen;
                       wen_a13 = wen;
                       wen_a12 = wen;
                       wen_a11 = wen;
                       wen_a10 = wen;
                       wen_a9  = wen;
                       wen_a8  = wen;
                       wen_a7  = wen;
                       wen_a6  = 1'b0;
                       wen_a5  = 1'b0;
                       wen_a4  = 1'b0;
                       wen_a3  = 1'b0;
                       wen_a2  = 1'b0;
                       wen_a1  = 1'b0;
                       wen_a0  = 1'b0;
                    end
                    5'b10000, 5'b10001, 5'b10010, 5'b10011, 5'b10100, 5'b10101, 5'b10110, 5'b10111 : begin
                       wen_a14 = 1'b0;
                       wen_a13 = 1'b0;
                       wen_a12 = 1'b0;
                       wen_a11 = 1'b0;
                       wen_a10 = 1'b0;
                       wen_a9  = 1'b0;
                       wen_a8  = 1'b0;
                       wen_a7  = 1'b0;
                       wen_a6  = wen;
                       wen_a5  = wen;
                       wen_a4  = wen;
                       wen_a3  = wen;
                       wen_a2  = 1'b0;
                       wen_a1  = 1'b0;
                       wen_a0  = 1'b0;
                    end
                    5'b11000, 5'b11001, 5'b11010, 5'b11011 : begin
                       wen_a14 = 1'b0;
                       wen_a13 = 1'b0;
                       wen_a12 = 1'b0;
                       wen_a11 = 1'b0;
                       wen_a10 = 1'b0;
                       wen_a9  = 1'b0;
                       wen_a8  = 1'b0;
                       wen_a7  = 1'b0;
                       wen_a6  = 1'b0;
                       wen_a5  = 1'b0;
                       wen_a4  = 1'b0;
                       wen_a3  = 1'b0;
                       wen_a2  = wen;
                       wen_a1  = wen;
                       wen_a0  = 1'b0;
                    end
                    5'b11100, 5'b11101 : begin
                       wen_a14 = 1'b0;
                       wen_a13 = 1'b0;
                       wen_a12 = 1'b0;
                       wen_a11 = 1'b0;
                       wen_a10 = 1'b0;
                       wen_a9  = 1'b0;
                       wen_a8  = 1'b0;
                       wen_a7  = 1'b0;
                       wen_a6  = 1'b0;
                       wen_a5  = 1'b0;
                       wen_a4  = 1'b0;
                       wen_a3  = 1'b0;
                       wen_a2  = 1'b0;
                       wen_a1  = 1'b0;
                       wen_a0  = wen;
                    end
                    default : begin
                       wen_a14 = 1'b0;
                       wen_a13 = 1'b0;
                       wen_a12 = 1'b0;
                       wen_a11 = 1'b0;
                       wen_a10 = 1'b0;
                       wen_a9  = 1'b0;
                       wen_a8  = 1'b0;
                       wen_a7  = 1'b0;
                       wen_a6  = 1'b0;
                       wen_a5  = 1'b0;
                       wen_a4  = 1'b0;
                       wen_a3  = 1'b0;
                       wen_a2  = 1'b0;
                       wen_a1  = 1'b0;
                       wen_a0  = 1'b0;
                    end
                endcase

                case (ckRdAddr[10:6])
                  5'b00000, 5'b00001,5'b00010, 5'b00011, 5'b00100, 5'b00101, 5'b00110,5'b00111, 5'b01000, 5'b01001, 
                    5'b01010, 5'b01011,5'b01100, 5'b01101, 5'b01110, 5'b01111 : begin                       

                       readData = 
                                   
                                   {
                                   readData14[0],
                                   readData13[0],
                                   readData12[0],
                                   readData11[0],
                                   readData10[0],
                                   readData9[0],
                                   readData8[0],
                                   readData7[0]
                                   };
                    end
                  5'b10000, 5'b10001, 5'b10010, 5'b10011, 5'b10100, 5'b10101, 5'b10110, 5'b10111 : begin
                     readData = 
                                 
                                 {
                                 readData6[1:0],
                                 readData5[1:0],
                                 readData4[1:0],
                                 readData3[1:0]
                                 };                     
                  end
                  5'b11000, 5'b11001, 5'b11010, 5'b11011: begin
                     readData = 
                                 
                                 {
                                 readData2[3:0],
                                 readData1[3:0]
                                 };
                  end
                  5'b11100, 5'b11101 : begin
                     readData = {readData0[7:0]};
                  end
                  default : begin
                     readData = 8'h00;
                  end
                endcase
            end

            2048: begin
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

                writeAddr15 = writeAddr[9:0];
                writeAddr14 = writeAddr[9:0];
                writeAddr13 = writeAddr[9:0];
                writeAddr12 = writeAddr[9:0];
                writeAddr11 = writeAddr[9:0];
                writeAddr10 = writeAddr[9:0];
                writeAddr9  = writeAddr[9:0];
                writeAddr8  = writeAddr[9:0];
                writeAddr7  = writeAddr[9:0];
                writeAddr6  = writeAddr[9:0];
                writeAddr5  = writeAddr[9:0];
                writeAddr4  = writeAddr[9:0];
                writeAddr3  = writeAddr[9:0];
                writeAddr2  = writeAddr[9:0];
                writeAddr1  = writeAddr[9:0];
                writeAddr0  = writeAddr[9:0];

                readAddr15 = readAddr[9:0];
                readAddr14 = readAddr[9:0];
                readAddr13 = readAddr[9:0];
                readAddr12 = readAddr[9:0];
                readAddr11 = readAddr[9:0];
                readAddr10 = readAddr[9:0];
                readAddr9  = readAddr[9:0];
                readAddr8  = readAddr[9:0];
                readAddr7  = readAddr[9:0];
                readAddr6  = readAddr[9:0];
                readAddr5  = readAddr[9:0];
                readAddr4  = readAddr[9:0];
                readAddr3  = readAddr[9:0];
                readAddr2  = readAddr[9:0];
                readAddr1  = readAddr[9:0];
                readAddr0  = readAddr[9:0];

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

                case (writeAddr[10:6])
                  5'b00000, 5'b00001,5'b00010, 5'b00011, 5'b00100,
                    5'b00101, 5'b00110,5'b00111, 5'b01000, 5'b01001,
                    5'b01010, 5'b01011,5'b01100, 5'b01101, 5'b01110,
                    5'b01111 : begin
                       wen_a15 = wen;
                       wen_a14 = wen;
                       wen_a13 = wen;
                       wen_a12 = wen;
                       wen_a11 = wen;
                       wen_a10 = wen;
                       wen_a9  = wen;
                       wen_a8  = wen;
                       wen_a7  = 1'b0;
                       wen_a6  = 1'b0;
                       wen_a5  = 1'b0;
                       wen_a4  = 1'b0;
                       wen_a3  = 1'b0;
                       wen_a2  = 1'b0;
                       wen_a1  = 1'b0;
                       wen_a0  = 1'b0;
                    end
                    5'b10000, 5'b10001, 5'b10010, 5'b10011, 5'b10100, 5'b10101, 5'b10110, 5'b10111, 5'b11000, 5'b11001, 
               5'b11010, 5'b11011, 5'b11100, 5'b11101, 5'b11110, 5'b11111  : begin
                       wen_a15 = 1'b0;
                       wen_a14 = 1'b0;
                       wen_a13 = 1'b0;
                       wen_a12 = 1'b0;
                       wen_a11 = 1'b0;
                       wen_a10 = 1'b0;
                       wen_a9  = 1'b0;
                       wen_a8  = 1'b0;
                       wen_a7  = wen;
                       wen_a6  = wen;
                       wen_a5  = wen;
                       wen_a4  = wen;
                       wen_a3  = wen;
                       wen_a2  = wen;
                       wen_a1  = wen;
                       wen_a0  = wen;
                    end
                    default : begin
                       wen_a15 = 1'b0;
                       wen_a14 = 1'b0;
                       wen_a13 = 1'b0;
                       wen_a12 = 1'b0;
                       wen_a11 = 1'b0;
                       wen_a10 = 1'b0;
                       wen_a9  = 1'b0;
                       wen_a8  = 1'b0;
                       wen_a7  = 1'b0;
                       wen_a6  = 1'b0;
                       wen_a5  = 1'b0;
                       wen_a4  = 1'b0;
                       wen_a3  = 1'b0;
                       wen_a2  = 1'b0;
                       wen_a1  = 1'b0;
                       wen_a0  = 1'b0;
                    end
                endcase

                case (ckRdAddr[10:6])
                  5'b00000, 5'b00001,5'b00010, 5'b00011, 5'b00100, 5'b00101, 5'b00110,5'b00111, 5'b01000, 5'b01001, 
                    5'b01010, 5'b01011,5'b01100, 5'b01101, 5'b01110, 5'b01111 : begin                       

                       readData = 
                                   
                                   {
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
                    5'b10000, 5'b10001, 5'b10010, 5'b10011, 5'b10100, 5'b10101, 5'b10110, 5'b10111, 5'b11000, 5'b11001, 
               5'b11010, 5'b11011, 5'b11100, 5'b11101, 5'b11110, 5'b11111  : begin
                     readData = 
                                 
                                 {
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
                     readData = 8'h00;
                  end
                endcase
            end

            2176: begin
                width16 = 3'b000;
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
                width0  = 3'b011;
                               
                writeAddr16 = writeAddr[9:0];
                writeAddr15 = writeAddr[9:0];
                writeAddr14 = writeAddr[9:0];
                writeAddr13 = writeAddr[9:0];
                writeAddr12 = writeAddr[9:0];
                writeAddr11 = writeAddr[9:0];
                writeAddr10 = writeAddr[9:0];
                writeAddr9  = writeAddr[9:0];
                writeAddr8  = writeAddr[9:0];
                writeAddr7  = writeAddr[9:0];
                writeAddr6  = writeAddr[9:0];
                writeAddr5  = writeAddr[9:0];
                writeAddr4  = writeAddr[9:0];
                writeAddr3  = writeAddr[9:0];
                writeAddr2  = writeAddr[9:0];
                writeAddr1  = writeAddr[9:0];
                writeAddr0 = {writeAddr[6:0], 3'b0};

                readAddr16 = readAddr[9:0];
                readAddr15 = readAddr[9:0];
                readAddr14 = readAddr[9:0];
                readAddr13 = readAddr[9:0];
                readAddr12 = readAddr[9:0];
                readAddr11 = readAddr[9:0];
                readAddr10 = readAddr[9:0];
                readAddr9  = readAddr[9:0];
                readAddr8  = readAddr[9:0];
                readAddr7  = readAddr[9:0];
                readAddr6  = readAddr[9:0];
                readAddr5  = readAddr[9:0];
                readAddr4  = readAddr[9:0];
                readAddr3  = readAddr[9:0];
                readAddr2  = readAddr[9:0];
                readAddr1  = readAddr[9:0];
                readAddr0 = {readAddr[6:0], 3'b0};                        

                writeData16 = {17'b0, writeData[7]};
                writeData15 = {17'b0, writeData[6]};
                writeData14 = {17'b0, writeData[5]};
                writeData13 = {17'b0, writeData[4]};
                writeData12 = {17'b0, writeData[3]};
                writeData11 = {17'b0, writeData[2]};
                writeData10 = {17'b0, writeData[1]};
                writeData9  = {17'b0, writeData[0]};
                writeData8  = {17'b0, writeData[7]};
                writeData7  = {17'b0, writeData[6]};
                writeData6  = {17'b0, writeData[5]};
                writeData5  = {17'b0, writeData[4]};
                writeData4  = {17'b0, writeData[3]};
                writeData3  = {17'b0, writeData[2]};
                writeData2  = {17'b0, writeData[1]};
                writeData1  = {17'b0, writeData[0]};
                writeData0  = {10'b0, writeData[7:0]};
      

                case (writeAddr[11:6])
                  6'b000000, 6'b000001,6'b000010, 6'b000011, 6'b000100,
                    6'b000101, 6'b000110,6'b000111, 6'b001000, 6'b001001,
                    6'b001010, 6'b001011,6'b001100, 6'b001101, 6'b001110,
                    6'b001111 : begin
                       wen_a16 = wen;
                       wen_a15 = wen;
                       wen_a14 = wen;
                       wen_a13 = wen;
                       wen_a12 = wen;
                       wen_a11 = wen;
                       wen_a10 = wen;
                       wen_a9  = wen;
                       wen_a8  = 1'b0;
                       wen_a7  = 1'b0;
                       wen_a6  = 1'b0;
                       wen_a5  = 1'b0;
                       wen_a4  = 1'b0;
                       wen_a3  = 1'b0;
                       wen_a2  = 1'b0;
                       wen_a1  = 1'b0;
                       wen_a0  = 1'b0;
                    end     
                    6'b010000, 6'b010001, 6'b010010, 6'b010011, 6'b010100, 6'b010101, 6'b010110, 6'b010111, 6'b011000, 6'b011001, 
               6'b011010, 6'b011011, 6'b011100, 6'b011101, 6'b011110, 6'b011111  : begin
                       wen_a16 = 1'b0;
                       wen_a15 = 1'b0;
                       wen_a14 = 1'b0;
                       wen_a13 = 1'b0;
                       wen_a12 = 1'b0;
                       wen_a11 = 1'b0;
                       wen_a10 = 1'b0;
                       wen_a9  = 1'b0;
                       wen_a8  = wen;
                       wen_a7  = wen;
                       wen_a6  = wen;
                       wen_a5  = wen;
                       wen_a4  = wen;
                       wen_a3  = wen;
                       wen_a2  = wen;
                       wen_a1  = wen;
                       wen_a0  = 1'b0;
                    end     
               6'b100000,6'b100001  : begin
                       wen_a16 = 1'b0;
                       wen_a15 = 1'b0;
                       wen_a14 = 1'b0;
                       wen_a13 = 1'b0;
                       wen_a12 = 1'b0;
                       wen_a11 = 1'b0;
                       wen_a10 = 1'b0;
                       wen_a9  = 1'b0;
                       wen_a8  = 1'b0;
                       wen_a7  = 1'b0;
                       wen_a6  = 1'b0;
                       wen_a5  = 1'b0;
                       wen_a4  = 1'b0;
                       wen_a3  = 1'b0;
                       wen_a2  = 1'b0;
                       wen_a1  = 1'b0;
                       wen_a0  = wen;
                    end     
                    default : begin
                       wen_a16 = 1'b0;
                       wen_a15 = 1'b0;
                       wen_a14 = 1'b0;
                       wen_a13 = 1'b0;
                       wen_a12 = 1'b0;
                       wen_a11 = 1'b0;
                       wen_a10 = 1'b0;
                       wen_a9  = 1'b0;
                       wen_a8  = 1'b0;
                       wen_a7  = 1'b0;
                       wen_a6  = 1'b0;
                       wen_a5  = 1'b0;
                       wen_a4  = 1'b0;
                       wen_a3  = 1'b0;
                       wen_a2  = 1'b0;
                       wen_a1  = 1'b0;
                       wen_a0  = 1'b0;
                    end     
                endcase

                case (ckRdAddr[11:6])
                  6'b000000, 6'b000001,6'b000010, 6'b000011, 6'b000100, 6'b000101, 6'b000110,6'b000111, 6'b001000, 6'b001001, 
                    6'b001010, 6'b001011,6'b001100, 6'b001101, 6'b001110, 6'b001111 : begin                       

                       readData = 
                                   
                                   {
                                   readData16[0],
                                   readData15[0],
                                   readData14[0],
                                   readData13[0],
                                   readData12[0],
                                   readData11[0],
                                   readData10[0],
                                   readData9[0]
                                   };
                    end
                    6'b010000, 6'b010001, 6'b010010, 6'b010011, 6'b010100, 6'b010101, 6'b010110, 6'b010111, 6'b011000, 6'b011001, 
               6'b011010, 6'b011011, 6'b011100, 6'b011101, 6'b011110, 6'b011111  : begin
                     readData = 
                                 
                                 {
                                   readData8[0],
                                    readData7[0], 
                                    readData6[0], 
                                    readData5[0], 
                                    readData4[0], 
                                    readData3[0], 
                                    readData2[0], 
                                    readData1[0] 
                                 };                     
                  end
               6'b100000, 6'b100001  : begin
                     readData = readData0[7:0];
                  end
                  default : begin
                     readData = 8'h00;
                  end
                endcase
            end


            2304: begin
                width17 = 3'b000;
                width16 = 3'b000;
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
                width1  = 3'b010;                               
                width0  = 3'b010;

                writeAddr17 = writeAddr[9:0];
                writeAddr16 = writeAddr[9:0];
                writeAddr15 = writeAddr[9:0];
                writeAddr14 = writeAddr[9:0];
                writeAddr13 = writeAddr[9:0];
                writeAddr12 = writeAddr[9:0];
                writeAddr11 = writeAddr[9:0];
                writeAddr10 = writeAddr[9:0];
                writeAddr9  = writeAddr[9:0];
                writeAddr8  = writeAddr[9:0];
                writeAddr7  = writeAddr[9:0];
                writeAddr6  = writeAddr[9:0];
                writeAddr5  = writeAddr[9:0];
                writeAddr4  = writeAddr[9:0];
                writeAddr3  = writeAddr[9:0];
                writeAddr2  = writeAddr[9:0];
                writeAddr1  = {writeAddr[7:0], 2'b0};
                writeAddr0  = {writeAddr[7:0], 2'b0};

                readAddr17 = readAddr[9:0];
                readAddr16 = readAddr[9:0];
                readAddr15 = readAddr[9:0];
                readAddr14 = readAddr[9:0];
                readAddr13 = readAddr[9:0];
                readAddr12 = readAddr[9:0];
                readAddr11 = readAddr[9:0];
                readAddr10 = readAddr[9:0];
                readAddr9  = readAddr[9:0];
                readAddr8  = readAddr[9:0];
                readAddr7  = readAddr[9:0];
                readAddr6  = readAddr[9:0];
                readAddr5  = readAddr[9:0];
                readAddr4  = readAddr[9:0];
                readAddr3  = readAddr[9:0];
                readAddr2  = readAddr[9:0];
                readAddr1  = {readAddr[7:0], 2'b0};                        
                readAddr0  = {readAddr[7:0], 2'b0};

                writeData17 = {17'b0, writeData[7]};
                writeData16 = {17'b0, writeData[6]};
                writeData15 = {17'b0, writeData[5]};
                writeData14 = {17'b0, writeData[4]};
                writeData13 = {17'b0, writeData[3]};
                writeData12 = {17'b0, writeData[2]};
                writeData11 = {17'b0, writeData[1]};
                writeData10 = {17'b0, writeData[0]};
                writeData9  = {17'b0, writeData[7]};
                writeData8  = {17'b0, writeData[6]};
                writeData7  = {17'b0, writeData[5]};
                writeData6  = {17'b0, writeData[4]};
                writeData5  = {17'b0, writeData[3]};
                writeData4  = {17'b0, writeData[2]};
                writeData3  = {17'b0, writeData[1]};
                writeData2  = {17'b0, writeData[0]};
                writeData1  = {14'b0, writeData[7:4]};
                writeData0  = {14'b0, writeData[3:0]};

      

                case (writeAddr[11:6])
                  6'b000000, 6'b000001,6'b000010, 6'b000011, 6'b000100,
                    6'b000101, 6'b000110,6'b000111, 6'b001000, 6'b001001,
                    6'b001010, 6'b001011,6'b001100, 6'b001101, 6'b001110,
                    6'b001111 : begin
                       wen_a17 = wen;
                       wen_a16 = wen;
                       wen_a15 = wen;
                       wen_a14 = wen;
                       wen_a13 = wen;
                       wen_a12 = wen;
                       wen_a11 = wen;
                       wen_a10 = wen;
                       wen_a9  = 1'b0;
                       wen_a8  = 1'b0;
                       wen_a7  = 1'b0;
                       wen_a6  = 1'b0;
                       wen_a5  = 1'b0;
                       wen_a4  = 1'b0;
                       wen_a3  = 1'b0;
                       wen_a2  = 1'b0;
                       wen_a1  = 1'b0;
                       wen_a0  = 1'b0;
                    end     
                    6'b010000, 6'b010001, 6'b010010, 6'b010011, 6'b010100, 6'b010101, 6'b010110, 6'b010111, 6'b011000, 6'b011001, 
               6'b011010, 6'b011011, 6'b011100, 6'b011101, 6'b011110, 6'b011111  : begin
                       wen_a17 = 1'b0;
                       wen_a16 = 1'b0;
                       wen_a15 = 1'b0;
                       wen_a14 = 1'b0;
                       wen_a13 = 1'b0;
                       wen_a12 = 1'b0;
                       wen_a11 = 1'b0;
                       wen_a10 = 1'b0;
                       wen_a9  = wen;
                       wen_a8  = wen;
                       wen_a7  = wen;
                       wen_a6  = wen;
                       wen_a5  = wen;
                       wen_a4  = wen;
                       wen_a3  = wen;
                       wen_a2  = wen;
                       wen_a1  = 1'b0;
                       wen_a0  = 1'b0;
                    end     
               6'b100000,6'b100001,6'b100010,6'b100011  : begin
                       wen_a17 = 1'b0;
                       wen_a16 = 1'b0;
                       wen_a15 = 1'b0;
                       wen_a14 = 1'b0;
                       wen_a13 = 1'b0;
                       wen_a12 = 1'b0;
                       wen_a11 = 1'b0;
                       wen_a10 = 1'b0;
                       wen_a9  = 1'b0;
                       wen_a8  = 1'b0;
                       wen_a7  = 1'b0;
                       wen_a6  = 1'b0;
                       wen_a5  = 1'b0;
                       wen_a4  = 1'b0;
                       wen_a3  = 1'b0;
                       wen_a2  = 1'b0;
                       wen_a1  = wen;
                       wen_a0  = wen;
                    end     
                    default : begin
                       wen_a17 = 1'b0;
                       wen_a16 = 1'b0;
                       wen_a15 = 1'b0;
                       wen_a14 = 1'b0;
                       wen_a13 = 1'b0;
                       wen_a12 = 1'b0;
                       wen_a11 = 1'b0;
                       wen_a10 = 1'b0;
                       wen_a9  = 1'b0;
                       wen_a8  = 1'b0;
                       wen_a7  = 1'b0;
                       wen_a6  = 1'b0;
                       wen_a5  = 1'b0;
                       wen_a4  = 1'b0;
                       wen_a3  = 1'b0;
                       wen_a2  = 1'b0;
                       wen_a1  = 1'b0;
                       wen_a0  = 1'b0;
                    end     
                endcase

                case (ckRdAddr[11:6])
                  6'b000000, 6'b000001,6'b000010, 6'b000011, 6'b000100, 6'b000101, 6'b000110,6'b000111, 6'b001000, 6'b001001, 
                    6'b001010, 6'b001011,6'b001100, 6'b001101, 6'b001110, 6'b001111 : begin                       

                       readData = 
                                   
                                   {
                                   readData17[0],
                                   readData16[0],
                                   readData15[0],
                                   readData14[0],
                                   readData13[0],
                                   readData12[0],
                                   readData11[0],
                                   readData10[0]
                                   };
                    end
                    6'b010000, 6'b010001, 6'b010010, 6'b010011, 6'b010100, 6'b010101, 6'b010110, 6'b010111, 6'b011000, 6'b011001, 
               6'b011010, 6'b011011, 6'b011100, 6'b011101, 6'b011110, 6'b011111  : begin
                     readData = 
                                 
                                 {
                                   readData9[0],
                                   readData8[0],
                                    readData7[0], 
                                    readData6[0], 
                                    readData5[0], 
                                    readData4[0], 
                                    readData3[0], 
                                    readData2[0]
                                 };                     
                  end
                 6'b100000, 6'b100001, 6'b100010, 6'b100011  : begin
                readData = 
                            
                            {
                            readData1[3:0],
                            readData0[3:0]
                            };

                  end
                  default : begin
                     readData = 8'h00;
                  end
                endcase // case (ckRdAddr[11:6])
               
            end // case: 2304          

        endcase // case (USRAM_NUM_LOCATIONS_DWIDTH32)        
   end // always @ (*)

    //----------------------------------------------------------------------------------------
    // RAM64x18 blocks
    //----------------------------------------------------------------------------------------


 RAM64x18 block_17(
                    .A_DOUT(readData17),            .B_DOUT(),
                    .A_ADDR_CLK(clk),              .B_ADDR_CLK(clk),
                    .A_ADDR_EN(1'b1),              .B_ADDR_EN(1'b1),
                    .A_ADDR_LAT(1'b1),             .B_ADDR_LAT(1'b1),
                    .A_ADDR_ARST_N(resetn),        .B_ADDR_ARST_N(resetn),
                    .A_ADDR_SRST_N(1'b1),          .B_ADDR_SRST_N(1'b1),
                    .A_DOUT_CLK(1'b1),             .B_DOUT_CLK(1'b1),
                    .A_DOUT_EN(1'b1),              .B_DOUT_EN(1'b1),
                    .A_DOUT_LAT(1'b1),             .B_DOUT_LAT(1'b1),
                    .A_DOUT_ARST_N(resetn),        .B_DOUT_ARST_N(resetn),
                    .A_DOUT_SRST_N(1'b1),          .B_DOUT_SRST_N(1'b1),
                    .A_ADDR(readAddr17),            .B_ADDR(readAddr17),
                    .A_WIDTH(width17),              .B_WIDTH(width17),
//                    .A_BLK(2'b11),                 .B_BLK(2'b11),
                    .A_BLK(ablk),                  .B_BLK(bblk),
                    .A_EN(1'b1),                   .B_EN(1'b1),
                    .C_CLK(clk),                   .C_ADDR(writeAddr17),
                    .C_DIN(writeData17),            .C_WEN(wen_a17),
                    .C_BLK(2'b11),                 .C_WIDTH(width17),
                    .C_EN(1'b1),                   .SII_LOCK(1'b0),
                    .BUSY(u_BUSY_17)
                   );

 RAM64x18 block_16(
                    .A_DOUT(readData16),            .B_DOUT(),
                    .A_ADDR_CLK(clk),              .B_ADDR_CLK(clk),
                    .A_ADDR_EN(1'b1),              .B_ADDR_EN(1'b1),
                    .A_ADDR_LAT(1'b1),             .B_ADDR_LAT(1'b1),
                    .A_ADDR_ARST_N(resetn),        .B_ADDR_ARST_N(resetn),
                    .A_ADDR_SRST_N(1'b1),          .B_ADDR_SRST_N(1'b1),
                    .A_DOUT_CLK(1'b1),             .B_DOUT_CLK(1'b1),
                    .A_DOUT_EN(1'b1),              .B_DOUT_EN(1'b1),
                    .A_DOUT_LAT(1'b1),             .B_DOUT_LAT(1'b1),
                    .A_DOUT_ARST_N(resetn),        .B_DOUT_ARST_N(resetn),
                    .A_DOUT_SRST_N(1'b1),          .B_DOUT_SRST_N(1'b1),
                    .A_ADDR(readAddr16),            .B_ADDR(readAddr16),
                    .A_WIDTH(width16),              .B_WIDTH(width16),
//                    .A_BLK(2'b11),                 .B_BLK(2'b11),
                    .A_BLK(ablk),                  .B_BLK(bblk),
                    .A_EN(1'b1),                   .B_EN(1'b1),
                    .C_CLK(clk),                   .C_ADDR(writeAddr16),
                    .C_DIN(writeData16),            .C_WEN(wen_a16),
                    .C_BLK(2'b11),                 .C_WIDTH(width16),
                    .C_EN(1'b1),                   .SII_LOCK(1'b0),
                    .BUSY(u_BUSY_16)
                   );

 RAM64x18 block_15(
                    .A_DOUT(readData15),            .B_DOUT(),
                    .A_ADDR_CLK(clk),              .B_ADDR_CLK(clk),
                    .A_ADDR_EN(1'b1),              .B_ADDR_EN(1'b1),
                    .A_ADDR_LAT(1'b1),             .B_ADDR_LAT(1'b1),
                    .A_ADDR_ARST_N(resetn),        .B_ADDR_ARST_N(resetn),
                    .A_ADDR_SRST_N(1'b1),          .B_ADDR_SRST_N(1'b1),
                    .A_DOUT_CLK(1'b1),             .B_DOUT_CLK(1'b1),
                    .A_DOUT_EN(1'b1),              .B_DOUT_EN(1'b1),
                    .A_DOUT_LAT(1'b1),             .B_DOUT_LAT(1'b1),
                    .A_DOUT_ARST_N(resetn),        .B_DOUT_ARST_N(resetn),
                    .A_DOUT_SRST_N(1'b1),          .B_DOUT_SRST_N(1'b1),
                    .A_ADDR(readAddr15),            .B_ADDR(readAddr15),
                    .A_WIDTH(width15),              .B_WIDTH(width15),
//                    .A_BLK(2'b11),                 .B_BLK(2'b11),
                    .A_BLK(ablk),                  .B_BLK(bblk),
                    .A_EN(1'b1),                   .B_EN(1'b1),
                    .C_CLK(clk),                   .C_ADDR(writeAddr15),
                    .C_DIN(writeData15),            .C_WEN(wen_a15),
                    .C_BLK(2'b11),                 .C_WIDTH(width15),
                    .C_EN(1'b1),                   .SII_LOCK(1'b0),
                    .BUSY(u_BUSY_15)
                   );

 RAM64x18 block_14(
                    .A_DOUT(readData14),            .B_DOUT(),
                    .A_ADDR_CLK(clk),              .B_ADDR_CLK(clk),
                    .A_ADDR_EN(1'b1),              .B_ADDR_EN(1'b1),
                    .A_ADDR_LAT(1'b1),             .B_ADDR_LAT(1'b1),
                    .A_ADDR_ARST_N(resetn),        .B_ADDR_ARST_N(resetn),
                    .A_ADDR_SRST_N(1'b1),          .B_ADDR_SRST_N(1'b1),
                    .A_DOUT_CLK(1'b1),             .B_DOUT_CLK(1'b1),
                    .A_DOUT_EN(1'b1),              .B_DOUT_EN(1'b1),
                    .A_DOUT_LAT(1'b1),             .B_DOUT_LAT(1'b1),
                    .A_DOUT_ARST_N(resetn),        .B_DOUT_ARST_N(resetn),
                    .A_DOUT_SRST_N(1'b1),          .B_DOUT_SRST_N(1'b1),
                    .A_ADDR(readAddr14),            .B_ADDR(readAddr14),
                    .A_WIDTH(width14),              .B_WIDTH(width14),
//                    .A_BLK(2'b11),                 .B_BLK(2'b11),
                    .A_BLK(ablk),                  .B_BLK(bblk),
                    .A_EN(1'b1),                   .B_EN(1'b1),
                    .C_CLK(clk),                   .C_ADDR(writeAddr14),
                    .C_DIN(writeData14),            .C_WEN(wen_a14),
                    .C_BLK(2'b11),                 .C_WIDTH(width14),
                    .C_EN(1'b1),                   .SII_LOCK(1'b0),
                    .BUSY(u_BUSY_14)
                   );

 RAM64x18 block_13(
                    .A_DOUT(readData13),            .B_DOUT(),
                    .A_ADDR_CLK(clk),              .B_ADDR_CLK(clk),
                    .A_ADDR_EN(1'b1),              .B_ADDR_EN(1'b1),
                    .A_ADDR_LAT(1'b1),             .B_ADDR_LAT(1'b1),
                    .A_ADDR_ARST_N(resetn),        .B_ADDR_ARST_N(resetn),
                    .A_ADDR_SRST_N(1'b1),          .B_ADDR_SRST_N(1'b1),
                    .A_DOUT_CLK(1'b1),             .B_DOUT_CLK(1'b1),
                    .A_DOUT_EN(1'b1),              .B_DOUT_EN(1'b1),
                    .A_DOUT_LAT(1'b1),             .B_DOUT_LAT(1'b1),
                    .A_DOUT_ARST_N(resetn),        .B_DOUT_ARST_N(resetn),
                    .A_DOUT_SRST_N(1'b1),          .B_DOUT_SRST_N(1'b1),
                    .A_ADDR(readAddr13),            .B_ADDR(readAddr13),
                    .A_WIDTH(width13),              .B_WIDTH(width13),
//                    .A_BLK(2'b11),                 .B_BLK(2'b11),
                    .A_BLK(ablk),                  .B_BLK(bblk),
                    .A_EN(1'b1),                   .B_EN(1'b1),
                    .C_CLK(clk),                   .C_ADDR(writeAddr13),
                    .C_DIN(writeData13),            .C_WEN(wen_a13),
                    .C_BLK(2'b11),                 .C_WIDTH(width13),
                    .C_EN(1'b1),                   .SII_LOCK(1'b0),
                    .BUSY(u_BUSY_13)
                   );

 RAM64x18 block_12(
                    .A_DOUT(readData12),            .B_DOUT(),
                    .A_ADDR_CLK(clk),              .B_ADDR_CLK(clk),
                    .A_ADDR_EN(1'b1),              .B_ADDR_EN(1'b1),
                    .A_ADDR_LAT(1'b1),             .B_ADDR_LAT(1'b1),
                    .A_ADDR_ARST_N(resetn),        .B_ADDR_ARST_N(resetn),
                    .A_ADDR_SRST_N(1'b1),          .B_ADDR_SRST_N(1'b1),
                    .A_DOUT_CLK(1'b1),             .B_DOUT_CLK(1'b1),
                    .A_DOUT_EN(1'b1),              .B_DOUT_EN(1'b1),
                    .A_DOUT_LAT(1'b1),             .B_DOUT_LAT(1'b1),
                    .A_DOUT_ARST_N(resetn),        .B_DOUT_ARST_N(resetn),
                    .A_DOUT_SRST_N(1'b1),          .B_DOUT_SRST_N(1'b1),
                    .A_ADDR(readAddr12),            .B_ADDR(readAddr12),
                    .A_WIDTH(width12),              .B_WIDTH(width12),
//                    .A_BLK(2'b11),                 .B_BLK(2'b11),
                    .A_BLK(ablk),                  .B_BLK(bblk),
                    .A_EN(1'b1),                   .B_EN(1'b1),
                    .C_CLK(clk),                   .C_ADDR(writeAddr12),
                    .C_DIN(writeData12),            .C_WEN(wen_a12),
                    .C_BLK(2'b11),                 .C_WIDTH(width12),
                    .C_EN(1'b1),                   .SII_LOCK(1'b0),
                    .BUSY(u_BUSY_12)
                   );

 RAM64x18 block_11(
                    .A_DOUT(readData11),            .B_DOUT(),
                    .A_ADDR_CLK(clk),              .B_ADDR_CLK(clk),
                    .A_ADDR_EN(1'b1),              .B_ADDR_EN(1'b1),
                    .A_ADDR_LAT(1'b1),             .B_ADDR_LAT(1'b1),
                    .A_ADDR_ARST_N(resetn),        .B_ADDR_ARST_N(resetn),
                    .A_ADDR_SRST_N(1'b1),          .B_ADDR_SRST_N(1'b1),
                    .A_DOUT_CLK(1'b1),             .B_DOUT_CLK(1'b1),
                    .A_DOUT_EN(1'b1),              .B_DOUT_EN(1'b1),
                    .A_DOUT_LAT(1'b1),             .B_DOUT_LAT(1'b1),
                    .A_DOUT_ARST_N(resetn),        .B_DOUT_ARST_N(resetn),
                    .A_DOUT_SRST_N(1'b1),          .B_DOUT_SRST_N(1'b1),
                    .A_ADDR(readAddr11),            .B_ADDR(readAddr11),
                    .A_WIDTH(width11),              .B_WIDTH(width11),
//                    .A_BLK(2'b11),                 .B_BLK(2'b11),
                    .A_BLK(ablk),                  .B_BLK(bblk),
                    .A_EN(1'b1),                   .B_EN(1'b1),
                    .C_CLK(clk),                   .C_ADDR(writeAddr11),
                    .C_DIN(writeData11),            .C_WEN(wen_a11),
                    .C_BLK(2'b11),                 .C_WIDTH(width11),
                    .C_EN(1'b1),                   .SII_LOCK(1'b0),
                    .BUSY(u_BUSY_11)
                   );

 RAM64x18 block_10(
                    .A_DOUT(readData10),            .B_DOUT(),
                    .A_ADDR_CLK(clk),              .B_ADDR_CLK(clk),
                    .A_ADDR_EN(1'b1),              .B_ADDR_EN(1'b1),
                    .A_ADDR_LAT(1'b1),             .B_ADDR_LAT(1'b1),
                    .A_ADDR_ARST_N(resetn),        .B_ADDR_ARST_N(resetn),
                    .A_ADDR_SRST_N(1'b1),          .B_ADDR_SRST_N(1'b1),
                    .A_DOUT_CLK(1'b1),             .B_DOUT_CLK(1'b1),
                    .A_DOUT_EN(1'b1),              .B_DOUT_EN(1'b1),
                    .A_DOUT_LAT(1'b1),             .B_DOUT_LAT(1'b1),
                    .A_DOUT_ARST_N(resetn),        .B_DOUT_ARST_N(resetn),
                    .A_DOUT_SRST_N(1'b1),          .B_DOUT_SRST_N(1'b1),
                    .A_ADDR(readAddr10),            .B_ADDR(readAddr10),
                    .A_WIDTH(width10),              .B_WIDTH(width10),
//                    .A_BLK(2'b11),                 .B_BLK(2'b11),
                    .A_BLK(ablk),                  .B_BLK(bblk),
                    .A_EN(1'b1),                   .B_EN(1'b1),
                    .C_CLK(clk),                   .C_ADDR(writeAddr10),
                    .C_DIN(writeData10),            .C_WEN(wen_a10),
                    .C_BLK(2'b11),                 .C_WIDTH(width10),
                    .C_EN(1'b1),                   .SII_LOCK(1'b0),
                    .BUSY(u_BUSY_10)
                   );

 RAM64x18 block_9(
                    .A_DOUT(readData9),            .B_DOUT(),
                    .A_ADDR_CLK(clk),              .B_ADDR_CLK(clk),
                    .A_ADDR_EN(1'b1),              .B_ADDR_EN(1'b1),
                    .A_ADDR_LAT(1'b1),             .B_ADDR_LAT(1'b1),
                    .A_ADDR_ARST_N(resetn),        .B_ADDR_ARST_N(resetn),
                    .A_ADDR_SRST_N(1'b1),          .B_ADDR_SRST_N(1'b1),
                    .A_DOUT_CLK(1'b1),             .B_DOUT_CLK(1'b1),
                    .A_DOUT_EN(1'b1),              .B_DOUT_EN(1'b1),
                    .A_DOUT_LAT(1'b1),             .B_DOUT_LAT(1'b1),
                    .A_DOUT_ARST_N(resetn),        .B_DOUT_ARST_N(resetn),
                    .A_DOUT_SRST_N(1'b1),          .B_DOUT_SRST_N(1'b1),
                    .A_ADDR(readAddr9),            .B_ADDR(readAddr9),
                    .A_WIDTH(width9),              .B_WIDTH(width9),
//                    .A_BLK(2'b11),                 .B_BLK(2'b11),
                    .A_BLK(ablk),                  .B_BLK(bblk),
                    .A_EN(1'b1),                   .B_EN(1'b1),
                    .C_CLK(clk),                   .C_ADDR(writeAddr9),
                    .C_DIN(writeData9),            .C_WEN(wen_a9),
                    .C_BLK(2'b11),                 .C_WIDTH(width9),
                    .C_EN(1'b1),                   .SII_LOCK(1'b0),
                    .BUSY(u_BUSY_9)
                   );

 RAM64x18 block_8(
                    .A_DOUT(readData8),            .B_DOUT(),
                    .A_ADDR_CLK(clk),              .B_ADDR_CLK(clk),
                    .A_ADDR_EN(1'b1),              .B_ADDR_EN(1'b1),
                    .A_ADDR_LAT(1'b1),             .B_ADDR_LAT(1'b1),
                    .A_ADDR_ARST_N(resetn),        .B_ADDR_ARST_N(resetn),
                    .A_ADDR_SRST_N(1'b1),          .B_ADDR_SRST_N(1'b1),
                    .A_DOUT_CLK(1'b1),             .B_DOUT_CLK(1'b1),
                    .A_DOUT_EN(1'b1),              .B_DOUT_EN(1'b1),
                    .A_DOUT_LAT(1'b1),             .B_DOUT_LAT(1'b1),
                    .A_DOUT_ARST_N(resetn),        .B_DOUT_ARST_N(resetn),
                    .A_DOUT_SRST_N(1'b1),          .B_DOUT_SRST_N(1'b1),
                    .A_ADDR(readAddr8),            .B_ADDR(readAddr8),
                    .A_WIDTH(width8),              .B_WIDTH(width8),
//                    .A_BLK(2'b11),                 .B_BLK(2'b11),
                    .A_BLK(ablk),                  .B_BLK(bblk),
                    .A_EN(1'b1),                   .B_EN(1'b1),
                    .C_CLK(clk),                   .C_ADDR(writeAddr8),
                    .C_DIN(writeData8),            .C_WEN(wen_a8),
                    .C_BLK(2'b11),                 .C_WIDTH(width8),
                    .C_EN(1'b1),                   .SII_LOCK(1'b0),
                    .BUSY(u_BUSY_8)
                   );



 RAM64x18 block_7(
                    .A_DOUT(readData7),            .B_DOUT(),
                    .A_ADDR_CLK(clk),              .B_ADDR_CLK(clk),
                    .A_ADDR_EN(1'b1),              .B_ADDR_EN(1'b1),
                    .A_ADDR_LAT(1'b1),             .B_ADDR_LAT(1'b1),
                    .A_ADDR_ARST_N(resetn),        .B_ADDR_ARST_N(resetn),
                    .A_ADDR_SRST_N(1'b1),          .B_ADDR_SRST_N(1'b1),
                    .A_DOUT_CLK(1'b1),             .B_DOUT_CLK(1'b1),
                    .A_DOUT_EN(1'b1),              .B_DOUT_EN(1'b1),
                    .A_DOUT_LAT(1'b1),             .B_DOUT_LAT(1'b1),
                    .A_DOUT_ARST_N(resetn),        .B_DOUT_ARST_N(resetn),
                    .A_DOUT_SRST_N(1'b1),          .B_DOUT_SRST_N(1'b1),
                    .A_ADDR(readAddr7),            .B_ADDR(readAddr7),
                    .A_WIDTH(width7),              .B_WIDTH(width7),
//                    .A_BLK(2'b11),                 .B_BLK(2'b11),
                    .A_BLK(ablk),                  .B_BLK(bblk),
                    .A_EN(1'b1),                   .B_EN(1'b1),
                    .C_CLK(clk),                   .C_ADDR(writeAddr7),
                    .C_DIN(writeData7),            .C_WEN(wen_a7),
                    .C_BLK(2'b11),                 .C_WIDTH(width7),
                    .C_EN(1'b1),                   .SII_LOCK(1'b0),
                    .BUSY(u_BUSY_7)
                   );

 RAM64x18 block_6(
                    .A_DOUT(readData6),            .B_DOUT(),
                    .A_ADDR_CLK(clk),              .B_ADDR_CLK(clk),
                    .A_ADDR_EN(1'b1),              .B_ADDR_EN(1'b1),
                    .A_ADDR_LAT(1'b1),             .B_ADDR_LAT(1'b1),
                    .A_ADDR_ARST_N(resetn),        .B_ADDR_ARST_N(resetn),
                    .A_ADDR_SRST_N(1'b1),          .B_ADDR_SRST_N(1'b1),
                    .A_DOUT_CLK(1'b1),             .B_DOUT_CLK(1'b1),
                    .A_DOUT_EN(1'b1),              .B_DOUT_EN(1'b1),
                    .A_DOUT_LAT(1'b1),             .B_DOUT_LAT(1'b1),
                    .A_DOUT_ARST_N(resetn),        .B_DOUT_ARST_N(resetn),
                    .A_DOUT_SRST_N(1'b1),          .B_DOUT_SRST_N(1'b1),
                    .A_ADDR(readAddr6),            .B_ADDR(readAddr6),
                    .A_WIDTH(width6),              .B_WIDTH(width6),
//                    .A_BLK(2'b11),                 .B_BLK(2'b11),
                    .A_BLK(ablk),                  .B_BLK(bblk),
                    .A_EN(1'b1),                   .B_EN(1'b1),
                    .C_CLK(clk),                   .C_ADDR(writeAddr6),
                    .C_DIN(writeData6),            .C_WEN(wen_a6),
                    .C_BLK(2'b11),                 .C_WIDTH(width6),
                    .C_EN(1'b1),                   .SII_LOCK(1'b0),
                    .BUSY(u_BUSY_6)
                   );

 RAM64x18 block_5(
                    .A_DOUT(readData5),            .B_DOUT(),
                    .A_ADDR_CLK(clk),              .B_ADDR_CLK(clk),
                    .A_ADDR_EN(1'b1),              .B_ADDR_EN(1'b1),
                    .A_ADDR_LAT(1'b1),             .B_ADDR_LAT(1'b1),
                    .A_ADDR_ARST_N(resetn),        .B_ADDR_ARST_N(resetn),
                    .A_ADDR_SRST_N(1'b1),          .B_ADDR_SRST_N(1'b1),
                    .A_DOUT_CLK(1'b1),             .B_DOUT_CLK(1'b1),
                    .A_DOUT_EN(1'b1),              .B_DOUT_EN(1'b1),
                    .A_DOUT_LAT(1'b1),             .B_DOUT_LAT(1'b1),
                    .A_DOUT_ARST_N(resetn),        .B_DOUT_ARST_N(resetn),
                    .A_DOUT_SRST_N(1'b1),          .B_DOUT_SRST_N(1'b1),
                    .A_ADDR(readAddr5),            .B_ADDR(readAddr5),
                    .A_WIDTH(width5),              .B_WIDTH(width5),
//                    .A_BLK(2'b11),                 .B_BLK(2'b11),
                    .A_BLK(ablk),                  .B_BLK(bblk),
                    .A_EN(1'b1),                   .B_EN(1'b1),
                    .C_CLK(clk),                   .C_ADDR(writeAddr5),
                    .C_DIN(writeData5),            .C_WEN(wen_a5),
                    .C_BLK(2'b11),                 .C_WIDTH(width5),
                    .C_EN(1'b1),                   .SII_LOCK(1'b0),
                    .BUSY(u_BUSY_5)
                   );

 RAM64x18 block_4(
                    .A_DOUT(readData4),            .B_DOUT(),
                    .A_ADDR_CLK(clk),              .B_ADDR_CLK(clk),
                    .A_ADDR_EN(1'b1),              .B_ADDR_EN(1'b1),
                    .A_ADDR_LAT(1'b1),             .B_ADDR_LAT(1'b1),
                    .A_ADDR_ARST_N(resetn),        .B_ADDR_ARST_N(resetn),
                    .A_ADDR_SRST_N(1'b1),          .B_ADDR_SRST_N(1'b1),
                    .A_DOUT_CLK(1'b1),             .B_DOUT_CLK(1'b1),
                    .A_DOUT_EN(1'b1),              .B_DOUT_EN(1'b1),
                    .A_DOUT_LAT(1'b1),             .B_DOUT_LAT(1'b1),
                    .A_DOUT_ARST_N(resetn),        .B_DOUT_ARST_N(resetn),
                    .A_DOUT_SRST_N(1'b1),          .B_DOUT_SRST_N(1'b1),
                    .A_ADDR(readAddr4),            .B_ADDR(readAddr4),
                    .A_WIDTH(width4),              .B_WIDTH(width4),
//                    .A_BLK(2'b11),                 .B_BLK(2'b11),
                    .A_BLK(ablk),                 .B_BLK(bblk),
                    .A_EN(1'b1),                   .B_EN(1'b1),
                    .C_CLK(clk),                   .C_ADDR(writeAddr4),
                    .C_DIN(writeData4),            .C_WEN(wen_a4),
                    .C_BLK(2'b11),                 .C_WIDTH(width4),
                    .C_EN(1'b1),                   .SII_LOCK(1'b0),
                    .BUSY(u_BUSY_4)
                   );

 RAM64x18 block_3(
                    .A_DOUT(readData3),            .B_DOUT(),
                    .A_ADDR_CLK(clk),              .B_ADDR_CLK(clk),
                    .A_ADDR_EN(1'b1),              .B_ADDR_EN(1'b1),
                    .A_ADDR_LAT(1'b1),             .B_ADDR_LAT(1'b1),
                    .A_ADDR_ARST_N(resetn),        .B_ADDR_ARST_N(resetn),
                    .A_ADDR_SRST_N(1'b1),          .B_ADDR_SRST_N(1'b1),
                    .A_DOUT_CLK(1'b1),             .B_DOUT_CLK(1'b1),
                    .A_DOUT_EN(1'b1),              .B_DOUT_EN(1'b1),
                    .A_DOUT_LAT(1'b1),             .B_DOUT_LAT(1'b1),
                    .A_DOUT_ARST_N(resetn),        .B_DOUT_ARST_N(resetn),
                    .A_DOUT_SRST_N(1'b1),          .B_DOUT_SRST_N(1'b1),
                    .A_ADDR(readAddr3),            .B_ADDR(readAddr3),
                    .A_WIDTH(width3),              .B_WIDTH(width3),
//                    .A_BLK(2'b11),                 .B_BLK(2'b11),
                    .A_BLK(ablk),                 .B_BLK(bblk),
                    .A_EN(1'b1),                   .B_EN(1'b1),
                    .C_CLK(clk),                   .C_ADDR(writeAddr3),
                    .C_DIN(writeData3),            .C_WEN(wen_a3),
                    .C_BLK(2'b11),                 .C_WIDTH(width3),
                    .C_EN(1'b1),                   .SII_LOCK(1'b0),
                    .BUSY(u_BUSY_3)
                   );


    RAM64x18 block_2(
                    .A_DOUT(readData2),            .B_DOUT(),
                    .A_ADDR_CLK(clk),              .B_ADDR_CLK(clk),
                    .A_ADDR_EN(1'b1),              .B_ADDR_EN(1'b1),
                    .A_ADDR_LAT(1'b1),             .B_ADDR_LAT(1'b1),
                    .A_ADDR_ARST_N(resetn),        .B_ADDR_ARST_N(resetn),
                    .A_ADDR_SRST_N(1'b1),          .B_ADDR_SRST_N(1'b1),
                    .A_DOUT_CLK(1'b1),             .B_DOUT_CLK(1'b1),
                    .A_DOUT_EN(1'b1),              .B_DOUT_EN(1'b1),
                    .A_DOUT_LAT(1'b1),             .B_DOUT_LAT(1'b1),
                    .A_DOUT_ARST_N(resetn),        .B_DOUT_ARST_N(resetn),
                    .A_DOUT_SRST_N(1'b1),          .B_DOUT_SRST_N(1'b1),
                    .A_ADDR(readAddr2),            .B_ADDR(readAddr2),
                    .A_WIDTH(width2),              .B_WIDTH(width2),
//                    .A_BLK(2'b11),                 .B_BLK(2'b11),
                    .A_BLK(ablk),                 .B_BLK(bblk),
                    .A_EN(1'b1),                   .B_EN(1'b1),
                    .C_CLK(clk),                   .C_ADDR(writeAddr2),
                    .C_DIN(writeData2),            .C_WEN(wen_a2),
                    .C_BLK(2'b11),                 .C_WIDTH(width2),
                    .C_EN(1'b1),                   .SII_LOCK(1'b0),
                    .BUSY(u_BUSY_2)
                   );

      RAM64x18 block_1(
                    .A_DOUT(readData1),            .B_DOUT(),
                    .A_ADDR_CLK(clk),              .B_ADDR_CLK(clk),
                    .A_ADDR_EN(1'b1),              .B_ADDR_EN(1'b1),
                    .A_ADDR_LAT(1'b1),             .B_ADDR_LAT(1'b1),
                    .A_ADDR_ARST_N(resetn),        .B_ADDR_ARST_N(resetn),
                    .A_ADDR_SRST_N(1'b1),          .B_ADDR_SRST_N(1'b1),
                    .A_DOUT_CLK(1'b1),             .B_DOUT_CLK(1'b1),
                    .A_DOUT_EN(1'b1),              .B_DOUT_EN(1'b1),
                    .A_DOUT_LAT(1'b1),             .B_DOUT_LAT(1'b1),
                    .A_DOUT_ARST_N(resetn),        .B_DOUT_ARST_N(resetn),
                    .A_DOUT_SRST_N(1'b1),          .B_DOUT_SRST_N(1'b1),
                    .A_ADDR(readAddr1),            .B_ADDR(readAddr1),
                    .A_WIDTH(width1),              .B_WIDTH(width1),
//                    .A_BLK(2'b11),                 .B_BLK(2'b11),
                    .A_BLK(ablk),                 .B_BLK(bblk),
                    .A_EN(1'b1),                   .B_EN(1'b1),
                    .C_CLK(clk),                   .C_ADDR(writeAddr1),
                    .C_DIN(writeData1),            .C_WEN(wen_a1),
                    .C_BLK(2'b11),                 .C_WIDTH(width1),
                    .C_EN(1'b1),                   .SII_LOCK(1'b0),
                    .BUSY(u_BUSY_1)
                   );

      RAM64x18 block_0(
                    .A_DOUT(readData0),            .B_DOUT(),
                    .A_ADDR_CLK(clk),              .B_ADDR_CLK(clk),
                    .A_ADDR_EN(1'b1),              .B_ADDR_EN(1'b1),
                    .A_ADDR_LAT(1'b1),             .B_ADDR_LAT(1'b1),
                    .A_ADDR_ARST_N(resetn),        .B_ADDR_ARST_N(resetn),
                    .A_ADDR_SRST_N(1'b1),          .B_ADDR_SRST_N(1'b1),
                    .A_DOUT_CLK(1'b1),             .B_DOUT_CLK(1'b1),
                    .A_DOUT_EN(1'b1),              .B_DOUT_EN(1'b1),
                    .A_DOUT_LAT(1'b1),             .B_DOUT_LAT(1'b1),
                    .A_DOUT_ARST_N(resetn),        .B_DOUT_ARST_N(resetn),
                    .A_DOUT_SRST_N(1'b1),          .B_DOUT_SRST_N(1'b1),
                    .A_ADDR(readAddr0),            .B_ADDR(readAddr0),
                    .A_WIDTH(width0),              .B_WIDTH(width0),
//                    .A_BLK(2'b11),                 .B_BLK(2'b11),
                    .A_BLK(ablk),                 .B_BLK(bblk),
                    .A_EN(1'b1),                   .B_EN(1'b1),
                    .C_CLK(clk),                   .C_ADDR(writeAddr0),
                    .C_DIN(writeData0),            .C_WEN(wen_a0),
                    .C_BLK(2'b11),                 .C_WIDTH(width0),
                    .C_EN(1'b1),                   .SII_LOCK(1'b0),
                    .BUSY(u_BUSY_0)
                   );


assign u_BUSY_all = u_BUSY_0 | u_BUSY_1 | u_BUSY_2 | u_BUSY_3 | u_BUSY_4 | u_BUSY_5 | u_BUSY_6 | u_BUSY_7 | u_BUSY_8 | u_BUSY_9 | u_BUSY_10 |
                       u_BUSY_11 | u_BUSY_12 | u_BUSY_13 | u_BUSY_14 | u_BUSY_15 | u_BUSY_16 | u_BUSY_17;


endmodule
