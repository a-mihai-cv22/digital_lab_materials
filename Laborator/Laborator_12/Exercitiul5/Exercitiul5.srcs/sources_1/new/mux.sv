module mux
	(
		input logic in0,
		input logic in1,
		input logic in2,
		input logic in3,
		input logic [1:0] sel,
		output logic out
	);

always_comb
	begin
		case(sel)
			0: out = in0;
			1: out = in1;
			2: out = in2;
			3: out = in3;
			default: out =0;
		endcase 
	end

endmodule 