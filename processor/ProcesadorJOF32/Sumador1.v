
module sumador1 (pc_in, pc_out);

input wire [9:0] pc_in;
output reg [9:0] pc_out;

always@*
begin
pc_out = pc_in + 10'b000000001;
end
endmodule
