module one_bit_comparator_behavioral (
    input  logic a,
    input  logic b,
    output logic greater,
    output logic less,
    output logic equal
);
    assign greater = a & !b; // TODO
    assign less    = !a & b; // TODO
    assign equal   = ! (a ^ b); // TODO
endmodule