`timescale 1ns / 1ps

module Register_Memory (
clk, // Clock Input
reg_wr,
address_ra,
address_rb,
address_wr,
data_outA,
data_outB,
data_wr,
reg_rd,
reg16
);

parameter DATA_WIDTH = 31; // Largo de los registros R, J, I - 32 bits.
parameter ADDR_WIDTH = 3; // Largo de las direcciones de registros. 16 instrucciones - 4 bits.
parameter RAM_DEPTH = 15; // Cantidad de registros que caben en la memoria. 16 registros.

//--------------Input Ports-----------------------

input [ADDR_WIDTH:0] address_ra;
input [ADDR_WIDTH:0] address_rb;
input [ADDR_WIDTH:0] address_wr;


//--------------Inout Ports-----------------------
output reg [31:0] data_outA;
output reg [31:0] data_outB;
input clk;
input reg_wr,reg_rd; // Bandera de control para la escritura en la memoria
input wire [31:0] data_wr; // Dato que se escribe en el write-back
output reg [31:0] reg16; // Registro que contiene el recuento de coincidencias entre patron y texto


reg [DATA_WIDTH:0] mem [0:RAM_DEPTH];


initial begin
    mem[0] <= 0; // Bandera de Cero
    mem[1] <= 0; // Bandera de salto (branch)
    mem[2] <= 0; // Bandera de IR. ------> No sabemos si tiene utilidad.
    mem[3] <= 0; //         ^
    mem[4] <= 0; //         |
    mem[5] <= 0; //         |
    mem[6] <= 0; //         |
    mem[7] <= 0; //         |
    mem[8] <= 0; //         |
    mem[9] <= 0; //         |  Registros de uso general
    mem[10] <= 0; //        |
    mem[11] <= 0; //        |
    mem[12] <= 0; //        |
    mem[13] <= 0; //        |
    mem[14] <= 0; //        |
    mem[15] <= 0; //        ^	
end



always @(posedge clk)
begin
	if(reg_rd)begin
    data_outA = mem[address_ra];
    data_outB = mem[address_rb];
	 end
	 
end
always @(negedge clk)
begin
	if (reg_wr) begin //si la bandera no esta en 1 ignora la lectura del dato (guardar dato en el banco de registro)
        mem[address_wr] <= data_wr;
		  reg16 <= mem[15];
	end
end
endmodule
