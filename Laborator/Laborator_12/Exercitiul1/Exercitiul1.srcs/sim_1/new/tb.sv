`timescale 1ns / 1ps
module tb();			// + testare a parolei 


reg clk;
reg rst;
reg en;
reg [7:0] data_in;
wire check;
wire [7:0] vowels;
wire [7:0] consonants;

		

top dut
	(
		.clk(clk),
		.rst(rst),
		.en(en),
		.data_in(data_in),
		.check(check),
		.vowels(vowels),
		.consonants(consonants) 
	);


initial 
begin
	clk <= 0;
	forever
		begin
		#5 clk <= ~clk;
		end
end	
	
	
	
initial 
begin
	rst <= 0;
	repeat(2) 
		begin
		@(posedge clk);
		end
	rst = 1; 
	repeat(2) 
		begin
		@(posedge clk);
		end
	rst = 0;
end	
	

initial 
begin
	en <= 0;
	data_in <= 0;
	repeat(10) 
		begin
		@(posedge clk);
		end
	en <=1;
	data_in <= "a";
	@(posedge clk);
	en <=1;
	data_in <= "b";
	@(posedge clk);
	en <=1;
	data_in <= "c";
	@(posedge clk);
	en <=1;
	data_in <= "d";
	@(posedge clk);
	en <=1;
	data_in <= "e";
	@(posedge clk);
	en <=1;
	data_in <= "f";
	@(posedge clk);
	en <=1;
	data_in <= "g";
	@(posedge clk);
	en <=0;
	data_in <= 0;
	
	@(posedge clk);	// password == mihai
	en <=1;
	data_in <= "m";
	@(posedge clk);
	en <=1;
	data_in <= "i";
	@(posedge clk);
	en <=1;
	data_in <= "h";
	@(posedge clk);
	en <=1;
	data_in <= "a";
	@(posedge clk);
	en <=1;
	data_in <= "i";
	@(posedge clk);
	en <=0;
	data_in <= 0;
end

initial
begin
	repeat(100) 
		begin
		@(posedge clk);
		end
	#1 $stop();
end



endmodule 








