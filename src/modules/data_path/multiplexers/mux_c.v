module mux_c(output reg [3:0] mult_output,
             input [3:0] data0,
             data2,
             data4,
             data5,
             input [2:0] mult_select);
always @(mult_select, data0, data2, data4, data5)
    case(mult_select)
        3'd0 : mult_output <= data0;
        3'd1 : mult_output <= 4'b1111;
        3'd2 : mult_output <= data2;
        3'd3 : mult_output <= 4'b1110;
        3'd4 : mult_output <= data4;
        3'd5 : mult_output <= data5;
    endcase

endmodule
