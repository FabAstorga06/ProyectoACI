module n_bit_adder(a,b,res);

parameter n = 32;
input [n-1:0] a, b;
output [n-1:0] res;

assign res = a + b;

endmodule 