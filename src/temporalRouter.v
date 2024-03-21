`ifndef __TEMPORALROUTER__
`define __TEMPORALROUTER__

`include "priorityRouter.v"

module temporalRouter
#(
  parameter DATA_WIDTH = 32,
  parameter DATA_NUM = 8, 
  parameter VERSION_WIDTH = 4,
  parameter VERSION_NUM = 4
)
(
  input [VERSION_WIDTH * VERSION_NUM - 1:0] versions, 

  input [DATA_WIDTH * VERSION_NUM - 1:0]    dataInputs, 

  input [VERSION_WIDTH * DATA_NUM - 1:0]    readVersions, 

  output reg [DATA_WIDTH * DATA_NUM - 1:0]  dataOuts
);

  genvar i;

  generate
    for(i = 0; i < DATA_NUM; i = i + 1)
    begin
      priorityRouter #(.DATA_WIDTH(DATA_WIDTH), 
                       .VERSION_WIDTH(VERSION_WIDTH), 
                       .VERSION_NUM(VERSION_NUM)) 
                       loopRouter 
                       (.versions(versions), 
                        .dataInputs(dataInputs), 
                        .readVersion(readVersions[i * VERSION_WIDTH +:VERSION_WIDTH]), 
                        .dataOut(dataOuts[i * DATA_WIDTH +:DATA_WIDTH]));
    end
  endgenerate

endmodule

`endif
