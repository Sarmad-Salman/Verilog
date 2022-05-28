module digclk_s(clk_in, reset, en, sec, min, hrs, but2, but3, but4);
input clk_in, reset, en, but2, but3, but4;
output [5:0] sec, min;
output [4:0] hrs;
wire clk_1Hz;
slowClock s1(clk_in, reset, en, clk_1Hz);
digclk d1(clk_1Hz, reset, sec, min, hrs, but2, but3, but4);
endmodule 