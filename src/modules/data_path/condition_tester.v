module condition_tester(output reg cond,
                        input [3:0] flags_in,
                        condition_code);
    
    parameter EQ = 4'b0000,
    NE = EQ + 1,
    CS_HS = NE + 1,
    CC_LO = CS_HS + 1,
    MI = CC_LO + 1,
    PL = MI + 1,
    VS = PL + 1,
    VC = VS + 1,
    HI = VC + 1,
    LS = HI + 1,
    GE = LS + 1,
    LT = GE + 1,
    GT = LT + 1,
    LE = GT + 1,
    AL = LE + 1;
    
    // Z N C V
    always @(flags_in, condition_code)
        case (condition_code)
            EQ: cond    = flags_in[0] == 1 ? 1:0;
            NE: cond    = flags_in[0] == 0 ? 1:0;
            CS_HS: cond = flags_in[2] == 1 ? 1:0;
            CC_LO: cond = flags_in[2] == 0 ? 1:0;
            MI: cond    = flags_in[1] == 1 ? 1:0;
            PL: cond    = flags_in[0] == 0 ? 1:0;
            VS: cond    = flags_in[3] == 1 ? 1:0;
            VC: cond    = flags_in[3] == 0 ? 1:0;
            HI: cond    = flags_in[2] == 1 && flags_in[0] == 0 ? 1:0;
            LS: cond    = flags_in[2] == 0 || flags_in[0] == 1 ? 1:0;
            GE: cond    = flags_in[1] == flags_in[3] ? 1:0;
            LT: cond    = flags_in[1] != flags_in[3] ? 1:0;
            GT: cond    = flags_in[0] == 0 && flags_in[1] == flags_in[3] ? 1:0;
            LE: cond    = flags_in[0] == 1 || flags_in[1] != flags_in[3] ? 1:0;
            AL: cond    = 1;
        endcase
    
endmodule
