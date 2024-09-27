`timescale 1ns/1ps
module booth_mult4 #(parameter n=16)(input clk, reset,
input [15:0]md, [15:0]mr,
output [31:0] out );

reg [31:0] pp, pp1, pp2, pp3, pp4,pp5,pp6,pp7,pp8;
reg [127:0] part = 32'b0 ;
reg [2:0]mr_window ;
reg [16:0]tmp_mr;
reg flag=0,flag1;
reg  b2, b3, b5, b4_msb;
reg [15:0] a1 ,b1, b4;
reg [14:0] a2,b4_2, b4_slice;
reg [15:0] neg_md, two_md, neg_two_md;
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

a1 = mr_window[2] ? neg_md : md ;
b5 = mr_window[1] ^ mr_window[0];
b2 = mr_window[2] | mr_window[1]|mr_window[0];
b3 = ~(mr_window[2] & mr_window[1] & mr_window[0]);

for (i=0; i<=15; i=i+1) begin
b1[i] = b2 & b3;
b4[i] = a1[i] & b1[i];
end

b4_msb = b4[15];
b4_slice = b4[14:0];
b4_2 = b4_slice <<1;
a2 = b5 ? b4_slice : b4_2;

if(count == 10) begin
pp1 = {{24{part[127]}},part [127:112]};
pp2 = {{22{part[111]}},part [111:96],2'b0};
pp3 = {{20{part[95]}},part[95:80],4'b0};
pp4 = {{18{part[79]}},part[79:64],6'b0};
pp5 = {{16{part[63]}},part[63:48],8'b0};
pp6 = {{14{part[47]}},part[47:32],10'b0};
pp7 = {{12{part[31]}},part[31:16],12'b0};
pp8 = {{12 {part[15]}},part[15:0],14'b0};
end
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
if(count < 10) begin
part = (part <<n) | pp;
end
end

array_adder_16 d1 (pp1, pp2, pp3, pp4, pp5, pp6, pp7, pp8, out);

endmodule








