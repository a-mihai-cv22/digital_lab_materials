`timescale 1ns/1ps    //timescale este necesar deoarece se foloseste #1
module Circuit(
    input   logic   a,
    input   logic   b,
    output  logic   c,
    output  logic   d
);

assign #1 c = ~(a | b);
assign #1 d = ~(c & b);

endmodule