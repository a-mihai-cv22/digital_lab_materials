module mux2
	#(
		parameter size = 1
	)	
	(
		input logic [size-1:0] in0,
		input logic [size-1:0] in1,
		input logic sel,
		output logic [size-1:0] out
    );

assign out = (sel == 0) ? in0 : in1;

endmodule
