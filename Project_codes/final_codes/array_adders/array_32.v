`timescale 1ns / 1ps


module array_adder_32(
input [63:0] p1, p2, p3, p4, p5, p6, p7, p8, p9,p10,p11,p12,p13,p14,p15,p16,
output [63:0] sum

    );
    
wire [63:0] ts1, ts2, ts3, ts4, ts5, ts6, ts7, ts8, ts9, ts10, ts11, ts12, ts13, ts14;
wire [63:0] c1, c2, c3, c4, c5, c6, c7, c8, c9, c10, c11, c12, c13, c14, c15;

ha ha1 (p1[0], p2[0], ts1[0], c1[0]);
ha ha2 (ts1[0], p3[0], ts2[0], c2[0]);
ha ha3 (ts2[0], p4[0], ts3[0], c3[0]);
ha ha4 (ts3[0], p5[0], ts4[0], c4[0]);
ha ha5 (ts4[0], p6[0], ts5[0], c5[0]);
ha ha6 (ts5[0], p7[0], ts6[0], c6[0]);
ha ha7 (ts6[0], p8[0], ts7[0], c7[0]);
ha ha8 (ts7[0], p9[0], ts8[0], c8[0]);
ha ha9 (ts8[0], p10[0], ts9[0], c9[0]);
ha ha10 (ts9[0], p11[0], ts10[0], c10[0]);
ha ha11 (ts10[0], p12[0], ts11[0], c11[0]);
ha ha12 (ts11[0], p13[0], ts12[0], c12[0]);
ha ha13 (ts12[0], p14[0], ts13[0], c13[0]);
ha ha14 (ts13[0], p15[0], ts14[0], c14[0]);
ha ha15 (p16[0], ts14[0], sum[0], c15[0]);

genvar i;
generate
for (i=1; i<=63; i=i+1) begin
fa fa1 (p1[i], p2[i], c1[i-1], ts1[i], c1[i]);
fa fa2 (p3[i], ts1[i], c2[i-1], ts2[i], c2[i]);
fa fa3 (p4[i], ts2[i], c3[i-1], ts3[i], c3[i]);
fa fa4 (p5[i], ts3[i], c4[i-1], ts4[i], c4[i]);
fa fa5 (p6[i], ts4[i], c5[i-1], ts5[i], c5[i]);
fa fa6 (p7[i], ts5[i], c6[i-1], ts6[i], c6[i]);
fa fa7 (p8[i], ts6[i], c7[i-1], ts7[i], c7[i]);
fa fa8 (p9[i], ts7[i], c8[i-1], ts8[i], c8[i]);
fa fa9 (p10[i], ts8[i], c9[i-1], ts9[i], c9[i]);
fa fa10 (p11[i], ts9[i], c10[i-1], ts10[i], c10[i]);
fa fa11 (p12[i], ts10[i], c11[i-1], ts11[i], c11[i]);
fa fa12 (p13[i], ts11[i], c12[i-1], ts12[i], c12[i]);
fa fa13 (p14[i], ts12[i], c13[i-1], ts13[i], c13[i]);
fa fa14 (p15[i], ts13[i], c14[i-1], ts14[i], c14[i]);
fa fa15 (p16[i], ts14[i], c15[i-1], sum[i], c15[i]);
end
endgenerate

endmodule
