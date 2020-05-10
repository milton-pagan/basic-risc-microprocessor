module register_selector(output reg[3:0] reg_address, output reg done, input [15:0] reg_list, input enable);


reg found = 0;
initial reg_address = 0;

always @ (reg_list, posedge enable)
  if(enable) begin 
  
    while(!found) begin
        if(reg_address > 15) done = 1'b1;

        if(reg_list[reg_address]) begin 
          found = 1;
        
          end

        if(!found) begin
            reg_address++;
        end
    end

  end

endmodule 