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
        // ! Store Immediate Offset
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
                            state_number = 10'd20;
                        end
                        
                        // Subtract
                        else
                        begin
                            state_number = 10'd30;
                        end
                    end

                    // Word --> TO BE IMPLEMENTED
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
                        // Add
                        if(instruction[23] == 1'b1)
                        begin
                            state_number = 10'd22;
                        end
                        
                        // Subtract
                        else
                        begin
                            state_number = 10'd32;
                        end
                    end

                    // Word --> TO BE IMPLEMENTED
                    else                                    
                    begin
                    
                    end   
                end
            end

            // Post-Indexed
            else                                    
            begin
                begin
                    // Unsigned Byte
                    if(instruction[22] == 1'b1)             
                    begin
                        // Add
                        if(instruction[23] == 1'b1)
                        begin
                            state_number = 10'd24;
                        end
                        
                        // Subtract
                        else
                        begin
                            state_number = 10'd34;
                        end
                    end

                    // Word --> TO BE IMPLEMENTED
                    else                                    
                    begin
                    
                    end   
                end
            end
        end

        // ! Store Register Offset
        else if (instruction[27:25] == 3'b011 && instruction[4] == 0)   
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
                            state_number = 10'd21;
                        end
                        
                        // Subtract
                        else
                        begin
                            state_number = 10'd31;
                        end
                    end

                    // Word --> TO BE IMPLEMENTED
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
                        // Add
                        if(instruction[23] == 1'b1)
                        begin
                            state_number = 10'd23;
                        end
                        
                        // Subtract
                        else
                        begin
                            state_number = 10'd33;
                        end
                    end

                    // Word --> TO BE IMPLEMENTED
                    else                                    
                    begin
                    
                    end   
                end
            end

            // Post-Indexed
            else                                    
            begin
                begin
                    // Unsigned Byte
                    if(instruction[22] == 1'b1)             
                    begin
                        // Add
                        if(instruction[23] == 1'b1)
                        begin
                            state_number = 10'd27;
                        end
                        
                        // Subtract
                        else
                        begin
                            state_number = 10'd37;
                        end
                    end

                    // Word --> TO BE IMPLEMENTED
                    else                                    
                    begin
                    
                    end   
                end
            end
        end
    end

    // *** LOAD ***
    else
    begin
        
    end

    // *** DATA PROCESSING ***

    // ! ADD
    if(instruction[27:25] == 3'b001)
    begin
        // ADDS
        if(instruction[20] == 1'b1)
            state_number = 10'd10;

        // ADD
        else
            state_number = 10'd11;


    end // end ADD

    // ! BRANCH
    if(instruction[27:25] == 3'b101)
    begin
        // BLEQ -> BRANCH AND LINK
        if(instruction[24] == 1'b1)
            state_number = 10'd13;
        
        // BEQ -> BRANCH
        else
            state_number = 10'd12;

    end // end BRANCH

    
end

endmodule
