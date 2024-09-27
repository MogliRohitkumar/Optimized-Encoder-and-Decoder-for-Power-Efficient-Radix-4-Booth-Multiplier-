`timescale 1ns / 1ps


module wallace_32(
input[63:0] p1,p2,p3,p4,p5,p6,p7,p8,p9,p10,p11,p12,p13,p14,p15,p16,
output [63:0]sum 
);
    

wire s1,s2,s3,s4,s5,s6,s7;
wire c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12;


fa fa1 (p1[0],p2[0],p3[0],s1,c1);
fa fa2(p4[0],p5[0],p6[0],s2,c2);
fa fa3(p7[0],p8[0],p9[0],s3,c3);
fa fa4(p10[0],p11[0],p12[0],s4,c4);
fa fa5(p13[0],p14[0],p15[0],s5,c5);

fa fa6(s1,s2,s3,s6,c6);
fa fa7(s4,s5,p16[0],s7,c7);
fa ha1(s6,s7,1'b0,sum[0],c8);


wire [63:0] cout1,cout2,cout3,cout4,cout5,cout6,cout7,cout8,cout9,cout10,cout11,cout12,cout13,cout14,cout15,cout16;
wire [63:0] tempsum1,tempsum2,tempsum3,tempsum4,tempsum5,tempsum6,tempsum7,tempsum8,tempsum9,tempsum10,tempsum11,tempsum12,tempsum13,tempsum14,tempsum15;

fa fa21 (p1[1],p2[1],p3[1],tempsum1[0],cout1[0]);
fa fa22 (p4[1],p5[1],p6[1],tempsum2[0],cout2[0]);
fa fa23 (p7[1], p8[1],p9[1],tempsum3[0], cout3[0]);
fa fa24 (p10[1], p11[1],p12[1],tempsum4[0], cout4[0]);
fa fa25 (p15[1],p14[1],p13[1],tempsum5[0], cout5[0]);

fa fa26 (tempsum1[0],tempsum2[0],c1,tempsum6[0],cout6[0]);
fa fa27 (tempsum3[0],c2,c3,tempsum7[0], cout7[0]);
fa fa28 (tempsum4[0],c4,c5,tempsum8[0],cout8[0]);

fa fa29 (tempsum6[0], tempsum7[0],c6,tempsum9[0],cout9[0]);
fa fa210 (tempsum8[0],tempsum5[0],c7,tempsum10[0],cout10[0]);

fa fa211 (tempsum9[0], tempsum10[0],c8,tempsum11[0],cout11[0]);

fa fa212 (tempsum11[0],p16[0],1'b0, sum[1], cout12[0]);




fa fas31 (p1[2],p2[2],p3[2],tempsum1[1],cout1[1]);
fa fas32 (p4[2],p5[2],p6[2],tempsum2[1],cout2[1]);
fa fas33 (p7[2],p8[2],p9[2],tempsum3[1],cout3[1]);
fa fas34 (p10[2],p11[2],p12[2],tempsum4[1],cout4[1]);
fa fas35 (p13[2],p14[2],p15[2],tempsum5[1],cout5[1]);

fa fas36 (tempsum1[1],tempsum2[1],cout1[0],tempsum6[1],cout6[1]);
fa fas37 (tempsum3[1],cout2[0],cout3[0], tempsum7[1],cout7[1]);
fa fas38 (tempsum4[1],cout4[0],cout5[0], tempsum8[1],cout8[1]);

fa fas39 (tempsum6[1], tempsum7[1],cout6[0], tempsum9[1], cout9[1]); 
fa fas310 (tempsum8[1],cout7[0],cout8[0],tempsum10[1],cout10[1]);

fa fas311 (tempsum5[1],p16[2],cout10[0],tempsum12[0],cout12[1]);
fa fas312 (tempsum9[1], tempsum10[1],cout9[0],tempsum11[1],cout11[1]);

fa fas313 (tempsum11[1],tempsum12[0],cout11[0],tempsum13[0],cout13[0]);
fa has314 (tempsum13[0],cout12[0],1'b0,sum[2],cout14[0]);



fa fas41 (p1[3],p2[3],p3[3],tempsum1[2],cout1[2]);
fa fas42 (p4[3],p5[3],p6[3],tempsum2[2],cout2[2]);
fa fas43 (p7[3],p8[3],p9[3],tempsum3[2],cout3[2]);
fa fas44 (p10[3],p11[3],p12[3],tempsum4[2],cout4[2]);
fa fas45 (p13[3],p14[3],p15[3],tempsum5[2],cout5[2]);

fa fas46 (tempsum1[2],tempsum2[2],cout1[1],tempsum6[2],cout6[2]);
fa fas47 (tempsum3[2],cout2[1],cout3[1], tempsum7[2],cout7[2]);
fa fas48 (tempsum4[2],cout4[1],cout5[1], tempsum8[2],cout8[2]);

fa fas49 (tempsum6[2], tempsum7[2], cout6[1],tempsum9[2], cout9[2]); 
fa fas410 (tempsum8[2],cout7[1],cout8[1],tempsum10[2],cout10[2]);

fa fas411 (tempsum5[2],p16[3],cout10[1],tempsum12[2],cout12[2]);
fa fas412 (tempsum9[2], tempsum10[2],cout9[1],tempsum11[2],cout11[2]);

fa fas413 (tempsum11[2],tempsum12[2],cout11[1],tempsum13[1],cout13[1]);
fa fas414 (tempsum13[1],cout12[1],cout13[0],tempsum14[0],cout14[1]);

fa has415 (tempsum14[0],cout14[0],1'b0,sum[3],cout15[0]);



fa fas51 (p1[4],p2[4],p3[4],tempsum1[3],cout1[3]);
fa fas52 (p4[4],p5[4],p6[4],tempsum2[3],cout2[3]);
fa fas53 (p7[4],p8[4],p9[4],tempsum3[3],cout3[3]);
fa fas54 (p10[4],p11[4],p12[4],tempsum4[3],cout4[3]);
fa fas55 (p13[4],p14[4],p15[4],tempsum5[3],cout5[3]);

fa fas56 (tempsum1[3],tempsum2[3],cout1[2],tempsum6[3],cout6[3]);
fa fas57 (tempsum3[3],cout2[2],cout3[2], tempsum7[3],cout7[3]);
fa fas58 (tempsum4[3],cout4[2],cout5[2], tempsum8[3],cout8[3]);

fa fas59 (tempsum6[3], tempsum7[3],cout6[2],tempsum9[3], cout9[3]); 
fa fas510 (tempsum8[3],cout7[2],cout8[2],tempsum10[3],cout10[3]);

fa fas511 (tempsum5[3],p16[4],cout10[2],tempsum12[3],cout12[3]);
fa fas512 (tempsum9[3], tempsum10[3],cout9[2],tempsum11[3],cout11[3]);

fa fas513 (tempsum11[3],cout12[2],cout11[2],tempsum13[2],cout13[2]);
fa fas514 (tempsum13[2],tempsum12[3],cout13[1],tempsum14[1],cout14[2]);

fa fas515 (tempsum14[1],cout14[1],cout15[0],sum[4],cout15[1]);


genvar i;

generate 

for (i=4; i<=63; i=i+1)begin


fa fasi1 (p1[i+1],p2[i+1],p3[i+1],tempsum1[i],cout1[i]);
fa fasi2 (p4[i+1],p5[i+1],p6[i+1],tempsum2[i],cout2[i]);
fa fasi3 (p7[i+1],p8[i+1],p9[i+1],tempsum3[i],cout3[i]);
fa fasi4 (p10[i+1],p11[i+1],p12[i+1],tempsum4[i],cout4[i]);
fa fasi5 (p13[i+1],p14[i+1],p15[i+1],tempsum5[i],cout5[i]);

fa fasi6 (tempsum1[i],tempsum2[i],cout1[i-1],tempsum6[i],cout6[i]);
fa fasi7 (tempsum3[i],cout2[i-1],cout3[i-1], tempsum7[i],cout7[i]);
fa fasi8 (tempsum4[i],cout4[i-1],cout5[i-1], tempsum8[i],cout8[i]);

fa fasi9 (tempsum6[i], tempsum7[i],cout6[i-1],tempsum9[i], cout9[i]); 
fa fasi10 (tempsum8[i],cout7[i-1],cout8[i-1],tempsum10[i],cout10[i]);

fa fasi11 (tempsum5[i],p16[i+1],cout10[i-1],tempsum12[i],cout12[i]);
fa fasi12 (tempsum9[i], tempsum10[i],cout9[i-1],tempsum11[i],cout11[i]);

fa fasi13 (tempsum11[i],cout12[i-1],cout11[i-1],tempsum13[i-1],cout13[i-1]);

fa fasi14 (tempsum13[i-1],tempsum12[i],cout13[i-2],tempsum14[i-2],cout14[i-1]);

fa fasi15 (tempsum14[i-2],cout14[i-2],cout15[i-3],sum[i+1],cout15[i-2]);


end

endgenerate






endmodule
