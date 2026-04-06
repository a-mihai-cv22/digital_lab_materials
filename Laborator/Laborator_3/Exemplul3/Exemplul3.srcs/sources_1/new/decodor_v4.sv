module decodor_v4
    (
        input logic [1:0] in,
        output logic [3:0] out 
    );                      
    
always_comb // generez un circuit combinational
begin	// begin si end pe post de acolade din c/c++; 
        // delimiteaza if/else si altele asemenea; 
        // inclusiv blocul always
    if(in == 0)
    begin
        out = 1; 
    end
    else
    begin
        if(in == 1)
            out = 2;	
            // fiind o singura instructiune, begin/end se  
            // pot omite; (identic c/c++)
        else
        begin	
            if(in == 2)
            begin
                out = 4;
            end
            else
            begin
                out = 8;
            end
        end
    end
end//end pentru always

endmodule