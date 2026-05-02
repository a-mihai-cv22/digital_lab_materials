module top
	(
		input logic clk,
		input logic reset,
		input logic en,
		output logic tester,
		output logic [7:0] sir
	);

logic [7:0] reg8b_0_X_out0;
logic [7:0] reg8b_1_X_out0;
logic [7:0] compute_structural_0_X_out;
logic [7:0] compute_behav_0_X_out;
logic [10:0] counter_11b_0_X_out;
logic [10:0] subtract_0_X_out;


reg8b reg8b_0
	(
		.clk(clk),
		.reset(reset),
		.en(en),
		.in(compute_behav_0_X_out),
		.out(reg8b_0_X_out0)
	);

reg8b reg8b_1
	(
		.clk(clk),
		.reset(reset),
		.en(en),
		.in(reg8b_0_X_out0),
		.out(reg8b_1_X_out0)
	);

compute_structural compute_structural_0
	(
		.in0(reg8b_0_X_out0),
		.in1(reg8b_1_X_out0),
		.out(compute_structural_0_X_out)
	);

compute_behav compute_behav_0
	(
		.in0(reg8b_0_X_out0),
		.in1(reg8b_1_X_out0),
		.out(compute_behav_0_X_out)
	);

comp_eq comp_eq_0
	(
		.in0(compute_structural_0_X_out),
		.in1(compute_behav_0_X_out),
		.out(tester)
	);
	
counter_11b counter_11b_0
	(
		.clk(clk),
		.reset(reset),
		.en(en),
		.out(counter_11b_0_X_out)
    );
    
subtract subtract_0
	(
		.in0(counter_11b_0_X_out),
		.in1(1),
		.out(subtract_0_X_out)
	);    
    
ram ram_0
	(
		.clk(clk),
		.addr_r(subtract_0_X_out),
		.data_r(sir),
		.w_en(en),
		.addr_w(counter_11b_0_X_out),
		.data_w(compute_behav_0_X_out)
	);    
    
    
    
    
    

endmodule 







