module bcd7d (Y,I);
output [6:0]Y;
input  [3:0]I;
wire   A,B,C,D;

//Assigning Variables
assign A = I[0];
assign B = I[1];
assign C = I[2];
assign D = I[3];

//Implementing Equations
assign Y[0] = B | D      | ( A & C) | (~A & ~C);                           //a
assign Y[1] =         ~C | ( A & B) | (~A & ~B);                           //b
assign Y[2] = A | C | ~B;                                                  //c
assign Y[3] = D          | (~C & B) | (~A & ~C) | (~A & B) | (A & C & ~B); //d
assign Y[4] =              (~A & B) | (~A & ~C);                           //e
assign Y[5] = D          | (~B & C) | (~A & ~B) | (~A & C);                //f
assign Y[6] = D          | (~A & B) | ( B & ~C) | (~B & C);                //g
endmodule