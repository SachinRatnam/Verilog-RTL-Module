module shift_register (
    input clk,
    input resetn,   // synchronous reset
    input in,
    output out);
    
    reg q1,q2,q3 ;
    always @(posedge clk)begin
        if(!resetn)
        	{q1,q2,q3,out} <= 4'b0 ;
        else
            {q1,q2,q3,out} <= {in,q1,q2,q3};
            // with concatanation operator we can also use bloking operator
            //  like-- {q1,q2,q3,out} = {in,q1,q2,q3};
        
            //or out <= q3; q3 <= q2; q2 <= q1; q1 <= in;
            
    end

endmodule
