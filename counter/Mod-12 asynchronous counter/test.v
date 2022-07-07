`timescale 1ns / 1ps

module test;

	// Inputs
	reg clk;
	reg reset;

	// Outputs
	wire [3:0] count;

	// Instantiate the Unit Under Test (UUT)
	asyn_counter uut (
		.clk(clk), 
		.reset(reset), 
		.count(count)
	);
	
	always #5 clk = ~clk ;

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 1;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		reset = 0 ;
		#142 reset = 1 ;
		#10 reset = 0 ;

	end
      
endmodule

