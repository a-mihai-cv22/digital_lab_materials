module compute_behav
	(
		input logic [7:0] in0,
		input logic [7:0] in1,
		output logic [7:0] out
	);

always_comb
	begin
	if(in0[0] ==0)
		begin
		out = 2 * in1 + in0 + 3;
		end
	else
		begin
		out = 2 * in1 + in0 - 1;
		end
	end




endmodule 