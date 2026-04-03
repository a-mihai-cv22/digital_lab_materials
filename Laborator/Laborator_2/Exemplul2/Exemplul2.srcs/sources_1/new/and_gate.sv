module and_gate
    (
    input   logic   in0,	
    input   logic   in1,	
    output  logic   out0
    ); 

assign out0 = in0 & in1; // & este operatorul SystemVerilog pentru AND 

endmodule