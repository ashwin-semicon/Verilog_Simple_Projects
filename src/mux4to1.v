module mux4to1_case(
    input [3:0] in,
    input [1:0] sel,
    output reg  out
);
    always @(*) begin
        case(sel)
        2'b00: out = in[0];
        2'b01: out = in[1];
        2'b10: out = in[2];
        2'b11: out = in[3];
        default: out = 1'bx;
        endcase
    end
endmodule

module mux4to1_using2to1(
    input [3:0] in,
    input [1:0] sel,
    output out //Note here we didn't use reg because we are using the output of the 2 to 1 muxes directly without any always block
);
wire w1,w2;
two_to_one_mux_case m1(in[1:0],sel[0],w1);
two_to_one_mux_case m2(in[3:2],sel[0],w2);
two_to_one_mux_case m3({w2,w1},sel[1],out); //here we used concatination of the output of the both of the 2 to 1 muxes 
endmodule

module mux4to1_ifelse (
    input [3:0] in,
    input [1:0] sel,
    output reg out
);
    always @(*) begin
        if (sel == 2'b00) begin
            out = in[0];
        end
        else if (sel == 2'b01) begin
            out = in[1];
        end
        else if (sel == 2'b10) begin
            out = in[2];
        end
        else if (sel == 2'b11) begin
            out = in[3];
        end
    end
endmodule