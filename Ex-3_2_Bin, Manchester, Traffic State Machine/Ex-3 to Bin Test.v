//_____________________________________________________________________
//____________5-bit Ex-3 to BCD Testbench______________________________
//_____________________________________________________________________
module mooreex3tobintest();
reg clk, rst, inp; wire outp;	//Port definition
reg [29:0] sequence;		//For the internal six 5-bit Ex-3 numbers
integer i;
Ex_3_to_Bin dut(outp, inp, clk, rst);		//Calling the instance
initial begin
clk = 0; rst = 1; #2 clk =1; #2 clk =0;
sequence = 30'b000110010000101001100011101000;	//Six 5-bit numbers
#5 rst = 0; inp=0;
for (i=0; i<=30; i=i+1) begin
inp = sequence[i];			//All the input bits
#2 clk = 1; #2 clk = 0;
$display ("State =  ", dut.state, " Input =  ", inp, " Output = ", outp);
end end endmodule 