module main_module(clk,reset,t,q
    );
	 input clk,reset,t;
	 output reg q;
	 
	 // asynchronous reset 
	 always @(posedge clk, posedge reset)begin
			if(reset)
				q <= 0;
			else
				begin
					if(t)
						q <= ~q ;
				end
	 end


endmodule
