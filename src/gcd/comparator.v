module comparator (A, B, lt, eq, gt);
    input [31:0] A, B;
    output lt, eq, gt;

    assign lt = (A < B);
    assign eq = (A == B);
    assign gt = (A > B);
endmodule
