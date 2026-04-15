module RAM_tb;

reg clk, cs, rd, wr;
reg [9:0] addr;
reg [7:0] data_in;
wire [7:0] data;

assign data = (wr && cs) ? data_in : 8'bz;

RAM_Single_port ram (
    .clk(clk),
    .cs(cs),
    .rd(rd),
    .wr(wr),
    .addr(addr),
    .data(data)
);

initial begin
    $dumpfile("RAM.vcd");
    $dumpvars(0, RAM_tb);

    $monitor("Time: %0t | cs: %b | rd: %b | wr: %b | addr: %h | data_in: %h | data: %h",
              $time, cs, rd, wr, addr, data_in, data);

    clk = 0; cs = 0; rd = 0; wr = 0; addr = 0; data_in = 0;

    // Write
    #10 cs = 1; wr = 1; addr = 0; data_in = 8'hAA;
    #10 addr = 1; data_in = 8'h55;
    #10 wr = 0;

    // Read
    #10 rd = 1; addr = 0;
    #10 addr = 1;
    #10 rd = 0; cs = 0;

    #20 $finish;
end

always #5 clk = ~clk;

endmodule