module fifo_tb();
reg clk, rst_n, wrt_sig, rd_sig;
reg [7:0] din;
wire [7:0] dout;
wire full_sig, empty_sig, over_flow, under_flow;
reg [4:0] wrt_ptr, rd_ptr, diff_ptr;
reg [7:0] mem_ch[0:31];
reg [7:0] comp_mem1[0:31];
reg [7:0] comp_mem2[0:31];
`include "init_fifo.v"
`include "mk_infile.v"
`include "wrt_data_fifo.v"
`include "rd_data_fifo.v"
`include "comp_data.v"
initial
begin
 init_fifo;
 mk_infile;
 wrt_data_fifo;
 rd_data_fifo;
 comp_data;
#1000 $stop;
end
always #25 clk=~clk;
fifo_top f2(clk, rst_n, wrt_sig, rd_sig, din, full_sig, empty_sig, over_flow, under_flow, dout);
endmodule