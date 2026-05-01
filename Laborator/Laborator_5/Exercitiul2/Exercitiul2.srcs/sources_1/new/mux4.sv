module mux4
    (
        input logic [7:0] in0,
        input logic [7:0] in1,
        input logic [7:0] in2,
        input logic [7:0] in3,
        input logic [1:0] sel,
        output logic [7:0] out0
    );

always_comb
    begin
    case(sel)
        0:
            begin
            out0 <= in0;
            end
        1:
            begin
            out0 <= in1;
            end
        2:
            begin
            out0 <= in2;
            end
        3:
            begin
            out0 <= in3;
            end
        default:
            begin
            out0 <= in0;
            end  
        endcase 
    end



endmodule







