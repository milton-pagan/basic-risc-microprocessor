module mux_b(output reg [31:0] mult_output,
             input [31:0] data0,
             data1,
             data2,
             data3,
             input [2:0] mult_select);
always @(mult_select, data0, data1, data2, data3)
    case(mult_select)
        3'd0 : mult_output <= data0;
        3'd1 : mult_output <= data1;
        3'd2 : mult_output <= data2;
        3'd3 : mult_output <= 32'd0;
        3'd4 : mult_output <= data3;
    endcase

endmodule
