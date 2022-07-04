module test;

	// Inputs
	reg clk;
	reg reset;

	// Outputs
	wire out;

	// Instantiate the Unit Under Test (UUT)
	main uut (
		.clk(clk), 
		.reset(reset), 
		.out(out)
	);
	
	always #5 clk = ~clk ;

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 1;

		// Wait 100 ns for global reset to finish
       #100
		 reset = 0;
		// Add stimulus here

	end
      
endmodule
