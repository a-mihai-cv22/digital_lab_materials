module counter_6b
	(
		input logic clk,
		input logic rst,
		input logic en,
		output logic [5:0] out
    );

always_ff@(posedge clk)
	begin
	if(rst == 1)
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
