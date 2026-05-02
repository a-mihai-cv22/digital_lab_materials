module uart_tx
	(	
		input logic clk,
		input logic rst,
		input logic start,
		input logic [7:0] data_in,
		output logic out_tx
	);
	
logic toggle_ff_0_X_out;
logic [3:0] comparator_egalitate_tff_X_out;
logic a;
logic [3:0] counter_bit_select_X_out;
logic [19:0] counter_baud_rate_X_out;
logic comparator_egalitate_bit_select_X_out;
logic comparator_egalitate_regload_X_out;
logic comparator_egalitate_regload2_X_out;
logic crc_calc_0_X_out;
logic [10:0] reg0_X_data_out;
logic mux_0_X_out;
	
assign out_tx = ~toggle_ff_0_X_out | mux_0_X_out;
assign a = comparator_egalitate_tff_X_out & comparator_egalitate_bit_select_X_out; 	
	
	
	
	
toggle_ff toggle_ff_0
	(
		.clk(clk),
		.rst(rst),
		.toggle( (~toggle_ff_0_X_out & start) | (a) ),
		.out(toggle_ff_0_X_out)
    );	
	
comparator_egalitate 
	#(
		.size(4)
	) comparator_egalitate_tff
	(
		.in0(10),
		.in1(counter_bit_select_X_out),
		.out(comparator_egalitate_tff_X_out)
	);

comparator_egalitate 
	#(
		.size(20)
	) comparator_egalitate_bit_select
	(
		.in0(10416),// clock 100MHZ => 10ns; 9600baud => 104166.667 ns; counter limit => 104166.667/10=> 10416
		.in1(counter_baud_rate_X_out),
		.out(comparator_egalitate_bit_select_X_out)
	);

comparator_egalitate 
	#(
		.size(4)
	) comparator_egalitate_regload
	(
		.in0(counter_bit_select_X_out),
		.in1(0),
		.out(comparator_egalitate_regload_X_out)
	);	
	
comparator_egalitate 
	#(
		.size(20)
	) comparator_egalitate_regload2
	(
		.in0(counter_baud_rate_X_out),
		.in1(0),
		.out(comparator_egalitate_regload2_X_out)
	);		
	
counter 
	#(
		.size(20)
	) counter_baud_rate
	(
		.clk(clk),
		.rst(rst | comparator_egalitate_bit_select_X_out),
		.en(toggle_ff_0_X_out),
		.out(counter_baud_rate_X_out)
    );	
	
counter 
	#(
		.size(4)
	) counter_bit_select
	(
		.clk(clk),
		.rst(a | rst),
		.en(comparator_egalitate_bit_select_X_out),
		.out(counter_bit_select_X_out)
    );	
	
crc_calc crc_calc_0
	(
		.in(data_in),
		.out(crc_calc_0_X_out)
	);	
	
reg0 reg0
	(
		.clk(clk),
		.rst(rst),
		.en(comparator_egalitate_regload_X_out & start & comparator_egalitate_regload2_X_out),
		.data_in({1'b1, crc_calc_0_X_out, 
					data_in[0], data_in[1], data_in[2], data_in[3],
					data_in[4], data_in[5], data_in[6], data_in[7],
					1'b0
				 }),
		.data_out(reg0_X_data_out)
    );	
	
mux mux_0
	(
		.in(reg0_X_data_out),
		.sel(counter_bit_select_X_out),
		.out(mux_0_X_out)
	);




endmodule 











