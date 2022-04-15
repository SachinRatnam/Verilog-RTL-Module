// Create a 100-bit binary ripple-carry adder by instantiating 100 full adders. The adder adds two 100-bit numbers and a carry-in to produce a 100-bit sum and carry out.

module adder_100( 
    input [99:0] a, b,
    input cin,
    output [99:0] cout,
    output [99:0] sum );

    genvar i ;
    
    full_adder FA1 (a[0],b[0],cin,sum[0],cout[0]);
    
    
    generate 
        for (i=1;i<100;i++)
            begin: full_add
                full_adder FA(a[i],b[i],cout[i-1],sum[i],cout[i]);
            end
    endgenerate
endmodule
            
module full_adder (a,b,cin,sum,cout);
	input a,b,cin;
    output sum,cout ;
    
    assign cout = a&b | b&cin | a&cin ;
    assign sum = a^b^cin ;
endmodule
