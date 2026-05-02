module ram64x8b
	(
		input logic clk,
		input logic [5:0] addr,
		input logic w_en,
		input logic [7:0] w_data,
		output logic [7:0] r_data
	);

logic [7:0] memorie_efectiva [0:63];

assign r_data = memorie_efectiva[addr];

always_ff@(posedge clk)
	begin
	if(w_en)
		begin
		memorie_efectiva[addr] <= w_data;
		end
	end

endmodule 