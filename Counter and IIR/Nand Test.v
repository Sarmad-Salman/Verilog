module nandtb();
reg a,b; wire c;
nanD a1(a, b, c);
initial begin
#10 a =1; b=0;
#10 a=1; b=1; end
endmodule 