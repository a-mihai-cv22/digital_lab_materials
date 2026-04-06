module decodor_v3
    (
        input logic [1:0] in,
        output logic [3:0] out 
    );

// operatorul "?": identic c/c++; 
// (conditie) ? (if_true) : (if_flase);

assign out = (in==0) ? // if in == 0 
                1 : // if true: out = 1 
                (in==1) ? // else, verifica alt if
                    2 : // if in !=0 si in == 1
                    (in==2) ?
                        4 :
                        8; // last case in==3
// in loc de 1,2,4,8 se putea scrie si in binar:
// 4'b0001, 4'b0010, 4'b0100, 4'b1000, 
endmodule