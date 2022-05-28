//__________________________________________________________________\\
//______________Universal Shift Register Test Bench__________________\\
//____________________________________________________________________\\
module universal_shift_reg_test();
wire [3:0] dout_21; reg [3:0] din_21;		//Port Decalarations
reg clk_21, MSBin_21, LSBin_21, s1_21, s0_21, rst_21;
wire MSBout_21, LSBout_21;	//Intermediate Wires
always #5 clk_21=~clk_21;	//Frequency of Clock
//Calling Instance
Universal_shift_reg inst1(dout_21, din_21, MSBout_21, LSBout_21,
		MSBin_21, LSBin_21, s1_21, s0_21, clk_21, rst_21);
initial #1000 $stop;	//Stop simuation after certain time steps
//using Fork Join constructs for parallel execution of all blocks
initial fork
clk_21 = 1'b0; begin #5 rst_21 =1; #20 rst_21 =0; end
begin #120 rst_21 =1; #20 rst_21 =0; end	//Initializing Clock and Reset
begin #260 rst_21 =1; #20 rst_21 =0; end
begin #380 rst_21 =1; #20 rst_21 =0; end join
initial fork
#10 fork #10 begin 	//Verify Right Shift
din_21=4'b1111; s0_21=0; s1_21=0; LSBin_21=1; MSBin_21=1; end
#40 s0_21=1; join
#120 fork begin		//Verify Left Shift
#10 din_21=4'b1111; s0_21=0; s1_21=0; LSBin_21=1; MSBin_21=1; end
#40 s1_21=1; join
#250 fork begin		//Verify Parallel Load
#10 din_21=4'b1111; s0_21=0; s1_21=0; LSBin_21=1; MSBin_21=1; end
#40 begin s0_21=1; s1_21=1; end join
#320 fork begin		//Reset
#10 din_21=4'b1111; s0_21=0; s1_21=0; LSBin_21=1; MSBin_21=1; end
#40 begin s0_21=0; s1_21=0; end
join join endmodule 