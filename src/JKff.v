module JKff(
    input clk, rst, J, K,
    output reg Q,
    output wire Qbar // note that Qbar is driven by Q and when Q changes it must change always so it must be a wire type.
);

assign Qbar = ~Q; //This is critical because You should not drive Qbar by providing it 1 or 0 from the the outside

always @(posedge clk, posedge rst) begin
    if(rst) begin
        Q <= 1'b0;
    end
    else begin
        case ({J,K})
            2'b00: begin
                Q <= Q;
            end
            2'b01: begin
                Q <= 1'b0;
            end
            2'b10: begin
                Q <= 1'b1;
            end
            2'b11: begin
                Q <= ~Q;
            end
        endcase
    end
end
endmodule
