module cnt4hz1(clk_in, en, rst, cnt_val, ovf);
input clk_in, en, rst;
output [3:0]cnt_val;
output ovf;
wire clk_out;
clkdiv c1 (clk_out, rst, en, clk_in);
counter #(4) c2 (clk_out,rst,cnt_val,ovf);
endmodule