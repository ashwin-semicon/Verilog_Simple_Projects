module JKff_tb;
reg clk, rst, J, K;
wire Q, Qbar;

JKff uut (clk, rst, J, K, Q, Qbar);

initial clk = 0;
always #5 clk = ~clk;

initial begin
    $dumpfile("JKff.vcd");
    $dumpvars(0,JKff_tb);
    $monitor("time = %t, clk = %b, J = %b, K = %b, Q = %b, Qbar = %b, rst = %b", $time , clk, J, K, Q, Qbar, rst);
    #3 rst = 1; J = 0; K = 0;
    #20 rst = 0; J = 0; K = 0;
    #10 J = 0; K = 1;
    #10 J = 1; K = 0;
    #10 J = 1; K = 1;
    #10 J = 0; K = 0;
    #10 J = 0; K = 1;
    #10 J = 1; K = 0;
    #10 J = 1; K = 1;
    #10 $finish;
end
endmodule