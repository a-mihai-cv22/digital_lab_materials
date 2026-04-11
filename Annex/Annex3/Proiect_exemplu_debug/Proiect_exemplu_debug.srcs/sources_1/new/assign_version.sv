
module assign_version
    (
        input logic [3:0] in0,
        input logic [3:0] in1,
        input logic [3:0] in2,
        input logic [3:0] in3,
        output logic [3:0] out0
    );
    
assign out0 = (in0 * in1) + (in2 * in3);    
    
endmodule
