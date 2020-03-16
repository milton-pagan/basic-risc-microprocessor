module reg_32_bit_test;
    reg [31:0] in;
    reg clk, load_enable, clr;
    wire [31:0] out;
    reg_32_bit register(out, in, load_enable, clk, clr);

    initial #100 $finish;

    initial begin
    clk = 1'b0;
    repeat(100) #5 clk = ~clk;
    end

    initial fork
        clr = 1'b1; #1 clr = ~clr; #2 clr = ~clr; 
        in = 32'h0000000A; #30 in = 32'h0000000B; #40 in = 32'h0000000C; 
        load_enable = 1'b0; #15 load_enable = 1'b1; #40 load_enable = 1'b0;  
    join

    initial begin
        $display("\n*** 32 BIT REGISTER TEST ***");
        $display ("\n input        load_enable        output        time");
        $monitor(" %h        %b        %h        %d", in, load_enable, out, $time);
    end 
endmodule