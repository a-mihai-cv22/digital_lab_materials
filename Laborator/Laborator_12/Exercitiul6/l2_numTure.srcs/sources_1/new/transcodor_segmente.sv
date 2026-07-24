module transcodor_segmente
    (
        input logic [3:0] addr,
        output logic [7:0] data
    );

always_comb
    begin
    case(addr)
        0:
            begin
            data <= 8'b1111_1110;
            end
        1:
            begin
            data <= 8'b1111_1110;
            end
        2:
            begin
            data <= 8'b1111_1110;
            end
        3:
            begin
            data <= 8'b1111_1110;
            end
        4:
            begin
            data <= 8'b1111_1101;
            end
        5:
            begin
            data <= 8'b1111_1011;
            end
        6:
            begin
            data <= 8'b1111_0111;
            end
        7:
            begin
            data <= 8'b1111_0111;
            end
        8:
            begin
            data <= 8'b1111_0111;
            end
        9:
            begin
            data <= 8'b1111_0111;
            end
        10:
            begin
            data <= 8'b1110_1111;
            end
        11:
            begin
            data <= 8'b1101_1111;
            end
        default:
            begin
            data <= 8'b1111_1111;
            end
    endcase
    end


endmodule 