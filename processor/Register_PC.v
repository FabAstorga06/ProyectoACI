`timescale 1ns / 1ps

module Register_PC (clk, pc_in, pc_out);

input wire clk;
input wire [9:0] pc_in;
reg [9:0]pc;
output reg [9:0] pc_out;

always @(posedge clk) // lee en el posedge
begin
    pc<=pc_in;
end 
always @(negedge clk) // escritura en el negedge
begin
	pc_out<=pc;
end

endmodule
