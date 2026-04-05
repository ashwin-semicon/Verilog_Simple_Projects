module two_to_one_mux_dataflow (
    input [1:0] in,
    input sel,
    output out
);
    assign out = sel?in[1]:in[0];
endmodule

module two_to_one_mux_ifelse (
    input [1:0] in,
    input sel,
    output reg out
);
    always @(*) begin
        if(sel)
            out = in[1];
        else
            out = in[0]; 
    end
endmodule

module two_to_one_mux_case (
    input [1:0] in,
    input sel,
    output reg out
);
    always @(*) begin
        case(sel)
            1'b0: out = in[0];
            1'b1: out = in[1];
        endcase
    end
endmodule

module two_to_one_mux_gates(
    input [0:1] in,
    input sel,
    output out
);
wire w1,w2,w3;
not n1(w1,sel);
and a1(w2,in[0],w1);
and a2(w3,in[1],sel);
or o1(out,w2,w3);
endmodule

module two_to_one_mux_function (
    input [1:0] in,
    input sel,
    output out
);
    function mux ;
        input [1:0] in;
        input sel;
        begin
            mux = sel?in[1]:in[0];
        end
    endfunction

assign out = mux(in,sel);
endmodule