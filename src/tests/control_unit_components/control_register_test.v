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
    wire [9:0] cr, current_state;
    
    // Inputs
    reg clk, reset;
    wire [37:0] in;
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
    microstore microstore(in, current_state, next_state, reset);
    
    initial #500 $finish;
    
    initial begin
        clk                = 0;
        repeat(100) #5 clk = ~clk;
    end
    
    initial
    begin
        reset = 1;
        #5 next_state = 9'd4;
        #6 reset = 0;
        #10 next_state = 9'd20; 
    end
    
    initial begin
        $display("\n*** CONTROL REGISTER TEST ***");
        $display ("\n input");
        $monitor("%d %b %b %b %b %b %b %b %b %b %b %b %b %b %b %b %b %b %b  %d", next_state, N, inv, select, fr_ld, rf_ld, ir_ld, mar_ld, mdr_ld, read_write, mov, data_length, ma, mb, mc, md, me, op, cr, $time);
    end
    
endmodule
