`ifndef __REGFILE__
`define __REGFILE__

module regFile
(
  input           clk,

  input [4:0]     read0,
  input [4:0]     read1,
  input [4:0]     read2,
  input [4:0]     read3,

  input [4:0]     write0,
  input [4:0]     write1,
  input [4:0]     write2,
  input [4:0]     write3,

  input           writeEnable0,
  input           writeEnable1,
  input           writeEnable2,
  input           writeEnable3,

  input [31:0]    dataIn0,
  input [31:0]    dataIn1,
  input [31:0]    dataIn2,
  input [31:0]    dataIn3,

  output reg [31:0] dataOut0,
  output reg [31:0] dataOut1,
  output reg [31:0] dataOut2,
  output reg [31:0] dataOut3
);
  
  reg [31:0] regFile [0:31];

  assign regFile[0] = 0;

  always @(posedge clk)
  begin
    if (writeEnable0)
    begin
      regFile[write0] <= dataIn0;
    end
    else if (writeEnable1)
    begin
      regFile[write1] <= dataIn1;
    end
    else if (writeEnable2)
    begin
      regFile[write2] <= dataIn2;
    end
    else if (writeEnable3)
    begin
      regFile[write3] <= dataIn3;
    end
    
    dataOut0 <= regFile[read0];
    dataOut1 <= regFile[read1];
    dataOut2 <= regFile[read2];
    dataOut3 <= regFile[read3];
  end

endmodule

`endif
