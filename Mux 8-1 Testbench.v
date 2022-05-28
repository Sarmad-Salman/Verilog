module mux81_t ();
reg [7:0]I;
reg [3:0]S;
wire Y;
mux81 m1 (Y,I,S);
initial
begin
#100 I=8'd7; S=3'd0;
#100 I=8'd7; S=3'd1;
#100 I=8'd7; S=3'd2;
#100 I=8'd7; S=3'd3;
#100 I=8'd7; S=3'd4;
end
endmodule