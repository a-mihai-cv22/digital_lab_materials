module subtract
	(
		input logic [10:0] in0,
		input logic [10:0] in1,
		output logic [10:0] out
	);

assign out = in0 - in1;

endmodule 