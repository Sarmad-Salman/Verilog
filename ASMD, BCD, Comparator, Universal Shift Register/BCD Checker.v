//_____________________________________\\
//___________BCD Checker________________\\
//_______________________________________\\
module BCD_checker (data_21, flag_21);
output reg flag_21;	//Port Declarations
input [3:0] data_21;
always @ (data_21)		//Behavioral Block
case (data_21)	//Case for checking BCD
0,1,2,3,4,5,6,7,8,9: flag_21 = 0;
default: flag_21 = 1;	//When not BCD
endcase endmodule 