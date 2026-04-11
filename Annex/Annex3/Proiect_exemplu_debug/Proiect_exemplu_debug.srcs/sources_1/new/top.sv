
module top
    (
        input logic [3:0] in0,
        input logic [3:0] in1,
        input logic [3:0] in2,
        input logic [3:0] in3,
        output logic out
    );
    
logic [3:0] instantiation_out;
logic [3:0] assign_out; 
  
instantiation_version instantiation_version_0
    (
        .in0(in0),
        .in1(in1),
        .in2(in2),
        .in3(in3),
        .out0(instantiation_out)
    );
    
assign_version assign_version_0
    (
        .in0(in0),
        .in1(in1),
        .in2(in2),
        .in3(in3),
        .out0(assign_out)
    );    

comparator_equal comparator_equal_0
    (
        .in0(instantiation_out),
        .in1(assign_out),
        .out0(out)
    );

endmodule
