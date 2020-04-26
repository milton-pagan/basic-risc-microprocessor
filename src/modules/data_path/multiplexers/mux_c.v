module mux_c(output reg [3:0] mult_output,
             input [3:0] data0,
             data2,
             input [1:0] mult_select);
always @(mult_select, data0, data2)
    case(mult_select)
        2'd0 : mult_output <= data0;
        2'd1 : mult_output <= 4'b1111;
        2'd2 : mult_output <= data2;
    endcase

endmodule
