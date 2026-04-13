module meta_tb();



// tb signals 
logic [1:0] dut_tb_in;
logic dut_tb_en;
logic dut_tb_output_sel;
logic [3:0] dut_tb_out;

logic [1:0] golden_vector_dut_tb_in [0:19];
logic golden_vector_dut_tb_output_sel [0:19];
logic golden_vector_dut_tb_en [0:19];

initial
	begin
	golden_vector_dut_tb_in[0] = 0;
	golden_vector_dut_tb_in[1] = 0;
	golden_vector_dut_tb_in[2] = 2;
	golden_vector_dut_tb_in[3] = 1;
	golden_vector_dut_tb_in[4] = 3;
	golden_vector_dut_tb_in[5] = 3;
	golden_vector_dut_tb_in[6] = 3;
	golden_vector_dut_tb_in[7] = 3;
	golden_vector_dut_tb_in[8] = 1;
	golden_vector_dut_tb_in[9] = 2;
	golden_vector_dut_tb_in[10] = 0;
	golden_vector_dut_tb_in[11] = 0;
	golden_vector_dut_tb_in[12] = 0;
	golden_vector_dut_tb_in[13] = 0;
	golden_vector_dut_tb_in[14] = 0;
	golden_vector_dut_tb_in[15] = 0;
	golden_vector_dut_tb_in[16] = 0;
	golden_vector_dut_tb_in[17] = 0;
	golden_vector_dut_tb_in[18] = 0;
	golden_vector_dut_tb_in[19] = 0;
	
	golden_vector_dut_tb_output_sel[0] = 0;
	golden_vector_dut_tb_output_sel[1] = 0;
	golden_vector_dut_tb_output_sel[2] = 0;
	golden_vector_dut_tb_output_sel[3] = 0;
	golden_vector_dut_tb_output_sel[4] = 0;
	golden_vector_dut_tb_output_sel[5] = 0;
	golden_vector_dut_tb_output_sel[6] = 1;
	golden_vector_dut_tb_output_sel[7] = 1;
	golden_vector_dut_tb_output_sel[8] = 1;
	golden_vector_dut_tb_output_sel[9] = 1;
	golden_vector_dut_tb_output_sel[10] = 1;
	golden_vector_dut_tb_output_sel[11] = 1;
	golden_vector_dut_tb_output_sel[12] = 1;
	golden_vector_dut_tb_output_sel[13] = 1;
	golden_vector_dut_tb_output_sel[14] = 1;
	golden_vector_dut_tb_output_sel[15] = 1;
	golden_vector_dut_tb_output_sel[16] = 1;
	golden_vector_dut_tb_output_sel[17] = 1;
	golden_vector_dut_tb_output_sel[18] = 1;
	golden_vector_dut_tb_output_sel[19] = 1;
	
	golden_vector_dut_tb_en[0] = 0;
	golden_vector_dut_tb_en[1] = 1;
	golden_vector_dut_tb_en[2] = 0;
	golden_vector_dut_tb_en[3] = 1;
	golden_vector_dut_tb_en[4] = 0;
	golden_vector_dut_tb_en[5] = 1;
	golden_vector_dut_tb_en[6] = 0;
	golden_vector_dut_tb_en[7] = 1;
	golden_vector_dut_tb_en[8] = 0;
	golden_vector_dut_tb_en[9] = 1;
	golden_vector_dut_tb_en[10] = 0;
	golden_vector_dut_tb_en[11] = 1;
	golden_vector_dut_tb_en[12] = 0;
	golden_vector_dut_tb_en[13] = 1;
	golden_vector_dut_tb_en[14] = 0;
	golden_vector_dut_tb_en[15] = 1;
	golden_vector_dut_tb_en[16] = 0;
	golden_vector_dut_tb_en[17] = 1;
	golden_vector_dut_tb_en[18] = 0;
	golden_vector_dut_tb_en[19] = 1;
	end

tb dut_tb();

assign dut_tb_in = dut_tb.in;
assign dut_tb_en = dut_tb.en;
assign dut_tb_output_sel = dut_tb.output_sel;
assign dut_tb_out = dut_tb.out;



logic [1:0] dut_decoder_in0;
logic [3:0] dut_decoder_out0;

decoder dut_decoder
	(
		.in0(dut_decoder_in0),
		.out0(dut_decoder_out0)
	);
	
	
	
