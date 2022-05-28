//____________________________________________
//____Parallel to Serial Converter Testbench__
//____________________________________________
module par_ser_test();
reg clk, rst, strobe;	//Port Declarations
wire d_out; reg [7:0]d_in;
par_ser inst1(clk,rst,strobe,d_in,d_out);
//Instance Calling
initial begin
d_in = 8'b10101010;  //Initializing Inputs
clk=0; #5 clk =1; #5 rst=1; #5 strobe=0;
#5 rst =0; #5 strobe=1; #10 strobe=0;
//Synchronising the time of Strobe with Clock
#500 $stop; end
always #5 clk = ~clk;
endmodule 