module register_8b_v2
    (
        input logic clock,
        input logic reset_n, // activ in "0"
        // uzual semnalel cu n in fata sau la sfarsit 
        // sunt in logica negativa: nreset, resetn, reset_n
        input logic we,
        input logic [7:0] data_in,
        output logic [7:0] data_out
    );

logic [7:0] memorie_efectiva;   

assign data_out = memorie_efectiva;

always_ff@(posedge clock)
begin  
    if( reset_n == 0) 
        begin
        memorie_efectiva <= 0;
        end
    else
        begin
        if(we == 1)
            begin
            memorie_efectiva <= data_in;
            end
        end
end
    
endmodule