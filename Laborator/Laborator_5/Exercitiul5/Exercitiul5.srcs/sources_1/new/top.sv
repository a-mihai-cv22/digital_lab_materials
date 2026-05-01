module top
	(
		input logic [7:0] in_litera,
		input logic [3:0] offset,
		output logic [7:0] out_litera
		
    );
    
logic [7:0] preprocesare_0_X_out;    
logic [7:0] sum_8b_0_out0;   
logic [7:0] sub_8b_0_X_out0;
logic comp_greater_0_X_out0;
logic [7:0] mux2_8b_0_X_out0;

    
preprocesare preprocesare_0
	(
		.in_litera(in_litera),
		.out(preprocesare_0_X_out)
	);  
 
 sum_8b sum_8b_0
	(
		.in0(preprocesare_0_X_out),
		.in1({4'b0000,offset}),
		.out0(sum_8b_0_out0)
	);
	
sub_8b sub_8b_0
	(
		.in0(sum_8b_0_out0),
		.in1(26),
		.out0(sub_8b_0_X_out0)
	);	
	
comp_greater comp_greater_0
	(
		.in0(sum_8b_0_out0),
		.in1(26),
		.out0(comp_greater_0_X_out0)
	);
	
mux2_8b mux2_8b_0
	(
		.in0(sum_8b_0_out0),
		.in1(sub_8b_0_X_out0),
		.sel(comp_greater_0_X_out0),
		.out0(mux2_8b_0_X_out0)
	);
	
sum_8b sum_8b_1
	(
		.in0(mux2_8b_0_X_out0),
		.in1(97),
		.out0(out_litera)
	);	   
    
endmodule
