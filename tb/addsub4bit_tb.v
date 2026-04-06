module addsub4bit_tb;
reg [3:0] a,b;
reg sel;
wire [3:0] result;
wire cout;
four_bit_adder_sub uut(a,b,sel,result,cout);

initial begin
    $dumpfile("addsub4bit.vcd");
    $dumpvars(0, addsub4bit_tb);
    $monitor("time=%t, a=%b, b=%b, sel=%b, result=%b, cout=%b", $time, a, b, sel, result, cout);
    #0  a = 4'b0000; b = 4'b0000; sel = 0;
    #10 a = 4'b0010; b = 4'b0001; sel = 0;
    #10 a = 4'b1010; b = 4'b0101; sel = 0;
    #10 a = 4'b1111; b = 4'b0001; sel = 0;
    #10 a = 4'b1100; b = 4'b0000; sel = 1;
    #10 a = 4'b1100; b = 4'b0011; sel = 1;
    #10 a = 4'b0011; b = 4'b1100; sel = 1;
    #10 $finish;
end
endmodule
