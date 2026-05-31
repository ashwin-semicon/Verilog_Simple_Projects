module gcd (clk, rst, data_in, ldA, ldB, sel_in, sel_1, sel_2, lt, eq, gt);
    input clk, rst, ldA, ldB, sel_in, sel_1, sel_2;
    input [31:0] data_in;
    output lt, eq, gt;

    wire [31:0] A, B, sub_out, mux1_out, mux2_out, bus;


    pipo regA (
        .clk(clk),
        .rst(rst),
        .ld(ldA),
        .data_in(bus),
        .data_out(A)
    );
    pipo regB (
        .clk(clk),
        .rst(rst),
        .ld(ldB),
        .data_in(bus),
        .data_out(B)
    );
    mux mux1 (
        .A(A),
        .B(B),
        .sel(sel_1),
        .out(mux1_out)
    );
        mux mux2 (
        .A(A),
        .B(B),
        .sel(sel_2),
        .out(mux2_out)
    );
    sub subtractor (
        .A(mux1_out),
        .B(mux2_out),
        .out(sub_out)
    );
    comparator comp(
        .A(A),
        .B(B),
        .lt(lt),
        .eq(eq),
        .gt(gt)
    );

endmodule



