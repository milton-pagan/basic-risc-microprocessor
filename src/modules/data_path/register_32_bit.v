module register_32_bit(output reg[31:0] out,
                       input[31:0] in,
                       input load_enable,
                       clk);

always @(posedge clk)
    if (load_enable) out <= in;
endmodule
