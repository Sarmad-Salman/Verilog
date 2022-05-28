//_______________________________________________________________________________________________________
//_______________________5-Bit Ex-3 to BCD_______________________________________________________________
//_______________________________________________________________________________________________________
module Ex_3_to_Bin(outp, inp, clk, rst);
input clk, inp, rst; output reg outp; reg [3:0] state;			//Port Definition
parameter s0=4'd0, s1=4'd1, s2=4'd2, s3=4'd3, s4=4'd4, s5=4'd5, s6=4'd6,
	  s7=4'd7,s8=4'd8,s9=4'd9,s10=4'd10,s11=4'd11, s12=4'd12;	//State Definition
always @(posedge clk)  		//Behavioral Block Handling Clock / Synchronous Reset/ Sequential Logic
if (rst) state <= s0;else begin case (state)	//Active Low Reset / Case statements for all the states	
s0: begin if (inp) state<=s1; else state<=s10; end	//State 0
s1: begin if (inp) state<=s2; else state<=s8; end	//State 1
s2: begin if (inp) state<=s4; else state<=s3; end	//State 2
s3: begin if (inp) state<=s6; else state<=s5; end	//State 3
s4: begin if (inp) state<=s5; else state<=s5; end	//State 4
s5: begin if (~inp) state<=s7; end			//State 5
s6: begin if (~inp) state<=s7; end			//State 6
s7: begin if (inp) state<=s1; else state<=s10; end	//State 7
s8: begin if (inp) state<=s3; else state<=s9; end	//State 8
s9: begin if (inp) state<=s5; end			//State 9
s10: begin if (inp) state<=s12; else state<=s11; end	//State 10
s11: begin if (inp) state<=s3; else state<=s4; end	//State 11
s12: begin if (inp) state<=s3;				//State 12
else state<=s4; end endcase end
always @(posedge clk)					//Output logic controller
begin if (rst) outp<=0;
else if (state == s4 || state == s6 || state == s8 ||state==s9||state== s10||state== s12)
outp<=1; else outp<=0; end 
endmodule 