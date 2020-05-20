module address_incrementer(output reg[31:0] inc_address, input[31:0] address, input inc_dec);

always @(address, inc_dec) begin
   inc_address = !inc_dec ? address - 4 : address + 4;
end

endmodule