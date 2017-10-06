module mux21(select, a, b, out);

input select;
input [3:0] a, b;
output [3:0] out;

assign out = (select) ? b : a;

endmodule 