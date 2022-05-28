module mul4 (Y,A,B);
input [3:0]A,B;
output [7:0]Y;
wire pp0,pp1,pp2,pp3;
assign pp0 = A & {4{B[0]}};
assign pp1 = A & {4{B[1]}};
assign pp2 = A & {4{B[2]}};
assign pp3 = A & {4{B[3]}};
assign #100 Y= {{pp3,3'b0},{pp2,2'b0},{pp1,1'b0},{pp0}};
endmodule