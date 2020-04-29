module shift_sign_extender(output reg[31:0] out,
                           output reg carry_out,
                           input [31:0] instruction,
                           Rm);

integer i = 0;
reg[31:0] temp;

always @(instruction, Rm) begin
    case(instruction[27:25])
        3'b001: begin
            // Shift by Immediate Shifter Operand
            if (instruction[4] == 0) begin
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
                        temp      = temp >>> instruction[11:7];
                        out       = temp;
                    end
                    
                    // ROR
                    2'b11: begin
                        temp      = Rm;
                        carry_out = temp[instruction[11:7] - 1];
                        out       = (temp >> instruction[11:7]) | (temp << ~instruction[11:7]);
                    end
                    
                endcase
            end
            
            // 32 Bit Immediate Shifter Operand
            else begin
                temp      = {24'd0,instruction[7:0]};
                carry_out = temp[instruction[11:8] * 2 - 1];
                out       = (temp >> instruction[11:8]) | (temp << ~instruction[11:8]);
            end
        end
        
        // Immediate Offset
        3'b010: begin
            out = {20'd0, instruction[11:0]};
        end
        
        
        // Register Offset/Index
        3'b011: begin
            if (instruction[4] == 0) begin
                out = Rm;
            end
        end
        
        // Branch and Branch with Link
        3'b101: begin
            out = {{8{instruction[23]}}, instruction[23:0]};
        end
        
    endcase
end

endmodule
