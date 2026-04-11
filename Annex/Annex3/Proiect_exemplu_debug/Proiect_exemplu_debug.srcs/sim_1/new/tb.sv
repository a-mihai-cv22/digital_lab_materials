`timescale 1ns / 1ps

module tb();

logic [3:0] in0_tb;
logic [3:0] in1_tb;
logic [3:0] in2_tb;
logic [3:0] in3_tb;
logic out_tb;

top dut
    (
        .in0(in0_tb),
        .in1(in1_tb),
        .in2(in2_tb),
        .in3(in3_tb),
        .out(out_tb)
    );

initial
begin
    in0_tb = 1;
    in1_tb = 2;
    in2_tb = 3;
    in3_tb = 4;
    #20 $stop();
 end



endmodule










