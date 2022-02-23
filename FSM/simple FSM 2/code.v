module top_module (
    input clk,
    input [2:0] y,
    input x,
    output Y0,
    output z
);
  	reg[2:0] state,next;
    parameter A=3'd0,B=3'd1,C=3'd2,D=3'd3,E=3'd4;
    
    always@(*) begin
        case(y)
            A: next = (~x)? A : B;
            B: next = (~x)? B : E;
            C: next = (~x)? C : B;
            D: next = (~x)? B : C;
            E: next = (~x)? D : E; 
        endcase
    end
    
    always@(posedge clk) begin
       state <= next; 
    end

    assign z = (y == D) || (y == E);
    assign Y0 = next[0];

endmodule
