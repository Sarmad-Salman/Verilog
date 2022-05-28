module compd (alb,agb,aeb,a,b);
input [4:0]a,b;
output alb,agb,aeb;
assign alb = a<b;
assign agb = a>b;
assign aeb = a==b;
endmodule