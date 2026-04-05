module bcd_adder_dataflow(
    input [3:0] a,b,
    input cin,
    output [3:0] sum,
    output cout
);
wire sum_temp;
assign sum_temp = a + b + cin;
assign sum = (sum_temp > 9) ? (sum_temp - 10) : sum_temp;
assign cout = (sum_temp > 9) ? 1 : 0;
endmodule

module bcd_adder_add4bit(
    input [3:0] a,b,
    input cin,
    output [3:0] sum,
    output cout
);
wire w1,w2,w3,w4;
wire [3:0] sum_temp;
add4bit_dataflow add1(a,b,cin,sum_temp,w1);
and a1(w2,sum_temp[3],sum_temp[2]);
and a2(w3,sum_temp[3],sum_temp[1]);
or o1(cout,w1,w2,w3);
add4bit_dataflow add2(sum_temp,{1'b0,cout,cout,1'b0},1'b0,sum,w4);
endmodule