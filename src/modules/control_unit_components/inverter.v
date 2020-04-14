module inverter(output reg out,
                input in,
                inv);

    always @(in, inv)
        out = inv ? !in: in;
        
endmodule
