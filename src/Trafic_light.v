// Trafic light code
module Tracfic_light(
    input wire clk,
    input wire rst,
    output reg [2:0] light
);
    reg [1:0] state, next_state;
    parameter S0 = 2'b00, S1 = 2'b01, S2 = 2'b10;

    // State transition
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            state <= S0;
        end else begin
            state <= next_state;
        end
    end

    // Next state logic and output logic
    always @(*) begin
        case (state)
            S0: begin
                light = 3'b100; // Red
                next_state = S1;
            end
            S1: begin
                light = 3'b010; // Green
                next_state = S2;
            end
            S2: begin
                light = 3'b001; // Yellow
                next_state = S0;
            end
            default: begin
                light = 3'b100; // Default to Red
                next_state = S0;
            end
        endcase
    end 
endmodule
