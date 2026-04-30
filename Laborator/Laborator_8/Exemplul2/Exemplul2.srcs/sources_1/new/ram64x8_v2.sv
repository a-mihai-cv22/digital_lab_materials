module ram64x8_v2 // varianta cu always combinational pentru citire
    (
        input logic clock,
        //interfata de citire
            input logic [5:0] addr_read,
            output logic [7:0] data_read,
        // interfata de scriere
            input logic we,
            input logic [5:0] addr_write,
            input logic [7:0] data_write
    );

logic [7:0] memorie_efectiva [0:63];  

always_comb //  citire asincrona fata de clock 
begin
    data_read = memorie_efectiva[addr_read]; 
end

always_ff@(posedge clock)
begin    
    if(we == 1)
    begin
    memorie_efectiva[addr_write] <= data_write; 
    // scriu la locatia data de "addr_write" din 
    // memoria efectiva datele "data_write"
    end 
end    

endmodule