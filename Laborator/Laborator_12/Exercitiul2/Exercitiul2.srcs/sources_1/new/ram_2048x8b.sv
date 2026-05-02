module ram
	(
		input clk,
		input [10:0] addr_r,
		output [7:0] data_r,
		input w_en,
		input [10:0] addr_w,
		input [7:0] data_w
	);

reg [7:0] memorie_efectiva [0:2047];
	
assign data_r = memorie_efectiva[addr_r];

always@(posedge clk)
begin
	if(w_en == 1) 
		begin
		memorie_efectiva[addr_w] <= data_w;
		end
end 



endmodule 








