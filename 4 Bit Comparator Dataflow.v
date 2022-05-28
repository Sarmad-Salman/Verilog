module comp4bd (l,g,e,A,B);
output l,g,e;
input  [3:0]A,B;
assign e = (A==B);
assign l = (A<B);
assign g = (A>B);
endmodule