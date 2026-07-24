module comp_eq
	#( 
        parameter nr_bits = 8
    )
    (
        input logic [nr_bits-1:0] in0,
        input logic [nr_bits-1:0] in1, 
        output logic out
    );
    
assign out = (in0==in1);   
    
endmodule
