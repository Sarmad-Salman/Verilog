module digital_watch_core(CLK, BTN_SOUTH, SW, sec_digits, min_digits, hrs_digits);
input CLK, BTN_SOUTH, SW;
output reg [5:0] sec_digits, min_digits;
output reg [4:0] hrs_digits;
//output [11:8] SF_D;
//reg [7:0] LcdCHAR;
//wire [7:0] LCD_INDEX
//output LCD_E, LCD_RS, LCD_RW, SF_CE0; 
always@(posedge CLK or posedge BTN_SOUTH)
	begin
	if(BTN_SOUTH ==1)
	begin
	sec_digits<=0;
	min_digits<=0;
	hrs_digits<=0;
	end
	else	
	begin
	sec_digits<=sec_digits+1;
	if(sec_digits==59)
	begin
	sec_digits<=0;
	min_digits<=min_digits+1;
	if(min_digits==59)
	begin
	min_digits<=0;
	hrs_digits<=hrs_digits+1;
	if(hrs_digits==23)
	begin
	hrs_digits<=0;
	end
		end
	end
	end
end
endmodule