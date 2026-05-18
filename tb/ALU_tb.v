module ALU_tb;
reg [7:0] A, B;
reg [3:0] op;
wire [7:0] result;
wire carry_out, zero, negative, overflow;
ALU uut (
    .A(A),
    .B(B),
    .op(op),
    .result(result),
    .carry_out(carry_out),
    .zero(zero),
    .negative(negative),
    .overflow(overflow)
);
initial begin
    $monitor("A=%h, B=%h, op=%b => result=%h, carry_out=%b, zero=%b, negative=%b, overflow=%b", A, B, op, result, carry_out, zero, negative, overflow);
    $dumpfile("ALU_tb.vcd");
    $dumpvars(0, ALU_tb);

    // Test addition
    A = 8'hFF; B = 8'h01; op = 4'b0000; #10;
    // Test subtraction
    A = 8'h05; B = 8'h03; op = 4'b0001; #10;
    // Test AND
    A = 8'h0F; B = 8'hF0; op = 4'b0010; #10;
    // Test OR
    A = 8'h0F; B = 8'hF0; op = 4'b0011; #10;
    // Test XOR
    A = 8'h0F; B = 8'hF0; op = 4'b0100; #10;
    // Test NOT
    A = 8'hAA; op = 4'b0101; #10;
    // Test Shift Left
    A = 8'h01; op = 4'b0110; #10;
    // Test Shift Right
    A = 8'h80; op = 4'b0111; #10;
    $finish;
end
endmodule