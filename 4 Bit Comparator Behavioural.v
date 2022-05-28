module comp4bb (l,g,e,A,B);
output l,g,e;
input  [3:0] A,B;
reg l,g,e;
always @ (*)
begin
	if (A<B)
		begin
		l=1;
		g=0;
		e=0;
		end
	else if (A>B)
		begin
		l=0;
		g=1;
		e=0;
		end
	else if (A==B)
		begin
		l=0;
		g=0;
		e=1;
		end
end
endmodule