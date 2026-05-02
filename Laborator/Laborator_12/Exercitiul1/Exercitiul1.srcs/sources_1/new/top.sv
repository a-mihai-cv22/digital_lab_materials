module top
	(
		input clk,
		input rst,
		input en,
		input [7:0] data_in,
		output check,
		output [7:0] vowels,
		output [7:0] consonants,
		output [7:0] data_read0,
		output [7:0] data_read1
	);

logic [5:0] counter_6b_0_X_out;
logic [5:0] reg_6b_0_X_out;


counter_6b counter_6b_0
	(
		.clk(clk),
		.rst(rst),
		.en(en),
		.out(counter_6b_0_X_out)
    );

reg_6b reg_6b_0
	(
		.clk(clk),
		.rst(rst),
		.in(counter_6b_0_X_out),
		.out(reg_6b_0_X_out)
    );
    
ram64x8b ram64x8b_consonants
	(
		.clk(clk),
		.addr(reg_6b_0_X_out),
		.w_en( en & (~vowel_checker_struct_0_X_is_vowel) ),
		.w_data(data_in),
		.r_data(data_read0)
	);   
    
ram64x8b ram64x8b_vowels
	(
		.clk(clk),
		.addr(reg_6b_0_X_out),
		.w_en(en & vowel_checker_struct_0_X_is_vowel),
		.w_data(data_in),
		.r_data(data_read1)
	);  
    
 vowel_checker_struct vowel_checker_struct_0
	(
		.data_in(data_in),
		.is_vowel(vowel_checker_struct_0_X_is_vowel)
	);   
    
 pass_check_fsm pass_check_fsm_0
	(
		.clk(clk),
		.rst(rst),
		.data_in(data_in),
		.en(en),
		.pass_checked(check)
	);   
    
demux demux_0
	(
		.in(data_in),
		.sel(vowel_checker_struct_0_X_is_vowel),
		.out0(vowels),
		.out1(consonants)
	);    
    
    

endmodule 














