module dec38 (Y,I);
output [7:0]Y;
input [2:0]I;
wire w1;
not N1 (w1,I[2]);
dec24 d1 (Y[3:0],I[0],I[1],w1);
dec24 d2 (Y[7:4],I[0],I[1],I[2]);
endmodule