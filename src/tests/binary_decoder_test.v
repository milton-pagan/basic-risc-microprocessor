module binary_decoder_test;
    reg [3:0]in;
    reg load_enable;
    wire [15:0] out;

    binary_decoder decoder(out, in, load_enable);

    initial #100 $finish;

    initial fork
        load_enable = 1'b0; #5 load_enable = 1'b1; #90 load_enable = 1'b0; 
        in = 4'b0000;
        #10 repeat(18) #5 in = in + 4'b0001;
    join
    
    initial begin
        $display("\n*** BINARY DECODER TEST ***");
        $display ("\n input  load_enable        output \t\t\ttime");
        $monitor(" %b        %b        %b   %d", in, load_enable, out, $time);
    end


endmodule