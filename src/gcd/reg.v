module pipo (clk, rst, ld, data_in, data_out);
    input clk, rst, ld;
    input [31:0] data_in;
    output reg [31:0] data_out;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            data_out <= 0;
        end else if (ld) begin
            data_out <= data_in;
        end
    end
endmodule