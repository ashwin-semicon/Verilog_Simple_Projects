module counter4asyncdown(
    input clk, rst,
    output [3:0] count
);
wire [3:0] Qbar;
JKff jk0 (clk, rst, 1'b1, 1'b1, count[0], Qbar[0]);
JKff jk1 (count[0], rst, 1'b1, 1'b1, count[1], Qbar[1]);
JKff jk2 (count[1], rst, 1'b1, 1'b1, count[2], Qbar[2]);
JKff jk3 (count[2], rst, 1'b1, 1'b1, count[3], Qbar[3]);

endmodule

module counter4asyncup(
    input clk, rst,
    output [3:0] count
);
wire [3:0] Qbar;
JKff jk0 (clk, rst, 1'b1, 1'b1, count[0], Qbar[0]);
JKff jk1 (Qbar[0], rst, 1'b1, 1'b1, count[1], Qbar[1]);
JKff jk2 (Qbar[1], rst, 1'b1, 1'b1, count[2], Qbar[2]);
JKff jk3 (Qbar[2], rst, 1'b1, 1'b1, count[3], Qbar[3]);
endmodule
