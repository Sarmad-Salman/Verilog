module counter (clk,rst,cnt_val,ovf);
parameter max =16;
input clk,rst;
output reg[max-1:0]cnt_val;
output reg ovf;
always @(posedge clk or posedge rst)
if(rst==1)
begin
cnt_val=0;
ovf=1'b0;
end

else if(rst==0)
if(cnt_val>=2**(max)-1)
begin  
ovf=1;
        cnt_val=0;
end

  else
begin
cnt_val=cnt_val+1;
ovf=0;
end
else
begin
cnt_val=cnt_val;
ovf=ovf;
end
endmodule