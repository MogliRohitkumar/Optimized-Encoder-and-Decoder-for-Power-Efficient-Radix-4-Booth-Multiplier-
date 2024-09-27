`timescale 1ns/1ps
module booth_mult4 #(parameter n=8)(input clk, reset,
input [7:0]md, [7:0]mr,
output  [15:0] sum );

reg [15:0] pp, pp1, pp2, pp3, pp4;
reg [31:0] part = 32'b0 ;
reg [2:0]mr_window ;
reg [8:0]tmp_mr;
reg flag=0,flag1;
reg  b2, b3,  b4_msb,b6;
reg [7:0]b1, b4,b5;
reg [6:0] a1,b4_2, b4_slice;
reg [7:0] neg_md, two_md, neg_two_md;
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

b6 = mr_window[1] ^ mr_window[0];
b2 = mr_window[2] | mr_window[1]|mr_window[0];
b3 = ~(mr_window[2] & mr_window[1] & mr_window[0]);
for (i=0; i<=7; i=i+1) begin
b5[i] = mr_window[2] ^ md[i];
b1[i] = b2 & b3;
b4[i] = b5[i] & b1[i];
end
b4_msb = b4[7];
b4_slice = b4[6:0];
b4_2 = b4_slice <<1;
a1 = b6 ? b4 : b4_2;


if(count == 6) begin
pp1 = {{8{part[31]}},part[31:24]};
pp2 = {{6{part[23]}},part[23:16],2'b0};
pp3 = {{4{part[15]}},part[15:8],4'b0};
pp4 = {{2{part[7]}},part[7:0],6'b0};
end
end


always@(posedge clk) begin
if (flag == 1) begin
mr_window = tmp_mr[2:0];
tmp_mr = tmp_mr >>2;
pp = {b4_msb,a1};
count = count+1;
end
end


always@(count) begin
if(count < 6) begin
part = (part <<n) | pp;
end
end

wallace_8 d1(pp1, pp2, pp3, pp4,c, sum);

endmodule








