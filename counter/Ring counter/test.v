`timescale 1ns / 1ps


module test;

	// Inputs
	reg clk;
	reg reset;

	// Outputs
	wire [3:0] q;

	// Instantiate the Unit Under Test (UUT)
	main uut (
		.clk(clk), 
		.reset(reset), 
		.q(q)
	);

	always #5 clk <= ~clk ;
	
	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 0;

		// Wait 100 ns for global reset to finish
		#100;
        reset = 1;
		// Add stimulus here

	end
      
endmodule

