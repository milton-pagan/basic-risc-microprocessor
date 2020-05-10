module shift_sign_extender(output reg[31:0] out,
                           output reg carry_out,
                           input [31:0] instruction,
                           Rm);

integer i = 0;
reg[31:0] temp;

always @(instruction, Rm) begin
    case(instruction[27:25])
        
        // Shift by Immediate Shifter Operand
        3'b000: begin
            if (instruction[4] == 0)
                case(instruction[6:5])
                    // LSL
                    2'b00: begin
                        temp      = Rm;
                        carry_out = temp[32 - instruction[11:7]];
                        temp      = temp << instruction[11:7];
                        out       = temp;
                    end
                    
                    // LSR
                    2'b01: begin
                        temp      = Rm;
                        carry_out = temp[instruction[11:7] - 1];
                        temp      = temp >> instruction[11:7];
                        out       = temp;
                    end
                    
                    // ASR
                    2'b10: begin
                        temp      = Rm;
                        carry_out = temp[instruction[11:7] - 1];
                        temp      = $signed(temp) >>> instruction[11:7];
                        out       = temp;
                    end
                    
                    // ROR
                    2'b11: begin
                        temp      = Rm;
                        carry_out = temp[instruction[11:7] - 1];
                        out       = (temp >> instruction[11:7]) | (temp << 32 - instruction[11:7]);
                    end
                    
                endcase
            else if (instruction[4] == 1 && instruction[7] == 1 && instruction[22] == 1) begin
               out = {24'd0, instruction[11:8], instruction[3:0]}; 
            end
        end
        
        // 32 Bit Immediate Shifter Operand
        3'b001: begin
            temp      = {24'd0,instruction[7:0]};
            carry_out = temp[instruction[11:8] * 2 - 1];
            out       = (temp >> instruction[11:8] * 2) | (temp << 32 - instruction[11:8] * 2);
        end
        
        // Immediate Offset
        3'b010: begin
            out = {20'd0, instruction[11:0]};
        end

        // Register Offset
        3'b011:  begin
            if (instruction[4] == 0) begin
                out = Rm;
            end
        end

        // Branch and Branch with Link
        3'b101: begin
            out = {{8{instruction[23]}}, instruction[23:0]} << 2;
        end
        
endcase
end

endmodule
