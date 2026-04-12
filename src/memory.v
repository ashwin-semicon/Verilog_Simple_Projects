module my_memory(
    input wire clk,
    input wire rst,
    input wire [7:0] addr,
    input wire [7:0] data_in,
    output reg [7:0] data_out,
    input wire write_enable
);

reg [7:0] memory [512:0];
integer i;

always @(posedge clk or posedge rst) begin
    if (rst) begin
        // Initialize memory to zero on reset
        for (i = 0; i < 512; i = i + 1) begin
            memory[i] <= 8'b0;
        end
        data_out <= 8'b0;
    end else if (write_enable) begin
        // Write data to memory
        memory[addr] <= data_in;
    end else begin
        // Read data from memory
        data_out <= memory[addr];
    end
end
endmodule
