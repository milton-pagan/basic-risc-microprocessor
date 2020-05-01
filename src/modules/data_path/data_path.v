`include "src/modules/data_path/alu.v"
`include "src/modules/data_path/condition_tester.v"
`include "src/modules/data_path/control_unit.v"
`include "src/modules/data_path/flags_register.v"
`include "src/modules/data_path/ram.v"
`include "src/modules/data_path/register_32_bit.v"
`include "src/modules/data_path/register_file.v"
`include "src/modules/data_path/shift_sign_extender.v"

`include "src/modules/data_path/multiplexers/mux_a.v"
`include "src/modules/data_path/multiplexers/mux_b.v"
`include "src/modules/data_path/multiplexers/mux_c.v"
`include "src/modules/data_path/multiplexers/mux_d.v"
`include "src/modules/data_path/multiplexers/mux_e.v"

module data_path(output[9:0] current_state, input main_clk, reset);
    
    // Wires
    wire[31:0] PA, PB, alu_out, B, E;
    wire Z, N, V, C, carry_out;
    wire[3:0] A, Cp;
    wire[4:0] op_to_alu;
    
    wire[31:0] ir, ram_out, mdr_out, address, shift_out;
    // Control Signals
    wire FRld,
    RFld,
    IRld,
    MARld,
    MDRld,
    RW,
    MOV,
    Cin,
    MD,
    ME;
    wire[1:0] MA,
    MB,
    MC,
    DL;
    wire[4:0] OP;
    wire MOC,
    cond;
    

    
    // Modules
    
    control_unit control_unit(FRld, RFld, IRld, MARld, MDRld, RW, MOV, Cin, MD, ME, MA, MB, MC, DL, OP, current_state, MOC, main_clk, cond, reset, ir);
    
    ALU alu(PA, B, Cin, op_to_alu, alu_out, C, N, V, Z);
    
    register_file register_file(PA, PB, A, ir[3:0], alu_out, Cp, RFld, main_clk);
    
    ram ram(ram_out, MOC, MOV, RW, DL, address[8:0], mdr_out);
    
    shift_sign_extender shift_sign_extender(shift_out, carry_out, ir, PB);
    
    register_32_bit instruction_register(ir, ram_out, IRld, main_clk);
    register_32_bit mar(address, alu_out, MARld, main_clk);
    register_32_bit mdr(mdr_out, E, MDRld, main_clk);
    
    mux_a mux_a(A, ir[19:16], ir[15:12], MA);
    mux_b mux_b(B, PB, shift_out, mdr_out, MB);
    mux_c mux_c(Cp, ir[15:12], ir[19:16], MC);
    mux_d mux_d(op_to_alu, ir[24:21], OP, MD);
    mux_e mux_e(E, ram_out, alu_out, ME);
    
endmodule
