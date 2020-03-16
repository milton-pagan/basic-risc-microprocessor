module multiplexer_16_to_1_test;
    wire[31:0] out;
    reg[3:0] control;
    reg[31:0] data1, data2, data3, data4, data5, data6, data7, 
        data8, data9, data10, data11, data12, data13, data14, data15, data16;

    multiplexer_16_to_1 multiplexer(out, data1, data2, data3, data4, data5, 
        data6, data7, data8, data9, data10, data11, data12, data13, 
            data14, data15, data16, control);

    initial #100 $finish;

    initial fork
        control = 4'd0; #5 control = 4'd1; #20 control = 4'd14;
        data1 = 32'h00000001; #10 data1 = 32'h00000001;
        data2 = 32'h0000000A; #13 data2 = 32'h0000000B;
        #13 data15 = 32'h00000BBB;
    join


    initial begin
        $display("\n*** MULTIPLEXER TEST ***");
        $display ("\n control  data1\t   data2\tdata3\t data4\t data5\t data6\t data7\t data8\t data9\t data10\t data11\t data12\t data13\t data14\t data15\t data16\t output\t\ttime");
        $monitor(" %b   %h  %h  %h  %h  %h  %h  %h  %h  %h  %h  %h  %h  %h  %h  %h  %h %h %d", control, data1, data2, 
                    data3, data4, data5, data6, data7, data8, data9, 
                        data10, data11, data12, data13, data14, data15, 
                            data16, out, $time);
    end
endmodule