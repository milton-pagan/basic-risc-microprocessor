module next_reg_calc(output reg[3:0] next_reg, input[3:0] prev_reg);

always @(prev_reg)
    next_reg = prev_reg + 1;

endmodule