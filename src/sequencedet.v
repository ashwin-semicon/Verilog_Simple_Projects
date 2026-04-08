module seq_det (
    input clk, rst, x,
    output reg z
);
parameter S0 = 2'b00, S1 = 2'b01, S2 = 2'b10, S3 = 2'b11;// either do like this or write 0,1,2,3 directly.. Don't write 00, 01, 10, 11 because it will be treated as octal numbers and will be converted to decimal numbers by the compiler. Hence, we need to write 2'b00, 2'b01, 2'b10, 2'b11 to represent binary numbers.
reg [0:1] PS, NS;
always @(posedge clk or posedge rst)
    begin
        if(rst) PS <= S0;
        else PS <= NS;
    end
always @(PS,x)
    begin
        case (PS)
            S0: begin
                z = x?0:0;
                NS = x?S0:S1;
            end 
            S1: begin
                z = x?0:0;
                NS = x?S2:S1;
            end 
            S2: begin
                z = x?0:0;
                NS = x?S3:S1;
            end 
            S3: begin
                z = x?0:1;
                NS = x?S0:S1;
            end 
        endcase
    end
endmodule
