module reg8b
	(
		input logic clk,
		input logic reset,
		input logic en,
		input logic [7:0] in,
		output logic [7:0] out
	);

always_ff@(posedge clk)
	begin
	if(reset == 1)
		begin
		out <= 0;
		end
	else
		begin
		if(en == 1)
			begin
			out <= in;
			end
		else
			begin
			out <= out;
			end
		end
	end

endmodule