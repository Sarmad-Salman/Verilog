module fa1b_t();
wire s,c;
reg a,b,ci;
fa1b fa1(s,c,a,b,ci);
initial
begin
#100; a=0; b=0; ci=0; 
#100; a=1; b=0; ci=0; 
#100; a=0; b=1; ci=0; 
#100; a=1; b=1; ci=0; 
#100; a=0; b=0; ci=1; 
#100; a=1; b=0; ci=1; 
#100; a=0; b=1; ci=1; 
#100; a=1; b=1; ci=1; 
end
endmodule