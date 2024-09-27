`timescale 1ns/1ps
module booth_mult4 #(parameter n=32)(input clk, reset,
input [31:0]md, [31:0]mr,
output  [63:0] out );

reg [63:0] pp, pp1, pp2, pp3, pp4,pp5,pp6,pp7,pp8,pp9,pp10,pp11,pp12,pp13,pp14,pp15,pp16;
reg [511:0] part = 512'd0 ;
reg [2:0]mr_window ;
reg [32:0]tmp_mr;
reg flag=0,flag1;
reg  b2, b3, b5, b4_msb;
reg [31:0] a1 ,b1, b4;
reg [30:0] a2,b4_2, b4_slice;
reg [31:0] neg_md, two_md, neg_two_md;
integer i=0,j=0;
integer count=0;

always@(negedge clk)begin
if(flag == 0)begin
tmp_mr = {mr, 1'b0};
mr_window = 3'b0;
flag = 1;
end
neg_md = ~(md) + 1'b1;
two_md = md <<1;
neg_two_md = ~(two_md) +1'b1;
//a1 = mr_window[2] ? neg_two_md : two_md ;
a1 = mr_window[2] ? neg_md : md ;
b6 = mr_window[1] ^ mr_window[0];
b2 = mr_window[2] | mr_window[1]|mr_window[0];
b3 = ~(mr_window[2] & mr_window[1] & mr_window[0]);
for (i=0; i<=31; i=i+1) begin
b1[i] = b2 & b3;
b4[i] = a1[i] & b1[i];
b5[i] = (mr_window[2] ^ md[i]);
end
b4_msb = b4[31];
b4_slice = b4[30:0];
b4_2 = b4_slice <<1;
a1 = b6 ? b4_slice : b4_2;

if(count == 18) begin
pp1 = {{32{part[511]}},part [511:480]};
pp2 = {{30{part[479]}},part [479:448],2'b0};
pp3 = {{28{part[447]}},part[447:416],4'b0};
pp4 = {{26{part[415]}},part[415:384],6'b0};
pp5 = {{24{part[383]}},part[383:352],8'b0};
pp6 = {{22{part[351]}},part[351:320],10'b0};
pp7 = {{20{part[319]}},part[319:288],12'b0};
pp8 = {{18 {part[287]}},part[287:256],14'b0};
pp9 = {{16{part[255]}},part [255:224],16'b0};
pp10 = {{14{part[223]}},part [223:192],18'b0};
pp11 = {{12{part[191]}},part[191:160],20'b0};
pp12 = {{10{part[159]}},part[159:128],22'b0};
pp13 = {{8{part[127]}},part[127:96],24'b0};
pp14 = {{6{part[95]}},part[95:64],26'b0};
pp15 = {{4{part[63]}},part[63:32],28'b0};
pp16 = {{2 {part[31]}},part[31:0],30'b0};
end
//a3 = b1 ? a2: a1;
//a4 = b2 ? a3 : 8'b0;
end


always@(posedge clk) begin
if (flag == 1) begin
mr_window = tmp_mr[2:0];
tmp_mr = tmp_mr >>2;
pp = {b4_msb,a2};
count = count+1;
end
end


always@(count) begin
if(count < 18) begin
part = (part <<n) | pp;
end
end

array_adder_32 d1 (pp1, pp2, pp3, pp4,pp5,pp6,pp7,pp8,pp9,pp10,pp11,pp12,pp13,pp14,pp15,pp16,out);

endmodule








