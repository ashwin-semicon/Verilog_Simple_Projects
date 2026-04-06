module four_bit_adder_sub(
    input [3:0] a,b,
    input sel,
    output [3:0] res,
    output cout
);
wire [3:0] w;
xor x0(w[0],b[0],sel);
xor x1(w[1],b[1],sel);
xor x2(w[2],b[2],sel);
xor x3(w[3],b[3],sel);
add4bit_dataflow add1(a,w,sel,res,cout);
endmodule
