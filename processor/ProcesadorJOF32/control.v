module control (clk,opcode_in,
					 sel_dir,//FETCH
					 reg_rd, //DECODE
					 alu_sel,dir_sl,opcode, //EXE
					 mem_wr,sel_ld, //MEM
					 sel_wb,reg_wr //WB
					 ); 

input clk;
input wire [4:0] opcode_in;
output reg [1:0] sel_dir=0;
output reg reg_rd=0;
output reg [1:0] alu_sel=0;
output reg dir_sl=0;
output reg [4:0] opcode=5'b11111;
output reg mem_wr=0;
output reg sel_ld=0;
output reg sel_wb=0;
output reg reg_wr=0;
					 


parameter ADD= 5'b00001;//1
parameter SUB=	5'b00010;//2
parameter SRL=	5'b00111;//7
parameter SLL=	5'b00110;//6
parameter AND=	5'b00011;//3
parameter OR= 	5'b00100;//4
parameter NOR=	5'b00101;//5
parameter MULT=5'b01000;//8
parameter DIV=	5'b01001;//9
parameter ADDI=5'b01111;//15
parameter SW=	5'b01110;//14
parameter LW=	5'b01100;//12
parameter LB=	5'b01101;//13
parameter BEQ=	5'b01010;//10
parameter BNE= 5'b01011;//11
parameter J=	5'b10000;//16
parameter NOP=	5'b11111;
			 

always @(posedge clk)
begin
 case (opcode_in)
 
			 ADD: begin
				sel_dir=2'b00;
				reg_rd=1;
				alu_sel=2'b00;
				dir_sl=0;
				mem_wr=0;
				sel_ld=0;
				sel_wb=1;
				reg_wr=1;
				end
			 SUB:begin
				sel_dir=2'b00;
				reg_rd=1;
				alu_sel=2'b00;
				dir_sl=0;
				mem_wr=0;
				sel_ld=0;
				sel_wb=1;
				reg_wr=1;
				end
			 SRL:begin
				sel_dir=2'b00;
				reg_rd=1;
				alu_sel=2'b10;
				dir_sl=0;
				mem_wr=0;
				sel_ld=0;
				sel_wb=1;
				reg_wr=1;
				end
			 SLL:begin
				sel_dir=2'b00;
				reg_rd=1;
				alu_sel=2'b10;
				dir_sl=0;
				mem_wr=0;
				sel_ld=0;
				sel_wb=1;
				reg_wr=1;
				end
			 AND:begin
				sel_dir=2'b00;
				reg_rd=1;
				alu_sel=2'b00;
				dir_sl=0;
				mem_wr=0;
				sel_ld=0;
				sel_wb=1;
				reg_wr=1;
				end
			 OR:begin
				sel_dir=2'b00;
				reg_rd=1;
				alu_sel=2'b00;
				dir_sl=0;
				mem_wr=0;
				sel_ld=0;
				sel_wb=1;
				reg_wr=1;
				end
			 NOR:begin
				sel_dir=2'b00;
				reg_rd=1;
				alu_sel=2'b00;
				dir_sl=0;
				mem_wr=0;
				sel_ld=0;
				sel_wb=1;
				reg_wr=1;
				end
			 MULT:begin
				sel_dir=2'b00;
				reg_rd=1;
				alu_sel=2'b00;
				dir_sl=0;
				mem_wr=0;
				sel_ld=0;
				sel_wb=1;
				reg_wr=1;
				end
			 DIV:begin
				sel_dir=2'b00;
				reg_rd=1;
				alu_sel=2'b00;
				dir_sl=0;
				mem_wr=0;
				sel_ld=0;
				sel_wb=1;
				reg_wr=1;
				end
			 ADDI:begin
				sel_dir=2'b00;
				reg_rd=1;
				alu_sel=2'b01;
				dir_sl=1;
				mem_wr=0;
				sel_ld=0;
				sel_wb=1;
				reg_wr=1;
				end
			 SW:begin
				sel_dir=2'b00;
				reg_rd=1;
				alu_sel=2'b01;
				dir_sl=1;
				mem_wr=1;
				sel_ld=0;
				sel_wb=1;
				reg_wr=0;
				end
			 LW:begin
				sel_dir=2'b00;
				reg_rd=1;
				alu_sel=2'b01;
				dir_sl=1;
				mem_wr=0;
				sel_ld=0;
				sel_wb=0;
				reg_wr=1;
				end
			 LB:begin
				sel_dir=2'b00;
				reg_rd=1;
				alu_sel=2'b01;
				dir_sl=1;
				mem_wr=0;
				sel_ld=1;
				sel_wb=0;
				reg_wr=1;
				end
			 BEQ:begin
				sel_dir=2'b01;
				reg_rd=1;
				alu_sel=2'b01;
				dir_sl=1;
				mem_wr=0;
				sel_ld=0;
				sel_wb=0;
				reg_wr=0;
				end
			 BNE:begin
				sel_dir=2'b01;
				reg_rd=1;
				alu_sel=2'b01;
				dir_sl=1;
				mem_wr=0;
				sel_ld=0;
				sel_wb=0;
				reg_wr=0;
				end
			 J:begin
				sel_dir=2'b10;
				reg_rd=1;
				alu_sel=2'b01;
				dir_sl=1;
				mem_wr=0;
				sel_ld=0;
				sel_wb=0;
				reg_wr=0;
				end
			 NOP:begin
				sel_dir=2'b00;
				reg_rd=1;
				alu_sel=2'b00;
				dir_sl=0;
				mem_wr=0;
				sel_ld=0;
				sel_wb=0;
				reg_wr=0;
				end
				endcase
				opcode=opcode_in;

end
endmodule