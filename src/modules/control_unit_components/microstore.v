`define NUM_STATES 50

module microstore(output reg [33:0] out,
                  input [9:0] next_state,
                  input reset);
/*
    state_info contains control signal bits for all states. **state_info[0] corresponds to State 0, state_info[1] to State 1, etc.**
    **MUST FILL UNUSED STATES WITH ZEROS SO ARRAY POSITIONS CORRESPOND TO THEIR STATE***/
parameter[0:34 * `NUM_STATES - 1] state_info = {     
    34'h18401b4c0,  // 0
    34'h1810413c0,
    34'h184643580,
    34'h2c2600003,
    34'h250000001,
    34'h000000000,  // 5
    34'h000000000,
    34'h000000000,
    34'h000000000,
    34'h000000000,
    34'h08c008000,  // 10
    34'h084008000,
    34'h39004b5cd,
    34'h10004b5c1,
    34'h000000000,
    34'h000000000,  // 15
    34'h000000000,
    34'h000000000,
    34'h000000000,
    34'h000000000,
    34'h101009828,  // 20
    34'h101001828,
    34'h10500d828,
    34'h105005828,
    34'h181001bc0,
    34'h180821bc0,  // 25
    34'h10420d82a,
    34'h181001bc0,
    34'h180821bc0,
    34'h10420582a,
    34'h1010098a8,  // 30
    34'h1010018a8,
    34'h10500d8a8,
    34'h1050058a8,
    34'h181001bc0,
    34'h180821bc0,  // 35
    34'h10420d8aa,
    34'h181001bc0,
    34'h180821bc0,
    34'h1042058aa,
    34'h180821bc0, // 40
    34'h180200800,
    34'h3c020082a,
    34'h000000000,
    34'h000000000,
    34'h000000000, // 45
    34'h000000000,
    34'h000000000,
    34'h000000000,
    34'h000000000  
};

integer i;

always @(next_state, reset)
begin
    if(reset)
        out = state_info[0+:34];
    else
        out = state_info[34*next_state+:34];
end

endmodule