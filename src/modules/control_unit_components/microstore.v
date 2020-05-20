`define NUM_STATES 257 

module microstore(output reg[43:0] out,
                  output reg [9:0] current_state,
                  input[9:0] next_state,
                  input reset);
/* state_info contains control signal bits for all states. **state_info[0] corresponds to State 0, state_info[1] to State 1, etc.**
 **MUST FILL UNUSED STATES WITH ZEROS SO ARRAY POSITIONS CORRESPOND TO THEIR STATE***/
parameter[0:44 * `NUM_STATES - 1] state_info = {
44'h21000663400,
44'h60402024000,
44'h610e2064400,
44'hb08e0001003,
44'h94000001001,
44'h0000000000, // 5
44'h0000000000,
44'h0000000000,
44'h0000000000,
44'h0000000000,
44'h23000201000,
44'h21000201000,
44'h21002261000,
44'h410020e400c,
44'h22000201000,
44'h0000000000, // 15
44'h0000000000,
44'h0000000000,
44'h0000000000,
44'h0000000000,
44'h40400231028,
44'h40400031028,
44'h414002b1028,
44'h414000b1028,
44'h60400034000,
44'h60201034000,
44'h410402b102a,
44'h60400034000,
44'h60201034000,
44'h410400b102a,
44'h40400230828,
44'h40400030828,
44'h414002b0828,
44'h414000b0828,
44'h60400034000,
44'h60201034000,
44'h410402b082a,
44'h60400034000,
44'h60201034000,
44'h410400b082a,
44'h60201034000,
44'h60040031000,
44'hf004003102a,
44'h4042023103f,
44'h4042003103f,
44'h414202b103f,
44'h414200b103f,
44'h60420034000,
44'h60221034000,
44'h410602b1041,
44'h60420034000,
44'h60221034000,
44'h410600b1041,
44'h4042023083f,
44'h4042003083f,
44'h414202b083f,
44'h414200b083f,
44'h60420034000,
44'h60221034000,
44'h410602b0841,
44'h60420034000,
44'h60221034000,
44'h410600b0841,
44'h60221034000,
44'h60060031000,
44'hf0060031041,
44'h40400221052,
44'h40400021052,
44'h414002a1052,
44'h414000a1052,
44'h60400024000,
44'h410002a1052,
44'h60400024000,
44'h410000a0052,
44'h40400220852,
44'h40400020852,
44'h414002a0852,
44'h414000a0852,
44'h60400024000,
44'h410002a0852,
44'h60400024000,
44'h410000a0852,
44'h600c0021000,
44'hb02c0021053,
44'h21000423400,
44'h40420221065,
44'h40420021065,
44'h414202a1065,
44'h414200a1065,
44'h60420024000,
44'h410202a1065,
44'h60420024000,
44'h410200a1065,
44'h40420220865,
44'h40420020865,
44'h414202a0865,
44'h414200a0865,
44'h60420024000,
44'h410202a0865,
44'h60420024000,
44'h410200a0865,
44'h600e0021000,
44'hb02e0021066,
44'h21020423400,
44'h4041023107c,
44'h4041003107c,
44'h414102b107c,
44'h414100b107c,
44'h60410034000,
44'h60211034000,
44'h410502b107e,
44'h60410034000,
44'h60211034000,
44'h410500b107c,
44'h4041023087c,
44'h4041003087c,
44'h414102b087c,
44'h414100b087c,
44'h60410034000,
44'h60211034000,
44'h410502b087e,
44'h60410034000,
44'h60211034000,
44'h410500b087e,
44'h60211034000,
44'h60050031000,
44'hf005003107e,
44'h4041022108f,
44'h4041002108f,
44'h414102a108f,
44'h414100a108f,
44'h60410024000,
44'h410102a108f,
44'h60410024000,
44'h410100a108f,
44'h4041022088f,
44'h4041002088f,
44'h414102a088f,
44'h414100a088f,
44'h60410024000,
44'h410102a088f,
44'h60410024000,
44'h410100a088f,
44'h600d0021000,
44'hb02d0021090,
44'h21010423400,
44'h404082210a2,
44'h404080210a2,
44'h414082a10a2,
44'h414080a10a2,
44'h60408024000,
44'h410082a10a2,
44'h60408024000,
44'h410080a10a2,
44'h404082208a2,
44'h404080208a2,
44'h414082a08a2,
44'h414080a08a2,
44'h60408024000,
44'h410082a08a2,
44'h60408024000,
44'h410080a08a2,
44'h600c8021000,
44'hb02c80210a3,
44'h21008423400,
44'h404182210b5,
44'h404180210b5,
44'h414182a10b5,
44'h414180a10b5,
44'h60418024000,
44'h410182a10b5,
44'h60418024000,
44'h410180a10b5,
44'h404182208b5,
44'h404180208b5,
44'h414182a08b5,
44'h414180a08b5,
44'h60418024000,
44'h410182a08b5,
44'h60418024000,
44'h410180a08b5,
44'h600d8021000,
44'hb02d80210b6,
44'h21018423400,
44'h404202210c8,
44'h404200210c8,
44'h414202a10c8,
44'h414200a10c8,
44'h60420024000,
44'h410202a10c8,
44'h60420024000,
44'h410200a10c8,
44'h404202208c8,
44'h404200208c8,
44'h414202a08c8,
44'h414200a08c8,
44'h60420024000,
44'h410202a08c8,
44'h60420024000,
44'h410200a08c8,
44'h600e0021000,
44'hb02e00210c9,
44'h61020423400,
44'h60420224800,
44'h600e0021000,
44'hb02e00210cd,
44'h21020523400,
44'h404202310e3,
44'h404200310e3,
44'h414202b10e3,
44'h414200b10e3,
44'h60420034000,
44'h60221034000,
44'h410602b10e5,
44'h60420034000,
44'h60221034000,
44'h410600b10e5,
44'h404202308e3,
44'h404200308e3,
44'h414202b08e3,
44'h414200b08e3,
44'h60420034000,
44'h60221034000,
44'h410602b08e5,
44'h60420034000,
44'h60221034000,
44'h410600b08e5,
44'h60221034000,
44'h60060031000,
44'hb00600310e5,
44'h60420234800,
44'h60223034000,
44'h60060031000,
44'hf00600310e9,
44'ha8120030001,
44'h60420034000,
44'h60224034000,
44'h60060030000,
44'hb00600300ee,
44'ha81200300f5,
44'h60420038000,
44'h60224034000,
44'h60060030000,
44'hb00600300f3,
44'h400000000ef,
44'hbc000020001,
44'h210008a3400,
44'ha8120020001,
44'h60420024000,
44'h600e0020000,
44'hb02e00200fa,
44'h61020563400,
44'ha81200200f5,
44'h60420028000,
44'h600e0020000,
44'hb02e00200ff,
44'h410205634fc
};

integer i;

always @(next_state, reset)
begin
    if (reset) begin
        out           <= state_info[0+:44];
        current_state <= 10'd0;
    end
    else begin
        out           <= state_info[44*next_state+:44];
        current_state <= next_state;
    end
end

endmodule
