`include "../priorityRouter.v"

`define BLOCK_SIZE 4

module test_priorityRouter.v;

integer i;

reg [31:0] dataIn0;
reg [31:0] dataIn1;
reg [31:0] dataIn2;
reg [31:0] dataIn3;

reg [BLOCK_SIZE - 1:0] version0;
reg [BLOCK_SIZE - 1:0] version1;
reg [BLOCK_SIZE - 1:0] version2;
reg [BLOCK_SIZE - 1:0] version3;

reg [BLOCK_SIZE - 1:0] readVersion;

wire [31:0] dataOut;

priorityRouter #(.BLOCK_SIZE(BLOCK_SIZE) dut (
  .version0(version0), .version1(version1), .version2(version2), .version3(version3), 
  .dataIn0(dataIn0), .dataIn1(dataIn1), .dataIn2(dataIn2), .dataIn3(dataIn3), 
  .readVersion(readVersion), 
  .dataOut(dataOut));

initial
begin
end

endmodule
