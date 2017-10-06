`timescale 1ns / 1ps

module Instruction_Memory (
    input wire [9:0] pc,
    output reg [31:0] instruction
);

// Memoria de 1024 instrucciones
reg [31:0] rom [0:1023];

always @*
begin
    instruction = rom[pc];
end

initial begin
    // Se ingresan los datos del programa aquí
    // $readmemb("instr.txt", rom);
end

endmodule
