//______________________________________________
//__________Parity Check Testbench______________
//______________________________________________
module parity_test();
reg even_odd; wire par_out;
reg [7:0] data_in;	//Port Declarations
parity inst1(data_in, even_odd, par_out);
//       Instance calling
initial begin
even_odd = 0; data_in = 8'b10101010;
//Initializing the inputs
#10 even_odd = 1;  //Checking for both parities
end endmodule 