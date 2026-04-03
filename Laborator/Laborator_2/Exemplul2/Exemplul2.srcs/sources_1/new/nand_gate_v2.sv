module nand_gate_v2
    (
        input   logic   in0,
        input   logic   in1,
        output  logic   out0
    );
  
logic w0;   // se declara un fir intern de legatura pe 1 bit 

and and_gate_A(w0, in0, in1);   // primitiva pentru poarta AND
not not_gate_A(out0, w0);       // primitiva pentru poarta NOT
   
endmodule