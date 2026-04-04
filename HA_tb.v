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
        // Test case 1: A=0, B=0
        A = 0; B = 0; #10;
        $display("A=%b, B=%b => Sum=%b, Carry=%b", A, B, Sum, Carry);
        
        // Test case 2: A=0, B=1
        A = 0; B = 1; #10;
        $display("A=%b, B=%b => Sum=%b, Carry=%b", A, B, Sum, Carry);
        
        // Test case 3: A=1, B=0
        A = 1; B = 0; #10;
        $display("A=%b, B=%b => Sum=%b, Carry=%b", A, B, Sum, Carry);
        
        // Test case 4: A=1, B=1
        A = 1; B = 1; #10;
        $display("A=%b, B=%b => Sum=%b, Carry=%b", A, B, Sum, Carry);
        
        $finish;
    end
endmodule
