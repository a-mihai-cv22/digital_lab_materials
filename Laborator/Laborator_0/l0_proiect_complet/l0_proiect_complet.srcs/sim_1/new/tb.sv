`timescale 1ns / 1ps 

module tb();

logic tb_w;   
logic tb_x;  
logic tb_y;  
logic tb_z;  
logic tb_out; 


modul_top dut
    (
        .w(tb_w),
        .x(tb_x),
        .y(tb_y),
        .z(tb_z),
        .out(tb_out)
    );

initial
begin
    tb_w = 0;
    tb_x = 0;
    tb_y = 0;
    tb_z = 0;
    #2
    
    tb_w = 0;
    tb_x = 1;
    tb_y = 0;
    tb_z = 0;
    #2
    
    tb_w = 0;
    tb_x = 0;
    tb_y = 1;
    tb_z = 0;
    #2
    
    tb_w = 1;
    tb_x = 1;
    tb_y = 0;
    tb_z = 0;
    #2
    
    
    #2 $stop();
end




endmodule







