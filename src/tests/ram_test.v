`include "src/modules/data_path/ram.v"
module ram_test();
    
    // Outputs
    wire [31:0] data_out;
    wire mfc;
    
    // Inputs
    reg enable, read_write, sig;
    reg [1:0] data_length;
    reg[8:0] address;
    reg [31:0] data_in;
    
    // Modules
    ram ram1(data_out, mfc, enable, read_write, sig, data_length, address, data_in);
    
    // Other
    integer fi, fo, i;
    reg [7:0]data;
    
    initial #500 $finish;
    
    // Precharge memory
    initial
    begin
        fi         = $fopen("res/ram_input_files/ram_input_1.txt", "r");
        address    = 9'd0;
        read_write = 1'b0;
        enable     = 1'b0;
        sig = 0;
        while(!$feof(fi))
        begin
            i                    = $fscanf(fi, "%d", data);
            ram1.memory[address] = data;
            address              = address + 1;
        end
        $fclose(fi);
    end
    
    // Read precharged memory
    initial
        #5 begin
        fo          = $fopen("res/ram_output_files/mem_content.txt");
        address     = 9'd0;
        read_write  = 1'b1;
        data_length = 2'b0;
        repeat(16)
        begin
            enable     = 1'b1;
            #5 enable  = 1'b0;
            #5 address = address + 1;
        end
    end
    
    // Write
    initial
        #170 begin
        read_write = 1'b0;
    
    // Write a byte to loc 0
    begin
    data_length = 2'd0;
    address     = 9'd0;
    data_in     = 32'h000000FF;
    sig = 1;
    enable      = 1'b1;
    #5 enable   = 1'b0;
    end
    // Write halfword to loc 2
    #10 begin
    data_length = 2'd1;
    address     = 9'd2;
    data_in     = 32'h0000FFFF;
    enable      = 1'b1;
    #5 enable   = 1'b0;
    end
    
    // Write halfword to loc 4
    #20 begin
    data_length = 2'd1;
    address     = 9'd4;
    data_in     = 32'h00000800;
    enable      = 1'b1;
    #5 enable   = 1'b0;
    end
    
    // Write word to loc 8
    #30 begin
    data_length = 2'd2;
    address     = 9'd8;
    data_in     = 32'h00100000;
    enable      = 1'b1;
    #5 enable   = 1'b0;
    end
    end
    
    // Read
    initial
        #255 begin
        read_write = 1'b1;
        data_in    = 0;
    
    // Read a byte from loc 0
    begin
    data_length = 2'd0;
    address     = 9'd0;
    enable      = 1'b1;
    #5 enable   = 1'b0;
    end
    // Read a halfword from loc 2
    #10 begin
    data_length = 2'd1;
    address     = 9'd2;
    enable      = 1'b1;
    #5 enable   = 1'b0;
    end
    
    // Read a halfword from loc 4
    #20 begin
    data_length = 2'd1;
    address     = 9'd4;
    enable      = 1'b1;
    #5 enable   = 1'b0;
    end
    
    // Read a word form loc 8
    #30 begin
    data_length = 2'd2;
    address     = 9'd8;
    enable      = 1'b1;
    #5 enable   = 1'b0;
    end
    end
    
    // Monitoring
    initial begin
        $dumpfile("bin/dumpfiles/ram_test.vcd");
        $dumpvars(0, ram_test);
        
        $display("\n*** RAM TEST ***");
        $display ("\ndata_out data_in  enable read_write data_length address mfc \t\t   time");
        $monitor("%b %h   %b \t     %b \t\t %b \t  %h\t %b %b %d", data_out, data_in, enable, read_write, data_length, address, mfc, sig, $time);
    end
    
    always @(negedge enable)
    begin
        $fdisplay(fo, "data out %d = %d  %d", address, data_out, $time);
    end
    
endmodule
