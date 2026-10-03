module decoder_4_to_16 (
    input  logic [3:0] addr,
    output logic [15:0] one_hot
);
    generate
        genvar i;
        for (i = 0; i < 16; i ++) begin // TODO
            line_decoder ld (
                .select(i), // TODO
                .addr(addr), // TODO
                .single_wire(one_hot[i]) // TODO
            );
        end
    endgenerate
endmodule
