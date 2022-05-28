module ha (I0, I1, C, S);
input I0, I1;
output C;
output S;
xor G1 (S, I0, I1);
and G2 (C, I0, I1);
endmodule