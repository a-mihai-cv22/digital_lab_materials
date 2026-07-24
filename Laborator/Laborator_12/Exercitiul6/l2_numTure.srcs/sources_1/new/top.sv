module top
    (
        input logic clock, 
        input logic reset,
        input logic start,
        input logic stop,
        input logic stop_at_end,
        output logic [7:0] segments,
        output logic [3:0] digits,
        output logic [7:0] nr_laps 
    );



logic fsm_0_X_reset_counters;
logic counter_1s_0_X_pulse_at_1s;
logic [3:0] counter_0_X_out;
logic reached_end_of_lap;
logic comp_eq_0_X_out;


assign reached_end_of_lap = ( comp_eq_0_X_out & counter_1s_0_X_pulse_at_1s);

comp_eq
	#( 
        .nr_bits(4)
    ) comp_eq_0
    (
        .in0(counter_0_X_out),
        .in1(11), 
        .out(comp_eq_0_X_out)
    );


fsm fsm_0    // moore fara intarziere 
    (
        .clock(clock), 
        .reset(reset),
        .start(start),
        .stop(stop),
        .stop_at_end(stop_at_end),
        .reached_end_of_lap(reached_end_of_lap),
        .reset_counters(fsm_0_X_reset_counters),
        .enable_counters(fsm_0_X_enable_counters)
    );



counter_1s counter_1s_0
    (
        .clock(clock),
        .reset(fsm_0_X_reset_counters),
        .pulse_at_1s(counter_1s_0_X_pulse_at_1s)
    );
    
    
    
counter
    #( 
        .nr_bits(4)
    ) counter_0
    (
        .clock(clock),
        .reset(fsm_0_X_reset_counters | reached_end_of_lap),
        .en(counter_1s_0_X_pulse_at_1s & fsm_0_X_enable_counters),
        .out(counter_0_X_out)
    );    



counter
    #( 
        .nr_bits(8)
    ) counter_1
    (
        .clock(clock),
        .reset(fsm_0_X_reset_counters),
        .en(reached_end_of_lap & fsm_0_X_enable_counters),
        .out(nr_laps)
    );



transcodor_segmente transcodor_segmente_0
    (
        .addr(counter_0_X_out),
        .data(segments)
    );



transcodor_digits transcodor_digits_0
    (
        .addr(counter_0_X_out),
        .data(digits)
    );






endmodule
















