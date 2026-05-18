module RAM_2 (
    input clk, cs, rd, wr,
    input [10:0] addr,
    inout [7:0] data
);
reg [7:0] mem [0:4096];
reg [7:0] data_out;

assign data = (cs && rd) ? data_out : 8'bz;

always @(*) begin
    if(cs && rd && !wr) begin
        data_out = mem[addr];
    end
    else begin
        data_out = 8'b0;
    end
end

always @(posedge clk) begin
    if(cs && wr && !rd) begin
        mem[addr] <= data;
    end
end
endmodule
