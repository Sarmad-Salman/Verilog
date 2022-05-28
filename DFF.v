module dff (q,d,clk,rst);
output q;
input d,clk,rst;
reg q;
	always @ (posedge rst or negedge clk)
	begin
		if (rst)
		q = 1'b0;
		else
		q = d;
	end
endmodule