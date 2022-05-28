//______________________________________________________
//______________NRZ to Manchestor_______________________
//______________________________________________________
module manchester(inp, outp, clk, rst);
input inp, rst, clk; 			//Port definitions
output reg outp; reg [3:0] state;
parameter s0=4'b0001, s1=4'b0010,
	  s2=4'b0100, s3=4'b1000;	//State declaration
always @(negedge clk)	//Behavioral Sequential Logic
if (rst) state<=s0;			//Active Low Reset
else begin case (state)		//For the assignments of all states
s0: begin if (inp==1) state<=s3;	//State 0
else if (inp==0) state<=s1; end
s1: begin if (inp==0) state<=s2; end	//State 1
s2: begin if (inp==1) state<=s3;	//State 2
else if (inp==0) state<=s1; end
s3: begin if (inp==1) state<=s0; end	//State 3
endcase end
always @(negedge clk)	//Output Logic
begin if (rst) outp<=0;
else if (state==s1||state==s0) outp<=1;
else outp<=0; end endmodule 