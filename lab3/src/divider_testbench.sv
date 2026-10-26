`default_nettype none

`timescale 1 ns / 100 ps

module divider_testbench;

  localparam int WIDTH = 4;

  logic clk = 0;
  always #(`CLOCK_PERIOD/2) clk = ~clk;

  logic start;
  logic [WIDTH-1:0] dividend, divisor;
  logic [WIDTH-1:0] quotient, remainder;
  logic done;

  divider #(.WIDTH(WIDTH)) div_dut (
    .clk(clk),
    .start(start),
    .done(done),
    .dividend(dividend),
    .divisor(divisor),
    .quotient(quotient),
    .remainder(remainder)
  );

  always_ff @(posedge clk) begin
    $display("At time %d: start %d, done %d, dividend %d, divisor %d, quotient %d, remainder %d",
      $time, start, done, dividend, divisor, quotient, remainder);
  end

  // TODO: Add more tests
  initial begin
    #0;
    start    = 0;
    dividend = 0;
    divisor  = 1;

    repeat (10) @(posedge clk);
    start    = 1;
    dividend = 7;
    divisor  = 2;

    @(posedge clk) start = 0; // 'start' is HIGH for one cycle
    @(posedge clk);

    // wait until 'done' is asserted
    while (done == 0) begin
      @(posedge clk);
    end

    // Check Test 1: 7 / 2
    if (quotient !== 3 || remainder !== 1)
      $error("FAIL: 7 / 2");
    else
      $display("PASS: 7 / 2");

    // Test 2 (Covers the dividend in in 4 bits)
    @(negedge clk);
    start    = 1;
    dividend = 13;
    divisor  = 4;

    @(negedge clk);
    start = 0;

    // Wait for completion
    while (done == 0) begin
      @(posedge clk);
    end

    if (quotient !== 3 || remainder !== 1)
      $error("FAIL: 13 / 4");
    else
      $display("PASS: 13 / 4");

    // Test 3 (Covers the final remainder is 0)
    @(negedge clk);
    start    = 1;
    dividend = 12;
    divisor  = 3;

    @(negedge clk);
    start = 0;

    // Wait for completion
    while (done == 0) begin
      @(posedge clk);
    end

    if (quotient !== 4 || remainder !== 0)
      $error("FAIL: 12 / 3");
    else
      $display("PASS: 12 / 3");

    // Test 3 (Covers dividend < divisor)
    @(negedge clk);
    start    = 1;
    dividend = 6;
    divisor  = 8;

    @(negedge clk);
    start = 0;

    // Wait for completion
    while (done == 0) begin
      @(posedge clk);
    end

    if (quotient !== 0 || remainder !== 6)
      $error("FAIL: 6 / 8");
    else
      $display("PASS: 6 / 8");

    $finish();
  end

endmodule
