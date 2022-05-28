module bcd7_t();
reg  [3:0]I;
wire [6:0]Y;
bcd7 b1 (I,Y);
initial
begin
#100 I=4'd0;
#100 I=4'd1;
#100 I=4'd2;
#100 I=4'd3;
#100 I=4'd4;
#100 I=4'd5;
#100 I=4'd6;
#100 I=4'd7;
#100 I=4'd8;
#100 I=4'd9;
end
endmodule