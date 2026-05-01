module comp_eq
	(
		input logic [1:0] in0,
		input logic [1:0] in1,
		output logic out
	);

assign out = (in0 == in1);

endmodule 