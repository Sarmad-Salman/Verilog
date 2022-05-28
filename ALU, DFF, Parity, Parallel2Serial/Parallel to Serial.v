//_________________________________________
//_____Parallel to Serial Converter________
//_________________________________________
module par_ser(clk,rst,strobe,d_in,d_out);
input [7:0] d_in; output d_out;
input clk, rst, strobe;	//Port Declarations
reg [7:0] temp;	//Internal register
always @(posedge clk) begin  //Behavioral Block
if (rst) temp<=8'b00000000;  //Reset Condition
else if (strobe) temp<=d_in; //Strobe Condition
else temp [7:0] <={temp[6:0], 1'b0}; //Left Shifting
end
assign d_out = temp[7];	//Serial Output i.e. MSB
endmodule 