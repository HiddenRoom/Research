`ifndef __PRIORITYROUTER__
`define __PRIORITYROUTER__

module priorityRouter
#(
  parameter BLOCK_SIZE = 4
)
(
  // take in input val and version num and read input with version num and
  // output the nearest version inside with a version num less than input
  // version num 
  input [BLOCK_SIZE - 1:0]     version0, 
  input [BLOCK_SIZE - 1:0]     version1, 
  input [BLOCK_SIZE - 1:0]     version2, 
  input [BLOCK_SIZE - 1:0]     version3, 

  input [31:0]    dataIn0, 
  input [31:0]    dataIn1, 
  input [31:0]    dataIn2, 
  input [31:0]    dataIn3, 

  input [BLOCK_SIZE - 1:0]     readVersion, 

  output [31:0]   dataOut
);

  always @(*)
  begin
    if (version0 < readVersion && version0 > version1 && version0 > version2 && version0 > version3)
    begin
      dataOut <= dataIn0;
    end
    else if (version1 < readVersion && version1 > version0 && version1 > version2 && version1 > version3)
    begin
      dataOut <= dataIn1;
    end
    else if (version2 < readVersion && version2 > version0 && version2 > version1 && version2 > version3)
    begin
      dataOut <= dataIn2;
    end
    else if (version3 < readVersion && version3 > version0 && version3 > version1 && version3 > version2)
    begin
      dataOut <= dataIn3;
    end
    /*
    else
    begin
      dataOut <= 0;
    end
    */
  end

endmodule

`endif
