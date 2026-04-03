`timescale 1ns/1ps     // unitatea de timp este de 1ns 
                       // cu precizie de 1ps

module waveform2();    // modulul se numeste waveform2 
                       // nu are nicio intrare si nicio iesire. 

logic clock;           // declaram intern semnalul ce trebuie generat

initial 
begin
    clock = 0;                 // clock este 0 la momentul t = 0
    forever                    // forever indica faptul ca 
        #1 clock = ~clock;     // ce urmeaza se va repeta pana la 
                               // terminarea simularii. 
                               // La trecea unui timp egal cu 
                               // unitatea de timp definita, 
                               // clock isi va nega valoarea
end

initial 
begin
    #20 $stop();       // La 20 de unitati de timp (aici, 20 ns), 
                       // simularea se va opri. 
                       // $stop este pus intr-un bloc separat 
                       // deoarece forever blocheaza blocul 
                       // initial in care se afla.
                       // Toate blocurile initial incep la
                       // momentul t = 0 si au efect in paralel
end

endmodule