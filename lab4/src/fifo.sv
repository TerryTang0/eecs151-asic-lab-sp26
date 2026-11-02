`default_nettype none

//=========================================================================
// FIFO Template
//-------------------------------------------------------------------------
//
//`include "EECS151.sv"

module fifo #(
    parameter int WIDTH    = 8,
    parameter int LOGDEPTH = 3
) (
    input  logic             clk,
    input  logic             reset,

    input  logic             enq_val,
    input  logic [WIDTH-1:0] enq_data,
    output logic             enq_rdy,

    output logic             deq_val,
    output logic [WIDTH-1:0] deq_data,
    input  logic             deq_rdy
);

    localparam int DEPTH = (1 << LOGDEPTH);

    // the buffer itself. Take note of the 2D syntax.
    logic [WIDTH-1:0] buffer [DEPTH-1:0];
    // read pointer, write pointer
    logic [LOGDEPTH-1:0] rptr, wptr;
    // is the buffer full? This is needed for when rptr == wptr
    logic full;

    // Define any additional regs or wires you need (if any) here

    // use "fire" to indicate when a valid transaction has been made
    logic enq_fire;
    logic deq_fire;

    assign enq_fire = enq_val & enq_rdy;
    assign deq_fire = deq_val & deq_rdy;

    // Your code here (don't forget the reset!)

    assign enq_rdy = !full;
    assign deq_val = (rptr != wptr) || full;
    assign deq_data = buffer[rptr];

    
    always_ff @(posedge clk) begin

        // Reset
        if (reset) begin 
            rptr <= '0;
            wptr <= '0;
            full <= '0;
        end

        // Input
        else begin

            // Enqueue
            if (enq_fire) begin
                buffer [wptr] <= enq_data;
                wptr <= (wptr + 1'b1);
            end
        
            // Dequeue
            if (deq_fire) begin
                rptr <= (rptr + 1'b1);
            end

            // Full
            if (enq_fire && !deq_fire) begin
                full <= ((wptr + 1'b1) == rptr);
            end
            else if (!enq_fire && deq_fire) begin
                full <= '0;
            end
        end
    end

endmodule
