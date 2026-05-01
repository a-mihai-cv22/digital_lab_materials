
module ALU
    (
        input logic [15:0] instruction,
        input logic [7:0] data0,
        input logic [7:0] data1,
        output logic [7:0] result,
        output logic zero_flag,
        output logic overflow_flag
    );

logic [8:0] result_intermediar;

assign result = result_intermediar[7:0];
assign overflow_flag = result_intermediar[8];
assign zero_flag = (result == 0);

always_comb
    begin
    case(instruction[13:10])
        4'b0000:
            begin
            result_intermediar <= (data0 << data1);
            end
        4'b0001:
            begin
            result_intermediar <= (data0 >> data1);
            end
        4'b0010:
            begin
            result_intermediar <= (data0 + data1);
            end
        4'b0011:
            begin
            result_intermediar <= (data0 - data1);
            end    
        4'b0100:
            begin
            result_intermediar <= (data0 & data1);
            end
        4'b0101:
            begin
            result_intermediar <= (data0 | data1);
            end
        4'b0110:
            begin
            result_intermediar <= (data0 ^ data1);
            end
        4'b0111:
            begin
            result_intermediar <= 1;
            end
        4'b100:
            begin
            result_intermediar <= 0;
            end
        4'b1100:
            begin
            result_intermediar <= data0;
            end
        4'b1100:
            begin
            result_intermediar <= data1;
            end
        default:    
            begin
            result_intermediar <= 0;
            end
    endcase
    end




endmodule
