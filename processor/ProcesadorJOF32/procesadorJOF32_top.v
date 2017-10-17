// Copyright (C) 2016  Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions 
// and other software and tools, and its AMPP partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License 
// Subscription Agreement, the Intel Quartus Prime License Agreement,
// the Intel MegaCore Function License Agreement, or other 
// applicable license agreement, including, without limitation, 
// that your use is for the sole purpose of programming logic 
// devices manufactured by Intel and sold by Intel or its 
// authorized distributors.  Please refer to the applicable 
// agreement for further details.

// PROGRAM		"Quartus Prime"
// VERSION		"Version 16.1.0 Build 196 10/24/2016 SJ Lite Edition"
// CREATED		"Sun Oct 15 23:39:45 2017"

module procesadorJOF32_top(
	clk,
	reg16
);


input wire	clk;
output wire	[31:0] reg16;

wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	[31:0] SYNTHESIZED_WIRE_2;
wire	[3:0] SYNTHESIZED_WIRE_3;
wire	[31:0] SYNTHESIZED_WIRE_4;
wire	SYNTHESIZED_WIRE_5;
wire	SYNTHESIZED_WIRE_6;
wire	SYNTHESIZED_WIRE_7;
wire	SYNTHESIZED_WIRE_8;
wire	SYNTHESIZED_WIRE_9;
wire	[1:0] SYNTHESIZED_WIRE_10;
wire	[31:0] SYNTHESIZED_WIRE_11;
wire	[31:0] SYNTHESIZED_WIRE_12;
wire	[31:0] SYNTHESIZED_WIRE_13;
wire	[4:0] SYNTHESIZED_WIRE_14;
wire	[3:0] SYNTHESIZED_WIRE_15;
wire	[3:0] SYNTHESIZED_WIRE_16;
wire	[31:0] SYNTHESIZED_WIRE_17;
wire	SYNTHESIZED_WIRE_18;
wire	SYNTHESIZED_WIRE_19;
wire	[3:0] SYNTHESIZED_WIRE_20;
wire	[31:0] SYNTHESIZED_WIRE_21;
wire	[31:0] SYNTHESIZED_WIRE_22;
wire	SYNTHESIZED_WIRE_23;
wire	[9:0] SYNTHESIZED_WIRE_55;
wire	[1:0] SYNTHESIZED_WIRE_26;
wire	[31:0] SYNTHESIZED_WIRE_27;
wire	[4:0] SYNTHESIZED_WIRE_28;
wire	SYNTHESIZED_WIRE_29;
wire	SYNTHESIZED_WIRE_30;
wire	[3:0] SYNTHESIZED_WIRE_31;
wire	[31:0] SYNTHESIZED_WIRE_32;
wire	[31:0] SYNTHESIZED_WIRE_33;
wire	SYNTHESIZED_WIRE_34;
wire	SYNTHESIZED_WIRE_35;
wire	SYNTHESIZED_WIRE_36;
wire	SYNTHESIZED_WIRE_37;
wire	[31:0] SYNTHESIZED_WIRE_38;
wire	[31:0] SYNTHESIZED_WIRE_39;
wire	[3:0] SYNTHESIZED_WIRE_40;
wire	SYNTHESIZED_WIRE_41;
wire	SYNTHESIZED_WIRE_42;
wire	[3:0] SYNTHESIZED_WIRE_43;
wire	[31:0] SYNTHESIZED_WIRE_44;
wire	[31:0] SYNTHESIZED_WIRE_45;
wire	SYNTHESIZED_WIRE_46;
wire	[1:0] SYNTHESIZED_WIRE_47;
wire	[31:0] SYNTHESIZED_WIRE_48;
wire	[31:0] SYNTHESIZED_WIRE_49;
wire	[31:0] SYNTHESIZED_WIRE_50;
wire	[4:0] SYNTHESIZED_WIRE_51;
wire	[3:0] SYNTHESIZED_WIRE_52;
wire	[3:0] SYNTHESIZED_WIRE_53;
wire	[31:0] SYNTHESIZED_WIRE_54;





