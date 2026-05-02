module demux2
	#(
		parameter data_size = 1
	)
	(
		input logic [data_size-1:0] in,
		input logic sel,
		output logic [data_size-1:0] out0,
		output logic [data_size-1:0] out1
	);

assign out1 = (sel == 1) ? in : 0;
assign out0 = (sel == 0) ? in : 0;

endmodule 