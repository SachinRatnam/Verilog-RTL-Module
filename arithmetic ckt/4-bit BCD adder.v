module bcd_adder(
    input [3:0] a,b,
    input cin,
    output reg [3:0] sum,
    output reg cout
);
    reg [4:0] sum_int;
    
    always @(*)begin
        sum_int = a + b + cin ;
        if(sum_int > 9)
            begin
               sum = sum_int + 4'd6 ;
               cout = 1'b1; 
            end
        else
            begin
                sum = sum_int[3:0];
                cout = 0;
            end
    end
endmodule
