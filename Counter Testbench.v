module counter_4t();
reg clk,rst;
wire[3:0]cnt_val;
wire ovf;
counter #(4) c1(clk,rst,cnt_val,ovf);
initial
begin
clk=1'b0;
rst=1'b1;
#100;
rst=1'b0;
end
always #10 clk=~clk;
endmodule