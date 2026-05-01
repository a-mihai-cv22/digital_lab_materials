module demux2_8b
	(
		input logic [7:0] in0,
		input logic sel,
		output logic [7:0] out0,
		output logic [7:0] out1
	);

assign out0 = (sel == 0) ? in0 : 0;
assign out1 = (sel == 1) ? in0 : 0;

endmodule 