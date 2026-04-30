module register_8b
    (
        input logic clock,                              // CLK_100MHZ
        input logic reset, // activ pe "1"              // BUT[0}
        input logic we,                                 // BUT[1]
        input logic [7:0] data_in,                      // SW[7:0]
        output logic [7:0] data_out                     // LED[7:0]
        // data_out are aceeasi dimensiune ca data_in
    );

// clock sincronizeaza actiunile circuitului
// doar pe edge-ul (frontul) pozitiv circuitul actioneaza
always_ff@(posedge clock) 
begin    
    if(reset == 1)
        begin
        data_out <= 0;
        end
    else
        begin
        if(we == 1) // comanda de scriere
            begin
            data_out <= data_in;
            end
        else // puteam sa omit acest else
            begin
            data_out <= data_out; // raman datele salvate anterior
            end
        end
end

endmodule