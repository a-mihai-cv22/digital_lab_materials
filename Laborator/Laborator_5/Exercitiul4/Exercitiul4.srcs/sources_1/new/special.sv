module special
	(
		input logic [1:0] in0,
		input logic [1:0] in1,
		output logic [1:0] out
	);

always_comb	
	begin
	if( (in0[1] + in0[0]) == (in1[1] + in1[0]) )
		begin
		out = 2'b01;
		end
	else
		begin
		out = 2'b00;
		end
	end

// se poate face si prin alte variante 

endmodule 