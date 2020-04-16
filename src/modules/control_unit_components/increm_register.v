module increm_register( output reg [9:0] out,
                        input [9:0] in,
                        input clk);

always @(posedge clk)
    out = in;
    
endmodule
