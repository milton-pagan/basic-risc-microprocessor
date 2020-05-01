`include "src/modules/data_path/data_path.v"

module data_path_test();
    
    wire[9:0] current_state;
    reg main_clk, reset;
    
    data_path data_path(current_state, main_clk, reset);
    
    initial #500 $finish;
    
    initial begin
        main_clk                = 0;
        repeat(100) #5 main_clk = ~main_clk;
    end
    
    initial begin
        data_path.ram.memory[0] <= 8'b11100101;
        data_path.ram.memory[1] <= 8'b11000001;
        data_path.ram.memory[2] <= 8'b00100000;
        data_path.ram.memory[3] <= 8'b00000001;
        reset <= 1;
        #6 reset = 0;
    end
    
   initial begin
       $monitor("%d %d", current_state, $time);
   end 
    
endmodule
