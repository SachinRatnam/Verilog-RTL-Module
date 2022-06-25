module top_module (
    input clk,
    input areset,
    input x,
    output reg z
); 
    parameter S0= 2'b01, S1= 2'b10 ; // One Hot Encoding
  reg [1:0] state, next_state ;
    
    always @(posedge clk,posedge areset)begin
        if(areset)
            state <= S0;
        else
            state <= next_state ;
    end
    
    always @(*)begin
      case(1'b1)
        state[0]: begin
                next_state = x ? S1:S0 ;
                z = x ? 1'b1: 1'b0 ;
            end
        state[1]: begin
                next_state = x ? S1:S1 ;
                z = x ? 1'b0: 1'b1 ; 
            end
        endcase
    end

endmodule
