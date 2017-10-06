module Fetch(clk, pc_jump, pc_branch,dir_sl,pc_out,inst_out );


parameter SIZE_PC=9;

input wire clk;
input wire [SIZE_PC:0] pc_jump;
input wire [SIZE_PC:0] pc_branch;
output wire [SIZE_PC:0] pc_out;
input wire [2:0] dir_sl;
output wire [31:0] inst_out;
//input mem_RD;

wire [SIZE_PC:0] pc_out_sum;
wire [SIZE_PC:0] pc_out_reg;
wire [SIZE_PC:0] mux_out; 

assign pc_out=pc_out_sum;

MuxPC muxPC(.pc_fetch(pc_out_sum),
				.pc_jump(pc_jump),
				.pc_branch(pc_branch),
				.dir_sl(dir_sl),
				.mux_out(mux_out)
				);

Sumador1 sum1(.pc_in(mux_out),
				  .pc_out(pc_out_sum)
				  );
				  

Register_PC regPC(.clk(clk),
						.pc_in(mux_out),
						.pc_out(pc_out_reg)
						);
						
Instruction_Memory intMem(.pc(pc_out_reg),
							     .instruction(inst_out)
								  );
				  
endmodule