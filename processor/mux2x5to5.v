`timescale 1 ps / 100 fs
// fpga4student.com: FPGA projects, Verilog Projects, VHDL projects
// Verilog project: 32-bit 5-stage Pipelined MIPS Processor in Verilog 
// mux2x5to5
// Select Write Register
module mux2x5to5( AddrOut,Addr0, Addr1, Select);
output [4:0] AddrOut; // Address Out
input [4:0] Addr0, Addr1; // Address In 1 and 2
input Select;
mux21 mux0(AddrOut[0],Addr0[0],Addr1[0],Select);
mux21 mux1(AddrOut[1],Addr0[1],Addr1[1],Select);
mux21 mux2(AddrOut[2],Addr0[2],Addr1[2],Select);
mux21 mux3(AddrOut[3],Addr0[3],Addr1[3],Select);
mux21 mux4(AddrOut[4],Addr0[4],Addr1[4],Select);
endmodule 