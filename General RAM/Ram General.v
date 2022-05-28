module ram_general(clk, wrt_sig, addr_w, addr_r, din_ram, dout_ram);
input clk, wrt_sig;
input [25:0] addr_w, addr_r;
input [7:0] din_ram;
output [7:0] dout_ram;
parameter [26:0] DEPTH = 2**26;
parameter [3:0] WIDTH = 8;
reg [WIDTH-1:0] RAM_MEM[0:DEPTH-1];
always @(posedge clk)
begin
	if(wrt_sig)
		RAM_MEM[addr_w]<=din_ram;
end
assign dout_ram = RAM_MEM[addr_r];
endmodule 