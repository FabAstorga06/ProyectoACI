
module registro_if_id (clk,
    instruction_in,
    instruction_out
    );

input clk;
input [31:0] instruction_in;
output reg [31:0] instruction_out;


reg [31:0] instruction;


always @(posedge clk)
begin
    instruction <= instruction_in;
end

always @(negedge clk)
begin
    instruction_out <= instruction;
end

endmodule
