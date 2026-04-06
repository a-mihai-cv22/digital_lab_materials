module Decoder(
    input logic [1:0] in, // Conectat la SW[1:0]
    output logic [3:0] out // Conectat la LEDs [3:0]
);

always_comb begin
    case(in)
        2'b00: out = 4'b0001; //la adresa 0 avem valoarea 1
        2'b01: out = 4'b0010; //la adresa 1 avem valoarea 2
        2'b10: out = 4'b0100; //la adresa 2 avem valoarea 4
        2'b11: out = 4'b1000; //la adresa 3 avem valoarea 8
        default: out = 4'b0000;
    endcase
end

endmodule