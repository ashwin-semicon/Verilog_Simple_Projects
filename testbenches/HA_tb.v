module HA_tb;
    reg A, B;
    wire Sum, Carry;
    HA ha_inst (
        .a(A),
        .b(B),
        .sum(Sum),
        .carry(Carry)
    );
    initial begin
        $dumpfile("HA_tb.vcd");
        $dumpvars(0, HA_tb);
        $monitor("time=%t, A=%b, B=%b => Sum=%b, Carry=%b", $time, A, B, Sum, Carry);
        #0 A=0; B=0;
        #10 A=0; B=1;
        #10 A=1; B=0;
        #10 A=1; B=1;
        #10 $finish;
    end
endmodule
