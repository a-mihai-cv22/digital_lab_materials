module toggle_ff
	(
		input logic clk,
		input logic rst,
		input logic toggle,
		output logic out
    );
    
always_ff@(posedge clk)
	begin
	if(rst == 1)
		begin
		out <= 0;
		end
	else
		begin
		if(toggle == 1)
			begin
			out <= ~out;
			end
		else	
			begin
			out <= out;
			end
		end
	end    
    
endmodule
