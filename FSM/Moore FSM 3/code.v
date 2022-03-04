module top_module (
    input clk,
    input reset,     // synchronous reset
    input w,
    output z);
    
    parameter A= 0,B= 1,C= 2,D= 3,E= 4,F= 5;
    
    reg [3:0] state, next_state ;
    
    always @(posedge clk)begin
        if(reset)
            state <= A ;
        else
            state <= next_state ;
    end
    
    always @(*)begin
        z = 1'b0 ;
        case(state)
            A: next_state = w ? A: B ;
            B: next_state = w ? D: C ;
            C: next_state = w ? D: E ;
            D: next_state = w ? A: F ;
            E:begin
                next_state = w ? D: E ;
                z = 1'b1 ;
            end
             F:begin
                next_state = w ? D: C ;
                z = 1'b1 ;
            end
        endcase
    end

endmodule
