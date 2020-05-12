`include "src/modules/data_path/shift_sign_extender.v"

module shift_sign_extender_test();
    
    wire[31:0] out;
    wire carry_out;
    
    reg[31:0] instruction, Rm;
    
    shift_sign_extender sse(out, carry_out, instruction, Rm);
    
    initial #100 $finish;
    
    initial begin
        // Shift by immediate shifter operand
        Rm             = 32'b11000000000000000000000000001010;
        instruction    = 32'b11100000000000000000000100000000;
        #5 instruction = 32'b11100000000000000000000100100000;
        #5 instruction = 32'b11100000000000000000000101000000;
        #5 instruction = 32'b11100000000000000000000101100000;
        #5 instruction = 32'b11100010000000000000001001100000;
        #5 instruction = 32'b11100100000000000000000000000001;
        #5 instruction = 32'b11100110000000000000000101100000;
        #5 instruction = 32'b11101010100000000000000101100000;
    end
    
    
    initial begin
        $monitor("%b %b %b %b %d", Rm, out, carry_out, instruction, $time);
    end
    
endmodule
