module fad (s,c,a,b,ci);
output [1:0]s;
output c;
input ci;
input [1:0]a,b;
assign {c,s} = a+b+ci;
endmodule