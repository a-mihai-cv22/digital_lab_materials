module reg0
	(
		input logic clk,
		input logic rst,
		input logic en,
		input logic [10:0] data_in,
		output logic [10:0] data_out
    );
    
always_ff@(posedge clk)
	begin
	if(rst == 1)
		begin
		data_out <= 0;
		end
	else
		begin
		if(en == 1)
			begin
			data_out <= data_in;
			end
		else	
			begin
			data_out <= data_out;
			end
		end
	end    
    
endmodule
