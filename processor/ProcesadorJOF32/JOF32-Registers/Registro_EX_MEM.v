module Registro_EX_MEM (clk,
								alu_in,
								alu_out,
								B_in,
								B_out,
								dir_wb_in,
								dir_wb_out,
								mem_wr_in,
								mem_wr_out,
								sel_wb_in,
								sel_wb_out,
								reg_wr_in,
								reg_wr_out,
								sel_ld_in,
								sel_ld_out);



reg [31:0] alu;
reg [31:0] B;
reg [3:0] dir_wb;
reg mem_wr;
reg sel_wb;
reg reg_wr;
reg sel_ld;

input clk;
input wire [31:0] alu_in;
input wire [31:0] B_in;
input wire [3:0]dir_wb_in;
input wire mem_wr_in;
input wire sel_wb_in;
input wire reg_wr_in;
input wire sel_ld_in;

output reg [31:0] alu_out;
output reg [31:0] B_out;
output reg [3:0] dir_wb_out;
output reg mem_wr_out;
output reg sel_wb_out;
output reg reg_wr_out;
output reg sel_ld_out;



always @(posedge clk)
begin
    alu<= alu_in;
	 B<=B_in;
	 dir_wb<=dir_wb_in;
	 mem_wr<=mem_wr_in;
	 sel_wb<=sel_wb_in;
	 reg_wr<=reg_wr_in;
	 sel_ld<=sel_ld_in;
end

always @(negedge clk)
begin
    alu_out<= alu;
	 B_out<=B;
	 dir_wb_out<=dir_wb;
	 mem_wr_out<=mem_wr;
	 sel_wb_out<=sel_wb;
	 reg_wr_out<=reg_wr;
	 sel_ld_out<=sel_ld;
end


endmodule