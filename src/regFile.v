`ifndef __REGFILE__
`define __REGFILE__

module regFile 
#(
    parameter REG_NUM = 32,
    parameter DATA_WIDTH = 32,
    parameter NUM_READ_PORTS = 4,
    parameter NUM_WRITE_PORTS = 4
) 
(
    input                       clk,
    input [$clog2(REG_NUM)-1:0] readAddr [0:NUM_READ_PORTS-1],
    input [$clog2(REG_NUM)-1:0] writeAddr [0:NUM_WRITE_PORTS-1],

    input                       writeEnable [0:NUM_WRITE_PORTS-1],

    input  [DATA_WIDTH-1:0]     dataInputs [0:NUM_WRITE_PORTS-1],

    output reg [DATA_WIDTH-1:0] dataOuts [0:NUM_READ_PORTS-1]
);

    reg [DATA_WIDTH-1:0] regFile [0:REG_NUM-1];

    assign regFile[0] = 0;

    always @(posedge clk) begin
    end

  always @(posedge clk) 
  begin
    for (int i = 0; i < NUM_READ_PORTS; i++) begin
      dataOuts[i] <= regFile[readAddr[i]];
    end

    for (int i = 0; i < NUM_WRITE_PORTS; i++) 
    begin
      if (writeEnable[i]) 
      begin
        regFile[writeAddr[i]] <= dataInputs[i];
      end
    end
  end

endmodule

`endif
