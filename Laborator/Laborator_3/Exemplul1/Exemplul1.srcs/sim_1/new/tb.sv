`timescale 1ns / 1ps

module tb();

reg [1:0] in_tb;
wire [3:0] out_v1_tb;
wire [3:0] out_v2_tb;
wire [3:0] out_v3_tb;
wire [3:0] out_v4_tb;
wire [3:0] out_v5_tb;
wire [3:0] out_v6_tb;

top dut
	(
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
	in_tb = 0;
	#20; in_tb = 1;
	#20; in_tb = 2;
	#20; in_tb = 3;
	#20; in_tb = 0;
	#20; in_tb = 2;
	
	#200; $stop();
end
	
	
	
endmodule
