module clkdiv_t ();
reg clk_in,en,rst;
wire clk_out;
clkdiv c1(clk_out, rst, en, clk_in);
initial
begin
en = 1'b0;
clk_in = 1'b0;
rst = 1'b1;
#100
en = 1'b1;
rst = 1'b0;
end
always #10 clk_in = ~clk_in;
endmodule