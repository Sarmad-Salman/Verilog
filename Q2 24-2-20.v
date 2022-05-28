module q2d (Y,I,en);
output Y;
input en;
input [4:0]I;
wire w1;
assign w1 = ~((I[0]&I[1])|(I[2]&I[3]&I[4]));
assign Y = en ? w1:1'bz;
endmodule