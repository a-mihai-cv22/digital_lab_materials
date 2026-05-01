module preprocesare
	(
		input logic [7:0] in_litera,
		output logic [7:0] out
	);

logic comp_greater_0_X_out;
logic [7:0] demux2_8b_0_X_out0;
logic [7:0] demux2_8b_0_X_out1;
logic [7:0] sub_8b_0_X_out0;
logic [7:0] sub_8b_1_X_out0;

comp_greater comp_greater_0
	(
		.in0(in_litera),
		.in1(90),
		.out0(comp_greater_0_X_out)
	);

demux2_8b demux2_8b_0
	(
		.in0(in_litera),
		.sel(comp_greater_0_X_out),
		.out0(demux2_8b_0_X_out0),
		.out1(demux2_8b_0_X_out1)
	);
	
sub_8b sub_8b_0
	(
		.in0(demux2_8b_0_X_out0),
		.in1(65),
		.out0(sub_8b_0_X_out0)
	);	
	
sub_8b sub_8b_1
	(
		.in0(demux2_8b_0_X_out1),
		.in1(97),
		.out0(sub_8b_1_X_out0)
	);	
	
mux2_8b mux2_8b_0
	(
		.in0(sub_8b_0_X_out0),
		.in1(sub_8b_1_X_out0),
		.sel(comp_greater_0_X_out),
		.out0(out)
	);

endmodule