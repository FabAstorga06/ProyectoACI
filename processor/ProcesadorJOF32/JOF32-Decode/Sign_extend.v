/* MODULO DE EXTENSION DE SIGNO DE 16 A 32 BITS */
module Sign_extend(extend, extended);

input[15:0] extend;
output [31:0] extended;

assign extended = { {16{extend[15]}}, extend };

endmodule
