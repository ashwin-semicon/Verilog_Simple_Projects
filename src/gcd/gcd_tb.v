module gdc_tb;
    reg clk, rst, start;
    reg [31:0] A, B;
    reg [31:0] data_in;
    wire done;

    gcd uut(.clk(clk), .rst(rst), .data_in(data_in), .ldA(ldA), .ldB(ldB), .sel_in(sel_in), .sel_1(sel_1), .sel_2(sel_2), .lt(lt), .eq(eq), .gt(gt));
    gcd_control ctrl(.clk(clk), .rst(rst), .ldA(ldA), .ldB(ldB), .sel_in(sel_in), .sel_1(sel_1), .sel_2(sel_2), .lt(lt), .eq(eq), .gt(gt), .start(start), .done(done));

initial begin
    clk = 1'b0;
    rst = 1'b1;
    #10 rst = 1'b0;
    #2 start = 1'b1;
    #1000 $finish;
end

always #5 clk = ~clk;

initial begin
    #14 data_in = 32'd238;
    #10 data_in = 32'd72;
end

initial begin
    $monitor("At time %t, A = %d, B = %d, GCD = %d", $time, uut.regA.data_out, uut.regB.data_out, uut.regA.data_out);
    $dumpfile("gcd.vcd");
    $dumpvars(0, gdc_tb);
end

endmodule