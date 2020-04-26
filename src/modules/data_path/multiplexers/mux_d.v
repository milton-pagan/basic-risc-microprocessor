module mux_d(output reg [4:0] mult_output,
             input [4:0] data0,
             input [3:0] data1,
             input mult_select);

always @(mult_select, data0, data1)
    if (!mult_select)
        mult_output <= data0;
    else
        mult_output <= {1'b0, data1};
endmodule
