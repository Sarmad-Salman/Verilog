module dff_t ();
wire q;
reg  d,clk,rst;
dff d1 (q,d,clk,rst);
initial
begin
clk = 1'b0;
rst = 1'b1;
d = 1'b0;
#100

rst = 1'b0;
#100 d=~d;
clk = ~clk;
forever #10  d = ~d;
end
endmodule