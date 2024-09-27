`timescale 1ns/1ps

module booth_mult4_tb;
reg clk,reset;
reg  [31:0] a,b;
wire [63:0] x;

booth_mult4 uut(clk, reset, a,b,x);

initial begin
clk=0;
reset = 1'b1; 
#10 
reset = 1'b0;
end


always #5 clk = ~clk;

initial begin
a = 32'd35;
b = 32'd15;
//$display("out = %b", result);

end


endmodule
