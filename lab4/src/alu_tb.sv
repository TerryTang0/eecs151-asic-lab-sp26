`default_nettype none

`timescale 1ns / 100ps

module alu_tb;

    import alu_op_pkg::*;


    logic [31:0] a;
    logic [31:0] b;
    alu_op_t alu_op;
    logic [31:0] out;
    logic [31:0] expected;

    alu dut (
        .a(a),
        .b(b),
        .alu_op(alu_op),
        .out(out)
    );

    // Test counter
    int total_test = 0;
    int fail = 0;

    task automatic test_alu(input alu_op_t op);

        for (int i = 0; i < 100; i++) begin
            a = $urandom;
            b = $urandom;
            alu_op = op;
            
            case (op)
                ALU_ADD: expected = a + b;
                ALU_SUB: expected = a - b;
                ALU_AND: expected = a & b;
                ALU_OR: expected = a | b;
                ALU_XOR: expected = a ^ b;
                ALU_SLT: expected = ($signed(a) < $signed(b)) ? 32'b1 : 32'b0;
                ALU_SLTU: expected = (a < b) ? 32'b1: 32'b0;
                ALU_SLL: expected = a << b[4:0];
                ALU_SRA: expected = $signed(a) >>> b[4:0];
                ALU_SRL: expected = a >> b[4:0];
                ALU_COPY_B: expected = b;
                ALU_XXX: expected = 32'b0;
                default: expected = 32'b0;
            endcase

            // Delay for ALU setup
            #10;

            total_test++;

            if (out != expected) begin 
                fail++;
                $display("At op %d, a %d, b %d, output %d, expected %d",
                    alu_op, a, b, out, expected);
            end

        end

    endtask

    initial begin

        test_alu(ALU_ADD);
        test_alu(ALU_SUB);
        test_alu(ALU_AND);
        test_alu(ALU_OR);
        test_alu(ALU_XOR);
        test_alu(ALU_SLT);
        test_alu(ALU_SLTU);
        test_alu(ALU_SLL);
        test_alu(ALU_SRA);
        test_alu(ALU_SRL);
        test_alu(ALU_COPY_B);
        test_alu(ALU_XXX);

        if (fail == 0) begin
            $display("All tests pass");
        end else begin
            $error("There are %d fails in total", fail);
        end

        $finish;
    end

endmodule
        
