`include "../priorityRouter.v"

module test_priorityRouter;

localparam DATA_WIDTH = 32;
localparam VERSION_WIDTH = 4;
localparam VERSION_NUM = 4;

integer i;

reg [DATA_WIDTH * VERSION_NUM - 1:0] dataInputs;

reg [VERSION_WIDTH * VERSION_NUM - 1:0] versions;

reg [VERSION_WIDTH - 1:0] readVersion;

wire [DATA_WIDTH - 1:0] dataOut;

priorityRouter #(.DATA_WIDTH(32), .VERSION_WIDTH(VERSION_WIDTH), .VERSION_NUM(VERSION_NUM)) dut ();

initial
begin
  $monitor("readVersion: %d\n\n\ndataIn0: %d\ndataIn1: %d\ndataIn2: %d\ndataIn3: %d\n\n\nversion0: %d\nversion1: %d\nversion2: %d\nversion3: %d\n\n\ndataOut: %d\n-------------------------------------------------------", readVersion, dataIn0, dataIn1, dataIn2, dataIn3, version0, version1, version2, version3, dataOut);

  for(i = 0; i < 20; i = i + 1)
  begin
    readVersion = $random;

    version0 = $random % (2 ** VERSION_WIDTH);
    version1 = $random % (2 ** VERSION_WIDTH);
    version2 = $random % (2 ** VERSION_WIDTH);
    version3 = $random % (2 ** VERSION_WIDTH);

    dataIn0 = $random;
    dataIn1 = $random;
    dataIn2 = $random;
    dataIn3 = $random;

    #1;
  end
end

endmodule
