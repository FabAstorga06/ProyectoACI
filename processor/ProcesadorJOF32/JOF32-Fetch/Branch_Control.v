module Branch_Control(sel_dir, branch_flag, sel_dir_out);

input wire [2:0] sel_dir;
input wire branch_flag;
output reg [2:0] sel_dir_out;


always@*
begin
if(sel_dir==2'b01)
		begin
			if (branch_flag)
				begin
					sel_dir_out=2'b01;
				end
			else 
				begin
					sel_dir_out=2'b00;
				end
		end
else 
	begin
		sel_dir_out=sel_dir;
	end
end
endmodule