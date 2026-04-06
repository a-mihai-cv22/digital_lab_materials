`timescale 1ns / 1ps

module tb();

logic clock;
logic reset;
logic [1:0] in_tb;
logic [3:0] out_v1_tb;
logic [3:0] out_v2_tb;
logic [3:0] out_v3_tb;
logic [3:0] out_v4_tb;
logic [3:0] out_v5_tb;
logic [3:0] out_v6_tb;

top dut
	(
	    .clock(clock),
	    .reset(reset),
		.in(in_tb),
		.out_v1(out_v1_tb),
		.out_v2(out_v2_tb),
		.out_v3(out_v3_tb),
		.out_v4(out_v4_tb),
		.out_v5(out_v5_tb),
		.out_v6(out_v6_tb)
	);
	
initial 
begin
    clock = 0;
    forever
        begin
        #5 clock = ~clock;
        end
end	
	
initial
begin
    in_tb <= 0;
    reset <= 1;
    #100; reset <= 0;
	#200; in_tb <= 1;
	#200; in_tb <= 2;
	#200; in_tb <= 3;
	#200; in_tb <= 0;
	#200; in_tb <= 2;
	
	#2000;
end
	
	
	
endmodule
