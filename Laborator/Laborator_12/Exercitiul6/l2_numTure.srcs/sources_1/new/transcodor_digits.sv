module transcodor_digits
    (
        input logic [3:0] addr,
        output logic [3:0] data
    );

always_comb
    begin
    case(addr)
        0:
            begin
            data = 4'b0111;
            end
        1:
            begin
            data = 4'b1011;
            end
        2:
            begin
            data = 4'b1101;
            end
        3:
            begin
            data = 4'b1110;
            end
        4:
            begin
            data = 4'b1110;
            end
        5:
            begin
            data = 4'b1110;
            end
        6:
            begin
            data = 4'b1110;
            end
        7:
            begin
            data = 4'b1101;
            end
        8:
            begin
            data = 4'b1011;
            end
        9:
            begin
            data = 4'b0111;
            end
        10:
            begin
            data = 4'b0111;
            end
        11:
            begin
            data = 4'b0111;
            end
        default:
            begin
            data = 4'b1111;
            end
    endcase
    end


endmodule 