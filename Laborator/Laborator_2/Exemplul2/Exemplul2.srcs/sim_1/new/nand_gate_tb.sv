`timescale 1ns/1ps      // unitatea de timp este de 1ns 
                        // cu precizie de 1ps

module nang_gate_tb();  // modulul de test se numeste "nang_gate_tb" 
                        // nu are nicio intrare si nicio iesire. 
                        // totul se intampla intern.

// 1. Se declara semnalele de test, pentru fiecare intrare si iesire
// a modulului testat
logic in0_tb;	
logic in1_tb;	
logic out0_tb;	

// 2. Se instantiaza modulul testat si se conecteaza semnalele de pe 
// interfata sa la semnalele de test
nand_gate DUT           // instantierea modulului "nang_gate" 
                        // sub numele "DUT" 
    (
        .in0(in0_tb),      // conectarea semnalelor de pe interfata
        .in1(in1_tb),      // modulului testat la semnalele de test
        .out0(out0_tb)
    );

// 3. Se genereaza formele de unda pentru semnalele ce intra in modulul testat (stimuli)
initial
begin 
    in0_tb = 0;     // in0_tb ia valoarea 0 la momentul 0 al simularii
    in1_tb = 0;     // si in1_tb ia valoarea 0
    #10;            // dupa 10 unitati de timp (aici, 10ns)
    in0_tb = 1;     // in0_tb ia valoarea 1
    in1_tb = 0;     // si in1_tb ia valoarea 0
    #10;            // dupa inca 10 unitati de timp
    in0_tb = 0;     // in0_tb ia valoarea 0
    in1_tb = 1;     // si in1_tb ia valoarea 1
    #10;            // dupa inca 10 unitati de timp
    in0_tb = 1;     // in0_tb ia valoarea 1
    in1_tb = 1;     // si in1_tb ia valoarea 1
    #10;            // dupa inca 10 unitati de timp
    in0_tb = 0;     // in0_tb ia valoarea 0
    in1_tb = 0;     // si in1_tb ia valoarea 0
    #20 $stop();	// dupa inca 20 unitati de timp
                    // oprim simularea
end 

endmodule










