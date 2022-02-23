module top_module (
    input clk,
    input reset,   // Synchronous reset
    input x,
    output z
);
    
    parameter S0= 0,S1= 1,S2= 2,S3= 3,S4= 4;
    reg [2:0] state,next_state;
    
    always @(posedge clk)begin
        if(reset)
            state <= S0 ;
        else
            state <= next_state ;
            
    end

    always @(*)begin
       z = 1'b0;
        case(state)
            S0: next_state = x ? S1: S0 ;
            S1: next_state = x ? S4: S1 ;
            S2: next_state = x ? S1: S2 ;
            S3:begin
                next_state = x ? S2: S1 ;
                z = 1'b1; 
            end
            S4:begin
                next_state = x ? S4: S3 ;
                z = 1'b1;
            end
        endcase
    end
    
endmodule
