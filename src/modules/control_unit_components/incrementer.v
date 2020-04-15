module incrementer( output reg [9:0] out,
                    input [9:0] in);

    always @(in) out = in + 10'b1;

endmodule