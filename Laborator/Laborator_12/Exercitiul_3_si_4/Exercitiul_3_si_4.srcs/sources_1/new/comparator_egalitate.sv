module comparator_egalitate
	#(
		parameter size = 8
	)
	(
		input logic [size-1:0] in0,
		input logic [size-1:0] in1,
		output logic out
	);

assign out = (in0==in1);

endmodule 