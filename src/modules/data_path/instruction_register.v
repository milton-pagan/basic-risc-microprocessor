module instruction_register(output reg[31:0] out,
                            input[31:0] in,
                            input load_enable);

always @(in, load_enable)
    if (load_enable) out = in;
    
endmodule
