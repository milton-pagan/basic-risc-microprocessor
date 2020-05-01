`define NUM_STATES 50

module microstore(output reg[37:0] out,
                  output reg [9:0] current_state,
                  input[9:0] next_state,
                  input reset);
/* state_info contains control signal bits for all states. **state_info[0] corresponds to State 0, state_info[1] to State 1, etc.**
 **MUST FILL UNUSED STATES WITH ZEROS SO ARRAY POSITIONS CORRESPOND TO THEIR STATE***/
parameter[0:38 * `NUM_STATES - 1] state_info = {
38'h8401b4c00,  // 0
38'h1810413c00,
38'h1847435800,
38'h2c27000003,
38'h2500000001,
38'h0000000000, // 5
38'h0000000000,
38'h0000000000,
38'h0000000000,
38'h0000000000,
38'h08c0080000, // 10
38'h0840080000,
38'h08404b5c00,
38'h1040473c0c,
38'h0000000000,
38'h0000000000,  // 15
38'h0000000000,
38'h0000000000,
38'h0000000000,
38'h0000000000,
38'h1010098028, // 20
38'h1010018028,
38'h10500d8028,
38'h1050058028,
38'h181001bc00,
38'h180821bc00, // 25
38'h10420d802a,
38'h181001bc00,
38'h180821bc00,
38'h104205802a,
38'h1010098828, // 30
38'h1010018828,
38'h10500d8828,
38'h1050058828,
38'h181001bc00,
38'h180821bc00, // 35
38'h10420d882a,
38'h181001bc00,
38'h180821bc00,
38'h104205882a,
38'h180821bc00, // 40
38'h1802008000,
38'h3c0200802a,
38'h101109803f,
38'h101101803f,
38'h10510d803f, // 45
38'h105105803f,
38'h181101bc00,
38'h180921bc00,
38'h10430d8041,
38'h181101bc00, // 50
38'h180921bc00,
38'h1043058041,
38'h101109883f,
38'h101101883f,
38'h10510d883f, // 55
38'h105105883f,
38'h181101bc00,
38'h180921bc00,
38'h10430d8841,
38'h181101bc00, // 60
38'h180921bc00,
38'h1043058841,
38'h180921bc00,
38'h1803008000,
38'h3c03008041, // 65
38'h0000000000,
38'h0000000000,
38'h0000000000,
38'h0000000000,
38'h0000000000  // 70
};

integer i;

always @(next_state, reset)
begin
    if (reset) begin
        out           <= state_info[0+:38];
        current_state <= 10'd0;
    end
    else begin
        out           <= state_info[38*next_state+:38];
        current_state <= next_state;
    end
end

endmodule
