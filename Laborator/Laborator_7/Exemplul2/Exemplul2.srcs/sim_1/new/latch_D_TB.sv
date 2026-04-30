`timescale 1ns/1ps

module latch_D_TB();

logic D_tb, E_tb;
logic Q_tb;

initial begin
       D_tb = 0;
       E_tb = 1;
    #1 D_tb = 1;
    #1 D_tb = 0;
    #1 E_tb = 0;
    #1 D_tb = 1;
    #1 D_tb = 0;
    #5 $stop();
end

latch_D DUT1(
    .D(D_tb),
    .E(E_tb),
    .Q(Q_tb)
);

endmodule