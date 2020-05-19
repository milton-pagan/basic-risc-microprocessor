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

    else if(instruction[27:25] == 3'b000 && instruction[7] == 1 && instruction[4] == 1) begin
        // Immediate Offset/Index
        if(instruction[22] == 1) begin
            // Offset/Pre-Indexed
            if(instruction[24] == 1'b1) begin
                // Offset  
                if(instruction[21] == 1'b0) begin
                    // Add
                    if(instruction[23] == 1) begin
                        case({instruction[20], instruction[6], instruction[5]})                        
                            3'b001: state_number = 104;   // STRH
                            3'b010: state_number = 184;   // LDRD
                            3'b011: state_number = 207;   // STRD
                            3'b101: state_number = 127;   // LDRH
                            3'b110: state_number = 146;   // LDRSB
                            3'b111: state_number = 165;   // LDRSH
                        endcase
                    end 

                    // Subtract
                    else begin
                        case({instruction[20], instruction[6], instruction[5]})                        
                            3'b001: state_number = 114;   // STRH
                            3'b010: state_number = 192;   // LDRD
                            3'b011: state_number = 217;   // STRD
                            3'b101: state_number = 135;   // LDRH
                            3'b110: state_number = 154;   // LDRSB
                            3'b111: state_number = 173;   // LDRSH
                        endcase
                    end
                end

                // Pre-Indexed
                else begin
                    // Add
                    if(instruction[23] == 1) begin
                        case({instruction[20], instruction[6], instruction[5]})                        
                            3'b001: state_number = 106;   // STRH
                            3'b010: state_number = 186;   // LDRD
                            3'b011: state_number = 209;   // STRD
                            3'b101: state_number = 129;   // LDRH
                            3'b110: state_number = 148;   // LDRSB
                            3'b111: state_number = 167;   // LDRSH
                        endcase
                    end 

                    // Subtract
                    else begin
                        case({instruction[20], instruction[6], instruction[5]})                        
                            3'b001: state_number = 116;   // STRH
                            3'b010: state_number = 194;   // LDRD
                            3'b011: state_number = 219;   // STRD
                            3'b101: state_number = 137;   // LDRH
                            3'b110: state_number = 156;   // LDRSB
                            3'b111: state_number = 175;   // LDRSH
                        endcase
                    end
                end
            end

            // Post-Indexed
            else begin
                    // Add
                    if(instruction[23] == 1) begin
                        case({instruction[20], instruction[6], instruction[5]})                        
                            3'b001: state_number = 108;   // STRH
                            3'b010: state_number = 188;   // LDRD
                            3'b011: state_number = 211;   // STRD
                            3'b101: state_number = 131;   // LDRH
                            3'b110: state_number = 150;   // LDRSB
                            3'b111: state_number = 169;   // LDRSH
                        endcase
                    end 

                    // Subtract
                    else begin
                        case({instruction[20], instruction[6], instruction[5]})                        
                            3'b001: state_number = 118;   // STRH
                            3'b010: state_number = 196;   // LDRD
                            3'b011: state_number = 221;   // STRD
                            3'b101: state_number = 139;   // LDRH
                            3'b110: state_number = 158;   // LDRSB
                            3'b111: state_number = 177;   // LDRSH
                        endcase
                    end
            end
        end 

        // Register Offset/Index
        else begin
            // Offset/Pre-Indexed
            if(instruction[24] == 1'b1) begin
                // Offset  
                if(instruction[21] == 1'b0) begin
                    // Add
                    if(instruction[23] == 1) begin
                        case({instruction[20], instruction[6], instruction[5]})                        
                            3'b001: state_number = 105;   // STRH
                            3'b010: state_number = 185;   // LDRD
                            3'b011: state_number = 208;   // STRD
                            3'b101: state_number = 128;   // LDRH
                            3'b110: state_number = 147;   // LDRSB
                            3'b111: state_number = 166;   // LDRSH
                        endcase
                    end 

                    // Subtract
                    else begin
                        case({instruction[20], instruction[6], instruction[5]})                        
                            3'b001: state_number = 115;   // STRH
                            3'b010: state_number = 193;   // LDRD
                            3'b011: state_number = 218;   // STRD
                            3'b101: state_number = 136;   // LDRH
                            3'b110: state_number = 155;   // LDRSB
                            3'b111: state_number = 174;   // LDRSH
                        endcase
                    end
                end

                // Pre-Indexed
                else begin
                    // Add
                    if(instruction[23] == 1) begin
                        case({instruction[20], instruction[6], instruction[5]})                        
                            3'b001: state_number = 107;   // STRH
                            3'b010: state_number = 187;   // LDRD
                            3'b011: state_number = 210;   // STRD
                            3'b101: state_number = 130;   // LDRH
                            3'b110: state_number = 149;   // LDRSB
                            3'b111: state_number = 168;   // LDRSH
                        endcase
                    end 

                    // Subtract
                    else begin
                        case({instruction[20], instruction[6], instruction[5]})                        
                            3'b001: state_number = 117;   // STRH
                            3'b010: state_number = 195;   // LDRD
                            3'b011: state_number = 220;   // STRD
                            3'b101: state_number = 138;   // LDRH
                            3'b110: state_number = 157;   // LDRSB
                            3'b111: state_number = 176;   // LDRSH
                        endcase
                    end
                end
            end

            // Post-Indexed
            else begin
                    // Add
                    if(instruction[23] == 1) begin
                        case({instruction[20], instruction[6], instruction[5]})                        
                            3'b001: state_number = 111;   // STRH
                            3'b010: state_number = 190;   // LDRD
                            3'b011: state_number = 214;   // STRD
                            3'b101: state_number = 133;   // LDRH
                            3'b110: state_number = 152;   // LDRSB
                            3'b111: state_number = 171;   // LDRSH 
                        endcase
                    end 

                    // Subtract
                    else begin
                        case({instruction[20], instruction[6], instruction[5]})                        
                            3'b001: state_number = 121;   // STRH
                            3'b010: state_number = 198;      // LDRD
                            3'b011: state_number = 224;       // STRD
                            3'b101: state_number = 141;   // LDRH
                            3'b110: state_number = 160;   // LDRSB
                            3'b111: state_number = 179;   // LDRSH
                        endcase
                    end
            end   
        end
    end

    // ! *** DATA PROCESSING ***

    else if((instruction[27:25] == 3'b001 || instruction[27:25] == 3'b000) && (instruction[24:21] == 4'b1000 || instruction[24:21] == 4'b1001 || instruction[24:21] == 4'b1010 || instruction[24:21] == 4'b1011)) begin
        state_number = 10'd14;
    end

    else if(instruction[27:25] == 3'b001 || instruction[27:25] == 3'b000)
    begin
        // With S
        if(instruction[20] == 1'b1)
            state_number = 10'd10;

        // Without S
        else
            state_number = 10'd11;
    end
    // ! BRANCH
    else if (instruction[27:25] == 3'b101)
        begin
            // BRANCH AND LINK
            if (instruction[24] == 1'b1)
                state_number = 10'd13;

            // BRANCH
            else
                state_number = 10'd12;

        end
/* 
 * Load/Store Multiple
*/

    else if (instruction[27:25] == 3'b100) begin
        // Inc/Dec After
        if(!instruction[24])state_number = !instruction[20] ? 10'd234: 10'd247;

        // Inc/Dec Before
        else state_number = !instruction[20] ? 10'd239: 10'd252;
    end

    // If instruction unknown go back to fetch
    else state_number = 10'd1; 
end
endmodule
