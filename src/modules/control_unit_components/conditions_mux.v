module conditions_mux(output reg out,
                      input in0,
                      in1,
                      in2,
                      in3,
                      input[1:0] select);
    
    always @(select, in0, in1, in2, in3)
        case(select)
            2'b00:  out = in0;
            2'b01:  out = in1;
            2'b10:  out = in2;
            2'b11:  out = in3;
        endcase
    
endmodule
