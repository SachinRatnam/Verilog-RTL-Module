// for even no of 1's , output = 0 ;
// for odd no of 1's , output = 1 ;
// zero is even , reset is zero


module parity_checker1(
		input x, clk,reset,
		output reg z
    );
	 
	 parameter EVEN = 0, ODD = 1;    // state name
	 
	 reg state, next_state ;
	 
	 // clock control
	 always @(posedge clk)begin
				if(reset)
						state <= EVEN ;
				else 
						state <= next_state ;
	 end
	 
	 // state transition logic
	 // combinational always block
	 
	 always @(*)begin
			z = 1'b0 ;                                  // output
			case(state)
					EVEN: next_state = x ? ODD : EVEN ;
					ODD: begin
							next_state = x ? EVEN : ODD ;
							z = 1'b1 ;
						  end
			endcase
	 end
	 

endmodule
