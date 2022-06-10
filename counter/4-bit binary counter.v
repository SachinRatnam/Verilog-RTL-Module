//Build a 4-bit binary counter that counts from 0 through 15, inclusive, with a period of 16. The reset input is synchronous, and should reset the counter to 0.

module counter (
    input clk,
    input reset,      // Synchronous active-high reset
    output reg [3:0] count);
    
    always @(posedge clk)begin
        if (reset)
            count <= 0;
        else
            count <= count + 1;
    end

endmodule
