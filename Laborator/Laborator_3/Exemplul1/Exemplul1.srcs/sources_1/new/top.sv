// observatie: 
// puteti da in vivado: rtl analysis -> open elaborated design 
// -> schematic pentru a vedea desenul rezultat

// puteti vedea ca moduri diferite de scriere 
// produc aparitia a diferite primitive de sinteza
module top
(
    input logic [1:0] in,   // Conectat la SW[1:0]
    output logic [3:0] out_v1, // Conectat la LEDs[3:0]
        // fiecare varianta de decodor cu iesirea lui
        // toate ar trebui sa scoata acelasi rezultat
    output logic [3:0] out_v2,  // Conectat la LEDs[7:4]
    output logic [3:0] out_v3,  // Conectat la LEDs[11:8]
    output logic [3:0] out_v4,  // Conectat la LEDs[15:12]
    output logic [3:0] out_v5,  // Conectat la 7Seg display left, seg D,C,B,A (3,2,1,0)
    output logic [3:0] out_v6   // Conectat la 7Seg display right, seg D,C,B,A (3,2,1,0)
);

decodor_v1 decodor_v1_0
(
.in(in),
.out(out_v1)
);

decodor_v2 decodor_v2_0
(
.in(in),
.out(out_v2)
);

decodor_v3 decodor_v3_0
(
.in(in),
.out(out_v3)
);

decodor_v4 decodor_v4_0
(
.in(in),
.out(out_v4)
);

decodor_v5 decodor_v5_0
(
.in(in),
.out(out_v5)
);

decodor_v6 decodor_v6_0
(
.in(in),
.out(out_v6)
);
	
endmodule