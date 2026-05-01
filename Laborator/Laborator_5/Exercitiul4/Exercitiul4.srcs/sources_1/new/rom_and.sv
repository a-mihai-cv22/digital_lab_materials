module rom_and
	(
		input logic [3:0] addr,
		output logic [1:0] data
	);

always_comb
	begin
	case(addr)
		0: data = 0;
		1: data = 0;
		2: data = 0;
		3: data = 0;
		4: data = 0;
		5: data = 1;
		6: data = 0;
		7: data = 1;
		8: data = 0;
		9: data = 0;
		10: data = 2;
		11: data = 2;
		12: data = 0;
		13: data = 1;
		14: data = 2;
		15: data = 3;
		default:  data = 0;
	endcase
	end

endmodule 