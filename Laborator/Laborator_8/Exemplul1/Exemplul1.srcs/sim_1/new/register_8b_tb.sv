`timescale 1ns / 1ps

module register_8b_tb();

logic clock_tb;
logic reset_tb;
logic we_tb;
logic [7:0] data_in_tb;
logic [7:0] data_out_tb;

register_8b dut // varianta cu reset activ in "1"
    (
        .clock(clock_tb),
        .reset(reset_tb),
        .we(we_tb),
        .data_in(data_in_tb),
        .data_out(data_out_tb)
    );

initial
begin
    clock_tb = 0;
    forever 
        begin
        #5 clock_tb = ~clock_tb; // perioada totala 10 !!!
        end
end    

initial
begin
    reset_tb <= 0;
    we_tb <= 0;
    data_in_tb <= 0;
    // observatie: pana la primul reset sau prima scriere, 
    // valoarea din registru va fi necunoscuta (in simulare X)
    
    // dau reset la circuit
    @(posedge clock_tb); // astept sa treaca 1 clock cycle
    reset_tb <= 1;	
    @(posedge clock_tb);
    reset_tb <= 0;
    
    repeat(5) // dupa 5 cicli de ceas
        begin
        @(posedge clock_tb);
        end
    
    // incep sa fac scrieri
    we_tb <= 1;
    data_in_tb <= 5;
    @(posedge clock_tb);
    we_tb <= 0;
    data_in_tb <= 10;	
        // scrierea asta nu se face deoarece 
        // nu am write enable activ
    @(posedge clock_tb);
    data_in_tb <= 11;	// nici asta
    @(posedge clock_tb);
    data_in_tb <= 12;	// nici asta
    @(posedge clock_tb);
    we_tb = 1;
    data_in_tb <= 42;	// asta da
    @(posedge clock_tb);
    data_in_tb <= 51;	// si asta da
    @(posedge clock_tb);	
    we_tb <= 0;
    
    repeat(5) // dupa 5 cicli de ceas
        begin
        @(posedge clock_tb);
        end
    $stop();
end 

endmodule