`timescale 1ns / 1ps


module top(  
input[15:0] pp1,pp2,pp3,pp4,
output [15:0]sum 
);
    


wire sum_temp, sum_temp1;
wire [14:0]temp_sum;
wire [14:0]temp_sum1, temp_sum2; 
wire cout, cout1, cout6;
wire [14:0]cout2;
wire [14:0]cout3;
wire [14:0]cout4;
wire [14:0] cout5;

fa fa1 ((p1[0]), (p2[0]),(p3[0]), (sum_temp),(cout));

fa fa2((1'b0),(sum_temp),(p4[0]),(sum[0]),(cout1));


fa fas1 (p1[1],p2[1],p3[1],temp_sum[0],cout2[0]);
fa fas12(p4[1],temp_sum[0],cout,temp_sum1[0],cout3[0]);
fa fas13(1'b0,temp_sum1[0],cout1,sum[1],cout4[0]);

genvar i;

generate 

for (i=1; i<=14; i=i+1)begin


fa fas2 (p3[i+1],p1[i+1],p2[i+1],temp_sum[i],cout2[i]);
fa fas22 (p4[i+1],temp_sum[i],cout2[i-1],temp_sum1[i],cout3[i]);
fa fas23 (cout3[i-1],temp_sum1[i],cout4[i-1],sum[i+1],cout4[i]);
end
endgenerate  
endmodule




