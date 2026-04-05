module add4bit_tb;
reg [3:0] a,b;
reg cin;
wire [3:0] sum;
wire cout;
add4bit_usingFA uut(a,b,cin,sum,cout);

initial begin
    $dumpfile("add4bit_tb.vcd");
    $dumpvars(0, add4bit_tb);
    $monitor("time=%t, a=%b, b=%b, cin=%b, sum=%b, cout=%b", $time, a, b, cin, sum, cout);
    a = 4'b0000; b = 4'b0000; cin = 0;
    #10 a = 4'b0001; b = 4'b0001; cin = 0;
    #10 a = 4'b0010; b = 4'b0010; cin = 0;
    #10 a = 4'b0100; b = 4'b0100; cin = 0;
    #10 a = 4'b1000; b = 4'b1000; cin = 0;
    #10 a = 4'b1111; b = 4'b1111; cin = 1;
    #10 $finish;
    end
endmodule
