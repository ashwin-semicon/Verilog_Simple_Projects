module add4bit_dataflow(
    input [3:0] a,b,
    input cin,
    output [3:0] sum,
    output cout
);
    assign sum = a ^ b ^ {3'b000,cin};
    assign cout = (a & b) | (cin & (a ^ b));
endmodule

module add4bit_usingFA (
    input [3:0] a,b,
    input cin,
    output [3:0] sum,
    output cout
);
wire c1,c2,c3;
FA fa0(a[0],b[0],cin,sum[0],c1);
FA fa1(a[1],b[1],c1,sum[1],c2);
FA fa2(a[2],b[2],c2,sum[2],c3);
FA fa3(a[3],b[3],c3,sum[3],cout);
endmodule

