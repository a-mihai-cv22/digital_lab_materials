module not_gate	    // cuvantul cheie "module" este urmat 
                    // de numele modulului
    (               // intre paranteze se pun semnalele de pe interfata
                    // ordinea acestora nu conteaza
                    // uzual, se grupeaza dupa functionalitati
        input   logic   in0,    // in0 este o intrare (input) pe 1 bit
        output  logic   out0    // out0 este o iesire (output) pe 1 bit
    ); 

assign out0 = ~in0; // ~ este operatorul SystemVerilog pentru negatie 

endmodule           // orice modul se inchide cu endmodule.