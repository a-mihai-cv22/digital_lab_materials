`timescale 1ns / 1ps

module tb();

logic clk;
logic rst;
logic tx_start;
logic [7:0] tx_data_in;
logic [7:0] rx_data_out;
logic rx_valid;
logic rx_en;
logic connection;

uart_tx tx
	(	
		.clk(clk),
		.rst(rst),
		.start(tx_start),
		.data_in(tx_data_in),
		.out_tx(connection)
	);

uart_rx rx
	(	
		.clk(clk),
		.rst(rst),
		.en(rx_en),
		.rx(connection),
		.valid(rx_valid),
		.data_out(rx_data_out)
	);



initial
	begin
	clk = 0;
	forever
		begin
		#5 clk = ~clk; // period of 10 ns => 100MHz
		end
	end



initial
	begin
	rst <= 0;
	tx_start <= 0;
	tx_data_in <= 0;
	rx_en <= 0;
	
	repeat(10)
		@(posedge clk);
	rst <= 1;
	
	repeat(10)
		@(posedge clk);
	rst <= 0;
	rx_en <= 1;
	
	repeat(100)
		@(posedge clk);
	tx_data_in <= "a";
	tx_start <= 1;
	
	repeat(1)
		@(posedge clk);
	tx_start <= 0;
	
	
	repeat(1_000_000)
		@(posedge clk);
		
	
	tx_data_in <= "b";
	tx_start <= 1;
	repeat(1)
		@(posedge clk);
	tx_start <= 0;
	
	repeat(1_000_000)
		@(posedge clk);
		
	tx_data_in <= "c";
	tx_start <= 1;
	repeat(1)
		@(posedge clk);
	tx_start <= 0;
	
	repeat(1_000_000)
		@(posedge clk);
		
	tx_data_in <= "d";
	tx_start <= 1;
	repeat(1)
		@(posedge clk);
	tx_start <= 0;
	
	repeat(1_000_000)
		@(posedge clk);	
		
	#1 $stop();
	
	end






endmodule









