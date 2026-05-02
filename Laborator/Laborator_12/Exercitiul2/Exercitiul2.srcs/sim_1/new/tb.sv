`timescale 1ns / 1ps

module tb();

logic clk;
logic reset;
logic en;
logic tester;
logic [7:0] sir;

top dut
	(
		.clk(clk),
		.reset(reset),
		.en(en),
		.tester(tester),
		.sir(sir)
	);

initial
	begin
	clk = 0;
	forever
		begin
		#5 clk = ~clk;
		end
	end

initial
	begin
	reset = 1;
	en = 0;
	repeat(2)
		@(posedge clk);
		
	reset = 0;
	en = 0;
	repeat(2)
		@(posedge clk);	
		
	en = 1;
	repeat(500)
		@(posedge clk);	
	
	#1 $stop();
	end

endmodule












