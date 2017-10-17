`timescale 1ns / 1ps

module alu(
    a,b,
    opcode,
    resultado
    );

input wire [31:0] a,b;
input wire [4:0] opcode;
output reg [31:0] resultado;


parameter ADD= 5'b00001;//1
parameter SUB=	5'b00010;//2
parameter SRL=	5'b00111;//7
parameter SLL=	5'b00110;//6
parameter AND=	5'b00011;//3
parameter OR= 	5'b00100;//4
parameter NOR=	5'b00101;//5
parameter MULT=5'b01000;//8
parameter DIV=	5'b01001;//9
parameter ADDI=5'b01111;//15
parameter SW=	5'b01110;//14
parameter LW=	5'b01100;//12
parameter LB=	5'b01101;//13
parameter BEQ=	5'b01010;//10
parameter BNE= 5'b01011;//11
parameter J=	5'b10000;//16
parameter NOP=	5'b11111;

always @*
begin
    case (opcode)
    ADD: resultado = a + b;   // ADD
    SUB: resultado = a - b;   // SUB
    AND: resultado = a & b;   // AND
    OR: resultado = a | b;   // OR
    //NOR: resultado = a ~| b;  // NOR
    SLL: resultado = a << b;  // SLL
    SRL: resultado = a >> b;  // SRL
    MULT: resultado = a * b;   // MULT
    DIV: resultado = a / b;   // DIV
    BEQ: resultado = 32'b0;   // BEQ
    BNE: resultado = 32'b0;   // BNE
    LW: resultado = a + b;   // LW a: RS  b: OFFSET
    LB: resultado = a + b;   // LB a: RS  b: OFFSET
    SW: resultado = a + b;   // SW a: RS  b: OFFSET
    J: resultado = 32'b0;   // J
    NOP: resultado = 32'b0;   // NOP
	 default: resultado = 32'b0;
    endcase
end
endmodule