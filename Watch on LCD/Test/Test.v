module digclk_t();
reg reset, clk_in, en;
wire [5:0]sec, min;
wire [4:0] hrs;
digclk_s d0(clk_in, reset, en, sec, min, hrs);
initial
begin
en=1'b0;
clk_in=1'b1;
reset=1'b1;
#100;
en=1'b1;
reset=1'b0;
end
always #10 clk_in=~clk_in;
endmodule