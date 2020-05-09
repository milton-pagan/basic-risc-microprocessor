`include "src/modules/data_path/data_path.v"

module data_path_test();

    // Initializing test
    wire [9:0] current_state;
    reg main_clk, reset;

    data_path data_path(current_state, main_clk, reset);

    integer fi, fo, i;
    reg [8:0] temp;
    reg [7:0] data;

    initial #500 $finish;

    // Starting Test
    initial $display("\n|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--STARTING DATA PATH TEST--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|");

    // Clock
    initial begin
        main_clk                    = 0;
        repeat (100) #5 main_clk    = ~main_clk;
    end

    initial
        begin
            fi = $fopen("res/ram_input_files/test_program.txt", "r");
            temp = 9'd0;
            while (!$feof(fi))
                begin
                    i = $fscanf(fi, "%b", data);
                    data_path.ram.memory[temp] = data;
                    temp++;
                end
            $fclose(fi);
        end

    initial begin
        reset <= 1;
        data_path.ram.memory[50] = 0;
        data_path.ram.memory[51] = 0;
        data_path.ram.memory[52] = 0;
        data_path.ram.memory[53] = 8'd5;
        data_path.ram.memory[54] = 0;
        data_path.ram.memory[55] = 0;
        data_path.ram.memory[56] = 0;
        data_path.ram.memory[57] = 8'd5;
        #6 reset = 0;
    end

    initial begin
        $display("\n    CS        PC         MAR         LR         R1         R2         R3         R5      ALU_OUT \t       Time");
        $monitor("\n %d %d %d %d %d %d %d %d %d %b %d %d %d %d",
            current_state,                                  // Current States
            data_path.register_file.reg_to_mult[15],        // PC
            data_path.address,                              // MAR
            data_path.register_file.reg_to_mult[14],        // LR
            data_path.register_file.reg_to_mult[1],         // R1
            data_path.register_file.reg_to_mult[2],         // R2
            data_path.register_file.reg_to_mult[3],         // R3
            data_path.register_file.reg_to_mult[5],         // R5
            data_path.alu_out,                              // ALU out
            data_path.ir,
            data_path.PA,
            data_path.B,
            data_path.SC,
            $time);                                         // Simulation Time
    end
    //Test Finished
    initial #500 $display("\n|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--DATA PATH TEST FINISHED--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|\n");


endmodule