//_______________________________________________
//_________DFF Top Module________________________
//_______________________________________________
module dff_top(clk, in, out);
input clk; input [3:0] in;    //Port Declarations
output [1:0] out;
wire wu, wd;	//Intermediate Wires
wire [3:0] p_in;
assign wu = p_in[3] & p_in[2];	//AND Gates
assign wd = p_in[1] & p_in[0];
dff_4 inst1(in, clk, p_in);	//Instance 1
dff_2 inst2({wu, wd}, clk, out); //Instance 2
//defparam inst2.WIDTH=2;	//Passing parameter as 2
endmodule 