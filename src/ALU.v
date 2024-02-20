`ifndef __ALU__
`define __ALU__

module ALU
(
  input [31:0]    dataIn0,
  input [31:0]    dataIn1, /* for shifts, dataIn1[4:0] has shamt */

  input [SIZENEEDED:0] /* replace with the amount needed to encode amount of arithmetic ops */

  output [31:0]   dataOut /* for booleans, dataOut[0] encodes answer */
);

endmodule

`endif
