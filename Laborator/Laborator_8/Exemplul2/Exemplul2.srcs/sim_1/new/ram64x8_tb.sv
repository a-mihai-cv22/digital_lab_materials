`timescale 1ns / 1ps

module ram64x8_tb();

logic clock_tb;
logic [5:0] addr_read_tb;
logic [7:0] data_read_tb;
logic we_tb;
logic [5:0] addr_write_tb;
logic [7:0] data_write_tb;


ram64x8_v1 dut
    (
        .clock(clock_tb),
        //interfata de citire
            .addr_read(addr_read_tb), 
                // 64 locatii => 6 biti de adresa 
            .data_read(data_read_tb), 
                // fiecare locatie are 8b  
        // interfata de scriere
            .we(we_tb),
            .addr_write(addr_write_tb),
            .data_write(data_write_tb)
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
    we_tb <= 0;
    data_write_tb <= 0;
    addr_read_tb <= 0; 
    // citind de la o adresa nescrisa inca, 
    // iesirea e necunoscuta
    addr_write_tb <= 0;
    repeat(5) // dupa 5 cicli de ceas
        begin
        @(posedge clock_tb);
        end
    
    // incep sa fac scrieri
    we_tb <= 1;	// scriu data 5 la adresa 10
    addr_write_tb <= 10;
    data_write_tb <= 5;
    addr_read_tb <= 11; 
        // citind de la o adresa nescrisa inca, 
        // iesirea e necunoscuta
    @(posedge clock_tb);
    we_tb <= 0;			
        // scrierea asta nu se face deoarece 
        // nu am write enable activ	
    addr_write_tb <= 11;
    data_write_tb <= 10;	
    @(posedge clock_tb);
    data_write_tb <= 11;	// nici asta
    @(posedge clock_tb);
    data_write_tb <= 12;	// nici asta
    @(posedge clock_tb);
    we_tb <= 1;
    addr_write_tb <= 20; // scriere ok 
    data_write_tb <= 42;	// scriu data 42 la adresa 20
    @(posedge clock_tb);
    data_write_tb <= 51;	
        // si asta; suprascriu datele anterioare la adresa 20.
    @(posedge clock_tb);
    addr_write_tb <= 21;
    data_write_tb <= 11;	// scriere ok
    addr_read_tb <= 20; 
        // citesc de la adresa 20, scrisa anteior 
        // deci voi vedea date cunoscute pe iesire.
    @(posedge clock_tb);
    addr_write_tb <= 23;
    data_write_tb <= 14;	// scriere ok 
    addr_read_tb <= 21; 
        // variez adresa de citire si pot parcurge 
        // memorie locatie cu locatie
    @(posedge clock_tb);	
    we_tb <= 0;	// opresc scrierea
    
    repeat(5) // dupa 5 cicli de ceas
    begin
    @(posedge clock_tb);
    end
    $stop();
end 	

endmodule