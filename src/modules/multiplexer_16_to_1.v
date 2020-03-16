module multiplexer_16_to_1(output reg [31:0] mult_output, input [31:0] data0, data1, data2, data3, data4, data5, data6, data7
    , data8, data9, data10, data11, data12, data13, data14, data15, input [3:0] mult_select);

    always @(mult_select, data0, data1, data2, data3, data4, data5, data6, data7
    , data8, data9, data10, data11, data12, data13, data14, data15)
        case(mult_select)
            4'd0 : mult_output <= data0;
            4'd1 : mult_output <= data1;
            4'd2 : mult_output <= data2;
            4'd3 : mult_output <= data3;
            4'd4 : mult_output <= data4;
            4'd5 : mult_output <= data5;
            4'd6 : mult_output <= data6;
            4'd7 : mult_output <= data7;
            4'd8 : mult_output <= data8;
            4'd9 : mult_output <= data9;
            4'd10 : mult_output <= data10;
            4'd11 : mult_output <= data11;
            4'd12 : mult_output <= data12;
            4'd13 : mult_output <= data13;
            4'd14 : mult_output <= data14;
            4'd15 : mult_output <= data15;
            default : mult_output <= 32'd0;
        endcase

endmodule