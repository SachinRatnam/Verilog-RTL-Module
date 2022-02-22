module top_module(
    input clk,
    input reset,    // Synchronous reset
    input in,
    output disc,
    output flag,
    output err);
    
    parameter zero= 0,one=1,two=2,thr=3,four=4,five=5,six=6,fg=7,er =8,dis= 9;
    reg [3:0] state, next_state;
    
    always @(posedge clk)begin
        if(reset)
            state <= zero;
        else
            state <= next_state ;
            
    end
    
    always @(*)begin
        case(state)
            zero: next_state =in ? one: zero ;
            one: next_state =in ? two: zero ;
            two: next_state =in ? thr: zero ;
            thr: next_state =in ? four: zero ;
            four: next_state =in ? five: zero ;
            five: next_state =in ? six: dis ;
            six: next_state =in ? er: fg ;
            fg: next_state =in ? one: zero ;
            dis: next_state =in ? one: zero ;
            er: next_state =in ? er: zero ;
        endcase
    end
    
    assign flag = (state == fg);
    assign disc = (state == dis);
    assign err = (state == er);

endmodule
