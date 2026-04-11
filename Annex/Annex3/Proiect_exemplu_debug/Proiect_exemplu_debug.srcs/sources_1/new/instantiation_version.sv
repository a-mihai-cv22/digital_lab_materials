module instantiation_version
    (
        input logic [3:0] in0,
        input logic [3:0] in1,
        input logic [3:0] in2,
        input logic [3:0] in3,
        output logic [3:0] out0
    );

logic [3:0] multiplicator_0_X_out0;
logic [3:0] multiplicator_0_X_out1;

multiplicator multiplicator_0
    (
        .in0(in0),
        .in1(in1),
        .out0(multiplicator_0_X_out0)
    );
 
multiplicator multiplicator_1
    (
        .in0(in2),
        .in1(in3),
        .out0(multiplicator_0_X_out1)
    );

adder adder_0
    (
        .in0(multiplicator_0_X_out0),
        .in1(multiplicator_0_X_out1),
        .out0(out0)
    );
    
endmodule 


    