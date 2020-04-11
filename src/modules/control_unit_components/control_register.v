module control_register(output reg fr_ld,
                        rf_ld,
                        ir_ld,
                        mar_ld,
                        mdr_ld,
                        md,
                        me,
                        read_write,
                        mov,
                        inv,
                        output reg [1:0] data_length,
                        select,
                        ma,
                        mb,
                        mc,
                        output reg [2:0] N,
                        output reg [4:0] op,
                        output reg [5:0] cr,
                        input clk,
                        input [33:0]data_in);
    
    always @(posedge clk)
    begin
        {N, inv, select, fr_ld, rf_ld, ir_ld, mar_ld, mdr_ld, read_write, mov, data_length, ma, mb, mc, md, me, op, cr} = data_in;
    end
    
endmodule
