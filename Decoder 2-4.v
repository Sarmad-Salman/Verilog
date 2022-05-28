module dec24 (Y, a, b, c);
output [3:0]Y;
input a,b,c;
wire w1,w2;
not N1 (w1,a);
not N2 (w2,b);
and A1 (Y[0],w1,w2,c);
and A2 (Y[1],a,w2,c);
and A3 (Y[2],w1,b,c);
and A4 (Y[3],a,b,c);
endmodule	