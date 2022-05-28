module comp4b_t ();
reg  [3:0]A,B;
wire l,g,e;
comp4b c1 (l,g,e,A,B);
initial 
begin 
#100 A=4'd1; B=4'd2;
#100 A=4'd1; B=4'd3;
#100 A=4'd1; B=4'd4;
#100 A=4'd1; B=4'd5;
#100 A=4'd1; B=4'd6;
#100 A=4'd5; B=4'd0;
#100 A=4'd5; B=4'd1;
#100 A=4'd5; B=4'd2;
#100 A=4'd5; B=4'd3;
#100 A=4'd5; B=4'd4;
#100 A=4'd1; B=4'd1;
#100 A=4'd2; B=4'd2;
#100 A=4'd3; B=4'd3;
#100 A=4'd4; B=4'd4;
#100 A=4'd5; B=4'd5;
#100 A=4'd8; B=4'd5;
#100 A=4'd4; B=4'd9;
#100 A=4'd2; B=4'd10;
#100 A=4'd1; B=4'd2;
end
endmodule