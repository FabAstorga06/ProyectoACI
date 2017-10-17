`timescale 1ns / 1ps

module ALU(
    a,b,
    opcode,
    resultado
    );

input wire [31:0] a,b;
input wire [4:0] opcode;
output reg [31:0] resultado;

always @*
begin
    case (opcode)
    5'b00000: resultado = a + b;   // ADD
    5'b00001: resultado = a - b;   // SUB
    5'b00010: resultado = a & b;   // AND
    5'b00011: resultado = a | b;   // OR
    //5'b00100: resultado = a ~| b;  // NOR
    5'b00101: resultado = a << b;  // SLL
    5'b00110: resultado = a >> b;  // SRL
    5'b00111: resultado = a * b;   // MULT
    5'b01000: resultado = a / b;   // DIV
    5'b01001: resultado = 32'b0;   // BEQ
    5'b01010: resultado = 32'b0;   // BNE
    5'b01011: resultado = a + b;   // LW a: RS  b: OFFSET
    5'b01100: resultado = a + b;   // LB a: RS  b: OFFSET
    5'b01101: resultado = a + b;   // SW a: RS  b: OFFSET
    5'b01110: resultado = 32'b0;   // J
    5'b11111: resultado = 32'b0;   // NOP
	 default: resultado = 32'b0;
    endcase
end
endmodule