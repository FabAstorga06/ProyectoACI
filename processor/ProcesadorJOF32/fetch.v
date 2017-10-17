module fetch(clk, pc_jump, pc_branch,sel_dir,inst_out,flag_branch );


parameter SIZE_PC=9;

input wire clk;
input wire [SIZE_PC:0] pc_jump;
input wire [SIZE_PC:0] pc_branch;
input wire [1:0] sel_dir;
input wire flag_branch;
output wire [31:0] inst_out;
//input mem_RD;

wire [SIZE_PC:0] pc_out_sum;
wire [SIZE_PC:0] pc_out_reg;
wire [SIZE_PC:0] mux_out; 
wire [1:0] sel_dir_pc;

muxpc mpc(.pc_fetch(pc_out_sum),
				.pc_jump(pc_jump),
				.pc_branch(pc_branch),
				.dir_sl(sel_dir_pc),
				.mux_out(mux_out)
				);

sumador1 sum1(.pc_in(mux_out),
				  .pc_out(pc_out_sum)
				  );
				  

register_pc regPC(.clk(clk),
						.pc_in(mux_out),
						.pc_out(pc_out_reg)
						);
						
instruction_memory intMem(.address(pc_out_reg),
							     .q(inst_out),
								  .clock(clk)
								  );
								  
branch_control branch_c(.sel_dir(sel_dir),
								.branch_flag(flag_branch), 
								.sel_dir_out(sel_dir_pc));
				  
endmodule