`timescale 1ns/1ps

module flipflop_D_TB();

logic data_in_tb, clock_tb;
logic data_out_tb;

initial begin
       data_in_tb <= 0;
    #2 data_in_tb <= 1;
    #4 data_in_tb <= 0;
    #5 $stop();
end

initial begin
    clock_tb = 0;
    forever #1 clock_tb = ~clock_tb;
end

flipflop_D DUT(
    .data_in(data_in_tb),
    .clock(clock_tb),
    .data_out(data_out_tb)
);

endmodule