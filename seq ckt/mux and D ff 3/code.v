module top_module (
    input [3:0] SW,
    input [3:0] KEY,
    output [3:0] LEDR
); //
    
    MUXDFF M1 (KEY[3],SW[3],KEY[1],KEY[2],KEY[0],LEDR[3]);     // clk-- KEY[0]
    MUXDFF M2 (LEDR[3],SW[2],KEY[1],KEY[2],KEY[0],LEDR[2]);
    MUXDFF M3 (LEDR[2],SW[1],KEY[1],KEY[2],KEY[0],LEDR[1]);
    MUXDFF M4 (LEDR[1],SW[0],KEY[1],KEY[2],KEY[0],LEDR[0]);

endmodule

module MUXDFF (
	input w,r,e,l,clk,
    output q
);
    always @(posedge clk)begin
        q <= l ? r: (e ? w: q) ;
    end

endmodule

