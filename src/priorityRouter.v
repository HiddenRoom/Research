`ifndef __PRIORITYROUTER__
`define __PRIORITYROUTER__

module priorityRouter
#(
  parameter DATA_WIDTH = 32,
  parameter VERSION_WIDTH = 4,
  parameter VERSION_NUM = 4
)
(
  // take in input val and version num and read input with version num and
  // output the nearest version inside with a version num less than input
  // version num 
  input [VERSION_WIDTH * VERSION_NUM - 1:0] versions, 

  input [DATA_WIDTH * VERSION_NUM - 1:0]    dataInputs, 

  input [VERSION_WIDTH - 1:0]               readVersion, 

  output reg [DATA_WIDTH - 1:0]             dataOut
);

  integer i;

  reg [VERSION_WIDTH - 1:0] greatest;

  always @(*)
  begin
    greatest = 0;
    for(i = 1; i < VERSION_NUM + 1; i = i + 1)
    begin
      if(versions[(i - 1) * VERSION_WIDTH +:VERSION_WIDTH] > greatest && versions[(i - 1) * VERSION_WIDTH +:VERSION_WIDTH] < readVersion)
      begin
        greatest = versions[(i - 1) * VERSION_WIDTH +:VERSION_WIDTH];
      end
    end

    dataOut = dataInputs[(greatest - 1) * DATA_WIDTH +:DATA_WIDTH];
  end

endmodule

`endif
