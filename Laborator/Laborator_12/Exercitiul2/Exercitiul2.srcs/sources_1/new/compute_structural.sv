module compute_structural // se evidentiaza structura si circuitele componente
	(
		input logic [7:0] in0,
		input logic [7:0] in1,
		output logic [7:0] out
	);

logic is_even;
logic multiplier_out;
logic adder_out;
logic even_branch;
logic odd_branch;


assign is_even = in0[0]; // wire 
assign multiplier_out = 2 * in1; // multiplier
assign adder_out = multiplier_out + in0; // adder
assign even_branch = adder_out + 3; // adder
assign odd_branch = adder_out -1; // subtracter
assign out = (is_even) ? even_branch : odd_branch; // mux 




endmodule 