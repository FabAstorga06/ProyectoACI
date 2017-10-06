`timescale 1ns / 1ps

module Registro_IF_ID (clk,
    pc_in,
    pc_out,
    instruction_in,
    instruction_out
    );

input clk;
input [9:0] pc_in;
output reg [9:0] pc_out;
input [31:0] instruction_in;
output reg [31:0] instruction_out;

reg [9:0] pc;
reg [31:0] instruction;


always @(posedge clk)
begin
    pc <= pc_in;
    instruction <= instruction_in;
end

always @(negedge clk)
begin
    pc_out <= pc;
    instruction_out <= instruction;
end

endmodule
