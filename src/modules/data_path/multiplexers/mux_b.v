module mux_b(output reg [31:0] mult_output,
             input [31:0] data0,
             data1,
             data2,
             input [1:0] mult_select);
always @(mult_select, data0, data1, data2)
    case(mult_select)
        4'd0 : mult_output <= data0;
        4'd1 : mult_output <= data1;
        4'd2 : mult_output <= data2;
    endcase

endmodule
