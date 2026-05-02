module demux
	(
		input logic [7:0] in,
		input logic sel,
		output logic [7:0] out0,
		output logic [7:0] out1
	);

always_comb
	begin
	case(sel)
		0:
			begin
			out0 = in;
			out1 = 0;
			end
		1:
			begin
			out0 = 0;
			out1 = in;
			end
	endcase
	end

endmodule 