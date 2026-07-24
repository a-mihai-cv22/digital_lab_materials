module counter
    #( 
        parameter nr_bits = 8
    )
    (
        input logic clock,
        input logic reset,
        input logic en,
        output logic [nr_bits -1: 0] out
    );

always_ff@(posedge clock)
    begin
    if(reset == 1)
        begin
        out <= 0;
        end
    else
        begin
        if(en == 1)
            begin
            out <= out +1; 
            end
        else
            begin
            out <= out;
            end
        end
    end







endmodule 