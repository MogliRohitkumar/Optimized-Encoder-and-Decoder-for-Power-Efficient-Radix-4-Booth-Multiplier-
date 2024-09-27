`timescale 1ns / 1ps


module wallace_16( 
input[32:0] p1,p2,p3,p4,p5,p6,p7,p8,
output [31:0]sum 
);
    


wire sum_temp, sum_temp1,sum_temp3;
wire [30:0]temp_sum3,temp_sum4,temp_sum5,temp_sum6;
wire [30:0]temp_sum1, temp_sum2; 
wire coutd,coutc,couta,coutb;
wire [30:0]cout1;
wire [30:0]cout2;
wire [30:0]cout3;
wire [30:0]cout4;
wire [30:0] cout5;
wire [30:0] cout6;
wire [30:0] cout7;

fa fa1 ((p1[0]),(p2[0]),(p3[0]),(sum_temp),(couta));
fa fa2((p4[0]),(p5[0]),(p6[0]),(sum_temp1),(coutb));
fa fa3((p7[0]),(sum_temp), (sum_temp1), (sum_temp3),(coutc));
fa fa4((p8[0]),(sum_temp3), (1'b0),(sum[0]),(coutd));



fa fas1 (p1[1],p2[1],p3[1],temp_sum1[0],cout1[0]);
fa fas12(p4[1],p5[1],p6[1],temp_sum2[0],cout2[0]);
fa fas13(temp_sum1[0],temp_sum2[0],couta,temp_sum3[0],cout3[0]);
fa fas14(p7[1],p8[1],coutb,temp_sum4[0],cout4[0]);
fa fas15(temp_sum3[0],temp_sum4[0],coutc, temp_sum5[0],cout5[0]);
fa ha16(temp_sum5[0],1'b0,coutd,sum[1],cout6[0]);



fa fas3 (p1[2],p2[2],p3[2],temp_sum1[1],cout1[1]);
fa fas32(p4[2],p5[2],p6[2],temp_sum2[1],cout2[1]);
fa fas33(temp_sum1[1],temp_sum2[1],cout1[0],temp_sum3[1],cout3[1]);
fa fas34(p7[2],p8[2],cout2[0],temp_sum4[1],cout4[1]);
fa fas35(temp_sum3[1],cout3[0],cout4[0], temp_sum5[1],cout5[1]);
fa fas36(temp_sum4[1],temp_sum5[1],cout5[0],temp_sum6[0],cout6[1]);
fa ha36(temp_sum6[0],1'b0,cout6[0],sum[2],cout7[0]);


fa fas4 (p1[3],p2[3],p3[3],temp_sum1[2],cout1[2]);
fa fas42(p4[3],p5[3],p6[3],temp_sum2[2],cout2[2]);
fa fas43(temp_sum1[2],temp_sum2[2],cout1[1],temp_sum3[2],cout3[2]);
fa fas44(p7[3],p8[3],cout2[1],temp_sum4[2],cout4[2]);
fa fas45(temp_sum3[2],cout3[1],cout4[1], temp_sum5[2],cout5[2]);
fa fas46(temp_sum4[2],temp_sum5[2],cout5[1],temp_sum6[1],cout6[2]);
fa fa46(temp_sum6[1],cout7[0],cout6[1],sum[3],cout7[1]);


genvar i;

generate 

for (i=3; i<=30; i=i+1)begin

fa fas4i (p1[i+1],p2[i+1],p3[i+1],temp_sum1[i],cout1[i]);
fa fas42i(p4[i+1],p5[i+1],p6[i+1],temp_sum2[i],cout2[i]);
fa fas43i(temp_sum1[i],temp_sum2[i],cout1[i-1],temp_sum3[i],cout3[i]);
fa fas44i(p7[i+1],p8[i+1],cout2[i-1],temp_sum4[i],cout4[i]);
fa fas45i(temp_sum3[i],cout3[i-1],cout4[i-1], temp_sum5[i],cout5[i]);
fa fas46i(temp_sum4[i],temp_sum5[i],cout5[i-1],temp_sum6[i-1],cout6[i]);
fa fa46i(temp_sum6[i-1],cout7[i-2],cout6[i-1],sum[i+1],cout7[i-1]);


end
endgenerate



  
endmodule
