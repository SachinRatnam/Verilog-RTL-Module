// Build a decade counter that counts from 0 through 9, inclusive, with a period of 10. The reset input is synchronous, and should reset the counter to 0.
module decade_counter (
    input clk,
    input reset,        // Synchronous active-high reset
    output reg [3:0] q);
    
    always @(posedge clk)begin
        if(reset || q==9)
            q <= 0;
        else
            q <= q + 1;
        
    end

endmodule
