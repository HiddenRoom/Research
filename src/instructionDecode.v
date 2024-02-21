`ifndef __INSTRUCTIONDECODE__
`define __INSTRUCTIONDECODE__

module instructionDecode
(
  input [31:0]    instruction,

  output          _lui,
  output          _auipc,
  output          _jal,
  output          _jalr,
  output          _beq,
  output          _bne,
  output          _blt,
  output          _bge,
  output          _bltu,
  output          _bgeu,
  output          _lb,
  output          _lh,
  output          _lw,
  output          _lbu,
  output          _lhu,
  output          _sb,
  output          _sh,
  output          _sw,
  output          _addi,
  output          _slti,
  output          _sltiu,
  output          _xori,
  output          _ori,
  output          _andi,
  output          _slli,
  output          _srli,
  output          _srai,
  output          _add,
  output          _sub,
  output          _sll,
  output          _slt,
  output          _sltu,
  output          _xor,
  output          _srl,
  output          _sra,
  output          _or,
  output          _and,
  output          _fence,
  output          _ecall,
  output          _ebreak,

  output [31:0]   imm_i,
  output [31:0]   imm_s,
  output [31:0]   imm_b,
  output [31:0]   imm_u,
  output [31:0]   imm_j,

  output [4:0]    shamt,

  output [4:0]    rs2,
  output [4:0]    rs1,
  output [4:0]    rd
);

  wire [6:0] opcode = instruction[6:0];
  wire [6:0] funct7 = instruction[31:25];
  wire [2:0] funct3 = instruction[14:12];

  assign _lui   = (opcode == 7'b0110111);
  assign _auipc = (opcode == 7'b0010111);
  assign _jal   = (opcode == 7'b1101111);
  assign _jalr  = (opcode == 7'b1100111);
  assign _beq   = (opcode == 7'b1100011 && funct3 == 3'b000);
  assign _bne   = (opcode == 7'b1100011 && funct3 == 3'b001);
  assign _blt   = (opcode == 7'b1100011 && funct3 == 3'b100);
  assign _bge   = (opcode == 7'b1100011 && funct3 == 3'b101);
  assign _bltu  = (opcode == 7'b1100011 && funct3 == 3'b110);
  assign _bgeu  = (opcode == 7'b1100011 && funct3 == 3'b111);
  assign _lb    = (opcode == 7'b0000011 && funct3 == 3'b000);
  assign _lh    = (opcode == 7'b0000011 && funct3 == 3'b001);
  assign _lw    = (opcode == 7'b0000011 && funct3 == 3'b010);
  assign _lbu   = (opcode == 7'b0000011 && funct3 == 3'b100);
  assign _lhu   = (opcode == 7'b0000011 && funct3 == 3'b101);
  assign _sb    = (opcode == 7'b0100011 && funct3 == 3'b000);
  assign _sh    = (opcode == 7'b0100011 && funct3 == 3'b001);
  assign _sw    = (opcode == 7'b0100011 && funct3 == 3'b010);
  assign _addi  = (opcode == 7'b0010011 && funct3 == 3'b000);
  assign _slti  = (opcode == 7'b0010011 && funct3 == 3'b010);
  assign _sltiu = (opcode == 7'b0010011 && funct3 == 3'b011);
  assign _xori  = (opcode == 7'b0010011 && funct3 == 3'b100);
  assign _ori   = (opcode == 7'b0010011 && funct3 == 3'b110);
  assign _andi  = (opcode == 7'b0010011 && funct3 == 3'b111);
  assign _slli  = (opcode == 7'b0010011 && funct3 == 3'b001);
  assign _srli  = (opcode == 7'b0010011 && funct3 == 3'b101 && funct7 == 7'b0000000);
  assign _srai  = (opcode == 7'b0010011 && funct3 == 3'b101 && funct7 == 7'b0100000);
  assign _add   = (opcode == 7'b0110011 && funct3 == 3'b000 && funct7 == 7'b0000000);
  assign _sub   = (opcode == 7'b0110011 && funct3 == 3'b000 && funct7 == 7'b0100000);
  assign _sll   = (opcode == 7'b0110011 && funct3 == 3'b001);
  assign _slt   = (opcode == 7'b0110011 && funct3 == 3'b010);
  assign _sltu  = (opcode == 7'b0110011 && funct3 == 3'b011);
  assign _xor   = (opcode == 7'b0110011 && funct3 == 3'b100);
  assign _srl   = (opcode == 7'b0110011 && funct3 == 3'b101 && funct7 == 7'b0000000);
  assign _sra   = (opcode == 7'b0110011 && funct3 == 3'b101 && funct7 == 7'b0100000);
  assign _or    = (opcode == 7'b0110011 && funct3 == 3'b110);
  assign _and   = (opcode == 7'b0110011 && funct3 == 3'b111);
  assign _fence = (opcode == 7'b0001111);
  assign _ecall = (opcode == 7'b1110011 && instruction[20] == 1'b0);
  assign _ebreak = (opcode == 7'b1110011 && instruction[20] == 1'b1);

  assign imm_i = {{21{instruction[31]}}, instruction[30:20]};
  assign imm_s = {{21{instruction[31]}}, instruction[30:25], instruction[11:7]};
  assign imm_b = {{20{instruction[31]}}, instruction[7], instruction[30:25], instruction[11:8], 1'b0};
  assign imm_u = {instruction[31:12], 12'b000000000000};
  assign imm_j = {{12{instruction[31]}}, instruction[19:12], instruction[20], instruction[30:21], 1'b0};

  assign shamt = instruction[24:20];

  assign rs2 = instruction[24:20];
  assign rs1 = instruction[19:15];
  assign rd = instruction[11:7];

endmodule

`endif
