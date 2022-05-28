//_________________________________________________________\\
//_______________Universal Shift Register___________________\\
//___________________________________________________________\\
module Universal_shift_reg(dout_21, din_21, MSBout_21, LSBout_21,
			 MSBin_21, LSBin_21, s1_21,s0_21,clk_21,rst_21);
output reg [3:0] dout_21;		//Port Declarations
output MSBout_21, LSBout_21;
input [3:0] din_21; input MSBin_21, LSBin_21, s1_21, s0_21, clk_21, rst_21;
assign MSBout_21 = dout_21[3];    //Most Significant Bit
assign LSBout_21 = dout_21[0];    //Least Significant Bit
always @(posedge clk_21) begin	//Behavioral Block
if (rst_21) dout_21<=0; else case ({s1_21, s0_21})//Using case statements
0: dout_21<=dout_21;		//Idle
1: dout_21<={MSBin_21,dout_21[3:1]};	//Shift Right
2: dout_21<={dout_21[2:0], LSBin_21};	//Shift Left
3: dout_21<= din_21;		//Parallel Load
endcase end endmodule 