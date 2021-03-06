module control_register(output reg fr_ld,
                        rf_ld,
                        ir_ld,
                        mar_ld,
                        mdr_ld,
                        md,
                        me,
                        read_write,
                        mov,
                        sig,
                        inv,
                        output reg [1:0] data_length,
                        select,
                        ma,
                        mb,
                        output reg [2:0] mc,
                        output reg [2:0] N,
                        output reg [4:0] op,
                        output reg [9:0] cr,
                        output reg [9:0] curr_state,
                        input clk,
                        input [39:0] data_in,
                        input [9:0] current_state);
    
    always @(posedge clk)
    begin
        {N, inv, select, fr_ld, rf_ld, ir_ld, mar_ld, mdr_ld, read_write, mov, data_length, sig, ma, mb, mc, md, me, op, cr} <= data_in;
        curr_state <= current_state;
    end
    
endmodule
