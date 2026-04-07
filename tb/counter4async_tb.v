module counter4async_tb;

reg clk, rst;
wire [3:0] count;

counter4asyncup dut (clk, rst, count);

// Clock generation
initial clk = 0;
always #5 clk = ~clk;

// Stimulus
initial begin
    $dumpfile("counter4asyncup.vcd");
    $dumpvars(0, counter4async_tb);
    $monitor("Time: %0t | Count: %b", $time, count);
    rst = 1;
    #5 rst = 0;

    #200 $finish;
end
endmodule