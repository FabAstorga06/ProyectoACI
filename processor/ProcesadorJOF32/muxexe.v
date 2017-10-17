
module muxexe (rt, rd, mux_out, dir_sl);

input wire [3:0] rd, rt;
input wire dir_sl;
output reg [3:0] mux_out;

always @*
begin
    if (dir_sl == 1'b0) begin
        mux_out = rt;
    end
    else begin
        mux_out = rd;
    end
end

endmodule