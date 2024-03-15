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

  reg [VERSION_NUM - 1:0] index;
  reg [VERSION_WIDTH - 1:0] greatest;

  always @(*)
  begin
    index = 0;
    greatest = 0;
    for(i = 0; i < VERSION_NUM; i = i + 1)
    begin
      $display("current: %b\npossibleNew: %b\nlimit: %b\n", greatest, versions[i * VERSION_WIDTH +:VERSION_WIDTH], readVersion);
      if(versions[i * VERSION_WIDTH +:VERSION_WIDTH] > greatest && versions[i * VERSION_WIDTH +:VERSION_WIDTH] < readVersion)
      begin
        index = i;
        greatest = versions[i * VERSION_WIDTH +:VERSION_WIDTH];
      end
    end
    $display("final: %b\n", greatest);


    dataOut = dataInputs[index * DATA_WIDTH +:DATA_WIDTH];
  end

endmodule

`endif
