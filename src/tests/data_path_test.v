`include "src/modules/data_path/data_path.v"

module data_path_test();
    
    wire[9:0] current_state;
    reg main_clk, reset;
    
    data_path data_path(current_state, main_clk, reset);

    integer fi, fo, i;
    reg[8:0] temp;
    reg[7:0] data;
    
    initial #500 $finish;
    
    initial begin
        main_clk                = 0;
        repeat(100) #5 main_clk = ~main_clk;
    end

    initial
    begin
        fi         = $fopen("res/ram_input_files/test_program.txt", "r");
        temp = 9'd0;
        while(!$feof(fi))
        begin
            i                          = $fscanf(fi, "%b", data);
            data_path.ram.memory[temp] = data;
            temp                       = temp + 1;
        end
        $fclose(fi);
    end

    initial begin
        reset <= 1;
        #6 reset = 0;
    end
    
   initial begin
       $monitor("%d %b %d", current_state, data_path.register_file.reg_to_mult[15], $time);
   end 
    
endmodule
