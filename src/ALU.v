module ALU (
    input [7:0] A, B,
    input [3:0] op,
    output reg [7:0] result,
    output reg carry_out, zero, negative, overflow
);
reg [8:0] temp;

always @(*) begin
    case(op)
        4'b0000: begin
            temp = A + B;
            result = temp[7:0];
        end 
        4'b0001: result = A - B;
        4'b0010: result = A & B;
        4'b0011: result = A | B;
        4'b0100: result = A ^ B;
        4'b0101: result = ~A;
        4'b0110: result = A << 1;
        4'b0111: result = A >> 1;
        default: result = 8'b0;
    endcase
end

always @(*) begin
    carry_out = (op == 4'b0000) ? (temp > 8'hFF) : 0;
    zero = (result == 8'b0);
    negative = result[7];
    overflow = (op == 4'b0000) && ((A[7] == B[7]) && (result[7] != A[7]));
end

endmodule
