//______________________________________________________\\
//________Compare 4 32-bit numbers Test Bench____________\\
//________________________________________________________\\
module ALGO_4_32_test();
reg [31:0] A_21,B_21,C_21,D_21;	  //Port Declarations
wire [3:0] GTE_21, LTE_21;	
wire AGT_21,BGT_21,CGT_21,DGT_21,ALT_21,BLT_21,CLT_21,DLT_21;
//Instance Calling 
           //Without Equalization
ALGO_4_32 INST1(GTE_21, LTE_21, A_21,B_21,C_21,D_21);
              //With Equalization	
ALGO_4_32_E INST2(AGT_21,BGT_21,CGT_21,DGT_21,ALT_21,BLT_21
		,CLT_21,DLT_21,A_21,B_21,C_21,D_21);
initial begin
A_21 =10; B_21=9; C_21=5; D_21=1;
#10 A_21 =9; B_21=5; C_21=1; D_21=10;    //Using different 
#10 A_21 =5; B_21=1; C_21=10; D_21=9;    //cases to check
#10 A_21 =1; B_21=10; C_21=9; D_21=5;    // comparator
#10 A_21 =525; B_21=12; C_21=41; D_21=31;
#10 A_21 =525; B_21=525; C_21=41; D_21=10; //Equal case check
#10 $stop; end	//Simulation end after time steps
endmodule 