`timescale 1ns / 1ps


module array_adder_16( input [31:0] p1,p2, p3, p4,p5,p6,p7,p8,
output [31:0] sum

    );
    
wire [31:0] ts1, ts2, ts3, ts4, ts5, ts6;
wire [31:0] c1, c2, c3, c4, c5, c6, c7;

ha ha1 (p1[0], p2[0], ts1[0], c1[0]);
ha ha2 (ts1[0], p3[0], ts2[0], c2[0]);
ha ha3 (ts2[0], p4[0], ts3[0], c3[0]);
ha ha4 (ts3[0], p5[0], ts4[0], c4[0]);
ha ha5 (ts4[0], p6[0], ts5[0], c5[0]);
ha ha6 (ts5[0], p7[0], ts6[0], c6[0]);
ha ha7 (ts6[0], p8[0], sum[0], c7[0]);

genvar i;
generate 
for (i=1; i<=31; i=i+1) begin
fa fa1 (p1[i], p2[i], c1[i-1], ts1[i], c1[i]);
fa fa2 (p3[i], ts1[i], c2[i-1], ts2[i], c2[i]);
fa fa3 (p4[i], ts2[i], c3[i-1], ts3[i], c3[i]);
fa fa4 (p5[i], ts3[i], c4[i-1], ts4[i], c4[i]);
fa fa5 (p6[i], ts4[i], c5[i-1], ts5[i], c5[i]);
fa fa6 (p7[i], ts5[i], c6[i-1], ts6[i], c6[i]);
fa fa7 (p8[i], ts6[i], c7[i-1], sum[i], c7[i]);
end
endgenerate

endmodule
