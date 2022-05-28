module q2d_t ();
wire Y;
reg en;
reg [4:0]I;
q2d n1 (Y,I,en);
initial
begin
#100 I = 5'd7; en =0;
#100 I = 5'd7; en =1;
end
endmodule