`ifndef __REGFILE__
`define __REGFILE__

module regFile 
#(
  parameter REG_NUM = 32,
  parameter DATA_WIDTH = 32,
  parameter READ_NUM = 4,
  parameter WRITE_NUM = 4
) 
(
  input                       clk,
  input [$clog2(REG_NUM) * READ_NUM - 1:0] readAddr, 
  input [$clog2(REG_NUM) * WRITE_NUM - 1:0] writeAddr, 

  input [WRITE_NUM - 1:0] writeEnable, 

  input  [DATA_WIDTH * WRITE_NUM - 1:0] dataInputs, 

  output reg [DATA_WIDTH * READ_NUM - 1:0] dataOuts
);

  reg [DATA_WIDTH - 1:0] regFile [0:REG_NUM - 1];

  assign regFile[0] = 0;

  always @(posedge clk) 
  begin
    for (int i = 0; i < READ_NUM; i++) 
    begin
      dataOuts[DATA_WIDTH * i +:DATA_WIDTH] <= regFile[readAddr[$clog2(REG_NUM) * i +:$clog2(REG_NUM)]];
    end

    for (int i = 0; i < WRITE_NUM; i++) 
    begin
      if (writeEnable[i]) 
      begin
        regFile[writeAddr[$clog2(REG_NUM) *  i +:$clog2(REG_NUM)]] <= dataInputs[i];
      end
    end
  end

endmodule

`endif
