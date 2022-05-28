module fa3b (s,c,a,b,cin);
input [2:0]a,b;
input cin;
output [2:0]s;
output c;
wire w1, w2;
fa1b fa1(s[0], w1, a[0], b[0], cin);
fa1b fa2(s[1], w2, a[1], b[1], w1);
fa1b fa3(s[2], c, a[2], b[2], w2);
endmodule