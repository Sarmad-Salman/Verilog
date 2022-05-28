//______________________________________________________\\
//_____Compare 4 32-bit numbers without equalization_____\\
//________________________________________________________\\
module ALGO_4_32 (GTE_21, LTE_21, A_21,B_21,C_21,D_21);
output reg [3:0] GTE_21, LTE_21;     //Port Declarations
input [31:0] A_21,B_21,C_21,D_21;
always @(A_21,B_21,C_21,D_21) begin		//Behavioral Level Logic
GTE_21 =0; LTE_21 = 0;		//Initialization
if ((A_21>=B_21)&&(A_21>=C_21)&&(A_21>=D_21)) GTE_21=GTE_21|4'b1000; //A is Greatest
if ((B_21>=A_21)&&(B_21>=C_21)&&(B_21>=D_21)) GTE_21=GTE_21|4'b0100; //B is Greatest	
if ((C_21>=A_21)&&(C_21>=B_21)&&(C_21>=D_21)) GTE_21=GTE_21|4'b0010; //C is Greatest
if ((D_21>=A_21)&&(D_21>=B_21)&&(D_21>=C_21)) GTE_21=GTE_21|4'b0001; //D is Greatest
if ((A_21<=B_21)&&(A_21<=C_21)&&(A_21<=D_21)) LTE_21=LTE_21|4'b1000; //A is Lowest
if ((B_21<=A_21)&&(B_21<=C_21)&&(B_21<=D_21)) LTE_21=LTE_21|4'b0100; //B is Lowest
if ((C_21<=A_21)&&(C_21<=B_21)&&(C_21<=D_21)) LTE_21=LTE_21|4'b0010; //C is Lowest
if ((D_21<=A_21)&&(D_21<=B_21)&&(D_21<=C_21)) LTE_21=LTE_21|4'b0001; //D is Lowest
end endmodule 

//_______________________________________________________\\
//_______Compare 4 32-bit numbers with equalization_______\\
//_________________________________________________________\\
module ALGO_4_32_E (AGT_21,BGT_21,CGT_21,DGT_21,ALT_21,BLT_21,CLT_21,DLT_21,A_21,B_21,C_21,D_21);
output reg AGT_21,BGT_21,CGT_21,DGT_21,ALT_21,BLT_21,CLT_21,DLT_21;
input [31:0] A_21,B_21,C_21,D_21;		//Port Declarations
always @(A_21,B_21,C_21,D_21) begin		//Behavioral Level Logic
AGT_21 = (A_21>=B_21)&&(A_21>=C_21)&&(A_21>=D_21);	//A is Greatest
BGT_21 = (B_21>=A_21)&&(B_21>=C_21)&&(B_21>=D_21);	//B is Greatest	
CGT_21 = (C_21>=A_21)&&(C_21>=B_21)&&(C_21>=D_21);	//C is Greatest
DGT_21 = (D_21>=A_21)&&(D_21>=B_21)&&(D_21>=C_21);	//D is Greatest
ALT_21 = (A_21<=B_21)&&(A_21<=C_21)&&(A_21<=D_21);	//A is Lowest
BLT_21 = (B_21<=A_21)&&(B_21<=C_21)&&(B_21<=D_21);	//B is Lowest
CLT_21 = (C_21<=A_21)&&(C_21<=B_21)&&(C_21<=D_21);	//C is Lowest
DLT_21 = (D_21<=A_21)&&(D_21<=B_21)&&(D_21<=C_21);	//D is Lowest
end endmodule 