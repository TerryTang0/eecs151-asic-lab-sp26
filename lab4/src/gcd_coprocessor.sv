`default_nettype none

//=========================================================================
// Template for GCD coprocessor
//-------------------------------------------------------------------------
//

module gcd_coprocessor #(
  parameter int W = 32
) (
  input  logic         clk,
  input  logic         reset,

  input  logic         operands_val,
  input  logic [W-1:0] operands_bits_A,
  input  logic [W-1:0] operands_bits_B,
  output logic         operands_rdy,

  output logic         result_val,
  output logic [W-1:0] result_bits,
  input  logic         result_rdy
);

  // You should be able to build this with only structural SystemVerilog!

  // TODO: Define wires
  logic fifoA_val;
  logic fifoA_rdy;
  logic fifoB_val;
  logic fifoB_rdy;
  logic [W-1:0] fifoA_data;
  logic [W-1:0] fifoB_data;
  logic control_enq_rdy;
  logic fifo_val;
  logic control_deq_val;
  logic result_enq_rdy;
  logic [W-1:0] datapath_data;
  logic B_mux_sel;
  logic A_en;
  logic B_en;
  logic [1:0] A_mux_sel;
  logic B_zero;
  logic A_lt_B;

  assign fifo_val = fifoA_val && fifoB_val;


  // TODO: Instantiate gcd_datapath
  gcd_datapath gcd_datapath(
    .operands_bits_A (operands_bits_A),
    .operands_bits_B (operands_bits_B),
    .result_bits_data (datapath_data),
    .clk (clk),
    .reset (reset),
    .B_mux_sel (B_mux_sel),
    .A_en (A_en),
    .B_en (B_en),
    .A_mux_sel (A_mux_sel),
    .B_zero (B_zero),
    .A_lt_B (A_lt_B)
  );

  // TODO: Instantiate gcd_control
  gcd_control gcd_control(
    .clk (clk),
    .reset (reset),
    .operands_val (fifo_val),
    .result_rdy (result_enq_rdy),
    .B_zero (B_zero),
    .A_lt_B (A_lt_B),
    .result_val (control_deq_val),
    .operands_rdy (control_enq_rdy),
    .A_mux_sel (A_mux_sel),
    .B_mux_sel (B_mux_sel),
    .A_en (A_en),
    .B_en (B_en)
  );

  // TODO: Instantiate request FIFO
  fifo fifoA(
    .clk (clk),
    .reset (reset),
    .enq_val (operands_val),
    .enq_data (operands_bits_A),
    .enq_rdy (fifoA_rdy),
    .deq_val (fifoA_val),
    .deq_data (fifoA_data),
    .deq_rdy (control_enq_rdy)
  );

  fifo fifoB(
    .clk (clk),
    .reset (reset),
    .enq_val (operands_val),
    .enq_data (operands_bits_B),
    .enq_rdy (fifoB_rdy),
    .deq_val (fifoB_val),
    .deq_data (fifoB_data),
    .deq_rdy (control_enq_rdy)
  );

  assign operands_rdy = fifoA_rdy && fifoB_rdy;

  // TODO: Instantiate response FIFO
  fifo result(
    .clk (clk),
    .reset (reset),
    .enq_val (control_deq_val),
    .enq_data (datapath_data),
    .enq_rdy (result_enq_rdy),
    .deq_val (result_val),
    .deq_data (result_bits),
    .deq_rdy (result_rdy)
  );

endmodule
