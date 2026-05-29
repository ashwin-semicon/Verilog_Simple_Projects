module Toggle (
    input wire clk,
    input wire rst,
    input wire btn,
    output reg LED
);

parameter OFF = 1'b0, ON = 1'b1;
reg state, next_state;

always @(posedge clk or posedge rst) begin
    if (rst) begin
        state <= OFF;
    end 
    else begin
        state <= next_state;
    end
end

always @(*) begin
    case (state)
        OFF: begin
            if (btn) begin
                next_state = ON;
            end else begin
                next_state = OFF;
            end
            LED = 0;
        end
        ON: begin
            if (btn) begin
                next_state = OFF;
            end else begin
                next_state = ON;
            end
            LED = 1;
        end
        default: begin
            next_state = OFF;
            LED = 0;
        end
    endcase
end
endmodule