logic dut_demux_in;
logic [1:0] dut_demux_sel;
logic [3:0] dut_demux_out0;
	
demux dut_demux
	(
		.in(dut_demux_in),
		.sel(dut_demux_sel),
		.out0(dut_demux_out0)
	);	
	
	
	
logic [2:0] dut_rom_addr;
logic [3:0] dut_rom_data;	
	
rom dut_rom
	(
		.addr(dut_rom_addr),
		.data(dut_rom_data)
	);



logic [3:0] dut_mux8_4b_in0;
logic [3:0] dut_mux8_4b_in1;
logic [3:0] dut_mux8_4b_in2;
logic [3:0] dut_mux8_4b_in3;
logic [3:0] dut_mux8_4b_in4;
logic [3:0] dut_mux8_4b_in5;
logic [3:0] dut_mux8_4b_in6;
logic [3:0] dut_mux8_4b_in7;
logic [2:0] dut_mux8_4b_sel;
logic [3:0] dut_mux8_4b_out0;

mux8_4b dut_mux8_4b
	(
		.in0(dut_mux8_4b_in0),
		.in1(dut_mux8_4b_in1),
		.in2(dut_mux8_4b_in2),
		.in3(dut_mux8_4b_in3),
		.in4(dut_mux8_4b_in4),
		.in5(dut_mux8_4b_in5),
		.in6(dut_mux8_4b_in6),
		.in7(dut_mux8_4b_in7),
		.sel(dut_mux8_4b_sel),
		.out0(dut_mux8_4b_out0)
	);
	
	

logic [3:0] dut_poarta_and_in0;
logic [3:0] dut_poarta_and_in1;
logic [3:0] dut_poarta_and_out0;	

poarta_and dut_poarta_and
	(
		.in0(dut_poarta_and_in0),
		.in1(dut_poarta_and_in1),
		.out0(dut_poarta_and_out0)
	);
	
	
	
logic [3:0] dut_comparator_eq_4b_in0;
logic [3:0] dut_comparator_eq_4b_in1;
logic dut_comparator_eq_4b_out0;

comparator_eq_4b dut_comparator_eq_4b
	(
		.in0(dut_comparator_eq_4b_in0),
		.in1(dut_comparator_eq_4b_in1),
		.out0(dut_comparator_eq_4b_out0)
	);	
	


logic dut_comparator_eq_1b_in0;
logic dut_comparator_eq_1b_in1;
logic dut_comparator_eq_1b_out0;
		
comparator_eq_1b dut_comparator_eq_1b
	(
		.in0(dut_comparator_eq_1b_in0),
		.in1(dut_comparator_eq_1b_in1),
		.out0(dut_comparator_eq_1b_out0)
	);	
	
	
	
logic [3:0] dut_mux2_4b_in0;
logic [3:0] dut_mux2_4b_in1;
logic dut_mux2_4b_sel;
logic [3:0] dut_mux2_4b_out0;

mux2_4b dut_mux2_4b
	(
		.in0(dut_mux2_4b_in0),
		.in1(dut_mux2_4b_in1),
		.sel(dut_mux2_4b_sel),
		.out0(dut_mux2_4b_out0)
	);	
	
	
	
logic [1:0] dut_top_in;
logic dut_top_en;
logic dut_top_output_sel;
logic [3:0] dut_top_out;
	
top dut_top
	(
		.in(dut_top_in),
		.en(dut_top_en),
		.output_sel(dut_top_output_sel),
		.out(dut_top_out)
	);	
	
	

logic tb_genereaza_ok;
logic decoder_ok;
logic demux_ok;
logic rom_ok;
logic mux8_4b_ok;
logic poarta_and_ok;
logic comparator_eq_4b_ok;
logic comparator_eq_1b_ok;
logic mux2_4b_ok;
logic top_ok;

integer tb_i;
integer decoder_i;
integer demux_i;
integer rom_i;
integer mux8_4b_i;
integer poarta_and_i;
integer comparator_eq_4b_i;
integer comparator_eq_1b_i;
integer mux2_4b_i;
integer top_i;

