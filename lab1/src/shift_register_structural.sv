module shift_register_structural (
    input  logic       in,
    input  logic       clk,
    output logic [3:0] out
);
    logic Q1, Q2, Q3, Q4;
    logic Q1n, Q2n, Q3n, Q4n;

    d_flip_flop dff_1(.D(in), .clk(clk), .Q(Q1), .Qn(Q1n)); // TODO
    d_flip_flop dff_2(.D(Q1), .clk(clk), .Q(Q2), .Qn(Q2n)); // TODO
    d_flip_flop dff_3(.D(Q2), .clk(clk), .Q(Q3), .Qn(Q3n)); // TODO
    d_flip_flop dff_4(.D(Q3), .clk(clk), .Q(Q4), .Qn(Q4n)); // TODO

    assign out = {Q4, Q3, Q2, Q1}; // TODO
endmodule
