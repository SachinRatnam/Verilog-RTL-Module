`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:08:37 04/17/2022
// Design Name:   seq_1010_overlap
// Module Name:   E:/verilog_coding/seq_1010/test.v
// Project Name:  seq_1010
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: seq_1010_overlap
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test;

	// Inputs
	reg x;
	reg clk;
	reg reset;

	// Outputs
	wire z;

	// Instantiate the Unit Under Test (UUT)
	seq_1010_overlap uut (
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
		#100
        
		// Add stimulus here
		#2 reset = 0;
		#10 x = 1;
		#10 x = 0;
		#10 x = 1;
		#10 x = 0;
		#10 x = 1;
		#10 x = 0;
	end
      
endmodule

