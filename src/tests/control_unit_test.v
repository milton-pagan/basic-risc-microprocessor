`include "src/modules/data_path/control_unit.v"
`include "src/modules/data_path/instruction_register.v"

module control_unit_test();
    
    // Output
    wire FRld,
    RFld,
    IRld,
    MARld,
    MDRld,
    RW,
    MOV,
    Cin,
    MD,
    ME;
    wire[1:0] MA,
    MB,
    MC,
    DL;
    wire [4:0] OP;
    wire[9:0] current_state;
    wire [31:0] ir_to_cu;
    
    //Input
    reg MOC,
    clk,
    cond,
    reset;
    reg[31:0] instruction;
    
    
    // Modules
    control_unit control_unit(FRld,
    RFld,
    IRld,
    MARld,
    MDRld,
    RW,
    MOV,
    Cin,
    MD,
    ME,
    MA,
    MB,
    MC,
    DL,
    OP,
    current_state,
    MOC,
    clk,
    cond,
    reset,
    ir_to_cu);
    
    instruction_register instruction_register(ir_to_cu, instruction, IRld, clk);
    
    initial #600 $finish;
    
    initial begin
        clk                = 0;
        repeat(200) #5 clk = ~clk;
    end
    
    initial fork
    MOC                      = 1;
    cond                     = 1;
    reset                    = 1;
    /* instruction           = 32'b11100101110000010010000000000001; // STRB Immediate Offset ADD */
    #5   reset               = 0;
    /*     #115  instruction = 32'b11100101010000010010000000000001; // Immediate Offset SUB
     #195  instruction       = 32'b11100101111000010010000000000001; // Immediate Pre-Indexed ADD
     #275  instruction       = 32'b11100101011000010010000000000001; // Immediate Pre-Indexed SUB */
    instruction              = 32'b11100010000000000001000000101000; // ADD 11
    #85  instruction         = 32'b11100010000100000001000000101000; // ADDS 10
    #135  instruction        = 32'b00001010000000000000000000000000; // BEQ 12
    #185  instruction        = 32'b00001011000000000000000000000000; // BLEQ 13
    join
    
    // Starting Test
    initial $display("\n|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--CONTROL UNIT TEST--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|\n");
    
    
    initial #5
    begin
    
    $display("\t          TIME  CS  FRld   RFld   IRld   MARld   MDRld   R/W   MOV   DL   MA   MB   MC   MD   ME    OP     Cond   MOC  RST       Instruction Register\n");
    $monitor(
    "%d  %d    %b      %b      %b      %b       %b      %b     %b    %b   %b   %b   %b   %b    %b    %b     %b     %b    %b   %b",
    $time, current_state, FRld, RFld, IRld, MARld, MDRld, RW, MOV, DL, MA, MB, MC, MD, ME, OP, cond, MOC, reset, ir_to_cu);
    end
    
    //Test Finished
    initial #600 $display("\n|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--CU TEST FINISHED--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|\n");
    
endmodule
