//___________________________________________\\
//________BCD Checker Test Bench______________\\
//_____________________________________________\\
module BCD_check_test();
wire flag_21;	//Port Declarations
reg [3:0] data_21; 
BCD_checker inst1(data_21, flag_21); //Calling Instance
initial begin
for (data_21 =0; data_21<=15; data_21 = data_21+1)
//Checking for all 16 possibilities
if (data_21 ==16) data_21 =0; else
#1 data_21 = data_21; end endmodule 