// observatie: 
// puteti da in vivado: rtl analysis -> open elaborated design 
// -> schematic pentru a vedea desenul rezultat

// puteti vedea ca moduri diferite de scriere 
// produc aparitia a diferite primitive de sinteza
module top
(
    input logic [1:0] in,
    output logic [3:0] out_v1, 
        // fiecare varianta de decodor cu iesirea lui
        // toate ar trebui sa scoata acelasi rezultat
    output logic [3:0] out_v2,  
    output logic [3:0] out_v3,
    output logic [3:0] out_v4,
    output logic [3:0] out_v5,
    output logic [3:0] out_v6
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