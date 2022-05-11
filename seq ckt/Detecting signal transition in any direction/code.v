`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:17:58 05/06/2022 
// Design Name: 
// Module Name:    a 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module sig_change(clk,reset,d,toggle,fall,rise);
	input clk,reset,d;
	output toggle,fall,rise ;
	reg q;
	
	always @(posedge clk,posedge reset)begin
		if(reset)
			q = 0 ;
		else
			q = d;
	end
	
	assign toggle = d ^ q ;
	assign rise = d & (~q) ;
	assign fall = (~d) & q ;
	
endmodule
