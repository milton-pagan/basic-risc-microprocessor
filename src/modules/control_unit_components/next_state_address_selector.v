    module next_state_address_selector(output reg[1:0] mux_select,
                                   input[2:0] N,
                                   input sts);


always @(N, sts) begin
    case (N)
        3'b000: mux_select = 2'b00;
        3'b001: mux_select = 2'b01;
        3'b010: mux_select = 2'b10;
        3'b011: mux_select = 2'b11;
        
        3'b100: begin
            if (!sts) mux_select = 2'b00;
            else    mux_select  = 2'b10;
        end
        
        3'b101: begin
            if (!sts) mux_select = 2'b11;
            else    mux_select  = 2'b10;
        end
        
        3'b110: begin
            if (!sts) mux_select = 2'b11;
            else    mux_select  = 2'b00;
        end
        
        3'b111: begin
            if (!sts) mux_select = 2'b01;
            else    mux_select  = 2'b10;
        end
    endcase
end

endmodule
