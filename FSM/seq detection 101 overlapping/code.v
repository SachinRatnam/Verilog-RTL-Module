// Implement a Mealy-type finite state machine that recognizes the sequence "101" on an input signal named x. Your FSM should have an output signal, z, that is asserted to logic-1 
// when the "101" sequence is detected. Your FSM should also have an active-low asynchronous reset. You may only have 3 states in your state machine.
// Your FSM should recognize overlapping sequences.

module top_module (
    input clk,
    input aresetn,    // Asynchronous active-low reset
    input x,
    output z ); 
    
    parameter S0 = 0,S1 =1,S2 =2;
    reg [1:0] state, next_state;
    
    always@(posedge clk or negedge aresetn) begin
        if(!aresetn)
            state <= S0 ;
        else
            state <= next_state ;
    end

    always @(*)begin
        z = 1'b0;                            // instead of writing output for every state, you can wite a default value and again define it only for those state when output has different value  
        case(state)
            S0: next_state = x ? S1: S0 ;
            S1: next_state = x ? S1: S2 ;
            S2:begin
                next_state = x ? S1: S0 ;
              z = x ? 1'b1 : 0;            // in this state, output 'z' is changing depending upon input 'x' 
            end
                
        endcase
    end
    
endmodule
