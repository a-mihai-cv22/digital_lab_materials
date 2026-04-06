`timescale 1ns/1ps

module Decoder_TB();
    logic [1:0] in_tb;
    logic [3:0] out_tb;
  
    integer idx;

    initial begin
        for(idx=0; idx<4; idx = idx + 1) begin
            in_tb = idx;
            #1;
        end 
        #2 $stop();
     end

Decoder DUT(
    .in(in_tb),
    .out(out_tb)
);

endmodule