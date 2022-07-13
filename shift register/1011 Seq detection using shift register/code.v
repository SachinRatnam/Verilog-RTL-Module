module main(x,clk,reset,z
    );
	 input x,clk,reset ;
	 output z ;
	 
	 reg [3:0] int_ff ;
	 
	 always @(posedge clk)begin
			if (reset)
				int_ff <= 0 ;
			else
				int_ff <= {int_ff[2:0],x} ;
		end
		
		assign z = int_ff[3] & (~int_ff[2]) & int_ff[1] & int_ff[0] ;


endmodule

// output is synchronous w. r. t. clock
// this module will detect 1011 seq with overlapping
