module gcd_control (clk, rst, ldA, ldB, sel_in, sel_1, sel_2, lt, eq, gt, start, done);
    input clk, rst, lt, eq, gt, start;
    output reg ldA, ldB, sel_in, sel_1, sel_2, done;

    reg [2:0] state;

    parameter S0 = 3'b000, S1 = 3'b001, S2 = 3'b010, S3 = 3'b011, S4 = 3'b100, S5 = 3'b101;

    always @ (posedge clk or posedge rst) begin
        if (rst) begin
            state <= S0;
            ldA <= 0;
            ldB <= 0;
            sel_in <= 0;
            sel_1 <= 0;
            sel_2 <= 0;
            done <= 0;
        end else begin
            case (state)
                S0: begin
                    if (start) begin
                        state <= S1;
                    end
                end
                S1: state <= S2;
                S2: begin
                        #2  if (eq) state <= S5;
                            else if (lt) state <= S3;
                            else if (gt) state <= S4;
                end 
                S3: begin
                    #2 if (eq) state <= S5;
                    else if (lt) state <= S3;
                    else if (gt) state <= S4;
                end
                S4: begin
                    #2 if (eq) state <= S5;
                    else if (lt) state <= S3;
                    else if (gt) state <= S4;
                end
                S5: begin
                    state <= S5;;
                end
                default: state <= S0;
            endcase
        end
    end

    always @(state) begin
        case (state)
            S0: begin
                sel_in <= 1;
                ldA <= 1;
                ldB <= 0;
                done <= 0;
            end
            S1: begin
                sel_in <= 1;
                ldA <= 0;
                ldB <= 1;
                done <= 0;
            end
            S2: begin
              if (eq) done <= 1;
              else if (lt) begin
                sel_1 <= 1;
                sel_2 <= 0;
                sel_in <= 0;
                #1  ldA <= 0;
                    ldB <= 1;
              end
              else if (gt) begin
                sel_1 <= 0;
                sel_2 <= 1;
                sel_in <= 0;
                #1  ldA <= 1;
                    ldB <= 0;
              end
            end
            S3: begin
                if (eq) done <= 1;
              else if (lt) begin
                sel_1 <= 1;
                sel_2 <= 0;
                sel_in <= 0;
                #1  ldA <= 0;
                    ldB <= 1;
              end
              else if (gt) begin
                sel_1 <= 0;
                sel_2 <= 1;
                sel_in <= 0;
                #1  ldA <= 1;
                    ldB <= 0;
              end
            end
            S4: begin
                if (eq) done <= 1;
              else if (lt) begin
                sel_1 <= 1;
                sel_2 <= 0;
                sel_in <= 0;
                #1  ldA <= 0;
                    ldB <= 1;
              end
              else if (gt) begin
                sel_1 <= 0;
                sel_2 <= 1;
                sel_in <= 0;
                #1  ldA <= 1;
                    ldB <= 0;
              end
            end
            S5: begin
                done <= 1;
                sel_1 <= 0;
                sel_2 <= 0;
                ldA <= 0;
                ldB <= 0;
            end
            default: begin
                ldA <= 0;
                ldB <= 0;
            end
        endcase
    end
endmodule


                