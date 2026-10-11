module dut (
	input  logic A, B, clk, rst,
	output logic X, Z
);
	logic tmp;

	REGISTER_R #(.N(1)) delay_step0 (.clk(clk), .rst(rst), .d(B), .q(X));
	REGISTER_R #(.N(1)) delay_step1 (.clk(clk), .rst(rst), .d(tmp), .q(Z));

	assign tmp = (Z & X) | A;
  
endmodule
