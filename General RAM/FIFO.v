module fifo_top(clk, rst_n, wrt_sig, rd_sig, din, full_sig, empty_sig, over_flow, under_flow, dout);
input clk, rst_n, wrt_sig, rd_sig;
input [7:0] din;
output full_sig, empty_sig, over_flow, under_flow;
output [7:0] dout;
parameter DEPTH =2**26;
reg [25:0] wrt_ptr, rd_ptr, diff_ptr;
wire full_sig, empty_sig, over_flow, under_flow;
always @(posedge clk or negedge rst_n)
begin
if (~rst_n)
wrt_ptr<=0;
else if (wrt_sig)
wrt_ptr<=wrt_ptr +1;
else
wrt_ptr<=wrt_ptr;
end
always @(posedge clk or negedge rst_n)
begin
if (~rst_n)
rd_ptr<=0;
else if (rd_sig)
rd_ptr<=rd_ptr +1;
else
rd_ptr<=rd_ptr;
end
always @(wrt_ptr or rd_ptr)
begin
if(wrt_ptr>=rd_ptr)
diff_ptr = wrt_ptr - rd_ptr;
else
diff_ptr = DEPTH - rd_ptr + wrt_ptr;
end
assign full_sig = (diff_ptr == DEPTH -1);
assign empty_sig = (diff_ptr == 0);
assign over_flow = (full_sig & wrt_sig);
assign under_flow = (empty_sig & rd_sig);
ram_general #(2**26, 8) r0 (.clk(clk), .wrt_sig(wrt_sig), .addr_w(wrt_ptr), .addr_r(rd_ptr), .din_ram(din), .dout_ram(dout));
endmodule 