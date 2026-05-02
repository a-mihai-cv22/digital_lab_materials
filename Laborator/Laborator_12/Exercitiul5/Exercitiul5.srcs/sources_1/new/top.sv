module top
	(
		input logic clk,
		input logic rst_n,
		input logic save,
		input logic sel,
		input logic [3:0] data,
		input logic [3:0] w_addr,
		output logic [3:0] instr 
	);



logic prescaler_0_X_clk_out;
logic [1:0] reg_2b_0_X_out;
logic demux2_save_X_out0;
logic demux2_save_X_out1;
logic [3:0] demux2_data_X_out0;
logic [3:0] demux2_data_X_out1;
logic [3:0] program_counter_0_X_out;



prescaler prescaler_0
	(
		.clk(clk),
		.rst_n(rst_n),
		.sel(reg_2b_0_X_out),
		.clk_out(prescaler_0_X_clk_out)
	);

reg_2b reg_2b_0
	(
		.clk(clk),
		.rst_n(rst_n),
		.save(demux2_save_X_out0),
		.data(demux2_data_X_out0),
		.out(reg_2b_0_X_out)
	);

	
demux2 
	#(
		.data_size(1)
	) demux2_save
	(
		.in(save),
		.sel(sel),
		.out0(demux2_save_X_out0),
		.out1(demux2_save_X_out1)
	);
	

demux2
	#(
		.data_size(4)
	) demux2_data
	(
		.in(data),
		.sel(sel),
		.out0(demux2_data_X_out0),
		.out1(demux2_data_X_out1)
	);	

program_counter program_counter_0
	(
		.clk(prescaler_0_X_clk_out),
		.rst_n(rst_n),
		.out(program_counter_0_X_out)
	);
	
ram_instr ram_instr_0
	(
		.clk(prescaler_0_X_clk_out),
		.r_addr(program_counter_0_X_out),
		.r_data(instr),
		.we(demux2_save_X_out1),
		.w_addr(w_addr),
		.w_data(demux2_data_X_out1)
    );

endmodule 










