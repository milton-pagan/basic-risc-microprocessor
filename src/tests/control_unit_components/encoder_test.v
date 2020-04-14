`include "src/modules/control_unit_components/encoder.v"

module encoder_test();
    
    wire [9:0] next_state;
    reg [31:0] instruction;
    
    encoder encoder(next_state, instruction);
    
    initial #100 $finish;
    
    initial begin
        // STRB
                                  // PUBWL
        instruction     = 32'b11100101110000010010000000000001; // Immediate Offset ADD
        #1  instruction = 32'b11100101010000010010000000000001; // Immediate Offset SUB
        #1  instruction = 32'b11100101111000010010000000000001; // Immediate Pre-Indexed ADD
        #1  instruction = 32'b11100101011000010010000000000001; // Immediate Pre-Indexed SUB
        #1  instruction = 32'b11100100110000010010000000000001; // Immediate Post-Indexed ADD
        #1  instruction = 32'b11100100010000010010000000000001; // Immediate Post-Indexed SUB

        #1  instruction = 32'b11100111110000010010000000000011; // Register Offset ADD
        #1  instruction = 32'b11100111010000010010000000000011; // Register Offset SUB
        #1  instruction = 32'b11100111111000010010000000000011; // Register Pre-Indexed ADD
        #1  instruction = 32'b11100111011000010010000000000011; // Register Pre-Indexed SUB
        #1  instruction = 32'b11100110110000010010000000000011; // Register Post-Indexed ADD
        #1  instruction = 32'b11100110010000010010000000000011; // Register Post-Indexed SUB
        
    end
    
    initial begin
        $display("\n*** ENCODER TEST ***");
        $display ("\n next_state\t\t instruction \t\t\t\t time");
        $monitor("%d \t\t%b %d", next_state, instruction ,$time);
    end
    
    
endmodule
