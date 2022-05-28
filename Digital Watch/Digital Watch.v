module digclk(clk_1Hz, reset, sec, min, hrs, but2, but3, but4);
input clk_1Hz, reset, but2, but3, but4;
output reg [5:0] sec, min;
output reg [4:0] hrs;
always@(posedge clk_1Hz or posedge reset)
begin	if(reset ==1)
	begin
	sec<=0;
	min<=0;
	hrs<=0;
	end
	else if(but2 == 1) begin
		if(but3 == 1) begin
			min<=min+1;
			if(min == 59) begin
				min<=0; hrs <=hrs+1; end 
			end
		if(but4 == 1) begin
			hrs<=hrs+1;
			if(hrs == 23) 
				hrs<=0;
				end
			end
	else	begin
		sec<=sec+1;
	if(sec==59)	begin
		sec<=0;
		min<=min+1;
	if(min==59)	begin
		min<=0;
		hrs<=hrs+1;
	if(hrs==23)	begin
		hrs<=0;
			end
		end
	end
	end
end
endmodule 
