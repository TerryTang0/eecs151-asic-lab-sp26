module Q1c(
    input logic A,
    input logic clk,
    output logic X,
    output logic Y,
)

    always_ff @(posedge clk) begin
        X <= A;
    end

    assign Y = A & X;
endmodule
