module dec24_t ();
reg a,b,c;
wire [3:0]Y;
dec24 d1 (Y, a, b, c);
initial
begin
#100 b=0; a=0; c=1;
#100 b=0; a=1; c=1;
#100 b=1; a=0; c=1;
#100 b=1; a=1; c=1;
end
endmodule