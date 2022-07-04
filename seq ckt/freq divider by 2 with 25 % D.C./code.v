module freq_divider(clk,reset,out
    );
	 input clk,reset;
	 output out;
	 reg q;
	 
	 always @(posedge clk,posedge reset)begin
		if (reset)
			q <= 0;
		else
			q <= ~q ;
	 end
	 
	 assign out = q & clk ;


endmodule
