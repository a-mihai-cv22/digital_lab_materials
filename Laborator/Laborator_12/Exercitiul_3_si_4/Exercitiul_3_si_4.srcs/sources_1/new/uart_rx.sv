module uart_rx
	(	
		input logic clk,
		input logic rst,
		input logic en,
		input logic rx,
		output logic valid,
		output logic [7:0] data_out
	);



// clock 100MHZ => 10ns; 9600baud => 104166.667 ns; counter limit => 104166.667/10=> 10416
localparam baudrate_limit = 10416;
localparam baudrate_half_limit = baudrate_limit/2;
localparam nr_bits = (1+8+1+1);

logic [14:0] counter_baud_rate;
logic [3:0] counter_current_bit;

logic [7:0] current_data_out;
logic sampled_value;
logic rx_working;



always_ff@(posedge clk)
	begin
	if(rst == 1)
		begin
		counter_baud_rate <= 0;
		counter_current_bit <= 0; 
		current_data_out <= 0;
		data_out <= 0;
		valid <= 0;
		rx_working <= 0;
		end
	else
		begin
		if(en == 1)
			begin
			if(rx_working == 1)
				begin
				if(counter_baud_rate == baudrate_limit)
					begin
					counter_baud_rate <= 0;
					case(counter_current_bit)
						0: // start bit done
							begin
							if( sampled_value == 0) // check proper transmission and not a 0 spike
								begin
								counter_current_bit <= counter_current_bit + 1; 
								end
							else
								begin
								counter_current_bit <= 0; 
								end
							end
						9: // parity bit done
							begin
							counter_current_bit <= counter_current_bit + 1; 
							end
						10:	// stop bit done
							begin
							counter_current_bit <= 0; 
							data_out <= current_data_out;
							current_data_out <= 0;
							valid <= 1; 
							rx_working <= 0;
							end
						default: // data_bits
							begin
							counter_current_bit <= counter_current_bit + 1;
							current_data_out[8-counter_current_bit] <= sampled_value; // 8- because of data format lsb first
							end
					endcase
					end
				else
					begin
					if(counter_baud_rate == baudrate_half_limit)
						begin
						sampled_value <= rx;
						end
					counter_baud_rate <= counter_baud_rate +1;
					end
				end
			else
				begin
				valid <= 0;
				if( rx == 0)
					begin
					rx_working <= 1;
					end
				else
					begin
					rx_working <= 0;
					end
				end
			end
		else // if enable stops, transmission resets
			begin
			counter_baud_rate <= 0;
			counter_current_bit <= 0; 
			current_data_out <= 0;
			data_out <= 0;
			valid <= 0;
			rx_working <= 0;
			end
		end
	end






endmodule 




