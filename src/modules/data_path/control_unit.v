`include "src/modules/control_unit_components/conditions_mux.v"
`include "src/modules/control_unit_components/control_register.v"
`include "src/modules/control_unit_components/encoder.v"
`include "src/modules/control_unit_components/increm_register.v"
`include "src/modules/control_unit_components/incrementer.v"
`include "src/modules/control_unit_components/inverter.v"
`include "src/modules/control_unit_components/microstore.v"
`include "src/modules/control_unit_components/next_state_address_selector.v"
`include "src/modules/control_unit_components/states_mux.v"

module control_unit(output FRld,
                    RFld,
                    IRld,
                    MARld,
                    MDRld,
                    RW,
                    MOV,
                    Cin,
                    MD,
                    ME,
                    output[1:0] MA,
                    MB,
                    MC,
                    DL,
                    output [4:0] OP,
                    output [9:0] current_state,
                    input MOC,
                    clk,
                    cond,
                    reset,
                    input [31:0] ir);
    
    // Wires
    wire cr_to_inv;
    wire[9:0] cr_to_states_mux;
    wire[2:0] cr_to_nas;
    wire[1:0] cr_to_condition_mux;
    
    wire[37:0] microstore_to_cr;
    
    wire cond_mux_to_inv, inv_to_nas;
    
    wire[1:0] nas_to_states_mux;
    
    wire[9:0] states_mux_to_microstore_to_increm, encoder_to_states_mux, increm_register_to_states_mux,
    increm_to_increm_register, microstore_to_cr_cs;
    
    
    // Modules
    control_register control_register(FRld, RFld, IRld, MARld, MDRld, MD, ME, RW, MOV, cr_to_inv, DL, cr_to_condition_mux, MA, MB, MC, cr_to_nas, OP, cr_to_states_mux, current_state, clk, microstore_to_cr, microstore_to_cr_cs);
    inverter inverter(inv_to_nas, cond_mux_to_inv, cr_to_inv);
    conditions_mux conditions_mux(cond_mux_to_inv, MOC, cond, cr_to_condition_mux);
    next_state_address_selector next_state_address_selector(nas_to_states_mux, cr_to_nas, inv_to_nas);
    microstore microstore(microstore_to_cr, microstore_to_cr_cs, states_mux_to_microstore_to_increm, reset);
    encoder encoder(encoder_to_states_mux, ir);
    states_mux states_mux(states_mux_to_microstore_to_increm, encoder_to_states_mux, cr_to_states_mux, increm_register_to_states_mux, nas_to_states_mux);
    incrementer incrementer(increm_to_increm_register, states_mux_to_microstore_to_increm);
    increm_register increm_register(increm_register_to_states_mux, increm_to_increm_register, clk);
    
    
endmodule
