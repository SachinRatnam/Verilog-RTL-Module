// You are to design a one-input one-output serial 2's complementer Moore state machine. The input (x) is a series of bits (one per clock cycle) 
// beginning with the least-significant bit of the number, and the output (Z) is the 2's complement of the input. The machine will accept input numbers of arbitrary length. 
// The circuit requires an asynchronous reset. The conversion begins when Reset is released and stops when Reset is asserted.


module top_module (
    input clk,
    input areset,
    input x,
    output reg z
); 
    parameter S0= 0,S1= 1,S2= 2 ;
    reg [1:0] state, next_state ;
    
    always @(posedge clk, posedge areset)begin
        if(areset)
            state <= S0 ;
        else
            state <= next_state ;
    end
    
    always @(*)begin
        z = 1'b0 ;
        case(state)
            S0:next_state = x ? S1: S0 ;
            S1:begin
                next_state = x ? S2: S1 ;
                z = 1'b1 ;
            end
            S2:next_state = x ? S2: S1 ;
        endcase
    end

    
endmodule
