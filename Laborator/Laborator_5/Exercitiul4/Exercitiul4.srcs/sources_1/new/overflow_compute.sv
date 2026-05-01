module overflow_compute
	(
		input logic [1:0] in0,
		input logic [1:0] in1,
		output logic out0
	);

logic [2:0] internal_sum;

assign internal_sum = in0 + in1;
assign out0 = internal_sum[2];

// se poate de asemnea face cu case (alt lut), in care vezi situatiile cand suma este strict mai mare decat 3

endmodule 