`default_nettype none

// Implement a vector dot product of a and b
// using a single-port SRAM of 5-bit address width, 16-bit data width

module dot_product #(
  localparam int ADDR_WIDTH = 5,
  parameter int WIDTH      = 32
) (
  input  logic                 clk,
  input  logic                 rst,

  input  logic [ADDR_WIDTH:0]  len,

  // input vector a
  input  logic [WIDTH-1:0]     a_data,
  input  logic                 a_valid,
  output logic                 a_ready,

  // input vector b
  input  logic [WIDTH-1:0]     b_data,
  input  logic                 b_valid,
  output logic                 b_ready,

  // dot product result c
  output logic [WIDTH-1:0]     c_data,
  output logic                 c_valid,
  input  logic                 c_ready
);

  typedef enum logic [2:0] {
    S_LOAD        = 3'd0,
    S_SET_A_ADDR  = 3'd1,
    S_GET_A       = 3'd2,
    S_SET_B_ADDR  = 3'd3,
    S_GET_B       = 3'd4,
    S_DONE        = 3'd5
  } state_t;

  // Handshakes
  logic a_fire, b_fire, c_fire;
  assign a_fire = a_valid && a_ready;
  assign b_fire = b_valid && b_ready;
  assign c_fire = c_valid && c_ready;

  // SRAM interface
  logic                 ce;
  logic                 rstb;
  logic                 we;
  logic [3:0]           wmask;
  logic [ADDR_WIDTH:0]  addr;
  logic [31:0] din;
  logic [31:0] dout;

  assign ce    = 1'b1;
  assign rstb  = ~rst;
  assign wmask = 4'b1111;

  sram22_64x32m4w8 sram (
    .clk  (clk),
    .rstb (rstb),
    .ce   (ce),
    .we   (we),
    .wmask(wmask),
    .addr (addr),
    .din  (din),
    .dout (dout)
  );

  // TODO: fill in the rest of this module.

  state_t state, next_state;

  logic [ADDR_WIDTH:0] a_count;
  logic [ADDR_WIDTH:0] b_count;
  logic [ADDR_WIDTH:0] index;

  logic [WIDTH-1:0] a_reg; 
  logic [WIDTH-1:0] result;

  always_ff @(posedge clk) begin
    if (rst) begin
      state <= S_LOAD;
      a_count <= '0;
      b_count <= '0;
      index <= '0;
      a_reg <= '0;
      result <= '0;
    end else begin
      state <= next_state;

      case (state)
        S_LOAD: begin
          
          if (a_fire) begin
            a_count <= a_count + 1'b1;
          end
          
          if (b_fire) begin
            b_count <= b_count +1'b1;
          end
        end

        S_GET_A: begin
          a_reg <= dout[WIDTH-1:0];
        end

        S_GET_B: begin
          result <= result + (a_reg * dout[WIDTH-1:0]);         
          index <= index + 1'b1;
        end

        S_DONE: begin
          if (c_fire) begin
            a_count <= '0;
            b_count <= '0;
            index <= '0;
            result <= '0;
          end
        end

        default: begin
        end
      endcase
        
    end

  end

  always_comb begin

    next_state = state;
    a_ready = 1'b0;
    b_ready = 1'b0;
    c_valid = 1'b0;
    we = 1'b0;
    addr = '0;
    din = '0;

    case (state)

      S_LOAD: begin
        a_ready = (a_count < len);

        b_ready = (b_count < len) && !(a_fire);

        if (a_fire) begin
            we   = 1'b1;
            addr = {1'b0, a_count[4:0]};
            din  = 32'(a_data);
        end else if (b_fire) begin
            we   = 1'b1;
            addr = {1'b1, b_count[4:0]};
            din  = 32'(b_data);
        end

        if ((a_count == len) && (b_count == len)) begin
            next_state = S_SET_A_ADDR;
        end

      end


      S_SET_A_ADDR: begin
        we = '0;
        addr = {1'b0, 5'(index)};
        next_state = S_GET_A;
      end


      S_GET_A: begin
        next_state = S_SET_B_ADDR;
      end


      S_SET_B_ADDR: begin
        we = '0;
        addr = {1'b1, 5'(index)};
        next_state = S_GET_B;
      end


      S_GET_B: begin
        if (index < (len - 6'b1)) begin
          next_state = S_SET_A_ADDR;
        end else begin
          next_state = S_DONE;
        end
      end

        
      S_DONE: begin
        c_valid = 1'b1;
        
        if (c_fire) begin
          next_state = S_LOAD;
        end
      end

      default: begin
        next_state = S_LOAD;
      end
    endcase
  end

  assign c_data = result;

  //Assertion 1: check that only one input can have handskae
  Single_Handshake: assert property (
    @(posedge clk) disable iff (rst)
    !(a_fire && b_fire)
  ) else $error("Both A and B accepted in same cycle!");

  //Assertion 2: output signal should stay stable
  Stable_Output: assert property (
    @(posedge clk) disable iff (rst)
    (c_valid && !c_ready) |=> (c_ready && $stable(c_data))
  ) else $error("Output handshake signal is not stable!");

endmodule
