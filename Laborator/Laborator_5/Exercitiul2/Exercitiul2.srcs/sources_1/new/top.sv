module top
	(
		input logic [15:0] instruction,
		input logic [7:0] data0,
		input logic [7:0] data1,
		output logic [7:0] out0,
		output logic [7:0] out1,
		output logic [7:0] out2,
		output logic [7:0] out3,
		output logic zero_flag,
		output logic overflow_flag
    );

logic [8:0] add_result;
logic [7:0] special_0_X_out;
logic [7:0] mux4_0_X_out0;
logic [7:0] mux4_1_X_out0;
logic [7:0] mux4_2_X_out0;

assign add_result = data0 + data1;
assign overflow_flag = add_result[8];

mux4 mux4_0
    (
        .in0(data0 >> data1),
        .in1(data0 << data1),
        .in2(add_result[7:0]),
        .in3(data0 - data1),
        .sel(instruction[11:10]),
        .out0(mux4_0_X_out0)
    );

mux4 mux4_1
    (
        .in0(data0 & data1),
        .in1(data0 | data1),
        .in2(data0 ^ data1),
        .in3(1),
        .sel(instruction[11:10]),
        .out0(mux4_1_X_out0)
    );

special special_0
	(
		.in0(data0),
		.in1(data1),
		.out0(special_0_X_out)
    );

mux4 mux4_2
    (
        .in0(mux4_0_X_out0),
        .in1(mux4_1_X_out0),
        .in2(0),
        .in3(special_0_X_out),
        .sel(instruction[13:12]),
        .out0(mux4_2_X_out0)
    );



demux4 demux4_0
    (
        .in0(mux4_2_X_out0),
        .sel(instruction[15:14]),
        .out0(out0),
        .out1(out1),
        .out2(out2),
        .out3(out3)
    );

comp_eq comp_eq_0
	(
		.in0(mux4_2_X_out0),
		.in1(0),
		.out0(zero_flag)
	);


endmodule











