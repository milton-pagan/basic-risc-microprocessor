`define NUM_STATES 50

module microstore(output reg [33:0] out,
                  input [9:0] next_state);

/*
    Contains control signal for all bits. **state_info[0] corresponds to State 0, state_info[1] to State 1, etc.**
    **MUST FILL UNUSED STATES WITH ZEROS SO ARRAY POSITIONS CORRESPOND TO THEIR STATE**
*/
parameter[0:34 * `NUM_STATES - 1] state_info = {     
34'h18401b4c0,  // 0
34'h1810413c0,
34'h184643580,
34'h2c2600003,
34'h210000001,
34'h000000000,
34'h000000000,
34'h000000000,
34'h000000000,
34'h000000000,
34'h000000000,  // 10
34'h000000000,
34'h000000000,
34'h000000000,
34'h000000000,
34'h000000000,
34'h000000000,
34'h000000000,
34'h000000000,
34'h000000000,
34'h181009800,  // 20
34'h181001800,
34'h18500d800,
34'h185005800,
34'h181001bc0,
34'h180821bc0,
34'h18420d800,
34'h181001bc0,
34'h180821bc0,
34'h184205800,
34'h181009880,  // 30
34'h181001880,
34'h18500d880,
34'h185005880,
34'h181001bc0,
34'h180821bc0,
34'h18420d880,
34'h181001bc0,
34'h180821bc0,
34'h184205880,
34'h180821bc0,  // 40
34'h180200800,
34'h240200801,
34'h000000000,
34'h000000000,
34'h000000000,
34'h000000000,
34'h000000000,
34'h000000000,
34'h000000000  
};

integer i;

always @(next_state)
begin
    out = state_info[34*next_state+:34];
end


endmodule


   /*  case (next_state)
        
        10'd0: out  = 34'h18401b4c0;     // Init
        10'd1: out  = 34'h1810413c0;     // Begin Fetch Sequence
        10'd2: out  = 34'h184643580;
        10'd3: out  = 34'h2c2600003;
        10'd4: out  = 34'h210000001;     // Decode
        10'd10: out = 0;
        10'd11: out = 0;
        10'd12: out = 0;
        10'd13: out = 0;
        10'd20: out = 34'h181009800;    // STRB Immediate Offset
        10'd21: out = 34'h180821bc0;
        10'd22: out = 34'h180200800;
        10'd23: out = 34'h240200801;
        10'd24: out = 34'h181001800;    // STRB Register Offset
        10'd25: out = 34'h180821bc0;
        10'd26: out = 34'h180200800;
        10'd27: out = 34'h240200801;
        10'd28: out = 34'h18500d800;    // STRB Immediate Pre-Indexed
        10'd29: out = 34'h180821bc0;
        10'd30: out = 34'h180200800;
        10'd31: out = 34'h240200801;
        10'd32: out = 34'h185005800;    // STRB Register Pre-Indexed
        10'd33: out = 34'h180821bc0;
        10'd34: out = 34'h180200800;
        10'd35: out = 34'h240200801;
        10'd36: out = 34'h18100dbc0;    // STRB Immediate Post-Indexed
        10'd37: out = 34'h18082dbc0;
        10'd38: out = 34'h18420d800;
        10'd39: out = 34'h24020c801;
        10'd40: out = 34'h181005bc0;    // STRB Register Post-Indexed
        10'd41: out = 34'h180825bc0;
        10'd42: out = 34'h184205800;
        10'd43: out = 34'h240204801;
    endcase */