module seq_det_tb;
    reg clk, rst, x;
    wire z;

seq_det uut(.clk(clk), .rst(rst), .x(x), .z(z));
    initial clk = 0;
    always #5 clk = ~clk;
    initial begin
        $dumpfile("seq_det.vcd");
        $dumpvars(0, seq_det_tb);
        $monitor("At time %t: x = %b, clk = %b, rst = %b, z = %b, PS=%b, NS=%b ", $time, x, clk, rst, z, seq_det_tb.uut.PS, seq_det_tb.uut.NS);
        #0 x = 0;
        #7 x = 1; rst = 1;
        #5 rst = 0;
        #5 x = 0;
        #10 x = 1;
        #10 x = 1;
        #10 x = 0;
        #10 x = 1;
        #10 x = 1;
        #10 x = 0;
        #10 x = 0;
        #10 x = 1;
        #10 x = 1;
        #10 x = 0;
        #10 x = 1;
        #10 x = 1;
        #10 x = 0;
        #10 x = 1;
        #10 x = 1;
        #10 x = 0;
        #10 $finish;
    end
endmodule