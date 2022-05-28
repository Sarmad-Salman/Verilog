module compd_t ();
reg [4:0]a,b;
wire alb,agb,aeb;
compd c1 (alb,agb,aeb,a,b);
initial
begin
#100 a=4'd5; b=4'd0;
#100 a=4'd0; b=4'd0;
#100 a=4'd0; b=4'd5;
end
endmodule