//__________________________________________________
//________ALU_______________________________________
//__________________________________________________
module alu(a,b,func,out);
input [15:0] a,b; input [2:0] func;
output reg [15:0] out;  //Port Declarations
parameter nots = 3'b001; parameter ands = 3'b010; 
parameter ors = 3'b011; parameter xors = 3'b100;
parameter xnors = 3'b101; parameter nors = 3'b110;
parameter nands = 3'b111; //Parameters for functions
always @(a or b or func)  //Behavioral Logic
begin case (func)    //Case Statements for functions
nots: out = ~b; ands: out = a & b;
ors: out = a | b; xors: out = a ^ b;
xnors: out = a ~^ b; nors: out = ~(a | b);
nands: out = ~(a & b); default: out = 16'd0; 
endcase end endmodule 