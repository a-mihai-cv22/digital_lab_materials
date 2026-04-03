`timescale 1ns/1ps  // unitatea de timp este de 1ns 
                    // cu precizie de 1ps

module waveform1(); // modulul se numeste waveform1 
                    // nu are nicio intrare si nicio iesire 
                    // (parantezele sunt goale)

logic a;
logic b;         // declaram intern semnalele ce trebuie generate   

initial 
begin
    $monitor("time = %2d, a = %b, b=%b", $time, a, b); // starea   
                    // semnalelor este monitorizata in consola
       a = 0;       // la momentul t = 0 (momentul initial)
       b = 0;       // semnalele a si b vor avea valoarea 0
    #1 a = 1;       // la 1ns de la momentul initial, a devine 1
    #1 b = 1;       // la 2ns de la momentul initial, b devine 1
    #1 a = 0;       // la 3ns de la momentul initial, a devine 0
       b = 0;       // la 3ns de la momentul initial, b devine 0
    #2 $stop();     // simularea este oprita la 5ns de la pornirea ei
end

endmodule           // incheiem descrierea modulului 
