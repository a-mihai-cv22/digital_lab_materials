module nand_gate
    (
        input   logic   in0,    // Conectat la SW[0]
        input   logic   in1,    // Conectat la SW[1]
        output  logic   out0    // Conectat la LED[]0]
    );
    
logic w0;   //se declara un fir intern de legatura pe 1 bit 
    
and_gate and_gate_A // instantiere: nume_modul nume_instanta 
    (
        .in0(in0),  // la intrarea "in0" a instantei "and_gate_A" 
                    // se conecteaza semnalul "in0" de pe interfata 
                    // modulului "nand_gate"
        .in1(in1),  // la intrarea "in1" a instantei "and_gate_A" 
                    // se conecteaza semnalul "in1" de pe interfata 
                    // modulului "nand_gate"
        .out0(w0)   // la iesirea "out0" a instantei "and_gate_A" 
                    // se conecteaza firul "w0" ce va face 
                    // legatura cu instanta "not_gate_A"
    );    
    
not_gate not_gate_A
    (
        .in0(w0),   // la intrarea "in0" a instantei "not_gate_A" 
                    // se conecteaza firul "w0" ce va face 
                    // legatura cu iesirea ionstantei "nand_gate_A"
        .out0(out0) // la iesirea "out0" a instantei "not_gate_A" 
                    // se conecteaza semnalul "out0" de pe interfata 
                    // modulului "nand_gate"
    );   

// Observatii:
// 1. Folosind modul de instantiere de mai sus, nu conteaza ordinea 
// in care facem legaturile cu semnalele de pe interfata. 
// Conteaza doar ca semnalul de pe interfata instantei sa fie 
// conectat la firul corespunzator.
// 2. Orice semnal care se afla in paranteza trebuie declarat in
// modulul in care s eface instantierea (aici, "nand_gate"), fie
// ca semnal de interfata, fie ca semnal intern.
 
endmodule














