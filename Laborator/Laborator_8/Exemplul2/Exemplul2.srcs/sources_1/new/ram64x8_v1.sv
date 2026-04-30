module ram64x8_v1
    (
        input logic clock,
        //interfata de citire
            input logic [5:0] addr_read, 
                // 64 locatii => 6 biti de adresa 
            output logic [7:0] data_read, 
                // fiecare locatie are 8b  
        // interfata de scriere
            input logic we,
            input logic [5:0] addr_write,
            input logic [7:0] data_write
    );

logic [7:0] memorie_efectiva [0:63]; 
// memorie cu locatiile de la 0 la 63, fiecare avand 8 biti    

assign data_read = memorie_efectiva[addr_read]; 
// fara registru pe iesire => citire asincrona fata de clock 

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