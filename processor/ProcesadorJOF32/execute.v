
module execute(
    in_a,
    in_b,
    inmediate,
    shamt,
    rt,
    rd,
    alu_sel,
    dir_sl,
    result,
    out_b,
	 opcode,
    mux_out
    );

input wire [31:0] in_a, in_b;
input wire [31:0] inmediate;
input wire [31:0] shamt;
input wire [3:0] rd, rt;
input wire [4:0] opcode;
input wire [1:0] alu_sel;
input wire  dir_sl;

output wire [31:0] result;
output wire [31:0] out_b;
output wire [3:0] mux_out;

wire [31:0] mux_alu_out;
assign out_b = in_b;

alu alu(
    .a(in_a),
    .b(mux_alu_out),
    .opcode(opcode),
    .resultado(result)
    );

muxalu mux_alu (
    .in_b(in_b),
    .inmediate(inmediate),
    .shamt(shamt),
    .alu_sel(alu_sel),
    .mux_out(mux_alu_out)
    );

muxexe MuxExe (
    .rd(rd),
    .rt(rt),
    .mux_out(mux_out),
    .dir_sl(dir_sl)
    );
	 
endmodule
