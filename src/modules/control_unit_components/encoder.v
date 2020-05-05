module encoder(output reg [9:0] state_number,
               input [31:0] instruction);

always @(instruction)
begin
    /*
        *** LOAD/STORE INSTRUCTIONS ***
    */
    // ! Immediate Offset
    if (instruction[27:25] == 3'b010)      
    begin
        // * STORE
        if(instruction[20] == 1'b0) 
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
                        // Add
                        if(instruction[23] == 1'b1)
                        begin
                            state_number = 10'd43;
                        end
                        
                        // Subtract
                        else
                        begin
                            state_number = 10'd53;
                        end
 
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
                        // Add
                        if(instruction[23] == 1'b1)
                        begin
                            state_number = 10'd45;
                        end
                        
                        // Subtract
                        else
                        begin
                            state_number = 10'd55;
                        end
 

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
                        // Add
                        if(instruction[23] == 1'b1)
                        begin
                            state_number = 10'd47;
                        end
                        
                        // Subtract
                        else
                        begin
                            state_number = 10'd57;
                        end
 

                    end   
                end
            end
        end

        // * LOAD
        else begin
           
        end
    end

    // ! Store Register Offset
    else if (instruction[27:25] == 3'b011 && instruction[4] == 0)   
    begin
        // * STORE
        if(instruction[20] == 1'b0) 
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
                        // Add
                        if(instruction[23] == 1'b1)
                        begin
                            state_number = 10'd44;
                        end
                        
                        // Subtract
                        else
                        begin
                            state_number = 10'd54;
                        end
 

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
                        // Add
                        if(instruction[23] == 1'b1)
                        begin
                            state_number = 10'd46;
                        end
                        
                        // Subtract
                        else
                        begin
                            state_number = 10'd56;
                        end
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
                        // Add
                        if(instruction[23] == 1'b1)
                        begin
                            state_number = 10'd50;
                        end
                        
                        // Subtract
                        else
                        begin
                            state_number = 10'd60;
                        end
                    end   
                end
            end
        end 
        
        // * LOAD
        else begin
           
        end   
    end

    // *** DATA PROCESSING ***

    // ! ADD
    else if(instruction[27:25] == 3'b001 || instruction[27:25] == 3'b000)
    begin
        // ADDS
        if(instruction[20] == 1'b1)
            state_number = 10'd10;

        // ADD
        else
            state_number = 10'd11;


    end // end ADD

    // ! BRANCH
    else if(instruction[27:25] == 3'b101)
    begin
        // BLEQ -> BRANCH AND LINK
        if(instruction[24] == 1'b1)
            state_number = 10'd13;
        
        // BEQ -> BRANCH
        else
            state_number = 10'd12;

    end // end BRANCH

    // If instruction unknown go back to fetch
    else state_number = 10'd1; 
end
endmodule
