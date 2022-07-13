`timescale 1ns / 1ps



module test;

	// Inputs
	reg x;
	reg clk;
	reg reset;

	// Outputs
	wire z;

	// Instantiate the Unit Under Test (UUT)
	main uut (
		.x(x), 
		.clk(clk), 
		.reset(reset), 
		.z(z)
	);
	
	always #5 clk = ~clk ;

	initial begin
		// Initialize Inputs
		x = 0;
		clk = 0;
		reset = 1;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		#2 reset = 0 ;
		#10 x = 1;
		#10 x = 0;
		#10 x = 1;
		#10 x = 1;
		#10 x = 0;
		#10 x = 1;
		#10 x = 1;
		#10 x = 0;
		#10 x = 0;
		#10 x = 1;
		#10 x = 0;

	end
      
endmodule

