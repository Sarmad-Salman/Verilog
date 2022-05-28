module comp2b (l,g,e,a0,a1,b0,b1);
input a0,a1,b0,b1;
output l,g,e;
wire w1,w2,w3,w4,w5,w6,w7,w8,w9,w10;

//equal
xor X1 (w1,a0,b0);
not N1 (w2,w1);
xor X2 (w3,a1,b1);
not N2 (w4,w3);
and A1 (e,w2,w4);

//less
not N3 (w5,a0);
not N4 (w6,a1);
and A2 (w7,w5,w6,b0);
and A3 (w8,w5,b0,b1);
and A4 (w9,w6,b1);
or  O1 (l,w7,w8,w9);

//greater
nor R1 (g,l,e);

endmodule