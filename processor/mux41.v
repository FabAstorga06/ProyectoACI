module mux41(select, a, b, c, d, out);

input [1:0] select;
input [31:0] a, b, c, d;
output [31:0] out;

wire [1:0] select;
wire [31:0] a, b, c, d;
reg [31:0] out;

always @(select)
begin
	if (select == 2'b00)
		out = a;
	if (select == 2'b01) 
		out = b;
	if (select == 2'b10) 
		out = c;
	if (select == 2'b11) 
		out = d;
end
endmodule 