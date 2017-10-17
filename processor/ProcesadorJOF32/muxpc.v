

module muxpc (pc_fetch, pc_branch, pc_jump, dir_sl, mux_out);

input wire [9:0] pc_fetch;
input wire [9:0] pc_jump; 
input wire [9:0] pc_branch;
input wire [1:0] dir_sl;
output reg [9:0] mux_out;


always @*
begin
    if (dir_sl == 1'b0) begin
        mux_out = pc_fetch;
    end
    else if (dir_sl == 1'b1) begin
        mux_out = pc_branch;
    end
    else begin
        mux_out = pc_jump;
    end
end

endmodule
