// single T flip-flop designed from D flip-flop by connecting q_bar to D input

module t_ff(clk,reset,q
    );
	 input clk,reset ;
	 output reg q ;
	 
	 always @(negedge clk,posedge reset)begin
			if(reset)
				q <= 0 ;
			else
				q <= ~q ; 
	 end
	 
endmodule
	 
  // 4 bit asynchronous counter design
  
module asyn_counter(clk,reset,count);
		input clk,reset;
		output[3:0] count;
		
		// instantiation
		
		t_ff T1(clk,reset,count[0]);
		t_ff T2(count[0],reset,count[1]);
		t_ff T3(count[1],reset,count[2]);
		t_ff T4(count[2],reset,count[3]);

endmodule
