`include "priorityRouter.v"

module test_priorityRouter;

localparam DATA_WIDTH = 32;
localparam VERSION_WIDTH = 4;
localparam VERSION_NUM = 4;

localparam TEST_NUM = 20;

integer i, j;

reg [DATA_WIDTH * VERSION_NUM - 1:0] dataInputs;

reg [VERSION_WIDTH * VERSION_NUM - 1:0] versions;

reg [VERSION_WIDTH - 1:0] readVersion;

wire [DATA_WIDTH - 1:0] dataOut;

priorityRouter #(.DATA_WIDTH(32), .VERSION_WIDTH(VERSION_WIDTH), .VERSION_NUM(VERSION_NUM)) dut ( 
                .versions(versions), 
                .dataInputs(dataInputs), 
                .readVersion(readVersion), 
                .dataOut(dataOut));
              
initial
begin
  $monitor("readVersion: %b\ndataOut: %d\n\n\n\n", readVersion, dataOut);

  for(i = 0; i < TEST_NUM; i = i + 1)
  begin
    dataInputs = $random * DATA_WIDTH * VERSION_NUM * 20;
    versions = $random;

    for(j = 0; j < VERSION_NUM; j = j + 1)
    begin
      $display("dataInputs[%d]: %d\nversions[%d]: %b\n", j, dataInputs[j * DATA_WIDTH +:DATA_WIDTH], j, versions[j * VERSION_WIDTH +:VERSION_WIDTH]);
    end

    readVersion = $random;
    #1;
  end
end

endmodule
