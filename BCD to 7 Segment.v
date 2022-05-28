module bcd7 (I,Y);
output [6:0]Y;
input  [3:0]I;
wire   A,B,C,D;
wire [12:0]w;

//Assigning Variables
assign A = I[0];
assign B = I[1];
assign C = I[2];
assign D = I[3];

//NOT of Each Input
not N1 (w[0],A);
not N2 (w[1],B);
not N3 (w[2],C);
not N4 (w[3],D);


and A1 (w[4],A,C);
and A2 (w[5],w[0],w[2]);
and A3 (w[6],A,B);
and A4 (w[7],w[0],w[1]);
and A5 (w[8],w[0],B);
and A6 (w[9],A,w[1],C);
and A7 (w[10],B,w[2]);
and A8 (w[11],w[1],C);
and A9 (w[12],w[0],C);


or O1 (Y[0],B,D,w[4],w[5]);
or O2 (Y[1],w[2],w[6],w[7]);
or O3 (Y[2],A,w[1],C);
or O4 (Y[3],w[5],w[8],w[9],w[10],D);
or O5 (Y[4],w[8],w[5]);
or O6 (Y[5],w[7],w[11],w[12],D);
or O7 (Y[6],w[8],w[10],w[11],D);

endmodule