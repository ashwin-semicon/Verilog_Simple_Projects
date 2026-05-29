module PIPO2 (dout, din, ld, clk, clr);
input [31:0] din;
input ld, clk, clr;
output reg [31:0] dout;

always @ (posedge clk) begin
    if (clr) begin
        dout <= 0;
    end else if (ld) begin
        dout <= din;  
    end
end
endmodule
