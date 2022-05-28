module dec38_t ();
reg [2:0]I;
wire [7:0]Y;
dec38 d31 (Y,I);
initial
begin
#100 I=3'd0;
#100 I=3'd1;
#100 I=3'd2;
#100 I=3'd3;
#100 I=3'd4;
#100 I=3'd5;
#100 I=3'd6;
#100 I=3'd7;
end
endmodule