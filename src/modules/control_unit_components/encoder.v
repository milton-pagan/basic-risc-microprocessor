module encoder(output reg [9:0] state_number,
               input [31:0] instruction);

always @(instruction)
begin
    /*
    *    *** LOAD/STORE INSTRUCTIONS ***
    */
    // ! Immediate Offset
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
                    if(instruction[20] == 1'b0) 
                        state_number = 10'd20; // Store
                    else
                        state_number = 10'd66; // Load
                    end
                    
                    // Subtract
                    else
                    begin
                    if(instruction[20] == 1'b0) 
                        state_number = 10'd30; // Store 
                    else
                        state_number = 10'd74; // Load
                    end
                end

                // Word 
                else                                    
                begin
                    // Add
                    if(instruction[23] == 1'b1)
                    begin
                    if(instruction[20] == 1'b0) 
                        state_number = 10'd43; // Store
                    else
                        state_number = 10'd85; // Load
                    end
                    
                    // Subtract
                    else
                    begin
                    if(instruction[20] == 1'b0) 
                        state_number = 10'd53; // Store
                    else
                        state_number = 10'd93; // Load
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
                    if(instruction[20] == 1'b0) 
                        state_number = 10'd22; // Store
                    else
                        state_number = 10'd68; // Load
                    end
                    
                    // Subtract
                    else
                    begin
                    if(instruction[20] == 1'b0) 
                        state_number = 10'd32; // Store
                    else 
                    state_number = 10'd76; // Load
                    end
                end

                // Word 
                else                                    
                begin
                    // Add
                    if(instruction[23] == 1'b1)
                    begin
                    if(instruction[20] == 1'b0) 
                        state_number = 10'd45; // Store
                    else
                        state_number = 10'd87; // Load
                    end
                    
                    // Subtract
                    else
                    begin
                    if(instruction[20] == 1'b0) 
                        state_number = 10'd55; // Store
                    else 
                        state_number = 10'd95; // Load
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
                    if(instruction[20] == 1'b0) 
                        state_number = 10'd24; // Store
                    else
                        state_number = 10'd70; // Load
                    end
                    
                    // Subtract
                    else
                    begin
                    if(instruction[20] == 1'b0) 
                        state_number = 10'd34; // Store
                    else
                        state_number = 10'd78; // Load
                    end
                end

                // Word 
                else                                    
                begin
                    // Add
                    if(instruction[23] == 1'b1)
                    begin
                    if(instruction[20] == 1'b0) 
                        state_number = 10'd47; // Store
                    else
                        state_number =10'd89; // Load
                    end
                    
                    // Subtract
                    else
                    begin
                    if(instruction[20] == 1'b0) 
                        state_number = 10'd57; // Store
                    else
                        state_number = 10'd97; // Load
                    end
                end   
            end
        end
    end

        
    // ! Register Offset
    else if (instruction[27:25] == 3'b011 && instruction[4] == 0)   
    begin
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
                        if(instruction[20] == 1'b0) 
                            state_number = 10'd21; // Store
                        else
                            state_number = 10'd67; // Load
                        end
                        
                        // Subtract
                        else
                        begin
                        if(instruction[20] == 1'b0) 
                            state_number = 10'd31; // Store
                        else
                            state_number = 10'd75; // Load
                        end
                    end

                    // Word 
                    else                                    
                    begin
                        // Add
                        if(instruction[23] == 1'b1)
                        begin
                        if(instruction[20] == 1'b0) 
                            state_number = 10'd44; // Store
                        else
                            state_number = 10'd86; // Load
                        end
                        
                        // Subtract
                        else
                        begin
                        if(instruction[20] == 1'b0) 
                            state_number = 10'd54; // Store
                        else
                            state_number = 10'd94; // Load
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
                        if(instruction[20] == 1'b0) 
                            state_number = 10'd23; // Store
                        else
                            state_number = 10'd69; // Load
                        end
                        
                        // Subtract
                        else
                        begin
                        if(instruction[20] == 1'b0) 
                            state_number = 10'd33; // Store
                        else
                            state_number = 10'd76; // Load
                        end
                    end

                    // Word 
                    else                                    
                    begin
                        // Add
                        if(instruction[23] == 1'b1)
                        begin
                        if(instruction[20] == 1'b0) 
                            state_number = 10'd46; // Store
                        else
                            state_number = 10'd88; // Load
                        end
                        
                        // Subtract
                        else
                        begin
                        if(instruction[20] == 1'b0) 
                            state_number = 10'd56; // Store
                        else
                            state_number = 10'd96; // Load
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
                        if(instruction[20] == 1'b0) 
                            state_number = 10'd27; // Store
                        else
                            state_number = 10'd72; // Load
                        end
                        
                        // Subtract
                        else
                        begin
                        if(instruction[20] == 1'b0) 
                            state_number = 10'd37; // Store
                        else
                            state_number = 10'd80; // Load
                        end
                    end

                    // Word 
                    else                                    
                    begin
                        // Add
                        if(instruction[23] == 1'b1)
                        begin
                        if(instruction[20] == 1'b0) 
                            state_number = 10'd50; // Store
                        else
                            state_number = 10'd91; // Load
                        end
                        
                        // Subtract
                        else
                        begin
                        if(instruction[20] == 1'b0) 
                            state_number = 10'd60; // Store
                        else
                            state_number = 10'd99; // Load
                        end
                    end   
                end
            end
        end 
    end

    /*
    *   Miscellaneous Load/Store   
    */

    if(instruction[27:25] == 3'b000 && instruction[7] == 1 && instruction[4] == 1) begin
        // Immediate Offset/Index
        if(instruction[22] == 1) begin
            // Offset/Pre-Indexed
            if(instruction[24] == 1'b1)         
            begin
                // Offset  
                if(instruction[21] == 1'b0)                    
                begin
                       
                end

                // Pre-Indexed
                else begin

                end
            end

            // Post-Indexed
            else                                    
            begin

            end

        end 

        // Register Offset/Index
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
