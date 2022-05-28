module dec38d (Y,I);
output [7:0]Y;
input  [2:0]I;
assign Y[0] = (~I[0] & ~I[1] & ~I[2]);
assign Y[1] = ( I[0] & ~I[1] & ~I[2]);
assign Y[2] = (~I[0] &  I[1] & ~I[2]);
assign Y[3] = ( I[0] &  I[1] & ~I[2]);
assign Y[4] = (~I[0] & ~I[1] &  I[2]);
assign Y[5] = ( I[0] & ~I[1] &  I[2]);
assign Y[6] = (~I[0] &  I[1] &  I[2]);
assign Y[7] = ( I[0] &  I[1] &  I[2]);
endmodule