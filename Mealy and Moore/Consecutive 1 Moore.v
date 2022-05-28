module consmoore (clk, rst, inp, outp);
input clk, rst, inp;
output reg outp;
reg [2:0] state;
parameter s0=3'b000, s1=3'b001, s2=3'b010, s3=3'b011, s4=3'b100, s5=3'b101, s6=3'b110, s7=3'b111;
always @(posedge clk, posedge rst)  //Handling clock and reset
if (rst)			    //Sequence Logic
state <= s0;			    //Active low reset
else begin		 	    //At reset=1, the states are initialized
case (state)			    //Case Statements for all the different states
s0: begin if (inp) state <= s0;	    //State 0
else state <= s1; end
s1: begin if (inp) state <= s2;     //State 1
else state <=s1; end
s2: begin if (inp) state <= s3;	    //State 2
else state <=s1; end
s3: begin if (inp) state <= s4;     //State 3
else state <=s1; end
s4: begin if (inp) state <= s5;     //State 4
else state <= s1; end
s5: begin if (inp) state <= s0;     //State 5
else state <=s1; end
endcase
end
always @(posedge clk, posedge rst)  //Output Logic
begin if (rst)
outp <=0;
else if (state == s4)
outp <=1;
else outp <=0; end
endmodule 