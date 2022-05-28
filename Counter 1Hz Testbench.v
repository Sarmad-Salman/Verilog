module counter_4t1hz();
reg clk_in, rst, en;
wire[3:0]cnt_val;
wire ovf;
cnt4hz1 c1(clk_in, en, rst, cnt_val, ovf);
initial
begin
en=1'b0;
clk_in=1'b0;
rst=1'b1;
#100;
rst=1'b0;
en=1'b1;
end
always #10 clk_in=~clk_in ;
endmodule