module ring_counter(clk,reset,q
    );
	 input clk,reset;
	 output reg [3:0] q;
	 
	 always @(posedge clk,negedge reset)begin
			if (!reset)
				q <= 4'b1000;
			else
				q <= {q[0],q[3:1]} ;
	 end

endmodule
