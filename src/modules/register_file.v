module register_file(
    output [31:0] port_a, port_b, 
    input[3:0] a_select, b_select,
    input[31:0] port_c,
    input[3:0] decoder_control,
    input load_enable,
    input clk
);

    wire[15:0] decoder_to_reg;
    wire[31:0] reg_to_mult[15:0];

    binary_decoder decoder(decoder_to_reg, decoder_control, load_enable);
    multiplexer_16_to_1 multiplexer_a(port_a, reg_to_mult[0], reg_to_mult[1], reg_to_mult[2], reg_to_mult[3], reg_to_mult[4], reg_to_mult[5],
        reg_to_mult[6], reg_to_mult[7], reg_to_mult[8], reg_to_mult[9], reg_to_mult[10], reg_to_mult[11], reg_to_mult[12], reg_to_mult[13],
            reg_to_mult[14], reg_to_mult[15], a_select);
    multiplexer_16_to_1 multiplexer_b(port_b, reg_to_mult[0], reg_to_mult[1], reg_to_mult[2], reg_to_mult[3], reg_to_mult[4], reg_to_mult[5],
        reg_to_mult[6], reg_to_mult[7], reg_to_mult[8], reg_to_mult[9], reg_to_mult[10], reg_to_mult[11], reg_to_mult[12], reg_to_mult[13],
            reg_to_mult[14], reg_to_mult[15], b_select);
    generate
        genvar i;
        for (i=0; i<16; i=i+1) 
        begin
            reg_32_bit reg_i(
                reg_to_mult[15-i]
                , port_c
                , decoder_to_reg[i]
                , clk
            );
        end
    endgenerate

endmodule