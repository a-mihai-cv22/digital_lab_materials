module mux
	(
		input logic [10:0] in,
		input logic [3:0] sel,
		output logic out
	);

// fiind 11 intrari pe 1 bit, se poate scrie cu 11 intrari separate sau o intrare de 11 bit si bit select pentru iesire

assign out = in[sel];

endmodule 