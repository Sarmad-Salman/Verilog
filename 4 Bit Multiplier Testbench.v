module mul4_t ();
reg [3:0]A,B;
wire [7:0]Y;
mul4 m1 (Y,A,B);
initial
begin
#100 A=4'd5; B=4'd7;
end
endmodule