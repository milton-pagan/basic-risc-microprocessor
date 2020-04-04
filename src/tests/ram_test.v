`include "src/modules/ram.v"
module ram_test();
    
    // Outputs
    wire [31:0] data_out;
    wire mfc;
    
    // Inputs
    reg enable, read_write;
    reg [1:0] data_length;
    reg[8:0] address;
    reg [31:0] data_in;
    
    // Modules
    ram ram(data_out, mfc, enable, read_write, data_length, address, data_in);
    
    integer fi, fo, code, i;
    
    initial #500 $finish;
    
    initial
    begin
        fi = $fopen("res/test_files/ram_input_1.txt", "r");
        address = 9'd0;

    end
    
    // Monitoring
    
    initial begin
        $dumpfile("bin/dumpfiles/ram_test.vcd");
        $dumpvars(0, ram_test);
        
        $display("\n*** RAM TEST ***");
        $display ("\n\tdata_out data_in enable  read_write data_length address mfc \t\t   time");
        $monitor("%d %d \t   %d \t  %d \t\t %d \t%d\t %d %d", data_out, data_in, enable, read_write, data_length, address, mfc, $time);
    end
    
endmodule
