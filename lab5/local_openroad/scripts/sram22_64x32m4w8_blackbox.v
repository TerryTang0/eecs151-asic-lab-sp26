// Synthesis-only SRAM22 port declaration.
// DO NOT use this stub instead of the behavioral SRAM model in simulation.
// OpenROAD will later use the real SRAM22 LEF and Liberty timing views.
(* blackbox *)
module sram22_64x32m4w8 (
    input wire         clk,
    input wire         rstb,
    input wire         ce,
    input wire         we,
    input wire [3:0]   wmask,
    input wire [5:0]   addr,
    input wire [31:0]  din,
    output wire [31:0] dout
);
endmodule
