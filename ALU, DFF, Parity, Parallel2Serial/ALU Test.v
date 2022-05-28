//___________________________________
//________ALU Testbench______________
//___________________________________
module alu_test();
reg [15:0] a,b; reg [2:0] func;
wire [15:0] out; //Port Declarations
alu inst1(a,b,func,out);
//  Instance calling
initial begin
a = 16'd24050; b = 16'd53040;
func = 3'b010; //Initializing Inputs
//Using two functions from the ALU
#10 func = 3'b111;
end endmodule 