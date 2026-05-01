module rom_add
	(
		input logic [3:0] addr,
		output logic [1:0] data
	);

always_comb
	begin
	case(addr)
		0: data = 0;
		1: data = 1;
		2: data = 2;
		3: data = 3;
		4: data = 2;
		5: data = 2;
		6: data = 3;
		7: data = 0;
		8: data = 2;
		9: data = 3;
		10: data = 0;
		11: data = 1;
		12: data = 3;
		13: data = 0;
		14: data = 1;
		15: data = 1;
		default:  data = 0;
	endcase
	end

endmodule 