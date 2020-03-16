module reg_32_bit(output reg [31:0] data_out, input [31:0] data_in, input load_enable, clk, clr);

always @(posedge clk, negedge clr)
    if(!clr) data_out <= 32'h00000000;
    else if(load_enable) data_out <= data_in;
endmodule