module decodor_v1
    (
	input logic [1:0] in,	// definirea intrarilor 
                                // sub forma de "bus" 
            // bus-ul de intrare se numeste "in" si este 
            // pe 2 biti: in[1], in[0].
            // fizic sunt 2 fire distincte,
            // grupate pentru o mai simpla folosire.
	output logic [3:0] out 	// avem o iesire, numita "out" 
                                // pe 4 biti.
    );
	
logic in_0_inv;
logic in_1_inv;
logic in_0_nat;
logic in_1_nat;

not not_gate_0(in_0_inv,in[0]); 
// aleg bitul 0 al lui in sa intre in aceasta poarta not;

not not_gate_1(in_1_inv,in[1]); 
// observatie: cele 2 fire si cele 2 porti putea fi comprimate 
// intr-un bus + poarta not pe 2 biti.

not not_gate_2(in_0_nat,in_0_inv);
not not_gate_3(in_1_nat,in_1_inv);
and and_gate_0(out[0],in_1_inv,in_0_inv);
and and_gate_1(out[1],in_1_inv,in_0_nat);
and and_gate_2(out[2],in_1_nat,in_0_inv);
and and_gate_3(out[3],in_1_nat,in_0_nat);

endmodule