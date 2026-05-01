module mux2
	(
		input logic [1:0] in0,
		input logic [1:0] in1,
		input logic sel,
		output logic [1:0] out
	);

assign out = (sel == 0) ? in0 : in1;

endmodule 