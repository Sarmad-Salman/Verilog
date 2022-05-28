module consmealy(clk, rst, inp, outp);
input clk, rst, inp; output reg outp; reg [2:0] state;
parameter s0=3'b000, s1=3'b001, s2=3'b010, s3=3'b011, s4=3'b100, s5=3'b101, s6=3'b110, s7=3'b111;
parameter S0=4'b0000,S1=4'b0001,S2=4'b0010,S3=4'b0011,S4=4'b0100,S5=4'b0101,S6=4'b0110,S7=4'b0111,S8=4'b1000,S9=4'b1001;
always @(posedge clk, rst) 		 //Handling clock and reset
begin if (rst)
state <= s0;				//Active low reset
else begin
case({state, inp})			 //Case Statements for all the different states
S0: begin
state <= s1;				//s1 = State 1
outp <= 0; end
S1: begin
state <= s0;				//s0 = State 0
outp <= 0; end
S2: begin
state <= s1;
outp <= 0; end
S3: begin
state <= s2;				//s2 = State 2
outp <= 0; end
S4: begin
state <= s1;
outp <= 0; end
S5: begin
state <= s3;				//s3 = State 3
outp <= 0; end
S6: begin
state <= s1;
outp <= 0; end
S7: begin
state <= s4;				//s4 = State 4
outp <= 1; end				//Immediate Output
S8: begin
state <= s1;
outp <= 0; end
S9: begin
state <= s0;
outp <= 0; end			
endcase
end
end
endmodule 