decode	b2v_inst(
	.clk(clk),
	.reg_wr(SYNTHESIZED_WIRE_0),
	.reg_rd(SYNTHESIZED_WIRE_1),
	.data_wb(SYNTHESIZED_WIRE_2),
	.dir_wb(SYNTHESIZED_WIRE_3),
	.instruction(SYNTHESIZED_WIRE_4),
	.flag_branch(SYNTHESIZED_WIRE_23),
	.dataA(SYNTHESIZED_WIRE_11),
	.dataB(SYNTHESIZED_WIRE_12),
	.opcode(SYNTHESIZED_WIRE_28),
	.pc_address(SYNTHESIZED_WIRE_55),
	.rd_dir(SYNTHESIZED_WIRE_15),
	.reg16(reg16),
	.rt_dir(SYNTHESIZED_WIRE_16),
	.shamt(SYNTHESIZED_WIRE_17),
	.sign_ext(SYNTHESIZED_WIRE_13));


registro_id_ex	b2v_inst10(
	.clk(clk),
	.dir_sl_in(SYNTHESIZED_WIRE_5),
	.sel_wb_in(SYNTHESIZED_WIRE_6),
	.mem_wr_in(SYNTHESIZED_WIRE_7),
	.reg_wr_in(SYNTHESIZED_WIRE_8),
	.sel_ld_in(SYNTHESIZED_WIRE_9),
	.alu_sel_in(SYNTHESIZED_WIRE_10),
	.in_a(SYNTHESIZED_WIRE_11),
	.in_b(SYNTHESIZED_WIRE_12),
	.inmediate_in(SYNTHESIZED_WIRE_13),
	.opcode_in(SYNTHESIZED_WIRE_14),
	.rd_in(SYNTHESIZED_WIRE_15),
	.rt_in(SYNTHESIZED_WIRE_16),
	.shamt_in(SYNTHESIZED_WIRE_17),
	.dir_sl_out(SYNTHESIZED_WIRE_46),
	.sel_wb_out(SYNTHESIZED_WIRE_35),
	.mem_wr_out(SYNTHESIZED_WIRE_34),
	.reg_wr_out(SYNTHESIZED_WIRE_36),
	.sel_ld_out(SYNTHESIZED_WIRE_37),
	.alu_sel_out(SYNTHESIZED_WIRE_47),
	.inmediate_out(SYNTHESIZED_WIRE_50),
	.opcode_out(SYNTHESIZED_WIRE_51),
	.out_a(SYNTHESIZED_WIRE_48),
	.out_b(SYNTHESIZED_WIRE_49),
	.rd_out(SYNTHESIZED_WIRE_53),
	.rt_out(SYNTHESIZED_WIRE_52),
	.shamt_out(SYNTHESIZED_WIRE_54));


registro_mem_wb	b2v_inst11(
	.clk(clk),
	.sel_wb_in(SYNTHESIZED_WIRE_18),
	.reg_wr_in(SYNTHESIZED_WIRE_19),
	.dir_wb_in(SYNTHESIZED_WIRE_20),
	.result_alu_in(SYNTHESIZED_WIRE_21),
	.result_mem_in(SYNTHESIZED_WIRE_22),
	.sel_wb_out(SYNTHESIZED_WIRE_29),
	.reg_wr_out(SYNTHESIZED_WIRE_30),
	.dir_wb_out(SYNTHESIZED_WIRE_31),
	.result_alu_out(SYNTHESIZED_WIRE_32),
	.result_mem_out(SYNTHESIZED_WIRE_33));


fetch	b2v_inst12(
	.clk(clk),
	.flag_branch(SYNTHESIZED_WIRE_23),
	.pc_branch(SYNTHESIZED_WIRE_55),
	.pc_jump(SYNTHESIZED_WIRE_55),
	.sel_dir(SYNTHESIZED_WIRE_26),
	.inst_out(SYNTHESIZED_WIRE_27));
	defparam	b2v_inst12.SIZE_PC = 9;


registro_if_id	b2v_inst17(
	.clk(clk),
	.instruction_in(SYNTHESIZED_WIRE_27),
	.instruction_out(SYNTHESIZED_WIRE_4));


