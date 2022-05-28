module digclk(clk_1Hz, reset, sec, min, hrs, LCD_E, LCD_RS, LCD_RW, SF_D, SF_CE0);
input clk_1Hz, reset;
output reg [5:0] sec, min;
output reg [4:0] hrs;
output [11:8] SF_D;
reg [7:0] LcdCHAR;
wire [7:0] LCD_INDEX
output LCD_E, LCD_RS, LCD_RW, SF_CE0; 
always@(posedge clk_1Hz or posedge reset)
	begin
	if(reset ==1)
	begin
	sec<=0;
	min<=0;
	hrs<=0;
	end
	else	
	begin
	sec<=sec+1;
	if(sec==59)
	begin
	sec<=0;
	min<=min+1;
	if(min==59)
	begin
	min<=0;
	hrs<=hrs+1;
	if(hrs==23)
	begin
	hrs<=0;
	end
		end
	end
	end
end
endmodule