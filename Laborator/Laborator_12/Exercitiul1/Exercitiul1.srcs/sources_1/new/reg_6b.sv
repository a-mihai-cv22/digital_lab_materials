module reg_6b
	(
		input logic clk,
		input logic rst,
		input logic [5:0] in,
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
		out <= in;
		end
	end

endmodule
