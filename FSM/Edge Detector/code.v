// implemented with moore style
// positive edge (0 to 1) detector

module edge_detector(
    input x,                // input
    input clk,
    input reset,
    output reg z            // output
    );
	 
	 parameter zero= 0, one_1 = 1, one_0 = 2;  // state name 
	 
	reg [1:0] state, next_state ;
	 
    // clock control
	 always @(posedge clk)begin
			if(reset)
					state <= zero ;
			else
					state <= next_state ;
	 end
	 
    // state transition logic 
    
	 always @(*)begin
			z = 1'b0 ;                                      // output
			case(state)
					zero:
						begin 
							next_state = x ? one_1 : zero; 
							z = 1'b1 ;
						end
					one_1: next_state = x ? one_0 : zero ;
					one_0: next_state = x ? one_0 : zero ;
			endcase
	 end


endmodule
