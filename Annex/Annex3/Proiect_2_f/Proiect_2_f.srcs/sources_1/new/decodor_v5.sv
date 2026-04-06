
// varianta cu always cu case

module decodor_v5
	(
		input logic [1:0] in,
		output logic [3:0] out 
	);

always_comb
begin
	case(in)
		0:
			begin
			out = 1;
			end
		2'd1: 
			begin
			out = 2;
			end
		10:
			begin
			out = 4;
			end
		2'h3: 
			begin
			out = 8;
			end
		default: 
			begin
			out = 0;
			end
	endcase

end 



endmodule 