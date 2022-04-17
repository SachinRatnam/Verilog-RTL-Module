`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:04:58 04/17/2022 
// Design Name: 
// Module Name:    seq_detect 
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
module seq_1010_overlap(
				input x,clk,reset,
				output reg z
     );
	  
	  reg [2:0] state,next_state  ;     
	  
	  parameter S00 = 3'b000,S01 = 3'b001,S1 = 3'b010, S2 = 3'b011, S3 = 3'b100;       // states
	  
	  always @(posedge clk, posedge reset)begin
				if (reset)                       // asynchronous reset 
						state <= S00 ;
				else
					   state <= next_state ;
						
		end
		
		// Moore machine
		// without overlap 
		always @(*)begin
				z = 1'b0 ;
				case(state)
				S00: next_state = x ? S00 : S1 ;
				S01: begin
						next_state = x ? S00 : S1 ;
						z = 1'b1 ;
						end
				S1: next_state = x ? S2 : S1 ;
				S2: next_state = x ? S3 : S1 ;
				S3: next_state = x ? S00 : S01 ;
				endcase
				
		end


endmodule