integer decoder_in_nr_bits = 2;
integer demux_in_nr_bits = 1+2;
integer rom_in_nr_bits = 3;
integer mux8_4b_in_nr_bits = 35;
integer mux8_4b_in_nr_random_checks = 5000;
integer poarta_and_in_nr_bits = 8;
integer comparator_eq_4b_in_nr_bits = 8;
integer comparator_eq_1b_in_nr_bits = 2;
integer mux2_4b_in_nr_bits = 9;
integer top_in_nr_bits =4;



	
initial 
begin
	tb_genereaza_ok = 1;
	decoder_ok = 1;         
	demux_ok = 1;     
	rom_ok = 1;       
	mux8_4b_ok = 1;         
	poarta_and_ok = 1;     
	comparator_eq_4b_ok = 1;
	comparator_eq_1b_ok = 1;
	mux2_4b_ok = 1;
	top_ok = 1;     
	
	#1
	for(tb_i = 0; tb_i<20; tb_i=tb_i+1)
		begin
		if(golden_vector_dut_tb_in[tb_i] != dut_tb_in)
			begin
			tb_genereaza_ok = 0;
			end
		if(golden_vector_dut_tb_en[tb_i] != dut_tb_en)
			begin
			tb_genereaza_ok = 0;
			end
		if(golden_vector_dut_tb_output_sel[tb_i] != dut_tb_output_sel)
			begin
			tb_genereaza_ok = 0;
			end	
		#5;	
		end
		
	#10;	
	for(decoder_i = 0; decoder_i<(1<<decoder_in_nr_bits); decoder_i=decoder_i+1)	
		begin
		dut_decoder_in0 = decoder_i;
		#1;
		if(dut_decoder_out0 != (1<<dut_decoder_in0))
			begin
			decoder_ok = 0;
			end
		end
	
	#10;
	for(demux_i = 0; demux_i<(1<<demux_in_nr_bits); demux_i=demux_i+1)	
		begin
		{dut_demux_in, dut_demux_sel} = demux_i;
		#1;
		if( dut_demux_out0 != (1<<dut_demux_sel)&({4{dut_demux_in}}))
			begin
			demux_ok = 0;
			end
		end
		
	#10;
	for(rom_i = 0; rom_i<(1<<rom_in_nr_bits); rom_i=rom_i+1)	
		begin
		dut_rom_addr = rom_i;
		#1;
		if( dut_rom_data != (1<<dut_rom_addr[1:0])&({4{dut_rom_addr[2]}}))
			begin
			rom_ok = 0;
			end
		end	
		
	#10;
	for(mux8_4b_i = 0; mux8_4b_i<mux8_4b_in_nr_random_checks; mux8_4b_i=mux8_4b_i+1)	
		begin:mux8_4b_checker_for
		logic [3:0] mux8_4b_golden_model_out;
		dut_mux8_4b_in0 = $urandom();
		dut_mux8_4b_in1 = $urandom();
		dut_mux8_4b_in2 = $urandom();
		dut_mux8_4b_in3 = $urandom();
		dut_mux8_4b_in4 = $urandom();
		dut_mux8_4b_in5 = $urandom();
		dut_mux8_4b_in6 = $urandom();
		dut_mux8_4b_in7 = $urandom();
		dut_mux8_4b_sel = $urandom();
		#1;
		case(dut_mux8_4b_sel)
			0: mux8_4b_golden_model_out = dut_mux8_4b_in0;
			1: mux8_4b_golden_model_out = dut_mux8_4b_in1;
			2: mux8_4b_golden_model_out = dut_mux8_4b_in2;
			3: mux8_4b_golden_model_out = dut_mux8_4b_in3;
			4: mux8_4b_golden_model_out = dut_mux8_4b_in4;
			5: mux8_4b_golden_model_out = dut_mux8_4b_in5;
			6: mux8_4b_golden_model_out = dut_mux8_4b_in6;
			7: mux8_4b_golden_model_out = dut_mux8_4b_in7;
		endcase
		if( dut_mux8_4b_out0 != mux8_4b_golden_model_out )
			begin
			mux8_4b_ok = 0;
			end
		end	
	
	#10;
	for(poarta_and_i = 0; poarta_and_i<(1<<poarta_and_in_nr_bits); poarta_and_i=poarta_and_i+1)	
		begin
		{dut_poarta_and_in1,dut_poarta_and_in0} = poarta_and_i;
		#1;
		if( dut_poarta_and_out0 != (dut_poarta_and_in1&dut_poarta_and_in0) )
			begin
			poarta_and_ok = 0;
			end
		end	
	
	#10;
	for(comparator_eq_4b_i = 0; comparator_eq_4b_i<(1<<comparator_eq_4b_in_nr_bits); comparator_eq_4b_i=comparator_eq_4b_i+1)	
		begin
		{dut_comparator_eq_4b_in1,dut_comparator_eq_4b_in0} = comparator_eq_4b_i;
		#1;
		if( dut_comparator_eq_4b_out0 != (dut_comparator_eq_4b_in1==dut_comparator_eq_4b_in0) )
			begin
			comparator_eq_4b_ok = 0;
			end
		end	
		
	#10;
	for(comparator_eq_1b_i = 0; comparator_eq_1b_i<(1<<comparator_eq_1b_in_nr_bits); comparator_eq_1b_i=comparator_eq_1b_i+1)	
		begin
		{dut_comparator_eq_1b_in1,dut_comparator_eq_1b_in0} = comparator_eq_1b_i;
		#1;
		if( dut_comparator_eq_1b_out0 != (dut_comparator_eq_1b_in1==dut_comparator_eq_1b_in0) )
			begin
			comparator_eq_1b_ok = 0;
			end
		end		
		
	#10;
	for(mux2_4b_i = 0; mux2_4b_i<(1<<mux2_4b_in_nr_bits); mux2_4b_i=mux2_4b_i+1)	
		begin
		{dut_mux2_4b_sel,dut_mux2_4b_in1,dut_mux2_4b_in0} = mux2_4b_i;
		#1;
		if( dut_mux2_4b_out0 != (dut_mux2_4b_sel?dut_mux2_4b_in1:dut_mux2_4b_in0) )
			begin
			mux2_4b_ok = 0;
			end
		end	
			
	#10;
	for(top_i = 0; top_i<(1<<top_in_nr_bits); top_i=top_i+1)	
		begin:top_checker_for
		{dut_top_output_sel,dut_top_en,dut_top_in} = top_i;
		#1;
		if( dut_top_out != (dut_top_output_sel?(1<<dut_top_in)&{4{dut_top_en}}:4'hf) )
			begin
			top_ok = 0;
			end
		end		
	
	if(tb_genereaza_ok == 1)
		begin
		$write("\n\n\nTB genereaza corect semnalele\n"); 
		end
	else
		begin
		$write("\n\n\nERROR: TB nu genereaza corect semnalele !!!!!!!!!!!!\n"); 
		end
		
	if(decoder_ok == 1)
		begin
		$write("Decodor ok\n"); 
		end
	else
		begin
		$write("ERROR: Decodor gresit !!!!!!!!!!!!\n"); 
		end
		
	if(demux_ok == 1)
		begin
		$write("Demux ok\n"); 
		end
	else
		begin
		$write("ERROR: Demux gresit !!!!!!!!!!!!\n"); 
		end	
		
	if(rom_ok == 1)
		begin
		$write("ROM ok\n"); 
		end
	else
		begin
		$write("ERROR: ROM gresit !!!!!!!!!!!!\n"); 
		end	
	
	if(mux8_4b_ok == 1)
		begin
		$write("Mux8_4b ok\n"); 
		end
	else
		begin
		$write("ERROR: Mux8_4b gresit !!!!!!!!!!!!\n"); 
		end	
		
	if(poarta_and_ok == 1)
		begin
		$write("Poarta and ok\n"); 
		end
	else
		begin
		$write("ERROR: Poarta and gresit !!!!!!!!!!!!\n"); 
		end	
	
	if(comparator_eq_4b_ok == 1)
		begin
		$write("Comparator_eq_4b and ok\n"); 
		end
	else
		begin
		$write("ERROR: Comparator_eq_4b gresit !!!!!!!!!!!!\n"); 
		end	
	
	if(comparator_eq_1b_ok == 1)
		begin
		$write("Comparator_eq_1b and ok\n"); 
		end
	else
		begin
		$write("ERROR: Comparator_eq_1b gresit !!!!!!!!!!!!\n"); 
		end	
	
	if(mux2_4b_ok == 1)
		begin
		$write("Mux2_4b and ok\n"); 
		end
	else
		begin
		$write("ERROR: Mux2_4b gresit !!!!!!!!!!!!\n"); 
		end	
	
	if(top_ok == 1)
		begin
		$write("Top ok\n"); 
		end
	else
		begin
		$write("ERROR: Top gresit !!!!!!!!!!!! (acest mesaj apare inclusiv daca oricare modul din interior e gresit)\n"); 
		end	
	#1 $finish();
end
	
	
	
	
	
	
	
		

endmodule 




