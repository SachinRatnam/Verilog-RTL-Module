module top_module (
    input d, 
    input ena,
    output q);
    
    always @(*)
        if (ena)
            q = d ; // non blocking assignment is used as it is not triggerd by clock

endmodule

