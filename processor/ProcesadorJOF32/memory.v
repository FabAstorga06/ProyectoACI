module memory (clk,
					result_alu_in,
					result_alu_out,
					in_B,
					dir_wb_in,
					dir_wb_out,
					mem_out,
					mem_wr,
					sel_ld
					);
					
input clk;				
input wire [31:0] result_alu_in;
input wire [31:0] in_B;
input wire [3:0] dir_wb_in;
input wire mem_wr,sel_ld;

output wire [31:0] mem_out;
output wire [31:0] result_alu_out;
output wire [3:0] dir_wb_out;

wire [31:0] lw_mux;
assign result_alu_out= result_alu_in;
assign dir_wb_out= dir_wb_in;

mux_ld m_ld(.lw(lw_mux),
				  .sel_ld(sel_ld),
				  .mux_out(mem_out)
				  );

data_memory data_mem(.clk(clk),
							.result_alu(result_alu_in),
							.in_b(in_B),
							.mem_wr(mem_wr),
							.out(lw_mux)
							);
					
endmodule