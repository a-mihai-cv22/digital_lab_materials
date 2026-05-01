module add_block
	(
		input logic [1:0] in0,
		input logic [1:0] in1,
		input logic sel,
		output logic [1:0] out,
		output logic ok,
		output logic of
	);

logic [1:0] add_0_X_out0;
logic [1:0] rom_add_0_X_data;

add add_0
	(
		.in0(in0),
		.in1(in1),
		.out0(add_0_X_out0)
	);
	
rom_add rom_add_0
	(
		.addr({in1,in0}),
		.data(rom_add_0_X_data)
	);	
	
comp_eq comp_eq_0
	(
		.in0(add_0_X_out0),
		.in1(rom_add_0_X_data),
		.out(ok)
	);

mux2 mux2_0
	(
		.in0(add_0_X_out0),
		.in1(rom_add_0_X_data),
		.sel(sel),
		.out(out)
	);
	
overflow_compute overflow_compute_0
	(
		.in0(in0),
		.in1(in1),
		.out0(of)
	);
		
endmodule 