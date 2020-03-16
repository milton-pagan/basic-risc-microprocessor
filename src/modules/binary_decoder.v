module binary_decoder(output reg [15:0] decoder_output, input [3:0] decoder_control, input load_enable);

always @(load_enable, decoder_control)
    if(load_enable)
        case(decoder_control)
            4'd0 : decoder_output <= 16'b1000000000000000;
            4'd1 : decoder_output <= 16'b0100000000000000;
            4'd2 : decoder_output <= 16'b0010000000000000;
            4'd3 : decoder_output <= 16'b0001000000000000;
            4'd4 : decoder_output <= 16'b0000100000000000;
            4'd5 : decoder_output <= 16'b0000010000000000;
            4'd6 : decoder_output <= 16'b0000001000000000;
            4'd7 : decoder_output <= 16'b0000000100000000;
            4'd8 : decoder_output <= 16'b0000000010000000;
            4'd9 : decoder_output <= 16'b0000000001000000;
            4'd10 : decoder_output <= 16'b0000000000100000;
            4'd11 : decoder_output <= 16'b0000000000010000; 
            4'd12 : decoder_output <= 16'b0000000000001000; 
            4'd13 : decoder_output <= 16'b0000000000000100; 
            4'd14 : decoder_output <= 16'b0000000000000010;
            4'd15 : decoder_output <= 16'b0000000000000001;
            default : decoder_output <= 16'd0;
        endcase
    else
        decoder_output <= 16'd0;
endmodule