`timescale 1ns / 1ps

module registro_id_ex (
    clk,
    in_a,
    in_b,
    out_a,
    out_b,
    shamt_in,
    shamt_out,
    rd_in, rt_in,
    rd_out, rt_out,
    inmediate_in,
    inmediate_out,
    // Señales de control
	 opcode_in,opcode_out,
    dir_sl_in, alu_sel_in, sel_wb_in,
	 dir_sl_out, alu_sel_out, sel_wb_out,
	 mem_wr_in, reg_wr_in,
	 mem_wr_out, reg_wr_out,
	 sel_ld_in, sel_ld_out
	 
	 
    );

input wire clk;
input wire [4:0] opcode_in;
output reg [4:0] opcode_out;
input wire [31:0] in_a, in_b;
output reg [31:0] out_a, out_b;
input wire [31:0] shamt_in;
output reg [31:0] shamt_out;
input wire [3:0] rd_in, rt_in;
output reg [3:0] rd_out, rt_out;
input wire [31:0] inmediate_in;
output reg [31:0] inmediate_out;
input wire mem_wr_in, reg_wr_in, sel_wb_in,sel_ld_in, dir_sl_in;
output reg mem_wr_out, reg_wr_out, sel_wb_out,sel_ld_out, dir_sl_out;
input wire [1:0]  alu_sel_in;
output reg [1:0]  alu_sel_out;

// Intermedios de las señales
reg mem_wr, reg_wr, sel_wb,sel_ld,dir_sl;
reg [1:0] alu_sel;



// Registros intermedios
reg [4:0] opcode;
reg [31:0] a,b;
reg [31:0] shamt;
reg [3:0] rd, rt;
reg [31:0] inmediate;

////////////////////

always @(posedge clk)
begin
    opcode <= opcode_in;
    a <= in_a;
    b <= in_b;
    shamt <= shamt_in;
    rd <= rd_in;
    rt <= rt_in;
    inmediate <= inmediate_in;
    mem_wr <= mem_wr_in;
    reg_wr <= reg_wr_in;
    dir_sl <= dir_sl_in;
    alu_sel <= alu_sel_in;
    sel_wb <= sel_wb_in;
	 sel_ld<=sel_ld_in;
end

always @(negedge clk)
begin
    opcode_out = opcode;
    out_a <= a;
    out_b <= b;
    shamt_out <= shamt;
    rd_out <= rd;
    rt_out <= rt;
    inmediate_out <= inmediate;
    mem_wr_out <= mem_wr;
    reg_wr_out <= reg_wr;
    dir_sl_out <= dir_sl;
    alu_sel_out <= alu_sel;
    sel_wb_out <= sel_wb;
	 sel_ld_out<=sel_ld;
end
endmodule