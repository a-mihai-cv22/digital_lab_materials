`timescale 1ns / 1ps

module meta_tb();


// la nivel de top 

// pentru tb pot face cu asteptari w_en si dastea 
	// + grija la ordine pentru reg in serie

logic clk;

	// tb
logic [7:0] tb_ram_gm [0:3];
logic [7:0] tb_regs_gm [0:3];
logic tb_had_start = 0;
logic tb_good_values = 1;

	// top
logic clk_top;
logic reset_top;
logic regs_w_en_top;
logic [7:0] data_w_top;
logic [1:0] addr_w_top;
logic w_en_top;
logic start_top;
logic done_top;
logic [7:0] fir_filter_out_top;
logic top_ok = 1;
logic [7:0] top_ram_gm [0:3];
logic [7:0] top_regs_gm [0:3];
localparam top_nr_operations = 100;
localparam top_nr_writes_per_operation=100;
int top_i;
int top_i2;

	// reg_8b
logic clk_reg_8b;
logic en_reg_8b;
logic [7:0] in_reg_8b;
logic [7:0] out_reg_8b;
logic reg_8b_ok = 1;
localparam reg_8b_i_nr_bits = 8+1;
logic [reg_8b_i_nr_bits-1 +1:0] reg_8b_i;
logic [7:0] out_reg_8b_gm;

	// ram
logic clk_ram;
logic [1:0] addr_r_ram;
logic [7:0] data_r_ram;
logic w_en_ram;
logic [1:0] addr_w_ram;
logic [7:0] data_w_ram;
logic ram_ok = 1;
logic [7:0] ram_gm [0:3];
localparam ram_nr_operations = 2000;
int ram_i;

	// mux4_8b
logic [7:0] in0_mux4_8b;
logic [7:0] in1_mux4_8b;
logic [7:0] in2_mux4_8b;
logic [7:0] in3_mux4_8b;
logic [1:0] sel_mux4_8b;
logic [7:0] out_mux4_8b;
logic mux4_8b_ok = 1;
localparam mux4_8b_nr_operations = 2000;
int mux4_8b_i;
logic [7:0] out_mux4_8b_gm;

	// control_fsm
logic clk_control_fsm;
logic reset_control_fsm;
logic start_control_fsm;
logic done_control_fsm;
logic acc_sel_control_fsm;
logic acc_w_en_control_fsm;
logic [1:0] ram_r_addr_control_fsm;
logic control_fsm_ok = 1;
logic [1:0] control_fsm_state_gm;
localparam control_fsm_nr_operations = 1000;
int control_fsm_i;

	// mult
logic [7:0] in0_mult;
logic [7:0] in1_mult;
logic [7:0] out_mult;
logic mult_ok = 1;
localparam mult_nr_bits = 8+8;
logic [mult_nr_bits-1 +1:0] mult_i;
logic [7:0] out_mult_gm;

	// add
logic [7:0] in0_add;
logic [7:0] in1_add;
logic [7:0] out_add;
logic add_ok = 1;
localparam add_nr_bits = 8+8;
logic [add_nr_bits-1 +1:0] add_i;
logic [7:0] out_add_gm;

	// mux2_8b
logic [7:0] in0_mux2_8b;
logic [7:0] in1_mux2_8b;
logic sel_mux2_8b;
logic [7:0] out_mux2_8b;
logic mux2_8b_ok = 1;
localparam mux2_8b_nr_bits = 8+8+1;
logic [mux2_8b_nr_bits-1 +1:0] mux2_8b_i;
logic [7:0] out_mux2_8b_gm;




tb tb_user();

top top_user
	(
		.clk(clk_top),
		.reset(reset_top),
		.regs_w_en(regs_w_en_top),
		.data_w(data_w_top),
		.addr_w(addr_w_top),
		.w_en(w_en_top),
		.start(start_top),
		.done(done_top),
		.fir_filter_out(fir_filter_out_top)
	);

reg_8b reg_8b_user
	(
		.clk(clk_reg_8b),
		.en(en_reg_8b),
		.in(in_reg_8b),
		.out(out_reg_8b)
	);
	
ram ram_user
	(
		.clk(clk_ram),
		.addr_r(addr_r_ram),
		.data_r(data_r_ram),
		.w_en(w_en_ram),
		.addr_w(addr_w_ram),
		.data_w(data_w_ram)
    );
	
mux4_8b mux4_8b_user
	(
		.in0(in0_mux4_8b),
		.in1(in1_mux4_8b),
		.in2(in2_mux4_8b),
		.in3(in3_mux4_8b),
		.sel(sel_mux4_8b),
		.out(out_mux4_8b)
	);	
	
control_fsm control_fsm_user
	(
		.clk(clk_control_fsm),
		.reset(reset_control_fsm),
		.start(start_control_fsm),
		.done(done_control_fsm),
		.acc_sel(acc_sel_control_fsm),
		.acc_w_en(acc_w_en_control_fsm),
		.ram_r_addr(ram_r_addr_control_fsm)
	);	
	
mult mult_user
	(
		.in0(in0_mult),
		.in1(in1_mult),
		.out(out_mult)
	);	
	
add add_user
	(
		.in0(in0_add),
		.in1(in1_add),
		.out(out_add)
	);	
	
mux2_8b mux2_8b_user
	(
		.in0(in0_mux2_8b),
		.in1(in1_mux2_8b),
		.sel(sel_mux2_8b),
		.out(out_mux2_8b)
	);	



initial
	begin
	clk = 0;
	forever
		begin
		#10 clk = ~clk;
		end
	end

assign clk_top = clk;
assign clk_reg_8b = clk;
assign clk_ram = clk;
assign clk_control_fsm = clk;	
always@(posedge clk_reg_8b)	if(en_reg_8b)out_reg_8b_gm<=in_reg_8b;
always@(posedge clk_ram) if(w_en_ram)ram_gm[addr_w_ram]<=data_w_ram;
assign out_mux4_8b_gm = (sel_mux4_8b==0)?in0_mux4_8b:(sel_mux4_8b==1)?in1_mux4_8b:(sel_mux4_8b==2)?in2_mux4_8b:in3_mux4_8b;
assign out_mult_gm = in0_mult*in1_mult;
assign out_add_gm = in0_add+in1_add;
assign out_mux2_8b_gm = (sel_mux2_8b==0)?in0_mux2_8b:in1_mux2_8b;
always@(posedge clk_control_fsm) if(reset_control_fsm)control_fsm_state_gm<=0;else if(control_fsm_state_gm==0) control_fsm_state_gm<=
control_fsm_state_gm+start_control_fsm;else control_fsm_state_gm<=control_fsm_state_gm+1;
always@(posedge clk_top) if(w_en_top)top_ram_gm[addr_w_top]<=data_w_top;
always@(posedge clk_top) if(regs_w_en_top) begin top_regs_gm[0]<=top_regs_gm[1];top_regs_gm[1]<=top_regs_gm[2];
top_regs_gm[2]<=top_regs_gm[3];top_regs_gm[3]<=data_w_top; end
always@(posedge tb.dut.clk) if(tb.dut.w_en)tb_ram_gm[tb.dut.addr_w]<=tb.dut.data_w;
always@(posedge tb.dut.clk) if(tb.dut.regs_w_en) begin tb_regs_gm[0]<=tb_regs_gm[1];tb_regs_gm[1]<=tb_regs_gm[2];
tb_regs_gm[2]<=tb_regs_gm[3];tb_regs_gm[3]<=tb.dut.data_w; end


	
initial
	begin
	
	repeat(50)
		@(posedge clk); 
	for(reg_8b_i = 0; reg_8b_i<(1<<reg_8b_i_nr_bits); reg_8b_i=reg_8b_i+1)	
		begin
		{en_reg_8b,in_reg_8b} <= reg_8b_i; 
		@(posedge clk_reg_8b);
		if( out_reg_8b != out_reg_8b_gm )
			begin
			reg_8b_ok <= 0;
			end
		end	
		
	repeat(50)
		@(posedge clk); 
	for(ram_i = 0; ram_i<ram_nr_operations; ram_i=ram_i+1)	
		begin
		addr_r_ram <= $urandom();
		w_en_ram <= $urandom();
		addr_w_ram <= $urandom();
		data_w_ram <= $urandom();
		@(posedge clk_ram);
		if( data_r_ram != ram_gm[addr_r_ram] )
			begin
			ram_ok <= 0;
			end
		end	
		
	repeat(50)
		@(posedge clk); 		
	for(mux4_8b_i = 0; mux4_8b_i<mux4_8b_nr_operations; mux4_8b_i=mux4_8b_i+1)	
		begin
		in0_mux4_8b <= $urandom();
		in1_mux4_8b <= $urandom();
		in2_mux4_8b <= $urandom();
		in3_mux4_8b <= $urandom();
		sel_mux4_8b <= $urandom();
		#1;
		if( out_mux4_8b != out_mux4_8b_gm )
			begin
			mux4_8b_ok <= 0;
			end
		end		
		
	repeat(50)
		@(posedge clk); 
	for(mult_i = 0; mult_i<(1<<mult_nr_bits); mult_i=mult_i+1)	
		begin
		{in0_mult,in1_mult} <= mult_i; 
		#1;
		if( out_mult != out_mult_gm )
			begin
			mult_ok <= 0;
			end
		end		

	repeat(50)
		@(posedge clk); 
	for(add_i = 0; add_i<(1<<add_nr_bits); add_i=add_i+1)	
		begin
		{in0_add,in1_add} <= add_i; 
		#1;
		if( out_add != out_add_gm )
			begin
			add_ok <= 0;
			end
		end	

	repeat(50)
		@(posedge clk); 
	for(mux2_8b_i = 0; mux2_8b_i<(1<<mux2_8b_nr_bits); mux2_8b_i=mux2_8b_i+1)	
		begin
		{sel_mux2_8b,in0_mux2_8b,in1_mux2_8b} <= mux2_8b_i; 
		#1;
		if( out_mux2_8b != out_mux2_8b_gm )
			begin
			mux2_8b_ok <= 0;
			end
		end	

	
	repeat(50)
		@(posedge clk); 
	for(ram_i = 0; ram_i<control_fsm_nr_operations; ram_i=ram_i+1)	
		begin
		reset_control_fsm <= $urandom();
		start_control_fsm <= $urandom();
		@(posedge clk_control_fsm);
		if( done_control_fsm != (control_fsm_state_gm==3) )
			begin
			control_fsm_ok <= 0;
			end
		if( acc_sel_control_fsm != (control_fsm_state_gm==0) )
			begin
			control_fsm_ok <= 0;
			end
		if( acc_w_en_control_fsm != ((control_fsm_state_gm!=0)|start_control_fsm) )
			begin
			control_fsm_ok <= 0;
			end
		if( ram_r_addr_control_fsm != control_fsm_state_gm )
			begin
			control_fsm_ok <= 0;
			end
		end	
	
	repeat(50)
		@(posedge clk_top); 
	for(top_i = 0; top_i<top_nr_operations; top_i=top_i+1)	
		begin
		for(top_i2 = 0; top_i2<top_nr_writes_per_operation; top_i2=top_i2+1)
			begin
			regs_w_en_top <= $urandom();
			data_w_top <= $urandom();
			addr_w_top <= $urandom();
			w_en_top <= $urandom();
			@(posedge clk_top); 
			end
		start_top <= 1;
		@(posedge clk_top); 
		start_top <= 0;
		@(posedge clk_top); 
		@(posedge clk_top); 
		@(posedge clk_top); 
		#1;
		if( ( done_top != 1 ) && (fir_filter_out_top != (top_ram_gm[0]*top_regs_gm[3]+
			top_ram_gm[1]*top_regs_gm[2]+top_ram_gm[2]*top_regs_gm[1]+top_ram_gm[3]*top_regs_gm[0]) ) )
			begin
			top_ok <= 0;
			end
		end	
		
		
		
		
	repeat(50)
		@(posedge clk_top); 	
	if( (tb_had_start == 1 ) && (tb_good_values == 1) )
		begin
		$write("\n\n\nTB genereaza corect semnalele\n"); 
		end
	else
		begin
		$write("\n\n\nERROR: TB nu genereaza corect semnalele !!!!!!!!!!!!\n"); 
		end
		
	if(reg_8b_ok == 1)
		begin
		$write("reg_8b ok\n"); 
		end
	else
		begin
		$write("ERROR: reg_8b gresit !!!!!!!!!!!!\n"); 
		end
	
	if(ram_ok == 1)
		begin
		$write("ram ok\n"); 
		end
	else
		begin
		$write("ERROR: ram gresit !!!!!!!!!!!!\n"); 
		end
		
	if(mux4_8b_ok == 1)
		begin
		$write("mux4_8b ok\n"); 
		end
	else
		begin
		$write("ERROR: mux4_8b gresit !!!!!!!!!!!!\n"); 
		end	
		
	if(mult_ok == 1)
		begin
		$write("mult ok\n"); 
		end
	else
		begin
		$write("ERROR: mult gresit !!!!!!!!!!!!\n"); 
		end	
		
	if(add_ok == 1)
		begin
		$write("add ok\n"); 
		end
	else
		begin
		$write("ERROR: add gresit !!!!!!!!!!!!\n"); 
		end	
		
	if(mux2_8b_ok == 1)
		begin
		$write("mux2_8b ok\n"); 
		end
	else
		begin
		$write("ERROR: mux2_8b gresit !!!!!!!!!!!!\n"); 
		end
		
	if(control_fsm_ok == 1)
		begin
		$write("control_fsm ok\n"); 
		end
	else
		begin
		$write("ERROR: control_fsm gresit !!!!!!!!!!!!\n"); 
		end
		
	if(top_ok == 1)
		begin
		$write("top ok\n"); 
		end
	else
		begin
		$write("ERROR: top gresit !!!!!!!!!!!!\n"); 
		end	
		
	repeat(50_000)
		@(posedge clk_top); 	
	#1 $finish();
	end



initial
	begin
	
	forever
		begin
		@(posedge tb.dut.clk);
		if(tb.dut.start)
			begin
			tb_had_start = 1;
			if( (tb_ram_gm[0]!=2)||(tb_ram_gm[1]!=3)||(tb_ram_gm[2]!=4)||(tb_ram_gm[3]!=5) )
				tb_good_values<=0;
			if( (tb_regs_gm[0]!=4)||(tb_regs_gm[1]!=3)||(tb_regs_gm[2]!=2)||(tb_regs_gm[3]!=1) )
				tb_good_values<=0;
			end
		end
	
	end
	
	
	
	



endmodule











