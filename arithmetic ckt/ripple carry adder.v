// create a 3-bit binary ripple-carry adder. The adder adds two 3-bit numbers and a carry-in to produce a 3-bit sum and carry out. 
// To encourage you to actually instantiate full adders, also output the carry-out from each full adder in the ripple-carry adder.
// cout[2] is the final carry-out from the last full adder, and is the carry-out you usually see.

module top_module( 
    input [2:0] a, b,
    input cin,
    output [2:0] sum );
    wire [2:0] cout,
    
    FA f1 (a[0],b[0],cin,sum[0],cout[0]);
    FA f2 (a[1],b[1],cout[0],sum[1],cout[1]);
    FA f3 (a[2],b[2],cout[1],sum[2],cout[2]);
    

endmodule

module FA(
    input x,y,c_in,
    output sum,cout
);
    assign sum = x ^ y ^ c_in ;
    assign cout = x&y | y&c_in | x&c_in ;
endmodule
