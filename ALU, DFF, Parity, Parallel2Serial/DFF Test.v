//_________________________________________________
//___________DFF Testbench_________________________
//_________________________________________________
module dff_test();
reg clk; reg [3:0] in;
wire [1:0] out;	//Port Declarations
dff_top insta(clk, in, out);  //Calling top module
initial begin
clk = 0; in = 4'b1100;	//Initializing the inputs
#500 $stop; end		//Stop time of simulation
always #50 clk = ~clk;	//Generating Clock
endmodule 