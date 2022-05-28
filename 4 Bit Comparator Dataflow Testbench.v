module comp4bd_t ();
reg  [3:0]A,B;
wire l,g,e;
comp4bd c1 (l,g,e,A,B);
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
end
endmodule