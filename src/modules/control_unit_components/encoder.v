module encoder(output reg [9:0] state_number,
               input [31:0] instruction);

always @(instruction)
begin
    /*
        *** LOAD/STORE INSTRUCTIONS ***
    */

    // *** STORE ***
    if (instruction[20] == 0)
    begin
        // Store Immediate Offset
        if (instruction[27:25] == 3'b010)      
        begin
            // Offset/Pre-Indexed
            if(instruction[24] == 1'b1)         
            begin
                // Offset  
                if(instruction[21] == 1'b0)                    
                begin
                    // Unsigned Byte
                    if(instruction[22] == 1'b1)             
                    begin
                        // Add
                        if(instruction[23] == 1'b1)
                        begin
                            
                        end
                        
                        // Subtract
                        else
                        begin
                            
                        end
                    end

                    // Word
                    else                                    
                    begin
                    
                    end     
                end

                // Pre-Indexed
                else                                    
                begin
                    // Unsigned Byte
                    if(instruction[22] == 1'b1)             
                    begin
                
                    end

                    // Word
                    else                                   
                    begin
                    
                    end    
                end
            end

            // Post-Indexed
            else                                    
            begin

            end
        end

        // Store Register Offset
        else if (instruction[27:25] == 3'b011)   
        begin
            
        end
    end

    // *** LOAD ***
    else
    begin
        
    end
end

endmodule
