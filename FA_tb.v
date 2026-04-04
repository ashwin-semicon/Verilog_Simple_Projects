module FA_tb;
    reg A, B, Cin;
    wire Sum, Carry;
    FA uut (A, B, Cin, Sum, Carry);
    initial begin
        $monitor("time=%t, A=%b, B=%b, Cin=%b => Sum=%b, Carry=%b", $time, A, B, Cin, Sum, Carry);
        #0 A=0; B=0; Cin=0;
        #10 A=0; B=0; Cin=1;
        #10 A=0; B=1; Cin=0;
        #10 A=0; B=1; Cin=1;
        #10 A=1; B=0; Cin=0;
        #10 A=1; B=0; Cin=1;
        #10 A=1; B=1; Cin=0;
        #10 A=1; B=1; Cin=1;
        $finish;
    end
endmodule
