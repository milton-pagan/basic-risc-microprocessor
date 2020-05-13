`include "src/modules/data_path/data_path.v"

module data_path_test();

    // Initializing test
    wire [9:0] current_state;
    reg main_clk, reset;

    data_path data_path(current_state, main_clk, reset);

    integer fi, fo, i;
    reg [8:0] temp;
    reg [7:0] data;

    initial #5000 $finish;

    // Starting Test
    initial $display("\n|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--STARTING DATA PATH TEST--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|");

    // Clock
    initial begin
        main_clk                    = 0;
        repeat (399) #5 main_clk    = ~main_clk;
    end

    // Precharge Memory
    initial
        begin
            fi = $fopen("res/ram_input_files/testcode_arm1.txt", "r");
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
        #6 reset = 0;
    end

    initial begin

        $display("\n    CS        PC         MAR         LR         R1         R2         R3         R5      ALU_OUT         Instruction Register  \t         ZNCV \t\t       Time");
        $monitor("\n %d %d %d %d %d %d %d %d %d    %b \t %b",
            current_state,                                  // Current States
            data_path.register_file.reg_to_mult[15],        // PC
            data_path.address,                              // MAR
            data_path.register_file.reg_to_mult[14],        // LR
            data_path.register_file.reg_to_mult[1],         // R1
            data_path.register_file.reg_to_mult[2],         // R2
            data_path.register_file.reg_to_mult[3],         // R3
            data_path.register_file.reg_to_mult[5],         // R5
            data_path.alu_out,                              // ALU out
            data_path.ir,                                   // IR
            data_path.flags,                                // FLAGS {ZNCV}
//            $time);                                         // Simulation Time
            );
        #2000
        $display("\n\n***************** MEMORY CONTENT *****************");
        for(i = 0; i < 512; i += 4) begin
            $display("\nLOC[%0d-%0d]\t %b%b%b%b", i, i+3, data_path.ram.memory[i], data_path.ram.memory[i + 1], data_path.ram.memory[i + 2], data_path.ram.memory[i + 3]);
        end


    end
    //Test Finished
    initial #5000 $display("\n|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--DATA PATH TEST FINISHED--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|\n");


endmodule