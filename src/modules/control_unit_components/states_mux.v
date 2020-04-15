module states_mux(  output reg [9:0] out, 
                    input [9:0] encoder, cr, increm,
                    input [1:0] sel);

    always @(sel, encoder, cr, increm)
        case(sel)
        
            2'b00: out = encoder;
            2'b01: out = 10'b1;
            2'b10: out = cr;
            2'b11: out = increm;
        endcase
endmodule