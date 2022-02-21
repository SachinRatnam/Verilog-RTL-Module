module top_module(
    input in,clk,areset,
    output out);
    
    reg [1:0] state, next_state ;
    parameter A=0, B=1, C=2, D=3;
    
 
    always @(posedge clk, negedge areset)begin
        if(! areset)
            state <= A;
        else
            state <= next_state ;
    end

    // State transition logic
    always @(*)begin
        case(state)
            A: next_state = in ? B: A ;
            B: next_state = in ? B: C ;
            C: next_state = in ? D: A ;
            D: next_state = in ? B: C ;
        endcase
            
    end

    // Output logic
    assign out = (state == D);

endmodule
