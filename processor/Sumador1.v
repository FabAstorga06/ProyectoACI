`timescale 1ns / 1ps

module Sumador1 (pc_in, pc_out);

input wire [9:0] pc_in;
output reg [9:0] pc_out;

always@*
begin
pc_out = pc_in + 1;
end
endmodule
