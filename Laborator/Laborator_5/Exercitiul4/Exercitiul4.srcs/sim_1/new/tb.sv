`timescale 1ns / 1ps

module tb();

logic [1:0] data0;
logic [1:0] data1;
logic [7:0] instr_in;
logic ok;
logic of;
logic [1:0] out0;
logic [1:0] out1;
logic [1:0] out2;
logic [1:0] out3;
logic [7:0] instr_out;

top dut
	(
	.data0(data0),
	.data1(data1),
	.instr_in(instr_in),
	.ok(ok),
	.of(of),
	.out0(out0),
	.out1(out1),
	.out2(out2),
	.out3(out3),
	.instr_out(instr_out)
	);
	
initial
	begin
	instr_in = 0;
	#10 instr_in = 8'h02;
	#10 instr_in = 8'hf0;
	#10 instr_in = 0;
	end

initial 
	begin
	data0 = 0;
	#10 data0 = 1;
	#5 data0 = 2;
	#5 data0 = 3;
	#15 data0 = 0;
	end

initial
	begin
	data1 = 0;
	#10 data1 = 1;
	#15 data1 = 0;
	end 

initial
	begin
	#200 $stop();
	end
endmodule













