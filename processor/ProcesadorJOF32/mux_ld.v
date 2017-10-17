`timescale 1ns / 1ps

module mux_ld(
    lw,
    sel_ld, // Bandera del mux
    mux_out
    );

input wire [31:0] lw;
input wire sel_ld;
output reg [31:0] mux_out;

// Definición de Load-Byte

always @*
begin
    if (sel_ld == 0)
    begin
        mux_out = lw;
    end
    else
    begin
        mux_out [31:8] = 24'b000000000000000000000000;
        mux_out [7:0] = lw [7:0];
    end
end

endmodule
