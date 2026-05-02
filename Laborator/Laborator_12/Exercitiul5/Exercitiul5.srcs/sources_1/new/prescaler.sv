module prescaler
	(
		input logic clk,
		input logic rst_n,
		input logic [1:0] sel,
		output logic clk_out
	);

logic [3:0] decoder_0_X_out;
logic freq_div_0_X_freq_x2_out;
logic freq_div_0_X_freq_x4_out;
logic freq_div_0_X_freq_x8_out;


decoder decoder_0
	(
		.in(sel),
		.out(decoder_0_X_out)
	);

freq_div freq_div_0
	(
		.clk(clk),
		.rst_n(rst_n),
		.freq_x2_en(decoder_0_X_out[1]),
		.freq_x4_en(decoder_0_X_out[2]),
		.freq_x8_en(decoder_0_X_out[3]),
		.freq_x2_out(freq_div_0_X_freq_x2_out),
		.freq_x4_out(freq_div_0_X_freq_x4_out),
		.freq_x8_out(freq_div_0_X_freq_x8_out)
	);

mux mux_0
	(
		.in0(clk),
		.in1(freq_div_0_X_freq_x2_out),
		.in2(freq_div_0_X_freq_x4_out),
		.in3(freq_div_0_X_freq_x8_out),
		.sel(sel),
		.out(clk_out)
	);
	

endmodule 










