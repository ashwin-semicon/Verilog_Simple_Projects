

module multiplication_by_repeated_additionJ(eqz, ldA, ldB, ldP, clrP, clk, dataIn);
input ldA, ldB, ldP, clrP, clk;
input [31:0] dataIn;
output eqz;
wire [31:0] X, Y, Z, bus, Bout;

PIPO1 A (.dout(X), .din(dataIn), .ld(ldA), .clk(clk));
PIPO2 P (.dout(Y), .din(Z), .ld(ldP), .clk(clk), .clr(clrP));
Counter B (.dout(Bout), .din(bus), .ld(ldB), .dec(decB), .clk(clk));
Adder Add (.A(X), .B(Y), .S(Z));
Comparator Comp (.eqz(eqz), .B(Bout));

endmodule

module PIPO1(dout, din, ld, clk);
input [31:0] din;
input ld, clk;
output reg [31:0] dout;

always @ (posedge clk) begin
    if (ld) begin
        dout <= din;
    end
end
endmodule

module PIPO2 (dout, din, ld, clk, clr);
input [31:0] din;
input ld, clk, clr;
output reg [31:0] dout;

always @ (posedge clk) begin
    if (clr) begin 
        dout <= 0;
    end else if (ld) begin
        dout <= din;
    end 
end
endmodule

module Counter (dout, din, ld, dec, clk);
input [31:0] din;
input ld, dec, clk;
output reg [31:0] dout;

always @ (posedge clk) begin
    if (ld) begin
        dout <= din;
    end else if (dec) begin
        dout <= dout - 1;
    end 
end
endmodule

module Adder (A, B, S);
input [31:0] A, B;
output [31:0] S;
assign S = A + B;
endmodule

module Comparator (eqz, B);
input [31:0] B;
output eqz;
assign eqz = (B == 0) ? 1 : 0;
endmodule

module controller (LdA, LdB, LAP, clrP, deck, done, clk, eqz, start);
input clk, eqz, start;
output reg LdA, LdB, LdP, clrp, deck, done;
reg [2:0] state;
parameter S0=3'b000, S1=3'b001, S2=3'b010, S3=3'b011, S4=3'b100;

always @ (posedge clk) begin
    case (state)
        S0: if (start) state <= S1;
        S1: state <= S2;
        S2: state <= S3;
        S3: #2 if (eqz) state <= S4;
        S4: state <= S0;
    default: state <= S0;
endcase
end

always @ (state) begin
    case (state)
        S0: begin #1 LdA = 0; LdB 0; LP = 0; clrP= 0; decB0; end
        S1: begin #1 LdA= 1; end
        S2: begin #1 LdA= 0; LdB= 1; clrp= 1; end
        S3: begin #1 LdP= 1; clrp = 0; decB 1; end
        S4: begin #1 LdB = 0; LdB = 0; LP = 0; decB = 0; end
        default: begin #1 LdA= 0; LdB=0; LdP=0; clrP 0; decB0; end
        endcase
    end
endmodule