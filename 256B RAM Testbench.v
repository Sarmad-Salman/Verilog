module ram_t ();
reg  clk, w_sig;
reg  [7:0] din;
reg  [7:0] add_r, add_w;
wire [7:0] dout;

reg [7:0] mem_ch[0:9999];

reg [7:0] comp_mem1[0:9999];
reg [7:0] comp_mem2[0:9999];

`include "initialize_sys.v"
`include "mk_infile.v"
`include "wrt_data.v"
`include "rd_data.v"
`include "comp_data.v"

initial
begin

initialize_sys;
mk_infile;
wrt_data;
rd_data;
comp_data;

#1000 $stop;
end

always #25 clk =~clk;

ram r1 (dout, clk, w_sig, add_r, add_w, din);

endmodule