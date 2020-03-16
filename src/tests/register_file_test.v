module register_file_test;
    wire [31:0] port_a, port_b;
    reg[3:0] a_select, b_select;
    reg[31:0] data_in;
    reg[3:0] decoder_control;
    reg load_enable, clk;
    register_file register_file(port_a, port_b, a_select, b_select, data_in, decoder_control, load_enable, clk);

    initial #500 $finish;

    initial begin
        clk = 1'b0;
        repeat(500) #5 clk = ~clk;
    end


    initial fork
        // Write to Reg 0 and select in Port_A 
        data_in = 32'h00000001;
        #10 load_enable = 1'b1;
        decoder_control = 4'd0;
        #15 a_select = 4'd0;

        //Try changing contents of Reg 0 while load_enable is still on
        #20 data_in = 32'h0000000B;

        // Try writing to same register but with load_enable off
        #30 data_in = 32'h0000000A;
        #30 load_enable = 1'b0;

        // Write to Reg 7 and select in Port_B
        #32 load_enable = 1'b1; #36 load_enable = 1'b0;
        #30 decoder_control = 4'd7;
        #35 b_select = 4'd7;

        // Write to Reg 12 and select in both Ports
        #40 data_in = 32'h0000000C;
        #40 decoder_control = 4'd12; 
        #45 a_select = 4'd12;
        #45 b_select = 4'd12;
        #43 load_enable = 1'b1;
    join


    initial begin
        $display("\n*** REGISTER FILE TEST ***");
        $display ("\ndata_in  decoder_control  load_enable  a_select  b_select  port_a  port_b                     time");
        $monitor("%h     %b             %b         %b      %b   %h %h  %d", data_in, decoder_control, load_enable, a_select, b_select, port_a, port_b, $time);
    end 
endmodule