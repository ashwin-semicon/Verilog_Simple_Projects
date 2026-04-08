module Dff(
    input D, clk, rst,
    output reg Q,
    output wire Qbar
);
assign Qbar = ~Q;

always @(posedge clk, posedge rst) begin
    if (rst) begin
        Q <= 0;
    end 
    else begin
        Q <= D;
    end
end