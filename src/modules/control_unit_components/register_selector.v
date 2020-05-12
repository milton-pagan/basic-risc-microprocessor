module register_selector(output reg[3:0] reg_address, output reg done, input [15:0] reg_list, input enable);


reg found = 0;
initial reg_address = 0;

always @ (reg_list, posedge enable)
  if(enable) begin 
  
    while(!found) begin
        if(reg_address > 15) begin
          done = 1'b1;
          reg_address = 0;
        end

        if(reg_list[reg_address]) found = 1;

        if(!found) begin
            reg_address++;
        end
    end

    found = 0;
  end

endmodule 