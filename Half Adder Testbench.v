module ha_t();
wire S,C;
reg  I0, I1;
ha h1(I0, I1, C, S);
initial 
begin 
#100; I0=0; I1=0; 
#100; I0=1; I1=0;  
#100; I0=0; I1=1;  
#100; I0=1; I1=1; 
end
endmodule