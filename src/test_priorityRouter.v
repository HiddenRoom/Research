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
  for(i = 0; i < TEST_NUM; i = i + 1)
  begin
    for(j = 0; j < VERSION_NUM; j = j + 1)
    begin
      dataInputs[(i - 1) * DATA_WIDTH +:DATA_WIDTH] = $random;
      versions[(i - 1) * VERSION_WIDTH +:VERSION_WIDTH] = $random;
      $display("dataInputs[%d]: %d\nversions[%d]: %b\n", i, dataInputs[(i - 1) * DATA_WIDTH +:DATA_WIDTH], i, versions[(i - 1) * VERSION_WIDTH +:VERSION_WIDTH]);
    end
    readVersion = $random;

    $display("readVersion: %b\ndataOut: %d\n\n\n\n", readVersion, dataOut);
    #1;
  end

end

endmodule
