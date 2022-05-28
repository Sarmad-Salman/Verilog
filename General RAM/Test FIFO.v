module tb_fifo();
reg clk, rst_n, wrt_sig, rd_sig; reg [7:0] din; reg [25:0] test;
wire full_sig, empty_sig, over_flow, under_flow; wire [7:0] dout;
update_fifo_top u1(clk, rst_n, wrt_sig, rd_sig, din, dout, full_sig, empty_sig, over_flow, under_flow);//fifo_top f7(clk, rst_n, wrt_sig, rd_sig, din, full_sig, empty_sig, over_flow, under_flow, dout);
initial begin
clk=1'b0; rst_n=1'b0;
wrt_sig=1'b0;
rd_sig=1'b0;
din=8'b0;
#30 rst_n=1'b1;
for(test=0; test < (2**26)-1; test = test + 1) begin
#20 wrt_sig = 1'b 1;
din = test;
#20 wrt_sig = 1'b 0;		end
for(test=0; test < (2**26)-1; test = test + 1) begin
#20 rd_sig = 1'b 1;
#20 rd_sig = 1'b 0;	end	
for(test=0; test < (2**26)-1; test = test + 1) begin
#20 wrt_sig = 1'b 1;
din = test;
#20 wrt_sig = 1'b 0;	end	
for(test=0; test < (2**26)-1; test = test + 1) begin
#20 rd_sig = 1'b 1;
#20 rd_sig = 1'b 0;	end	
for(test=0; test < (2**26)-1; test = test + 1)begin
#20 rd_sig = 1'b 1;
wrt_sig = 1'b 1;
din = test;
#20 rd_sig = 1'b 0;
wrt_sig = 1'b 0;	end
for(test=0; test < (2**26)-1; test = test + 1) begin
#20 rd_sig = 1'b 1;
#20 rd_sig = 1'b 0;	end
for(test=0; test < (2**26)-1; test = test + 1) begin
#20 wrt_sig = 1'b 1;
din = test;
#20 wrt_sig = 1'b 0;	end
#10	rst_n = 1'b 1;
#100 $stop;	end
always #25 clk=~clk;
endmodule 