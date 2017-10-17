module MuxWB (result_alu, result_mem, mux_out, sel_wb);

input wire [31:0] result_mem, result_alu;
input wire sel_wb;
output reg [31:0] mux_out;


always @*
begin
    if (sel_wb == 1'b0) begin
        mux_out = result_alu;
    end
    else begin
        mux_out = result_mem;
    end
end
endmodule