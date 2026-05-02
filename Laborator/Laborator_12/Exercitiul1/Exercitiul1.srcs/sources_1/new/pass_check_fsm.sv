module pass_check_fsm // name = mihai => password = mihai
	(
		input logic clk,
		input logic rst,
		input logic [7:0] data_in,
		input logic en,
		output logic  pass_checked
	);

localparam state_idle = 0;	
localparam state_ok_1_litera = 1;
localparam state_ok_2_litera = 2;
localparam state_ok_3_litera = 3;
localparam state_ok_4_litera = 4;

logic [2:0] state; 
	
always@(posedge clk)
begin
	if(rst == 1) 
		begin
		state <= state_idle;
		end
	else
		begin
		if(en == 1)
			begin
			case(state)
				state_idle:
					begin
					if(data_in == "m")
						begin
						state <= state_ok_1_litera;
						pass_checked <= 0;
						end
					else
						begin
						state <= state_idle;
						pass_checked <= 0;
						end
					end 
				state_ok_1_litera:
					begin
					if(data_in == "i")
						begin
						state <= state_ok_2_litera;
						pass_checked <= 0;
						end
					else
						begin
						state <= state_idle;
						pass_checked <= 0;
						end
					end 
				state_ok_2_litera:
					begin
					if(data_in == "h")
						begin
						state <= state_ok_3_litera;
						pass_checked <= 0;
						end
					else
						begin
						state <= state_idle;
						pass_checked <= 0;
						end
					end 
				state_ok_3_litera:
					begin
					if(data_in == "a")
						begin
						state <= state_ok_4_litera;
						pass_checked <= 0;
						end
					else
						begin
						state <= state_idle;
						pass_checked <= 0;
						end
					end 
				state_ok_4_litera:
					begin
					if(data_in == "i")
						begin
						state <= state_idle;
						pass_checked <= 1;
						end
					else
						begin
						state <= state_idle;
						pass_checked <= 0;
						end
					end
				default:
					begin
					state <= state_idle;
					pass_checked <= 0;
					end 
			endcase  
			end
		else//if not enable 
			begin
			pass_checked <= 0;
			end 
		end
end



endmodule 








