module digclk_t();
reg reset, clk_in, en, but2, but3, but4;
wire [5:0]sec, min;
wire [4:0] hrs;
digclk_s d0(clk_in, reset, en, sec, min, hrs, but2, but3, but4);
initial
begin
	but2 = 1'b0;
	but3 = 1'b0;
	but4 = 1'b0;
	en=1'b0;
	clk_in=1'b1;
	reset=1'b1;
	#100;
	en=1'b1;
	reset=1'b0;
	#200;
	but2 = 1'b1;
	#20; but3 = 1'b1;
	#20; but3 = 1'b0;
	#20; but3 = 1'b1;
	#20; but3 = 1'b0;
	#20; but3 = 1'b1;
	#20; but3 = 1'b0;
	
	
	#20; but4 = 1'b1;
	#20; but4 = 1'b0;
	#20; but4 = 1'b1;
	#20; but4 = 1'b0;
	#50; but2 = 1'b0;
end
always #10 clk_in=~clk_in;
endmodule 