module ram_instr
	(
		input logic clk,
		input logic [3:0] r_addr,
		output logic [3:0] r_data,
		input logic we,
		input logic [3:0] w_addr,
		input logic [3:0] w_data
    );

logic [3:0] mem [0:15];

assign r_data = mem[r_addr];

always_ff@(posedge clk)
	begin
	if(we == 1)
		begin
		mem[w_addr] <= w_data;
		end
	end


endmodule
