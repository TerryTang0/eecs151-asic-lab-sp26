module four_bit_comparator_always (
    input logic [3:0] a, // TODO
    input logic [3:0] b, // TODO
    output logic greater,
    output logic less,
    output logic equal
);

    always_comb begin
        greater = 1'b0;
        less = 1'b0;
        equal = 1'b0;

        if (a > b) begin // TODO
            greater = 1'b1;// TODO
        end else if (a < b) begin // TODO
            less = 1'b1;// TODO
        end else begin
            equal = 1'b1;// TODO
        end
    end
endmodule
