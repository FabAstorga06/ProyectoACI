`timescale 1ns / 1ps

module muxalu (in_b, inmediate, shamt, alu_sel, mux_out);

input wire [31:0] in_b, inmediate, shamt;
input wire [1:0] alu_sel;
output reg [31:0] mux_out;

always @*
begin
    if (alu_sel == 0) begin
        mux_out = in_b;
    end
    else if (alu_sel == 1) begin
        mux_out = inmediate;
    end
    else begin  // alu_sel == 10
        mux_out = shamt;
    end
end

endmodule
