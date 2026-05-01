module demux4
	(
		input logic [1:0] in,
		input logic [1:0] sel,
		output logic [1:0] out0,
		output logic [1:0] out1,
		output logic [1:0] out2,
		output logic [1:0] out3
	);

always_comb
	begin
	case(sel)
		0:
			begin
			out0 = in;
			out1 = 0;
			out2 = 0;
			out3 = 0;
			end
		1:
			begin
			out0 = 0;
			out1 = in;
			out2 = 0;
			out3 = 0;
			end
		2:
			begin
			out0 = 0;
			out1 = 0;
			out2 = in;
			out3 = 0;
			end
		3:
			begin
			out0 = 0;
			out1 = 0;
			out2 = 0;
			out3 = in;
			end
		default:
			begin
			out0 = 0;
			out1 = 0;
			out2 = 0;
			out3 = 0;
			end
	endcase
	end

endmodule 