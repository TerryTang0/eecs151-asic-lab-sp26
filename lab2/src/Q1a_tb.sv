module Q1a_tb;

    logic A, B, clk, rst;
    logic X, Z;

    dut uut(
        .A(A),
        .B(B),
        .clk(clk),
        .rst(rst),
        .X(X),
        .Z(Z)
    );

    initial clk = 0;
    always #(`CLOCK_PERIOD/2) clk = ~clk;

    initial begin

        $dumpfile("build/q1a.vcd");
        $dumpvars(0, Q1a_tb);

        // Initialize all other inputs
        A = 0;
        B = 0;
        rst = 1;

        @(negedge clk) rst <= 1'b0;

        @(negedge clk) begin
            A <= 1'b1;
            B <= 1'b1;
        end

        @(negedge clk) begin
            A <= 1'b1;
            B <= 1'b0;
        end

        @(negedge clk) begin
            A <= 1'b0;
            B <= 1'b1;
        end

        @(negedge clk) begin
            A <= 1'b0;
            B <= 1'b0;
        end

        repeat (5) @(negedge clk);

        $finish;
    end

    always @(negedge clk) begin
        $display(
            "Time: %0t, A=%b, B=%b, rst=%b, X=%b, Z=%b",
            $time, A, B, rst, X, Z
        );
    end

endmodule

