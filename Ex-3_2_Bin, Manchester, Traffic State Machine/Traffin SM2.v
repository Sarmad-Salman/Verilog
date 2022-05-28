//______________________________________________________________________________________
//_______________Traffic Controller State Machine_______________________________________
//______________________________________________________________________________________
module traffic_sm2(clk,rst_n,enable,counter_24,enable_sig,road1_out,road2_out,ped1,ped2);
input clk, rst_n, enable; input [5:0] counter_24;	//Port Definitions
output reg enable_sig; output reg [2:0] road1_out,road2_out, ped1, ped2;
parameter [2:0] RED = 3'b001,YELLOW = 3'b010,GREEN = 3'b100; reg [5:0] traffic_state;
parameter [5:0] s0=6'b000001, s1=6'b000010, s2=6'b000100,
	 s3=6'b001000,s4=6'b010000,s5=6'b100000;	//One Hot Encoding
always @(posedge clk, negedge rst_n)		//Behavioral Sequential Logic
begin if (rst_n) begin traffic_state<=s0; end
else begin case (traffic_state)		//Building the State Machine
s0: begin if (enable) traffic_state<=s1; else traffic_state<=s0; end	//State 0
s1: begin if (counter_24==6'd4) traffic_state<=s2; else traffic_state<=s1; end	//State 1
s2: begin if (counter_24==6'd9) traffic_state<=s3; else traffic_state<=s2; end	//State 2 
s3: begin if (counter_24==6'd11) traffic_state<=s4; else traffic_state<=s3; end	//State 3
s4: begin if (counter_24==6'd16) traffic_state<=s5; else traffic_state<=s4; end	//State 4
s5: begin if (counter_24==6'd21) traffic_state<=s1; else traffic_state<=s5; end	//State 5
endcase end end	
always @(traffic_state) begin case (traffic_state)	//Output Logic
s0: begin enable_sig=1'b0; road1_out=RED; road2_out=RED; ped1=RED; ped2=RED; end //Assigning
s1: begin enable_sig=1'b1; road1_out=YELLOW; road2_out=RED; ped1=RED; ped2=GREEN; end //Outputs
s2: begin enable_sig=1'b1; road1_out=GREEN; road2_out=RED; ped1=RED; ped2=GREEN; end
s3: begin enable_sig=1'b1; road1_out=YELLOW; road2_out=YELLOW; ped1=RED; ped2=RED; end
s4: begin enable_sig=1'b1; road1_out=RED; road2_out=GREEN; ped1=GREEN; ped2=RED; end
s5: begin enable_sig=1'b1; road1_out=RED; road2_out=YELLOW; ped1=GREEN; ped2=RED; end
endcase end endmodule 