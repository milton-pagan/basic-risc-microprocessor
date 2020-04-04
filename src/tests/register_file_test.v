`include "src/modules/register_file.v"
module register_file_test();
    // Outputs
    
    wire [31:0] port_a, port_b;
    
    // Inputs
    
    reg[3:0] a_select, b_select;
    reg[31:0] port_c;
    reg[3:0] decoder_control;
    reg load_enable, clk;
    
    // Modules
    
    register_file register_file(port_a, port_b, a_select, b_select, port_c, decoder_control, load_enable, clk);
    
    initial #500 $finish;
    
    initial begin
        clk                = 1'b0;
        repeat(500) #5 clk = ~clk;
    end
    
    // Main test
    
    initial fork
    // Write into all 16 registers
    load_enable     = 4'd1;
    port_c          = 32'd0;
    decoder_control = 4'd0;
    
    repeat(15) #10
    begin
    decoder_control = decoder_control + 4'd1;
    port_c          = port_c + 32'd1;
    end
    
    /*  Verify register content through Ports A and B
     Even register will be shown on Port A and odd ones on Port B
     */
    
    #160
    begin
    load_enable <= 4'd0;
    port_c      <= 32'd0;
    decoder_control = 4'd0;
    
    a_select <= 16'd0;
    b_select <= 16'd1;
    end
    #160
    repeat(7) #10
    begin
    a_select = a_select + 16'd2;
    b_select = b_select + 16'd2;
    end
    
    // Change value in R10 and select in Port A
    #240
    begin
    port_c          <= 32'd50;
    decoder_control <= 4'd10;
    load_enable     <= 1;
    a_select        <= 4'd10;
    end
    
    
    join
    
    // Monitoring
    
    initial begin
        $dumpfile("bin/dumpfiles/register_file_test.vcd");
        $dumpvars(0, register_file_test);
        
        $display("\n*** REGISTER FILE TEST ***");
        $display ("\n      port_c decoder_control load_enable a_select b_select     port_a    port_b                 time");
        $monitor("%d         %d             %b         %d      %d   %d %d  %d", port_c, decoder_control, load_enable, a_select, b_select, port_a, port_b, $time);
    end
endmodule
