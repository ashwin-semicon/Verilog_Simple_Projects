module toggle_tb;
reg clk;
reg rst;
reg btn;
wire LED;
Toggle uut(
    .clk(clk),
    .rst(rst),
    .btn(btn),
    .LED(LED)
);

initial begin
    clk = 0;
end

always #5 clk = ~clk;

initial begin
    $monitor("Time: %0t | rst: %b | btn: %b | LED: %b", $time, rst, btn, LED);
    $dumpfile("toggle_tb.vcd");
    $dumpvars(0, toggle_tb);
    rst = 1;
    btn = 0;
    #10;
    rst = 0;
    #10;
    btn = 1;
    #10;
    btn = 0;
    #10;
    btn = 1;
    #10;
    btn = 0;
    #10;
    $finish;
end
endmodule
