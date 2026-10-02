module one_bit_comparator_structural (
    input  logic a,
    input  logic b,
    output logic greater,
    output logic less,
    output logic equal
);
    logic a_not, b_not;

    not(a_not, a); // TODO
    not(b_not, b); // TODO

    and(greater, a, b_not); // TODO
    and(less, a_not, b); // TODO
    xnor(equal, a, b); // TODO
endmodule
