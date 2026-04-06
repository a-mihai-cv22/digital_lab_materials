

module top
    (
        input logic clock,
        input logic reset,
		input logic [1:0] in,
		output logic [3:0] out_v1,
		output logic [3:0] out_v2,
		output logic [3:0] out_v3,
		output logic [3:0] out_v4,
		output logic [3:0] out_v5,
		output logic [3:0] out_v6
	);
	
	
logic [3:0] decodor_v1_0_X_out;
logic [3:0] decodor_v2_0_X_out;
logic [3:0] decodor_v3_0_X_out;
logic [3:0] decodor_v4_0_X_out;
logic [3:0] decodor_v5_0_X_out;
logic [3:0] decodor_v6_0_X_out;

	
	
decodor_v1 decodor_v1_0
	(
		.in(in),
		.out(decodor_v1_0_X_out)
	);

decodor_v2 decodor_v2_0
	(
		.in(in),
		.out(decodor_v2_0_X_out)
	);
	
decodor_v3 decodor_v3_0
	(
		.in(in),
		.out(decodor_v3_0_X_out)
	);
	
decodor_v4 decodor_v4_0
	(
		.in(in),
		.out(decodor_v4_0_X_out)
	);
	
decodor_v5 decodor_v5_0
	(
		.in(in),
		.out(decodor_v5_0_X_out)
	);

decodor_v6 decodor_v6_0
	(
		.in(in),
		.out(decodor_v6_0_X_out)
	);



reg_4b reg_4b_1
    (
        .clock(clock),
        .reset(reset),
        .in(decodor_v1_0_X_out),
        .out(out_v1)
    );

reg_4b reg_4b_2
    (
        .clock(clock),
        .reset(reset),
        .in(decodor_v2_0_X_out),
        .out(out_v2)
    );

reg_4b reg_4b_3
    (
        .clock(clock),
        .reset(reset),
        .in(decodor_v3_0_X_out),
        .out(out_v3)
    );

reg_4b reg_4b_4
    (
        .clock(clock),
        .reset(reset),
        .in(decodor_v4_0_X_out),
        .out(out_v4)
    );
    
reg_4b reg_4b_5
    (
        .clock(clock),
        .reset(reset),
        .in(decodor_v5_0_X_out),
        .out(out_v5)
    );
    
reg_4b reg_4b_6
    (
        .clock(clock),
        .reset(reset),
        .in(decodor_v6_0_X_out),
        .out()
    );        
	
	
	
endmodule 











