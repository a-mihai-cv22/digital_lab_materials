`timescale 1ns / 1ps

module tb();

logic clock;
logic reset;
logic start;
logic stop;
logic stop_at_end;
logic [7:0] segments;
logic [3:0] digits;
logic [7:0] nr_laps; 

top dut
    (
        .clock(clock), 
        .reset(reset),
        .start(start),
        .stop(stop),
        .stop_at_end(stop_at_end),
        .segments(segments),
        .digits(digits),
        .nr_laps(nr_laps)
    );


initial
    begin
    clock = 0;
    forever
        begin
        #5 clock = ~ clock;
        end
    end



initial
    begin
    reset <= 1;
    start <= 0;
    stop <= 0;
    stop_at_end <= 0;
    
    repeat(5)
        begin
        @(posedge clock);
        end
    
    reset <=0;
    
    repeat(5)
        begin
        @(posedge clock);
        end
    start <= 1;
    
    repeat(5)
        begin
        @(posedge clock);
        end
    start <= 0;   
        
   repeat(20 * 100_000_000)
        begin
        @(posedge clock);
        end  
   stop_at_end <= 1;    
        
   repeat(1)
        begin
        @(posedge clock);
        end     
   stop_at_end <= 0;
   
    
   repeat(8 * 100_000_000)
        begin
        @(posedge clock);
        end  
   $stop();     
        
   end






endmodule













