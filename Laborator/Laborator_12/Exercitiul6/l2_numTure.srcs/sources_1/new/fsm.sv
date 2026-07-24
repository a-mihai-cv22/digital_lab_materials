module fsm  // moore fara intarziere 
    (
        input logic clock,
        input logic reset,
        input logic start,
        input logic stop,
        input logic stop_at_end,
        input logic reached_end_of_lap,
        output logic reset_counters,
        output logic enable_counters
    );

logic [1:0] state;

localparam state_reset = 0;
localparam state_idle = 1;
localparam state_running_forever = 2;
localparam state_run_until_end = 3;

always_ff@(posedge clock)
    begin
    if(reset == 1)
        begin
        state <= state_reset;
        end
    else
        case(state)
            state_reset:
                begin
                state <= state_idle;
                end
            state_idle:
                begin
                if( start == 1)
                    begin
                    state <= state_running_forever;
                    end
                else
                    begin
                    state <= state_idle;
                    end
                end
            state_running_forever:
                begin
                if(stop == 1)
                    begin
                    state <= state_idle;
                    end
                else
                    begin
                    if(stop_at_end == 1)
                        begin
                        state <= state_run_until_end;
                        end
                    else
                        begin
                        state <= state_running_forever;
                        end
                    end
                end
            state_run_until_end:    
                begin
                if(reached_end_of_lap) 
                    begin
                    state <= state_idle;
                    end
                else
                    begin
                    state <= state_run_until_end;
                    end
                end
        endcase 
    end


always_comb
    begin
   case(state)
        state_reset:
            begin
            reset_counters = 1;
            enable_counters = 0;
            end
        state_idle:
            begin
            reset_counters = 0;
            enable_counters = 0;
            end
        state_running_forever:
            begin
            reset_counters = 0;
            enable_counters = 1;
            end
        state_run_until_end:    
            begin
            reset_counters = 0;
            enable_counters = 1;
            end
    endcase 
   
    end






endmodule 

















