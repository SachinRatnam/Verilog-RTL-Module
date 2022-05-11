`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:11:01 05/11/2022
// Design Name:   sig_change
// Module Name:   E:/verilog_coding/test/test.v
// Project Name:  test
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: sig_change
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
	reg d;

	// Outputs
	wire toggle;
	wire fall;
	wire rise;

	// Instantiate the Unit Under Test (UUT)
	sig_change uut (
		.clk(clk), 
		.reset(reset), 
		.d(d), 
		.toggle(toggle), 
		.fall(fall), 
		.rise(rise)
	);
	
	always #5 clk = ~clk ;

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 1;
		d = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		#2 reset = 0;
		
		#10 d = 0;
		#10 d = 1;
		#20 d = 1;
		#10 d = 0;
		

	end
      
endmodule

