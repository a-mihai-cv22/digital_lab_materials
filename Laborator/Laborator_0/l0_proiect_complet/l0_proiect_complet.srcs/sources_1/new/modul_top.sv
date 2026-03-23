module modul_top
    (
        input logic w,
        input logic x,
        input logic y,
        input logic z,
        output logic out
    );
    
logic fir0;
logic fir1;    
    
modul_tip_A primul
    (
        .in0(w),
        .in1(x),
        .out0(fir0)
    );   
    
 modul_tip_A al_doilea
    (
        .in0(y),
        .in1(z),
        .out0(fir1)
    );     
 
 modul_tip_B modul_final
    (
        .in0(fir0),
        .in1(fir1),
        .out0(out)
    );
    
endmodule
