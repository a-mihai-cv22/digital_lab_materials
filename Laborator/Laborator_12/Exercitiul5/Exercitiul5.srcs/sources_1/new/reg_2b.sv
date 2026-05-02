module reg_2b
	(
		input logic clk,
		input logic rst_n,
		input logic save,
		input logic [1:0] data,
		output logic [1:0] out
	);

always_ff@(posedge clk)
	begin
	if(rst_n == 0)
		begin
		out <= 0;
		end
	else
		begin
		if(save == 1)
			begin
			out <= data;
			end
		else
			begin
			out <= out;
			end
		end
	end

endmodule