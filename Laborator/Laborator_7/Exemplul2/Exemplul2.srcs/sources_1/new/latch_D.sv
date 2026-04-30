module latch_D(
    input logic D,  //  SW[0]
    input logic E,  //  BUT[0]
    output logic Q  //  LED[0]
);

assign Q = (E == 1) ? D : Q;

endmodule