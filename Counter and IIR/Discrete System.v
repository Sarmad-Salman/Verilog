//__________Infinite Impulse Response_____________________________________\\
//___________For output not increasing 20 bits_____________________________\\
//__________________________________________________________________________\\
module discrete_sys_core(clk_21,rst_21,data_valid_21,din_21,dout_21);
input [7:0]din_21; input clk_21,rst_21, data_valid_21;	//Port Declarations
output [19:0]dout_21; reg [13:0] y1, y2; wire [13:0] y;
reg [7:0] in1, in2, in3; wire [11:0]mul1,mul2,mul3; wire [19:0]mul4,mul5;
parameter M1=4'b1111; parameter M2=4'b1111; parameter M3=4'b1111;
parameter M4=4'b1111; parameter M5=4'b1111;	//Defining Multipliers
always @(posedge clk_21) begin	//Synchronous Block for Delay of Inputs
if ((data_valid_21==0) || (rst_21==1)) begin
in1<=8'd0; in2<=in1; in3<=in2; end else		//Delay of inputs
if ((data_valid_21==1) && (rst_21==0)) begin
in1<=din_21; in2<=in1; in3<=in2; end end
assign mul1 = in1*M1;		//First_21 Multiplication
assign mul2 = in2*M2;		//Second Multiplication
assign mul3 = in3*M3;		//Third Multiplication
assign y = mul1+mul2+mul3;	//Output of the FIR
always @(posedge clk_21) begin	//Synchronous Block for Delay of Outputs
y1<=y; y2<=y1; end		//Delay of Outputs
assign mul4 = y1*M4;		//Fouth Multiplication
assign mul5 = y2*M5;		//Fifth Multiplication
assign dout_21 = y + mul4 + mul5;	//Output of IIR
endmodule 