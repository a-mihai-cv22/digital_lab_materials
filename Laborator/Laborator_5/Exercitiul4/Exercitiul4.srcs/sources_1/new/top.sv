module top
	(
	input logic [1:0] data0,
	input logic [1:0] data1,
	input logic [7:0] instr_in,
	output logic ok,
	output logic of,
	output logic [1:0] out0,
	output logic [1:0] out1,
	output logic [1:0] out2,
	output logic [1:0] out3,
	output logic [7:0] instr_out
	);

logic add_block_0_X_ok;
logic and_block_0_X_ok;
logic [1:0] add_block_0_X_out;
logic [1:0] and_block_0_X_out;
logic [1:0] special_0_X_out;
logic [1:0] mux4_0_X_out;

assign instr_out = instr_in;
assign ok = add_block_0_X_ok | and_block_0_X_ok;

add_block add_block_0
	(
		.in0(data0),
		.in1(data1),
		.sel(instr_in[0]),
		.out(add_block_0_X_out),
		.ok(add_block_0_X_ok),
		.of(of)
	);

and_block and_block_0
	(
		.in0(data0),
		.in1(data1),
		.sel(instr_in[0]),
		.out(and_block_0_X_out),
		.ok(and_block_0_X_ok)
	);

special special_0
	(
		.in0(data0),
		.in1(data1),
		.out(special_0_X_out)
	);
		
mux4 mux4_0
	(
		.in0(add_block_0_X_out),
		.in1(and_block_0_X_out),
		.in2(special_0_X_out),
		.in3(0),
		.sel(instr_in[2:1]),
		.out(mux4_0_X_out)
	);	
	
demux4 demux4_0
	(
		.in(mux4_0_X_out),
		.sel(instr_in[4:3]),
		.out0(out0),
		.out1(out1),
		.out2(out2),
		.out3(out3)
	);
	


endmodule








