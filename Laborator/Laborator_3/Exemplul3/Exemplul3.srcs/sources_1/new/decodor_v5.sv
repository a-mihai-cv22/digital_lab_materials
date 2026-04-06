module decodor_v5
    (
        input logic [1:0] in,
        output logic [3:0] out 
    );
    
always_comb
begin
    case(in) // functioneaza ca switch/case din c/c++;
    0: // if in == 0
    begin
        out = 1;
    end
    2'd1: // if in == 1;	
    begin
        out = 2;
    end
    2'b10: // if in == 2; 
    begin
        out = 4;
    end
    2'h3: // if in == 3;
    begin
        out = 8;
    end
    default: // daca in == un caz netrat; 
    begin // aici inutil pt ca am tratat toate cazurile posibile; 
          // pus ca exemplu de sintaxa 
        out = 0;
    end
    endcase // orice "case" se inchide cu "endcase"
end 
    
endmodule