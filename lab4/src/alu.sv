`default_nettype none

import alu_op_pkg::*;

module alu (
    input  logic [31:0] a,
    input  logic [31:0] b,
    input  alu_op_t     alu_op,
    output logic [31:0] out
);

// Your code goes here

    always_comb begin

        case(alu_op)
            ALU_ADD: out = a + b;
            ALU_SUB: out = a - b;
            ALU_AND: out = a & b;
            ALU_OR: out = a | b;
            ALU_XOR: out = a ^ b;
            ALU_SLT: out = ($signed(a) < $signed(b)) ? 32'b1 : 32'b0;
            ALU_SLTU: out = ($unsigned(a) < $unsigned(b)) ? 32'b1 : 32'b0;
            ALU_SLL: out = a << b[4:0];
            ALU_SRA: out = $signed(a) >>> b[4:0];
            ALU_SRL: out = a >> b[4:0];
            ALU_COPY_B: out = b;
            ALU_XXX: out = 32'b0;
            default: out = 32'b0;
        endcase
    end


endmodule
