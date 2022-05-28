module mooretest();
reg clk, rst, inp;
wire outp; wire [4:0]stack;
reg [31:0] sequence;			//For the internal 32-bits
integer i;
moore dut(clk, rst, inp, outp, stack);		//Calling the instance
initial
begin
clk = 0;
rst = 1;
sequence = 32'b0011_1000_1111_0111_0011_1000_1111_0011;
#5 rst = 0;
for (i=0; i<=31; i=i+1)
begin
inp = sequence[i];			//All the input bits
#2 clk = 1;
#2 clk = 0;
$display ("State =  ", dut.state, " Input =  ", inp, " Output = ", outp);
end
end
endmodule 