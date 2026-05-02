module program_counter
	(
		input logic clk,
		input logic rst_n,
		output logic [3:0] out
	);

always_ff@(posedge clk)
	begin
	if(rst_n == 0) 
		begin
		out <= 0;
		end
	else
		begin
		out <= out +1;
		end
	end

endmodule 