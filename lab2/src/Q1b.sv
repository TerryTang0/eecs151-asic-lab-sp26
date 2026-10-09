module Q1b(
    input logic [1:0]A,
    input logic [1:0]B,
    output logic Y
);
    logic C, D;

    assign C = A[1] ~^ B[1];
    assign D = A[0] ~^ B[0];
    assign Y = C & D;

endmodule