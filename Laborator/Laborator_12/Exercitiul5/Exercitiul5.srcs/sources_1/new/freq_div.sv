module freq_div
	(
		input logic clk,
		input logic rst_n,
		input logic freq_x2_en,
		input logic freq_x4_en,
		input logic freq_x8_en,
		output logic freq_x2_out,
		output logic freq_x4_out,
		output logic freq_x8_out
	);

logic [2:0] counter;

assign freq_x2_out = counter[0] & freq_x2_en;
assign freq_x4_out = counter[1] & freq_x4_en;
assign freq_x8_out = counter[2] & freq_x8_en;

always_ff@(posedge clk)
	begin
	if(rst_n == 0)
		begin
		counter <= 0;
		end
	else
		begin
		if(freq_x2_en | freq_x4_en | freq_x8_en)
			begin
			counter <= counter +1;
			end
		else
			begin
			counter <= 0;
			end
		end
	end

endmodule 