control	b2v_inst4(
	.clk(clk),
	.opcode_in(SYNTHESIZED_WIRE_28),
	.reg_rd(SYNTHESIZED_WIRE_1),
	.dir_sl(SYNTHESIZED_WIRE_5),
	.mem_wr(SYNTHESIZED_WIRE_7),
	.sel_ld(SYNTHESIZED_WIRE_9),
	.sel_wb(SYNTHESIZED_WIRE_6),
	.reg_wr(SYNTHESIZED_WIRE_8),
	.alu_sel(SYNTHESIZED_WIRE_10),
	.opcode(SYNTHESIZED_WIRE_14),
	.sel_dir(SYNTHESIZED_WIRE_26));
	defparam	b2v_inst4.ADD = 5'b00000;
	defparam	b2v_inst4.ADDI = 5'b01111;
	defparam	b2v_inst4.AND = 5'b00010;
	defparam	b2v_inst4.BEQ = 5'b01001;
	defparam	b2v_inst4.BNE = 5'b01010;
	defparam	b2v_inst4.DIV = 5'b01000;
	defparam	b2v_inst4.J = 5'b01110;
	defparam	b2v_inst4.LB = 5'b01100;
	defparam	b2v_inst4.LW = 5'b01011;
	defparam	b2v_inst4.MULT = 5'b00111;
	defparam	b2v_inst4.NOP = 5'b11111;
	defparam	b2v_inst4.NOR = 5'b00100;
	defparam	b2v_inst4.OR = 5'b00011;
	defparam	b2v_inst4.SLL = 5'b00101;
	defparam	b2v_inst4.SRL = 5'b00110;
	defparam	b2v_inst4.SUB = 5'b00001;
	defparam	b2v_inst4.SW = 5'b01101;


write_back	b2v_inst5(
	.sel_wb(SYNTHESIZED_WIRE_29),
	.reg_wr_in(SYNTHESIZED_WIRE_30),
	.dir_wb_in(SYNTHESIZED_WIRE_31),
	.result_alu(SYNTHESIZED_WIRE_32),
	.result_mem(SYNTHESIZED_WIRE_33),
	.reg_wr_out(SYNTHESIZED_WIRE_0),
	.data_out(SYNTHESIZED_WIRE_2),
	.dir_wb_out(SYNTHESIZED_WIRE_3));


registro_ex_mem	b2v_inst7(
	.clk(clk),
	.mem_wr_in(SYNTHESIZED_WIRE_34),
	.sel_wb_in(SYNTHESIZED_WIRE_35),
	.reg_wr_in(SYNTHESIZED_WIRE_36),
	.sel_ld_in(SYNTHESIZED_WIRE_37),
	.alu_in(SYNTHESIZED_WIRE_38),
	.B_in(SYNTHESIZED_WIRE_39),
	.dir_wb_in(SYNTHESIZED_WIRE_40),
	.mem_wr_out(SYNTHESIZED_WIRE_41),
	.sel_wb_out(SYNTHESIZED_WIRE_18),
	.reg_wr_out(SYNTHESIZED_WIRE_19),
	.sel_ld_out(SYNTHESIZED_WIRE_42),
	.alu_out(SYNTHESIZED_WIRE_45),
	.B_out(SYNTHESIZED_WIRE_44),
	.dir_wb_out(SYNTHESIZED_WIRE_43));


memory	b2v_inst8(
	.clk(clk),
	.mem_wr(SYNTHESIZED_WIRE_41),
	.sel_ld(SYNTHESIZED_WIRE_42),
	.dir_wb_in(SYNTHESIZED_WIRE_43),
	.in_B(SYNTHESIZED_WIRE_44),
	.result_alu_in(SYNTHESIZED_WIRE_45),
	.dir_wb_out(SYNTHESIZED_WIRE_20),
	.mem_out(SYNTHESIZED_WIRE_22),
	.result_alu_out(SYNTHESIZED_WIRE_21));


execute	b2v_inst9(
	.dir_sl(SYNTHESIZED_WIRE_46),
	.alu_sel(SYNTHESIZED_WIRE_47),
	.in_a(SYNTHESIZED_WIRE_48),
	.in_b(SYNTHESIZED_WIRE_49),
	.inmediate(SYNTHESIZED_WIRE_50),
	.opcode(SYNTHESIZED_WIRE_51),
	.rd(SYNTHESIZED_WIRE_52),
	.rt(SYNTHESIZED_WIRE_53),
	.shamt(SYNTHESIZED_WIRE_54),
	.mux_out(SYNTHESIZED_WIRE_40),
	.out_b(SYNTHESIZED_WIRE_39),
	.result(SYNTHESIZED_WIRE_38));


endmodule
