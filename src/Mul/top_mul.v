module top_mul (
    input clk,
    input clr,
    input [31:0] dataIn,
    output [31:0] Result
);

    // Internal control wires
    wire ldA, ldB, ldP, decB, clrP;
    wire zero_flag;

    // Datapath instantiation
    Mul_repeated_addition datapath (
        .dataIn(dataIn),
        .ldA(ldA),
        .ldB(ldB),
        .ldP(ldP),
        .decB(decB),
        .clrP(clrP),
        .clk(clk),
        .eq_to_zero(zero_flag),
        .Result(Result)
    );

    // Controller instantiation
    mul_control controller (
        .clr(clr),
        .ldA(ldA),
        .ldB(ldB),
        .ldP(ldP),
        .decB(decB),
        .clrP(clrP),
        .clk(clk),
        .zero_flag(zero_flag)
    );

endmodule