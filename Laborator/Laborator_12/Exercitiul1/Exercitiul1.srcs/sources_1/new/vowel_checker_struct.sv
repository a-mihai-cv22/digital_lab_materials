module vowel_checker_struct
	(
		input logic [7:0] data_in,
		output logic is_vowel
	);


logic is_a;
logic is_e;
logic is_i;
logic is_o;
logic is_u;

assign is_a = (data_in == "a"); // comparators
assign is_e = (data_in == "e");
assign is_i = (data_in == "i");
assign is_o = (data_in == "o");
assign is_u = (data_in == "u");

assign is_vowel = (is_a | is_e | is_i | is_o | is_u);

endmodule 