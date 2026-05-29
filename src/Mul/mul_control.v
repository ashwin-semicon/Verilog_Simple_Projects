module mul_control (clr,ldA, ldB, ldP, decB, clrP, clk, zero_flag);
input clk, zero_flag, clr;
output reg ldA, ldB, ldP, decB, clrP;

reg [2:0] state, next_state;

parameter S0 = 3'b000, S1 = 3'b001, S2 = 3'b010, S3 = 3'b011;

always @ (posedge clk) begin
    if (clr) begin
        state <= S0;
    end else begin
        state <= next_state;
    end
end

always @ (*) begin
    case (state)
        S0: begin
            ldA = 1; ldB = 0; ldP = 0; decB = 0; clrP = 1;
            next_state = S1;
        end
        S1: begin
            ldA = 0; ldB = 1; ldP = 0; decB = 0; clrP = 0;
            next_state = S2;
        end
        S2: begin
            ldA = 0; ldB = 0; ldP = 1; decB = 1; clrP = 0;
            if (zero_flag) begin
                next_state = S3;
            end else begin
                next_state = S2;
            end
        end
        S3: begin
            ldA = 0; ldB = 0; ldP = 0; decB = 0; clrP = 0;
            next_state = S3;
        end
        default: begin
            ldA = 0; ldB = 0; ldP = 0; decB = 0; clrP = 0;
            next_state = S0;
        end
    endcase
end
endmodule
