//__________________________________________________________________________________________________________________
//_______________________Traffic Controller State Machine___________________________________________________________
//__________________________________________________________________________________________________________________
module traffic_sm(clk,rst_n,enable,counter_24,enable_sig,road1_out,road2_out,road3_out,ped);
input clk, rst_n, enable; input [5:0] counter_24;						//Port Definitions
output reg enable_sig; output reg [2:0] road1_out,road2_out, road3_out, ped;
parameter [2:0] RED = 3'b001,YELLOW = 3'b010,GREEN = 3'b100; reg [10:0] traffic_state;
parameter [10:0] s0=11'b00000000001, s1=11'b00000000010, s2=11'b00000000100, s3=11'b00000001000,   //One Hot Encoding
s4=11'b00000010000,s5=11'b00000100000, s6=11'b00001000000,s7=11'b00010000000,s8=11'b00100000000,
s9=11'b01000000000,s10=11'b10000000000;
always @(posedge clk, negedge rst_n) begin if (rst_n) begin traffic_state<=s0; end	//Behavioral Sequential Logic
else begin case (traffic_state)			//Building the State Machine
s0: begin if (enable) traffic_state<=s1; else traffic_state<=s0; end			//State 0
s1: begin if (counter_24==6'd1) traffic_state<=s2; else traffic_state<=s1; end		//State 1
s2: begin if (counter_24==6'd11) traffic_state<=s3; else traffic_state<=s2; end 	//State 2
s3: begin if (counter_24==6'd13) traffic_state<=s4; else traffic_state<=s3; end		//State 3
s4: begin if (counter_24==6'd22) traffic_state<=s5; else traffic_state<=s4; end		//State 4
s5: begin if (counter_24==6'd25) traffic_state<=s6; else traffic_state<=s5; end		//State 5
s6: begin if (counter_24==6'd34) traffic_state<=s7; else traffic_state<=s6; end		//State 6
s7: begin if (counter_24==6'd37) traffic_state<=s8; else traffic_state<=s7; end		//State 7
s8: begin if (counter_24==6'd39) traffic_state<=s9; else traffic_state<=s8; end		//State 8
s9: begin if (counter_24==6'd49)traffic_state<=s10; else traffic_state<=s9; end		//State 9
s10: begin if (counter_24==6'd51)traffic_state<=s1; else traffic_state<=s10; end endcase end end  //State 10
always @(traffic_state) begin case (traffic_state)		//Output Logic Controller
s0: begin enable_sig=1'b0; road1_out=RED; road2_out=RED; road3_out=RED; ped=RED; end	//Assigning Outputs
s1: begin enable_sig=1'b1; road1_out=YELLOW; road2_out=RED; road3_out=RED; ped=RED; end
s2: begin enable_sig=1'b1; road1_out=GREEN; road2_out=RED; road3_out=RED; ped=RED; end
s3: begin enable_sig=1'b1; road1_out=YELLOW; road2_out=RED; road3_out=RED; ped=RED; end
s4: begin enable_sig=1'b1; road1_out=RED; road2_out=RED; road3_out=RED; ped=GREEN; end
s5: begin enable_sig=1'b1; road1_out=RED; road2_out=RED; road3_out=YELLOW; ped=RED; end
s6: begin enable_sig=1'b1; road1_out=RED; road2_out=RED; road3_out=GREEN; ped=RED; end
s7: begin enable_sig=1'b1; road1_out=RED; road2_out=RED; road3_out=YELLOW; ped=RED; end
s8: begin enable_sig=1'b1; road1_out=RED; road2_out=YELLOW; road3_out=RED; ped=RED; end
s9: begin enable_sig=1'b1; road1_out=RED; road2_out=GREEN; road3_out=RED; ped=RED; end
s10: begin enable_sig=1'b1; road1_out=RED; road2_out=YELLOW; road3_out=RED; ped=RED; end
endcase end endmodule 