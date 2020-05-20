module register_selector(
  output reg[3:0] reg_address, 
  output reg done, 
  input [15:0] reg_list, 
  input enable);


reg found = 0, visited = 0;
initial reg_address = 0;
initial done = 0;

always @ (reg_list, enable)
  if(enable) begin 
    while(!found && !done) begin
        if((visited && reg_address == 15) || reg_address > 15) begin
          done = 1'b1;
          reg_address = 0;
        end

        else if(reg_list[reg_address + visited]) begin
            found = 1;
            if(visited)
                reg_address++;
            else visited = 1;
        end

        if(!found) reg_address++;
    end

    found = 0;
  end

endmodule 