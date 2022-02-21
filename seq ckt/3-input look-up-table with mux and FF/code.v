// In this question, you will design a circuit for an 8x1 memory, where writing to the memory is accomplished by shifting-in bits, and reading is "random access", 
// as in a typical RAM. You will then use the circuit to realize a 3-input logic function.
// First, create an 8-bit shift register with 8 D-type flip-flops. Label the flip-flop outputs from Q[0]...Q[7]. The shift register input should be called S, 
// which feeds the input of Q[0] (MSB is shifted in first). The enable input controls whether to shift. Then, extend the circuit to have 3 additional inputs A,B,C and an output Z.
// The circuit's behaviour should be as follows: when ABC is 000, Z=Q[0], when ABC is 001, Z=Q[1], and so on. Your circuit should contain ONLY the 8-bit shift register, and multiplexers. 
// (Aside: this circuit is called a 3-input look-up-table (LUT)).

module top_module (
    input clk,
    input enable,
    input S,
    input A, B, C,
    output Z ); 
    reg [0:7] q;
    
    always @(posedge clk)begin
        if(enable)
            q <= {S,q[0:6]} ;
    end
    
    always @(*)begin
        case({A,B,C})
            3'b000: Z = q[0] ;
            3'b001: Z = q[1] ;
            3'b010: Z = q[2] ;
            3'b011: Z = q[3] ;
            3'b100: Z = q[4] ;
            3'b101: Z = q[5] ;
            3'b110: Z = q[6] ;
            3'b111: Z = q[7] ;
        endcase
    end
        
    

endmodule
