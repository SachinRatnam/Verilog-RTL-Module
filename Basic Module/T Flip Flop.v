module main_module(clk,reset,t,q
    );
	 input clk,reset,t;
	 output reg q;
	 
	 // asynchronous reset 
	 always @(posedge clk, posedge reset)begin
			if(reset)
				q <= 0;
		 else if(t)
				q <= ~q ;
	 end


endmodule
