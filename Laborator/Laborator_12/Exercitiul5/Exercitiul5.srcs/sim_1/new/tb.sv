`timescale 1ns / 1ps

module tb();

logic clk;
logic rst_n;
logic save;
logic sel;
logic [3:0] data;
logic [3:0] w_addr;
logic [3:0] instr;

top dut
	(
		.clk(clk),
		.rst_n(rst_n),
		.save(save),
		.sel(sel),
		.data(data),
		.w_addr(w_addr),
		.instr(instr)
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
	rst_n = 1;
	save = 0;
	sel = 0;
	data = 0;
	w_addr = 0;
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	
	rst_n = 0;
	@(posedge clk);
	@(posedge clk);
	
	rst_n = 1;
	@(posedge clk);
	@(posedge clk);
	
	save = 1;
	sel = 1;
	data = 1;
	@(posedge clk);
	
	data = 2;
	w_addr = 1;
	@(posedge clk);
	
	w_addr = 2;
	@(posedge clk);
	
	data = 1;
	w_addr = 3;
	@(posedge clk);
	
	save = 0;
	sel = 0;
	data = 0;
	w_addr = 0;
	@(posedge clk);
	
	save = 1;
	data = 5;
	@(posedge clk);
	
	save = 0;
	data = 0;
	end

initial
	begin
	repeat(50)
		@(posedge clk);
	end



endmodule












