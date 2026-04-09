module seq_det(
    input clk, rst, x,
    output reg z
);
parameter S0 = 3'b000, S1 = 3'b001, S2 = 3'b010, S3 = 3'b011, S4 = 3'b100, S5 = 3'b101, S6 = 3'b110;
reg [2:0] PS, NS;
always @(posedge clk or posedge rst)
    begin
        if(rst) PS <= S0;
        else PS <= NS;
    end

always @(PS,x)
    begin
        case(PS)
            S0: begin
                z = x?0:0;
                NS = x?S0:S1;
            end
            S1: begin
                z = x?0:0;
                NS = x?S0:S2;
            end 
            S2: begin
                z = x?0:0;
                NS = x?S3:S1;
            end 
            S3: begin
                z = x?0:0;
                NS = x?S4:S2;
            end 
            S4: begin
                z = x?0:0;
                NS = x?S1:S5;
            end 
            S5: begin
                z = x?1:0;
                NS = x?S0:S2;
            end 
        endcase 
    end
endmodule