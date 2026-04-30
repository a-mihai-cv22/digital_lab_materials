`timescale 1ns/1ps

module Circuit_TB();

logic a_tb, b_tb;
logic c_tb, d_tb;

initial begin
       a_tb = 0;
       b_tb = 0;
    #5 b_tb = 1;
    #5 $stop();
end

Circuit DUT(
    .a(a_tb),
    .b(b_tb),
    .c(c_tb),
    .d(d_tb)
);

endmodule