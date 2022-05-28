//___________________________________________________
//_________Parity Check Module_______________________
//___________________________________________________
module parity(data_in, even_odd, par_out);
input [7:0] data_in; input even_odd;
output par_out;		//Port Definitions
assign par_out = (even_odd) ? ^data_in:~^data_in;
//Using the conditional operator to differentiate
//between both polarity bit checks
endmodule 