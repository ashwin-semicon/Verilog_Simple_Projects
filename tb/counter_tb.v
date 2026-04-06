module counter_tb;
reg clk, rst, ld, mode;
reg [7:0] din;
wire [7:0] count;

counter8synchronous uut(
    .clk(clk),
    .rst(rst),
    .ld(ld),
    .mode(mode),
    .din(din),
    .count(count)
);

initial clk = 0;
always #5 clk = ~clk;
initial begin
    $dumpfile("counter.vcd");
    $dumpvars(0,counter_tb);
    $monitor("time=%t, rst=%b, ld=%b, mode=%b, din=%b, count=%b", $time, rst, ld, mode, din, count);
    #0 rst = 1; ld = 0; mode = 0; din = 8'b00000000;
    #8 rst = 0; ld = 1; mode = 1; din = 8'b00011111;
    #10 ld = 0;
    #100 rst = 1;
    #10 rst = 0; ld = 1; mode = 0; din = 8'b00000111;
    #10 ld = 0;
    #60 $finish;
end
endmodule