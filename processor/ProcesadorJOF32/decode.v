module decode (clk,instruction, data_wb, dir_wb, reg_wr, reg_rd, // entradas
					dataA, dataB,  sign_ext, shamt, rt_dir, rd_dir,// salidas de registros
					pc_address, flag_branch,// banderas de control de salto
					opcode,
					reg16);// bandera de unidad de control


input clk;
input wire [31:0] instruction; 
input wire [31:0] data_wb; //datos que vienen del WB
input wire [3:0] dir_wb; //direccion donde se guarda en WB
input wire reg_wr; //señal de control del WB
input wire reg_rd; 


output wire [31:0] dataA;
output wire [31:0] dataB;
output wire flag_branch;
output wire [31:0] sign_ext;
output wire [31:0] shamt;

output wire [4:0] opcode;
output wire [3:0] rt_dir;
output wire [3:0] rd_dir;

output wire [31:0] reg16;

wire [3:0] rs_dir;
wire [18:0] address; //para load y para save word

output wire [9:0] pc_address; //branch y jump;


assign opcode = instruction [31:27];
assign rs_dir= instruction [26:23];
assign rt_dir= instruction [22:19];
assign rd_dir= instruction [18:15];
assign shamt [4:0]= instruction [14:10];
assign shamt [31:5]=27'b0;
assign pc_address= instruction [9:0];
assign address = instruction [18:0];


//Falta un mux para saber si es un shift o un load word o para saber quien utiliza el sign_ext
// 


sign_extend sign(.extend(address[15:0]),
					  .extended(sign_ext) //va al REG ID/EXE
					);

n_bit_comparator comp(.a(dataA), //data out a
							 .b(dataB), //data out b
							 .equal(flag_branch) //salida del deco
							);
				
register_memory reg_mem(.clk(clk), // Clock Input
					  .reg_wr(reg_wr),
					  .address_ra(rs_dir),
				     .address_rb(rt_dir),
					  .address_wr(dir_wb),
					  .data_outA(dataA),
					  .data_outB(dataB),
					  .data_wr(data_wb),
					  .reg_rd(reg_rd),
					  .reg16(reg16)
						);


endmodule
