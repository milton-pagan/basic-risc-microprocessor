module ram(output reg[31:0] data_out,
           output mfc,
           input enable,
           read_write,
           input[1:0] data_length,
           input[6:0] address,
           input[31:0] data_in);

reg [31:0] memory[0:127];
always @(enable, read_write)
    if (enable)
        if (read_write) data_out = memory[address];
        else memory[address]     = data_in;

endmodule
