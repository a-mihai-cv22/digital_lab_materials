module mux4
	(
		input logic [1:0] in0,
		input logic [1:0] in1,
		input logic [1:0] in2,
		input logic [1:0] in3,
		input logic [1:0] sel,
		output logic [1:0] out
	);

always_comb 
	begin
	case(sel)
		0:
			begin
			out = in0;
			end
		1:
			begin
			out = in1;
			end
		2:
			begin
			out = in2;
			end
		3:
			begin
			out = in3;
			end
		default:
			begin
			out = in0;
			end
	endcase
	end

endmodule 