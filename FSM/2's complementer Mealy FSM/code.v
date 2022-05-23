module top_module (
    input clk,
    input areset,
    input x,
    output reg z
); 
    parameter S0=0, S1= 1;
    reg state, next_state ;
    
    always @(posedge clk,posedge areset)begin
        if(areset)
            state <= S0;
        else
            state <= next_state ;
    end
    
    always @(*)begin
        case(state)
            S0: begin
                next_state = x ? S1:S0 ;
                z = x ? 1'b1: 1'b0 ;
            end
            S1: begin
                next_state = x ? S1:S1 ;
                z = x ? 1'b0: 1'b1 ; 
            end
        endcase
    end

endmodule
