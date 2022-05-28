module dec24d (Y,I,c);
input  [1:0]I;
input  c;
output [3:0]Y;
assign Y[0]= (~I[0] & ~I[1] & c);
assign Y[1]= ( I[0] & ~I[1] & c);
assign Y[2]= (~I[0] &  I[1] & c);
assign Y[3]= ( I[0] &  I[1] & c);
endmodule