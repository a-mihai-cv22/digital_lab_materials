`timescale 1ns / 1ps

module ALU_tb();

logic [15:0] instruction;
logic [7:0] data0;
logic [7:0] data1;
logic [7:0] out0;
logic [7:0] out1;
logic [7:0] out2;
logic [7:0] out3;
logic zero_flag;
logic overflow_flag;

top dut 
    (
        .instruction(instruction),
        .data0(data0),
        .data1(data1),
        .out0(out0),
        .out1(out1),
        .out2(out2),
        .out3(out3),
        .zero_flag(zero_flag),
        .overflow_flag(overflow_flag)
    );


initial
    begin
    instruction = 0;
    #10;
    instruction = 16'hffff;
    #20; 
    instruction = 16'b0000_1100_0000_0000;
    #25; 
    instruction = 0;
    
    // test flag overflow cu adunare 
    #35; 
    instruction = 16'b00_0010_0000000000;
    
    // test flag 0 cu and 
    #20;
    instruction = 16'b00_0100_0000000000;
    end

initial
    begin
    data0 = 0;
    #20;
    data0 = 255;
    #10;
    data0 = 1;
    #5;
    data0 = 2;
    #10;
    data0 = 0;
    
    // test flag overflow cu adunare 
    #45; 
    data0 = 255;
    
    // test flag 0 cu and 
    #20;
    data0 = 255;
    
    end
    
initial
    begin
    data1 = 0;
    #20;
    data1 = 255;
    #10;
    data1 = 1;
    #10;
    data1 = 3;
    #10;
    data1 = 0;
    
    // test flag overflow cu adunare 
    #50; 
    data1 = 255;
    
    // test flag 0 cu and 
    #20;
    data1 = 0;
    end
    
initial
    begin
    #200 $stop();
    end
    






endmodule
