`ifndef __ALU__
`define __ALU__

/* when relevant, dataIn0 shall be the left side of the operator and dataIn1
* the right */

module alu 
(
  input [31:0]    dataIn0,
  input [31:0]    dataIn1, /* for shifts, dataIn1[4:0] has shamt */

  input [3:0]     operation, 
                 /* ceil(logb2(14)) bits encode 14 unique operations
                 listed in ascending order of bits used to encode they are:
                 equal, not equal, less than, greater than or equal,
                 less than unsigned, greater than or equal unsigned 
                 add, xor, or, and, subtract, shift left logical,
                 shift right logical, shift right arithmetic */

  output reg [31:0]  dataOut /* for comparisons, dataOut will be 1 if true and 0 if false */
);

  wire signed [31:0] dataIn0Signed = dataIn0;
  wire signed [31:0] dataIn1Signed = dataIn1;

  always @(*)
  begin
    case (operation)
      4'b0000 :   dataOut = (dataIn0 == dataIn1);
      4'b0001 :   dataOut = (dataIn0 != dataIn1); 
      4'b0010 :   dataOut = (dataIn0Signed < dataIn1Signed);
      4'b0011 :   dataOut = (dataIn0Signed >= dataIn1Signed);
      4'b0100 :   dataOut = (dataIn0 < dataIn1); 
      4'b0101 :   dataOut = (dataIn0 >= dataIn1); 
      4'b0110 :   dataOut = (dataIn0 + dataIn1); 
      4'b0111 :   dataOut = (dataIn0 ^ dataIn1); 
      4'b1000 :   dataOut = (dataIn0 | dataIn1); 
      4'b1001 :   dataOut = (dataIn0 & dataIn1); 
      4'b1010 :   dataOut = (dataIn0 - dataIn1); 
      4'b1011 :   dataOut = (dataIn0 << dataIn1[4:0]);
      4'b1100 :   dataOut = (dataIn0 >> dataIn1[4:0]);
      4'b1101 :   dataOut = (dataIn0Signed >>> dataIn1[4:0]);
    endcase
  end

endmodule

`endif
