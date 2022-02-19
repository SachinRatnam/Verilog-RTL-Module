module convert(
    input in_clk,reset,
    output out_clk
);
    wire [11:0] q_in;
    
    bcd_counter C1 (in_clk,reset,q_in[3:0]);        // all ff in C1 is given in_clk , output of C1--  q_in[3] will have freq (in_clk / 10)
    bcd_counter C2 (q_in[3],reset,q_in[7:4]);       // all ff in C2 in given clk as q_in[3] which is output of 1st bcd_counter C1, output of C2-- q_in[7] will have feq (in_clk / 100 ) 
    bcd_counter C2 (q_in[7],reset,q_in[11:8]);
    
    assign out_clk = q_in;
    
endmodule


module decade_counter (
    input clk,
    input reset,        // Synchronous active-high reset
    output reg [3:0] q);
    
    always @(posedge clk)begin    // it's a synchronous counter 
        if(reset || q==9)
            q <= 0;
        else
            q <= q + 1;
        
    end

endmodule
