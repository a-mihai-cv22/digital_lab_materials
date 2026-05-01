module and_gate
	(
		input logic [1:0] in0,
		input logic [1:0] in1,
		output logic [1:0] out0
	);

assign out0 = in0 & in1;

endmodule 