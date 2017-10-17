module write_back (result_mem, 
						 result_alu,
						 sel_wb,
						 reg_wr_in,
						 reg_wr_out,
						 dir_wb_in,
						 dir_wb_out,
						 data_out);

						 
input wire [31:0] result_mem;
input wire [31:0] result_alu;
input wire [3:0] dir_wb_in;
input wire reg_wr_in;
input wire sel_wb;


output wire [31:0] data_out;
output wire [3:0] dir_wb_out;
output wire reg_wr_out;

						 
assign dir_wb_out= dir_wb_in;
assign reg_wr_out=reg_wr_in;

muxwb mwb (.result_alu(result_alu), 
				 .result_mem(result_mem), 
				 .mux_out(data_out), 
				 .sel_wb(sel_wb));					 
endmodule
						 
						 
					