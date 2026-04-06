
// varianta cu assign comportamental 

module decodor_v6
	(
		inut logic [1:0] in,
		output logic [3:0] out 
	);

assign out = 1 << in; 

endmodule 