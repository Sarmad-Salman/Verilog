module fa1b (s,c,a,b,ci);
input a,b,ci;
output s,c;
wire w0, w1, w2;
ha h2(a,b,w1,w0);
ha h3(ci,w0,w2,s);
or G1(c, w1, w2);
endmodule