`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:10:44 05/14/2022
// Design Name:   a
// Module Name:   E:/verilog_coding/b/test.v
// Project Name:  b
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: a
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
	reg clk;
	reg reset;

	// Outputs
	wire [3:0] gray_count;

	// Instantiate the Unit Under Test (UUT)
	a uut (
		.clk(clk), 
		.reset(reset), 
		.gray_count(gray_count)
	);
	
	always #5 clk = ~clk ;

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 1;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		#2 reset = 0;
		
	end
      
endmodule

