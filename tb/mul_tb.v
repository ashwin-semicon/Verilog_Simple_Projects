module mul_tb;
reg [31:0] dataIn;
reg ldA, ldB, ldP, decB, clrP, clk;
wire [31:0] X, Y, Z, Bout;
wire eqz;
multiplication mul (X, Y, Z, Bout, eqz, dataIn, ldA, ldB, ldP, decB, clrP, clk);
controller ctrl (eqz, ldA, ldB, ldP, decB, clrP, clk);
v 
initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin
    dataIn = 5; ldA = 1; ldB = 1; ldP = 0; decB = 0; clrP = 1;
    #10 clrP = 0; ldA = 0; ldB = 0; ldP = 1;
    #10 ldP = 0; decB = 1;
    #50 $finish;
end
endmodule