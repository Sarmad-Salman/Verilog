module moore (clk, rst, inp, outp, stack);
input clk, rst, inp;
output reg outp; output reg [4:0]stack;
reg [2:0] state;
parameter s0=3'b000, s1=3'b001, s2=3'b010, s3=3'b011, s4=3'b100, s5=3'b101, s6=3'b110, s7=3'b111;
always @(posedge clk, posedge rst)  //Handling clock and reset
if (rst)			    //Sequence Logic
state <= s0;			    //Active low reset
else begin		 	    //At reset=1, the states are initialized
case (state)			    //Case Statements for all the different states
s0: begin if(inp) begin state <= s1;stack <= 5'b00001; end	    //State 0
else begin state <= s0; stack <= 5'b00000; end end
s1: begin if (inp) begin state <= s1; stack <= 5'b00001;  end   //State 1
else begin state <=s2;stack <= 5'b00010; end end
s2: begin if (inp) begin state <= s1;stack <= 5'b00001;	end    //State 2
else begin state <=s3;stack <= 5'b00100; end end
s3: begin if (inp) begin state <= s4;stack <= 5'b01001; end    //State 3
else begin state <=s0;stack <= 5'b00000; end end
s4: begin if (inp) begin state <= s5;stack <= 5'b10011;  end   //State 4
else begin state <= s2;stack <= 5'b00010; end end
s5: begin if (inp) begin state <= s1;stack <= 5'b00001; end    //State 5
else begin state <=s2;stack <= 5'b00010; end end
endcase
end
always @(posedge clk, posedge rst)  //Output Logic
begin if (rst)
outp <=0;
else if (state == s5)
outp <=1;
else outp <=0; end
endmodule 