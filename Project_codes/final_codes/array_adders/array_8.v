`timescale 1ns / 1ps
`include "full_adder.v"
`include "half_adder.v"


module adder_8(
input  [15:0] p1,p2,p3,p4,
output  [15:0] sum
    );

wire [15:0]ts1, ts2;
wire [15:0]c1, c2, c3;

ha ha1 (p1[0], p2[0], ts1[0], c1[0]);
ha ha2 (ts1[0], p3[0], ts2[0], c2[0]);
ha ha3 (ts2[0], p4[0], sum[0], c3[0]);

genvar i;

generate
for (i=1; i<=15; i=i+1) begin
fa fa1 (p1[i], p2[i], c1[i-1], ts1[i], c1[i]);
fa fa2 (p3[i], ts1[i], c2[i-1], ts2[i], c2[i]);
fa fa3 (p4[i], ts2[i], c3[i-1], sum[i], c3[i]);
end
endgenerate


endmodule
