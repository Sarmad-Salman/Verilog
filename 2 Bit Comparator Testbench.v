module comp2b_t();
wire l,g,e;
reg a0,a1,b0,b1;
comp2b c1 (l,g,e,a0,a1,b0,b1);
initial 
begin 
#100; a1=0; a0=0; b1=1; b0=1;
#100; a1=0; a0=0; b1=0; b0=1;
#100; a1=1; a0=0; b1=1; b0=1;
#100; a1=1; a0=1; b1=1; b0=1;
#100; a1=0; a0=0; b1=0; b0=0;
#100; a1=0; a0=1; b1=0; b0=0;
#100; a1=1; a0=0; b1=0; b0=0;
#100; a1=1; a0=1; b1=1; b0=0;
end
endmodule