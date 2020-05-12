module flags_register(output reg[3:0] flags_out,
                      input Z,
                      N,
                      C,
                      V,
                      load_enable,
                      clk);

always @(posedge clk)
    if (load_enable) flags_out <= {Z, N, C, V};
endmodule
