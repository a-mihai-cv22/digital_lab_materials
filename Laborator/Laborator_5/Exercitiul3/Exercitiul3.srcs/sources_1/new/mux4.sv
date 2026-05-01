module mux4
	(
		input logic in0,
		input logic in1,
		input logic in2,
		input logic in3,
		input logic [1:0] sel,
		output logic out
    );

logic mux2_sus_X_out;
logic mux2_jos_X_out;

mux2
	#(
		.size(1)
	) mux2_sus
	(
		.in0(in0),
		.in1(in1),
		.sel(sel[0]),
		.out(mux2_sus_X_out)
    );
    
mux2
	#(
		.size(1)
	) mux2_jos
	(
		.in0(in2),
		.in1(in3),
		.sel(sel[0]),
		.out(mux2_jos_X_out)
    );
    
mux2
	#(
		.size(1)
	) mux2_dreapta
	(
		.in0(mux2_sus_X_out),
		.in1(mux2_jos_X_out),
		.sel(sel[1]),
		.out(out)
    );        

endmodule
