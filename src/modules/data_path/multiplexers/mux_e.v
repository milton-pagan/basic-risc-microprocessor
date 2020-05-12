module mux_e(output reg [31:0] mult_output,
                           input [31:0] data0,
                           data1,
                           input mult_select);
always @(mult_select, data0, data1)
    if (!mult_select)
        mult_output <= data0;
    else
        mult_output <= data1;
endmodule
