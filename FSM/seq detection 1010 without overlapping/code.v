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
	  
	  reg [1:0] state,next_state  ;     
	  
	  parameter S0 = 2'b00,S1 = 2'b01, S2 = 2'b10, S3 = 2'b11;       // states
	  
	  always @(posedge clk)begin
				if (reset)                       // synchronous reset 
						state <= S0 ;
				else
					   state <= next_state ;
						
		end
		
		// Mealy machine
		// without overlap 
		always @(*)begin
				z = 1'b0 ;
				case(state)
				S0: next_state = x ? S1 : S0 ;
				S1: next_state = x ? S1 : S2 ;
				S2: next_state = x ? S3 : S0 ;
				S3: begin 
						next_state = S0 ;
						z = x ? 1'b0:1'b1 ;
						end
				endcase
				
		end


endmodule
