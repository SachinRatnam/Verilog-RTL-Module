module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output done
); 
    parameter rst= 0,d_cnt= 1,dn= 2,err= 3;
    reg [3:0]cnt;
    
    reg [2:0]state, next_state ;
    
    always @(posedge clk)begin
        if(reset)
            state <= rst ;
        	cnt <= 0;
        else
            
    end

endmodule
