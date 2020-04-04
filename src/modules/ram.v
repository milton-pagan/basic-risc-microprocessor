module ram(output reg[31:0] data_out,
           output reg mfc,
           input enable,
           read_write,
           input [1:0] data_length,
           input[8:0] address,
           input[31:0] data_in);

parameter BYTE       = 2'd0;
parameter HALFWORD   = 2'd1;
parameter WORD       = 2'd2;
parameter DOUBLEWORD = 2'd3;
integer temp;

reg [7:0] memory[0:511];
always @(enable, read_write)
    if (enable)
    begin
        mfc <= 1'b0;
        case(data_length)
            BYTE:
            begin #5
                if (read_write)
                begin
                    data_out = 0;
                    data_out = memory[address];
                end
                
                else
                begin
                    memory[address] = data_in[7:0];
                end
            end
            HALFWORD:
            begin #5
                if (read_write)
                begin
                    data_out = 0;
                    data_out[15:8]  = memory[address];
                    data_out[7:0] = memory[address + 1];
                end
                
                else
                begin
                    memory[address]     = data_in[15:8];
                    memory[address + 1] = data_in[7:0];
                end
            end
            WORD:
            begin #5
                if (read_write)
                begin
                    data_out[31:24]   = memory[address];
                    data_out[23:16]  = memory[address + 1];
                    data_out[15:8] = memory[address + 2];
                    data_out[7:0] = memory[address + 3];
                end
                
                else
                begin
                    memory[address]     = data_in[31:24];
                    memory[address + 1] = data_in[23:16];
                    memory[address + 2] = data_in[15:8];
                    memory[address + 3] = data_in[7:0];
                end
            end
            DOUBLEWORD:
            begin
                if (read_write)
                begin
                    temp = address;
                    repeat(2) #5
                    begin
                    data_out[31:24]   = memory[temp];
                    data_out[23:16]  = memory[temp + 1];
                    data_out[15:8] = memory[temp + 2];
                    data_out[7:0] = memory[temp + 3];
                    temp            = temp + 4;
                end
            end
            
            else
            begin
                temp = address;
                repeat(2) #5
                begin
                    memory[temp]     = data_in[31:24];
                    memory[temp + 1] = data_in[23:16];
                    memory[temp + 2] = data_in[15:8];
                    memory[temp + 3] = data_in[7:0];
                    temp             = temp + 4;
                end
            end
        end
        endcase

        mfc <= 1'b1;
    end

    else 
        mfc <= 1'b0;
    
endmodule
