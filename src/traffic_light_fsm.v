module Traffic_Light_FSM (
    input wire clk,
    input wire rst,
    output reg [2:0] lights
);

parameter RED = 3'b100, YELLOW = 3'b010, GREEN = 3'b001;

reg [1:0] state, next_state;

always @(posedge clk or posedge rst) begin
    if (rst) begin
        state <= RED;
    end else begin
        state <= next_state;
    end
end

always @(*) begin
    case (state)
        RED: begin
            next_state = YELLOW;
            lights = RED;
        end
        GREEN: begin
            next_state = RED;
            lights = GREEN;
        end
        YELLOW: begin
            next_state = GREEN;
            lights = YELLOW;
        end
        default: begin
            next_state = RED;
            lights = RED;
        end
    endcase
end
endmodule

