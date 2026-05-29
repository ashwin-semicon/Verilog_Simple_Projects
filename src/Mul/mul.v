module Mul_repeated_addition(dataIn, ldA, ldB, ldP, clrP, clk, eq_to_zero, decB, Result);
input [31:0] dataIn;
input ldA, ldB, ldP, clrP, clk, decB;
output eq_to_zero;
output [31:0] Result;
wire [31:0] X, Y, Z, bus, Bout;

assign bus = dataIn;

PIPO1 A (.dout(X), .din(bus), .ld(ldA), .clk(clk));
PIPO2 P (.dout(Y), .din(Z), .ld(ldP), .clk(clk), .clr(clrP));
adder add (.sum(Z), .a(X), .b(Y));
PIPO_with_dec B (.dout(Bout), .din(bus), .ld(ldB), .dec(decB), .clk(clk), .zero_flag(eq_to_zero));

endmodule