module mux2_8b
	(
		input logic [7:0] in0,
		input logic [7:0] in1,
		input logic sel,
		output logic [7:0] out0
	);

assign out0 = (sel == 1) ? in1 : in0;


endmodule 