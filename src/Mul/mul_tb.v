`timescale 1ns/1ps

module tb_top_mul;

    reg clk;
    reg clr;
    reg [31:0] dataIn;
    wire [31:0] Result;

    // Instantiate DUT
    top_mul DUT (
        .clk(clk),
        .clr(clr),
        .dataIn(dataIn),
        .Result(Result)
    );

    // Clock generation (10 ns period)
    always #5 clk = ~clk;

    initial begin
        // Waveform dump
        $dumpfile("wave.vcd");
        $dumpvars(0, tb_top_mul);

        // Initialize
        clk = 0;
        clr = 1;
        dataIn = 0;

        // Reset
        #10;
        clr = 0;

        // Load A = 20
        dataIn = 20;
        #10;

        // Load B = 33
        dataIn = 33;
        #10;

        // Wait for multiplication to complete
        #400;

        // Display result
        $display("20 * 33 = %d", Result);

        $finish;
    end

endmodule