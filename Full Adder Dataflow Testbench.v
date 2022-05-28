module fad_t();
reg [1:0]a,b;
reg ci;
wire [1:0]s;
wire c;
fad fa1(s,c,a,b,ci);
initial
begin
#100 a=2'd0; b=2'd0; ci =0;
#100 a=2'd0; b=2'd1; ci =0;
#100 a=2'd1; b=2'd0; ci =0;
#100 a=2'd1; b=2'd1; ci =0;
#100 a=2'd0; b=2'd0; ci =1;
#100 a=2'd0; b=2'd1; ci =1;
#100 a=2'd1; b=2'd0; ci =1;
#100 a=2'd1; b=2'd2; ci =1;
end
endmodule