module top_module (
    input clk,
    input w, R, E, L,
    output Q
);
    always @(posedge clk)begin
      Q <= L ? R: (E ? w: Q) ;    // terniray operator implement (2 x 1) mux 
    end

endmodule
