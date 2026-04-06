
module reg_4b
    (
        input logic clock,
        input logic reset,
        input logic [3:0] in,
        output logic [3:0] out
    );
    
always_ff @(posedge clock)
begin
    if(reset == 1)
        begin
        out <= 0;
        end
    else   
        begin
        out <= in;
        end
end    
    
    

