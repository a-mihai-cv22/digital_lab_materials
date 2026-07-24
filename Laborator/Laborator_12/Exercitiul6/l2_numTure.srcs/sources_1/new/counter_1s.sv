
module counter_1s
    (
        input logic clock,
        input logic reset,
        output logic pulse_at_1s
    );
   
logic [31:0] counter_0_X_out;
  
counter
    #( 
        .nr_bits(32)
    ) counter_0
    (
        .clock(clock),
        .reset(reset | pulse_at_1s),
        .en(1),
        .out(counter_0_X_out)
    );   
   
    
comp_eq
	#( 
        .nr_bits(8)
    ) comp_eq_0
    (
        .in0(counter_0_X_out),
        .in1(100_000_000), 
        .out(pulse_at_1s)
    );    
    
    
endmodule













