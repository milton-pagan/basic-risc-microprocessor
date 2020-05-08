`include "src/modules/data_path/control_unit.v"
`include "src/modules/data_path/register_32_bit.v"

module control_unit_test();
    
    // Output
    wire FRld,
    RFld,
    IRld,
    MARld,
    MDRld,
    RW,
    MOV,
    SIG,
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
    SIG,
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
    
    register_32_bit instruction_register(ir_to_cu, instruction, IRld, clk);
    
    initial #1186 $finish;
    
    initial begin
        clk                = 0;
        repeat(300) #5 clk = ~clk;
    end
    
    initial fork
          MOC         = 1;
          cond        = 1;
          reset       = 1;
    #5    reset       = 0;
    
          instruction = 32'b11100010000000000001000000101000;   // 11 ADD
    #85   instruction = 32'b11100010000100000001000000101000;   // 10 ADDS
    #135  instruction = 32'b00001010000000000000000000000000;   // 12 BEQ
    #185  instruction = 32'b00001011000000000000000000000000;   // 13 BLEQ
    
    #245  instruction = 32'b11100101110000010010000000000001;   // 20 STRB Immediate Offset ADD
    #325  instruction = 32'b11100101010000010010000000000001;   // 30 STRB Immediate Offset SUB
    #405  instruction = 32'b11100101111000010010000000000001;   // 22 STRB Immediate Pre-Indexed ADD
    #485  instruction = 32'b11100101011000010010000000000001;   // 32 STRB Immediate Pre-Indexed SUB
    #565  instruction = 32'b11100100110000010010000000000001;   // 24 STRB Immediate Post-Indexed ADD
    #645  instruction = 32'b11100100010000010010000000000001;   // 34 STRB Immediate Post-Indexed SUB
    
    #725  instruction = 32'b11100111110000010010000000000011;   // 21 STRB Register Offset ADD
    #805  instruction = 32'b11100111010000010010000000000011;   // 31 STRB Register Offset SUB
    #885  instruction = 32'b11100111111000010010000000000011;   // 23 STRB Register Pre-Indexed ADD
    #965  instruction = 32'b11100111011000010010000000000011;   // 33 STRB Register Pre-Indexed SUB
    #1045 instruction = 32'b11100110110000010010000000000011;   // 27 STRB Register Post-Indexed ADD
    #1125 instruction = 32'b11100110010000010010000000000011;   // 37 STRB Register Post-Indexed SUB

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
    initial #1186 $display("\n|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--CU TEST FINISHED--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|\n");
endmodule
