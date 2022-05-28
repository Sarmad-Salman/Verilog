module uat_top(clk_x, rst_p, din_rdy, din_byte, ser_out);

input clk_x ;
input rst_p ;		//1-bit Asyncronous Active Low Reset input
input din_rdy ;		//1-bit ready input signal that indicates the data is ready at input for Tx
input [7:0] din_byte ;	//8-bit data input in UART for Tx

output reg ser_out ;	//1-bit Tx data output from UART

reg din_rdy_reg;	// 1-bit serial data from channel
reg [2:0] shift_count;
reg [7:0] data_buf;

wire start_bit_sig, data_bits_sig, stop_bit_sig;	// Bit Insertion Control Signal Generated from State Machine

// Registered Data Ready Signal
always @(posedge clk_x or posedge rst_p)
begin
	if(rst_p)
		din_rdy_reg <= 1'b0;
	else
		din_rdy_reg <= din_rdy ;
end

//Output Logic
//always @(posedge clk_x or posedge rst_p)
always @(negedge clk_x or posedge rst_p)
begin
	if(rst_p)
		ser_out <= 1'b1;
	else
	begin
		case({start_bit_sig,data_bits_sig,stop_bit_sig})
		3'b100:
			ser_out <= 1'b0;
		3'b010:
			ser_out <= data_buf[0];
		3'b001:
			ser_out <= 1'b1;
		default:
			ser_out <= 1'b1;
		endcase
	end
end

//Start Bit Pipelining
always @(posedge clk_x or posedge rst_p)
begin
	if(rst_p)
		data_buf <= 8'd0;
	else if(start_bit_sig)
		data_buf <= din_byte; // at just arriving the start_bit_sig , we load data into data_buffer
	else if(data_bits_sig)
		data_buf <= {1'b1,data_buf[7:1]};
	else
		data_buf <= data_buf;
end

// Counter that Count Shift in Data Buffer Logic
always @(posedge clk_x or posedge rst_p)
begin
	if(rst_p)
		shift_count <= 3'd0;
	else if(data_bits_sig)
		shift_count <= shift_count + 1; //Counter will start when "data_bits_sig" flag is High
	else
		shift_count <= 3'd0;
end

// State Machine for Tx
uat_sm uat_sm_inst( .clk_x(clk_x), .rst_p(rst_p), .din_rdy(din_rdy_reg), .shift_count(shift_count),
		    .start_bit_sig(start_bit_sig), .data_bits_sig(data_bits_sig), .stop_bit_sig(stop_bit_sig) );

endmodule
