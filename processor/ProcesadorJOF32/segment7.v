module segment7(
	decimal,
	a1, b1, c1, d1, e1, f1, g1, dp1, a2, b2, c2, d2, e2, f2, g2, dp2
);

input wire [31:0] decimal;
output reg a1, b1, c1, d1, e1, f1, g1, dp1, a2, b2, c2, d2, e2, f2, g2, dp2;

reg [7:0] segs1, segs2;

always @*
begin
	case (decimal)
	begin
		0:begin segs2 = 8'b11111100; segs1 = 8'b0;end
		1:begin segs2 = 8'b01100000; segs1 = 8'b0; end
		2: segs2 = 8'b11011010; segs1 = 8'b0;
		3: segs2 = 8'b11110010; segs1 = 8'b0;
		4: segs2 = 8'b01100110; segs1 = 8'b0;
		5: segs2 = 8'b10110110; segs1 = 8'b0;
		6: segs2 = 8'b10111110; segs1 = 8'b0;
		7: segs2 = 8'b11100000; segs1 = 8'b0;
		8: segs2 = 8'b11111110; segs1 = 8'b0;
		9: segs2 = 8'b11110110; segs1 = 8'b0;
		10: segs2 = 8'b11111100; segs1 = 8'b01100000;
		11: segs2 = 8'b01100000; segs1 = 8'b01100000;
		12: segs2 = 8'b11011010; segs1 = 8'b01100000;
		13: segs2 = 8'b11110010; segs1 = 8'b01100000;
		14: segs2 = 8'b01100110; segs1 = 8'b01100000;
		15: segs2 = 8'b10110110; segs1 = 8'b01100000;
		16: segs2 = 8'b10111110; segs1 = 8'b01100000;
		17: segs2 = 8'b11100000; segs1 = 8'b01100000;
		18: segs2 = 8'b11111110; segs1 = 8'b01100000;
		19: segs2 = 8'b11110110; segs1 = 8'b01100000;
		20: segs2 = 8'b11111100; segs1 = 8'b11011010;
		21: segs2 = 8'b01100000; segs1 = 8'b11011010;
		22: regs2 = 8'b11011010; segs1 = 8'b11011010;
		23: regs2 = 8'b11110010; segs1 = 8'b11011010;
		default: segs2 = 8'b11111100; segs1 = 8'b11111100;
	end
	
	assign {a1, b1, c1, d1, e1, f1, g1, dp1} = segs1;
	assign {a2, b2, c2, d2, e2, f2, g2, dp2} = segs2;
	
end

endmodule