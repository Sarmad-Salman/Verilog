module comp4b (l,g,e,A,B);
input  [3:0]A,B;
output l,g,e;
wire l1,g1,e1,l0,g0,e0,w1,w2;
comp2b c1 (l1,g1,e1,A[2],A[3],B[2],B[3]);
comp2b c2 (l0,g0,e0,A[0],A[1],B[0],B[1]);

//equal
and A1 (e,e0,e1);

//less
and A2 (w1,l0,e1);
or  O1 (l,w1,l1);

//greater
and A3 (w2,g0,e1);
or  O2 (g,w2,g1);

endmodule