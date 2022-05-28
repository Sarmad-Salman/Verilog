module tff (q,t,clk,rst);
output q;
input t,clk,rst;
wire w1;
xor X1 (w1,q,t);
dff d1 (q,w1,clk,rst);
endmodule