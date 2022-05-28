//_________________________________________________________
//____DFF Module using parameters__________________________
//_________________________________________________________
module dff_param(d, clk, q);
parameter WIDTH = 4;  //Using Parameters for generalization
input [WIDTH-1:0] d; input clk;	//Port declaration
output reg [WIDTH-1:0] q;
always @(posedge clk)	//Synchronous Reset
q<=d;
endmodule 