module flipflop_D(
    input logic data_in,    // SW[0]
    input logic clock,      // BUT[0]
    output logic data_out   // LED[0]
);

always_ff@(posedge clock) begin
    data_out <= data_in; // atribuire non-blocanta
end

endmodule