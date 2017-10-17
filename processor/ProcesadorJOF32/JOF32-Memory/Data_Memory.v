module Data_Memory (
    clk,
    result_alu,
    in_b,
    mem_wr,
    out
    );

input wire clk;
input wire [31:0] result_alu;
input wire [31:0] in_b;
input wire mem_wr;
output reg [31:0] out;



reg [18:0] cociente;
reg [1:0] residuo;

wire [18:0] address;
wire [31:0] out_ram;

assign address = result_alu/4;
Ram_1port ram (
  .address(address),
  .clock(clk),
  .data(in_b),
  .wren(mem_wr),
  .q(out_ram)
);


always @(posedge clk)
begin
	  //cociente=result_alu/4;
	  residuo= result_alu%4;
    if (mem_wr == 1) // if sw
    begin
		case(residuo)
		0:begin
        out [31:24] <= out_ram [31:24];
        out [23:16] <= out_ram [23:16];
        out [15:8] <= out_ram [15:8];
        out [7:0] <= out_ram [7:0];
		end
		1:begin
		  out [31:24] <= out_ram [7:0];
        out [23:16] <= out_ram [31:24];
        out [15:8] <=  out_ram [23:16];;
        out [7:0] <= out_ram [15:8];
		end
		2:begin
		  out [31:24] <= out_ram [15:8];
        out [23:16] <= out_ram [7:0];
        out [15:8] <=  out_ram [31:24];;
        out [7:0] <= out_ram [23:16];
		end
		3:begin
		  out [31:24] <= out_ram [23:16];
        out [23:16] <= out_ram [15:8];
        out [15:8] <=  out_ram [7:0];;
        out [7:0] <= out_ram [31:24];
		end
		 endcase
    end
end


endmodule
