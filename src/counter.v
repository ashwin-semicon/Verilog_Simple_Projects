module counter8synchronous (
    input clk, rst, ld, mode,
    input [7:0] din,
    output reg [7:0] count
);
always@(posedge clk, posedge rst) begin
    if (rst) begin
        count <= 8'b00000000;
    end
    else if (ld) begin
        count <= din;
    end
    else if (mode == 1) begin
        count <= count + 1;
    end
    else if (mode == 0) begin
        count <= count - 1;
    end
end
endmodule
