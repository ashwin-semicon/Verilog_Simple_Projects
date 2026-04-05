module mux4to1_tb;
reg [3:0] in;
reg [1:0] sel;
wire out_case, out_ifelse, out_using2to1;
mux4to1_case m1(in, sel, out_case);
mux4to1_ifelse m2(in, sel, out_ifelse);
mux4to1_using2to1 m3(in, sel, out_using2to1);
initial begin
    $dumpfile("mux4to1_tb.vcd");
    $dumpvars(0, mux4to1_tb);
    $monitor("time=%t, in=%b, sel=%b => out_case=%b, out_ifelse=%b, out_using2to1=%b", $time, in, sel, out_case, out_ifelse, out_using2to1);
    #0 in=4'b0000; sel=2'b00;
    #10 in=4'b0001; sel=2'b01;
    #10 in=4'b0010; sel=2'b10;
    #10 in=4'b0100; sel=2'b11;
    #10 in=4'b1000; sel=2'b00;
    #10 in=4'b1111; sel=2'b01;
    #10 in=4'b1010; sel=2'b10;
    #10 in=4'b0101; sel=2'b11;
    #10 $finish;
end
endmodule
