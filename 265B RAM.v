module ram (dout, clk, w_sig, add_r, add_w, din);
parameter width = 8;		//For Byte
parameter depth = 8;	 //8 bits for 256 Bits
input   w_sig, clk;
input  [width-1:0] din;
input  [depth-1:0] add_r, add_w;
output [width-1:0] dout;
reg  [depth-1:0]add_rr;
reg    [width-1:0]ram[0:(2**depth)-1];

always @ (posedge clk)
begin
	if (w_sig)
	begin
		ram[add_w] <= din;
	end
end

assign dout = ram[add_r];

//always @ (posedge clk)
//	add_rr <= add_r;
	
//assign dout = ram[add_rr];

endmodule