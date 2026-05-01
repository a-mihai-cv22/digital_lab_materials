`timescale 1ns / 1ps

module tb();

logic [7:0] in_litera;
logic [3:0] offset;
logic [7:0] out_litera;

top dut
	(
		.in_litera(in_litera),
		.offset(offset),
		.out_litera(out_litera)
		
    );

initial
	begin
	in_litera = "a";
	#5 in_litera = "b";
	#10 in_litera = "c";
	#5 in_litera = "a";
	#5 in_litera = "b";
	#5 in_litera = "x";
	#5 in_litera = "y";
	#5 in_litera = "z";
	#10 in_litera = "a";
	#5 in_litera = "b";
	end

initial
	begin
	offset = 0;
	#20 offset = 4;
	#30 offset = 10;
	end
	
initial
	begin
	#200 $stop();
	end


endmodule








