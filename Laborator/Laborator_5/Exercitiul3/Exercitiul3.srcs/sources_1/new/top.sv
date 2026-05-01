module top
	(
		input logic in0,
		input logic in1,
		input logic in2,
		input logic in3,
		input logic [1:0] sel,
		input logic [3:0] data,
		output logic out0,
		output logic out1,
		output logic out2,
		output logic out3
    );

logic [1:0] not_gate_0_X_out;
logic parity_calc_0_X_out;
logic mux4_0_X_out;
logic [1:0] mux2_0_X_out;

mux4 mux4_0
	(
		.in0(in0),
		.in1(in1),
		.in2(in2),
		.in3(in3),
		.sel(sel),
		.out(mux4_0_X_out)
    );


not_gate not_gate_0
	(
		.in(sel),
		.out(not_gate_0_X_out)
	);

parity_calc parity_calc_0	
	(
		.in(data),
		.out(parity_calc_0_X_out)
	);

mux2
	#(
		.size(2)
	) mux2_0
	(
		.in0(not_gate_0_X_out),
		.in1(sel),
		.sel(parity_calc_0_X_out),
		.out(mux2_0_X_out)
    );

demux4 demux4_0
	(
		.in(mux4_0_X_out),
		.sel(mux2_0_X_out),
		.out0(out0),
		.out1(out1),
		.out2(out2),
		.out3(out3)
	);
	
endmodule 