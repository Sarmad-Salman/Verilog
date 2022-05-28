module dec24d_t ();
reg  [1:0]I;
reg  c;
wire [3:0]Y;
dec24d d1 (Y, I, c);
initial
begin
#100 I=2'd0; c=1;
#100 I=2'd1; c=1;
#100 I=2'd2; c=1;
#100 I=2'd3; c=1;
end
endmodule
