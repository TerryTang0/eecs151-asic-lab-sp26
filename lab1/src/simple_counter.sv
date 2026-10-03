module simple_counter (
    input  logic       clk,
    input  logic       reset,
    output logic [1:0] counter_out
);
    logic [1:0] counter;

    always_ff @(posedge clk or posedge reset) begin
        if (reset) begin // TODO
            counter <= 2'b00;
        end else begin
            case (counter) // TODO
                2'b00: counter <= 2'b01;
                2'b01: counter <= 2'b10;
                2'b10: counter <= 2'b11; 
                2'b11: counter <= 2'b00;// TODO
            endcase
        end
    end

    assign counter_out = counter; // TODO
endmodule
