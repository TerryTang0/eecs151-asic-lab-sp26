`default_nettype none

module divider #(
  parameter int WIDTH = 4
) (
  input  logic               clk,
  input  logic               start,
  output logic               done,
  input  logic [WIDTH-1:0]   dividend,
  input  logic [WIDTH-1:0]   divisor,
  output logic [WIDTH-1:0]   quotient,
  output logic [WIDTH-1:0]   remainder
);

  // Feel free to change the code as long as your final code implements a divider
  // Check the algorithm described in the slides (URL in the spec)
  // Pay attention to the block diagram(s)

  typedef enum logic [1:0] {
    IDLE = 2'b00,
    CALC = 2'b01,
    DONE = 2'b10
  } state_t;

  state_t state, next_state;

  // Create registers
  logic [WIDTH-1:0] counter_reg, next_counter;
  logic [WIDTH-1:0] quotient_reg, next_quotient;
  logic [2*WIDTH-1:0] divisor_reg, next_divisor;
  logic [2*WIDTH-1:0] remainder_reg, next_remainder;

  // Registers update
  always_ff @(posedge clk) begin
    state <= next_state;
    counter_reg <= next_counter;
    quotient_reg <= next_quotient;
    divisor_reg <= next_divisor;
    remainder_reg <= next_remainder;
  end
  

  always_comb begin

    next_state = state;
    next_counter = counter_reg;
    next_quotient = quotient_reg;
    next_divisor = divisor_reg;
    next_remainder = remainder_reg;

    case(state)

      IDLE: begin
        next_counter = '0;
        if (start) begin
          next_counter = '0;
          next_quotient = '0;
          next_divisor = {divisor, {WIDTH{1'b0}}};
          next_remainder = {{WIDTH{1'b0}}, dividend};
          next_state = CALC;
        end
      end

      CALC: begin

        next_counter = counter_reg + 1;
        next_divisor = divisor_reg >> 1;

        if (remainder_reg < divisor_reg) begin
          next_remainder = remainder_reg;
          next_quotient = quotient_reg << 1;

          if (next_counter < WIDTH'(WIDTH + 1)) begin
            next_state = CALC;
          end else begin
            next_state = DONE;
          end

        end else begin
          next_remainder = remainder_reg - divisor_reg;
          next_quotient = (quotient_reg << 1) | WIDTH'(1);

          if (next_counter < WIDTH'(WIDTH + 1)) begin
            next_state = CALC;
          end else begin
            next_state = DONE;
          end
        
        end

      end

      DONE: begin
        next_state = IDLE;
      end

      default: begin
        next_state = IDLE;
        next_counter = 0;
      end

    endcase

  end
    
  assign quotient  = quotient_reg;
  assign remainder = remainder_reg[WIDTH-1:0];
  assign done = (state == DONE);


endmodule
