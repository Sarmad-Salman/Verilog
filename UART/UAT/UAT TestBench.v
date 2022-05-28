module uat_t ();

reg clk_x;
reg rst_p;
reg din_rdy;
reg [7:0] din_byte;

wire ser_out;

uat_top m1 (clk_x, rst_p, din_rdy, din_byte, ser_out);

initial
begin
	    clk_x = 0;
	    din_byte = 8'b11001010;
	    din_rdy = 0;
	    rst_p = 1;
	#15 din_rdy = 1;
	#15 rst_p = 0;

end

always #10 clk_x = ~clk_x;
initial #500 $stop;
endmodule
