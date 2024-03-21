`ifndef __ARITHMETICPROCESSINGELEMENT__
`define __ARITHMETICPROCESSINGELEMENT__

`include "alu.v"

module arithmeticProcessingElement
#(
  parameter DATA_WIDTH = 32,
  parameter DATA_NUM = 8,
  parameter INSTRUCTION_NUM = 16
)
(
  input           configure,
  input [3:0]     operationConf,
  input [$clog2(DATA_NUM) - 1:0] dataIn0Conf,
  input [$clog2(DATA_NUM) - 1:0] dataIn1Conf,
  input [$clog2(DATA_NUM) - 1:0] dataOutConf,
  input [$clog2(INSTRUCTION_NUM) - 1:0] instructionNumberConf,

  input [DATA_WIDTH - 1:0]    dataIn0,
  input [DATA_WIDTH - 1:0]    dataIn1,

  output reg [$clog2(DATA_NUM) - 1:0] dataIn0Request,
  output reg [$clog2(DATA_NUM) - 1:0] dataIn1Request,
  output reg [$clog2(DATA_NUM) - 1:0] dataOutDestination,
  output reg [$clog2(INSTRUCTION_NUM) - 1:0] instructionNumber,

  output [DATA_WIDTH - 1:0]   dataOut
);

  reg [3:0] aluOp;

  always @(*)
  begin
    if (configure)
    begin
      aluOp = operationConf;
      dataIn0Request = dataIn0Conf;
      dataIn1Request = dataIn1Conf;
      dataOutDestination = dataOutConf;
      instructionNumber = instructionNumberConf;
    end
  end

  alu #(.DATA_WIDTH(DATA_WIDTH)) arithPE_ALU ( 
        .dataIn0(dataIn0), 
        .dataIn1(dataIn1), 
        .dataOut(dataOut));

endmodule

`endif
