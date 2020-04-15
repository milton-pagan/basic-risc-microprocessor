module increm_register( output reg [9:0] out,
                        input [9:0] in,
                        input load_enable);

always @(in, load_enable)
    if (load_enable) out = in;
    
endmodule
