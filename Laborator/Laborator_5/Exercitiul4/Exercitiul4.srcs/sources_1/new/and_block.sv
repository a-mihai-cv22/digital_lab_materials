module and_block
	(
		input logic [1:0] in0,
		input logic [1:0] in1,
		input logic sel,
		output logic [1:0] out,
		output logic ok
	);

logic [1:0] and_gate_0_X_out0;
logic [1:0] rom_and_0_X_data;

and_gate and_gate_0
	(
		.in0(in0),
		.in1(in1),
		.out0(and_gate_0_X_out0)
	);

rom_and rom_and_0
	(
		.addr({in1,in0}),
		.data(rom_and_0_X_data)
	);

comp_eq comp_eq_0
	(
		.in0(and_gate_0_X_out0),
		.in1(rom_and_0_X_data),
		.out(ok)
	);

mux2 mux2_0
	(
		.in0(and_gate_0_X_out0),
		.in1(rom_and_0_X_data),
		.sel(sel),
		.out(out)
	);

endmodule 