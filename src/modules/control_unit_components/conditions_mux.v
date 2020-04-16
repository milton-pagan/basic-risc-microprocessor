module conditions_mux(output reg out,
                      input in0,
                      in1,
                      input[1:0] select);
    
    always @(select, in0, in1)
        case(select)
            2'b00:  out = in0;
            2'b01:  out = in1;
        endcase
    
endmodule
