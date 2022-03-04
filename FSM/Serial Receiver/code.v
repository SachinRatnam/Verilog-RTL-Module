// Incorrect code
// tring to fix 

module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output done
); 
    parameter rst= 0,d_cnt= 1,dn= 2,err= 3;
    reg [3:0]cnt;
    
    reg [1:0]state, next_state ;
    
    always @(posedge clk)begin
        if(reset)begin
            	state <= rst ;
        		cnt <= 0;
        		end
        else
            begin
            	state <= next_state ;
        		if (next_state == d_cnt)
                    cnt <= cnt + 1 ;
                else if (next_state == dn || next_state == err)
                    cnt <= 0 ;
            end
                
    end
    
    always @(*)begin
        // done = 1'b0 ;
        case(state)
            rst: next_state = in ? rst: d_cnt ;
            d_cnt:begin
                if(cnt== 7 && in)
                        next_state = dn ;
                else if (cnt== 7 && (~in))
                    	next_state = err ;
                	else
                        next_state = d_cnt ;
             	  end
            dn:begin
                	next_state = in ? rst: d_cnt ;
                	// done = 1'b1 ;
            	end
            err: next_state = in ? rst: err ;
            
        endcase
    end
    
    assign done = (state == dn);

endmodule
