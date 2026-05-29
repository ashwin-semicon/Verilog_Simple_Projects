module PIPO_with_dec (dout, din, ld, clk, dec, zero_flag);
input [31:0] din;
input ld, clk, dec;
output reg [31:0] dout;
output wire zero_flag;
assign zero_flag = (dout == 0) ? 1 : 0;

always @ (posedge clk) begin
     if (ld) begin
        dout <= din;
    end else if (dec) begin
        dout <= dout - 1;
    end
end
endmodule
