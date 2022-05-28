`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:00:54 05/14/2022 
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
module a(clk,reset,gray_count);
	input clk,reset;
	output [3:0] gray_count;
	reg [3:0] count;
	
	always @(posedge clk,posedge reset)begin
		if(reset)
			count <= 0 ;
		else
			count <= count + 1;
	end
	
	assign gray_count = count ^ count >> 1 ;


endmodule
