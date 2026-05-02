module counter_11b
	(
		input logic clk,
		input logic reset,
		input logic en,
		output logic [10:0] out
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
			out <= out + 1;
			end
		else
			begin
			out <= out;
			end
		end
	end

endmodule









