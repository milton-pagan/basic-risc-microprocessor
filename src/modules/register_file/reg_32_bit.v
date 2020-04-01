module reg_32_bit(
    output reg [31:0] data_out, 
    input [31:0] data_in,
    input load_enable, clk
);

always @(posedge clk)
    if(load_enable) data_out <= data_in;
endmodule