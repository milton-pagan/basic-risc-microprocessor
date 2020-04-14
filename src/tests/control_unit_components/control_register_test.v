`include "src/modules/control_unit_components/control_register.v"
`include "src/modules/control_unit_components/microstore.v"

module control_register_test();
    
    // Outputs
    wire fr_ld,
    rf_ld,
    ir_ld,
    mar_ld,
    mdr_ld,
    md,
    me,
    read_write,
    mov,
    inv;
    wire [1:0] data_length,
    select,
    ma,
    mb,
    mc;
    wire [2:0] N;
    wire [4:0] op;
    wire [5:0] cr;
    
    // Inputs
    reg clk, reset;
    wire [33:0] in;
    reg[9:0] next_state;
    
    // Modules
    control_register control_register(fr_ld,
    rf_ld,
    ir_ld,
    mar_ld,
    mdr_ld,
    md,
    me,
    read_write,
    mov,
    inv,
    data_length,
    select,
    ma,
    mb,
    mc,
    N,
    op,
    cr,
    clk,
    in);
    microstore microstore(in, next_state, reset);
    
    initial #500 $finish;
    
    initial begin
        clk                = 1;
        repeat(100) #5 clk = ~clk;
    end
    
    initial
    begin
        reset = 1;
        #5 next_state = 9'd4;
        #5 reset = 0;
        #10 next_state = 9'd20; 
    end
    
    initial begin
        $display("\n*** CONTROL REGISTER TEST ***");
        $display ("\n input");
        $monitor("%h %b %b %b %b %b %b %b %b %b %b %b %b %b %b %b %b %b %b  %d", in, N, inv, select, fr_ld, rf_ld, ir_ld, mar_ld, mdr_ld, read_write, mov, data_length, ma, mb, mc, md, me, op, cr, $time);
    end
    
endmodule
