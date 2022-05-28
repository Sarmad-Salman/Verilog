module uar_top(clk_16x, rst_p, ser_in, dout_rdy, dout_byte);

input clk_16x, rst_p, ser_in;

output dout_rdy;
output [7:0] dout_byte;

reg ser_in_r1, ser_in_r2, dout_rdy_temp, dout_rdy, dout_rdy_d;
reg [3:0] count_sample, shift_count;
reg [4:0] count_rdy_sig;
reg [7:0] dout_byte_temp, dout_byte;

wire start_bit_sig, data_bits_sig, stop_bit_sig, valid_data;

// Detect Input Data
always @(posedge clk_16x or posedge rst_p)
begin
	if(rst_p)
	begin
		ser_in_r1 <= 1'b1;
		ser_in_r2 <= 1'b1;
	end
	else
	begin
		ser_in_r1 <= ser_in;
		ser_in_r2 <= ser_in_r1;
	end
end

assign valid_data = (~ser_in_r1 & ser_in_r2);

// Output Logic
always @(posedge clk_16x or posedge rst_p)
begin
	if(rst_p)
		count_sample <= 4'd0;
	else if(start_bit_sig | data_bits_sig | stop_bit_sig )
		count_sample <= count_sample + 1;
	else
		count_sample <= 4'd0;
end

// Counter that count shift in Data Buffer Logic
always @(posedge clk_16x or posedge rst_p)
begin
	if(rst_p)
		shift_count <= 4'd0;
	else if(count_sample == 4'd9 && shift_count == 4'd9)
		shift_count <= 4'd0;
	else if(count_sample == 4'd9 && (start_bit_sig | data_bits_sig | stop_bit_sig))
		shift_count <= shift_count + 1;
	else
		shift_count <= shift_count;
end

// Output Logic
always @(posedge clk_16x or posedge rst_p)
begin
	if(rst_p)
	begin
		dout_byte_temp <= 8'd0;
		dout_rdy_temp <= 1'b0;
	end
	else
	begin
		case({stop_bit_sig, data_bits_sig, start_bit_sig})
		3'b001: begin // Data Bits Extract
			dout_byte_temp <= dout_byte_temp;
			dout_rdy_temp <= 1'b0;
		end
		3'b010: begin // Data Bits Extract
			if(count_sample == 4'd7)
				dout_byte_temp <= {ser_in_r2, dout_byte_temp[7:1]};
			dout_rdy_temp <= 1'b0;
		end
		3'b100: begin // Data Bits Extract
			if(count_sample == 4'd7 && ser_in_r2 == 1'b1)
				dout_rdy_temp <= 1'b1;
			else
				dout_rdy_temp <= 1'b0;
			dout_byte_temp <= dout_byte_temp;
		end
		default: begin // Retain previous status
			dout_byte_temp <= dout_byte_temp;
			dout_rdy_temp <= 1'b0;
		end
		endcase
	end
end

// Latch Decode Data
always @(posedge clk_16x or posedge rst_p)
begin
	if(rst_p)
		dout_byte <= 8'd0;
	else if(dout_rdy_temp)
		dout_byte <= dout_byte_temp;
	else
		dout_byte <= dout_byte;
end

always @(posedge clk_16x or posedge rst_p)
begin
	if(rst_p)
	begin
		count_rdy_sig <= 5'd0;
		dout_rdy_d <= 1'b0;
	end
	else if(dout_rdy_temp)
	begin
		count_rdy_sig <= 5'd1;
		dout_rdy_d <= 1'b1;
	end
	else if(count_rdy_sig != 5'd0 && count_rdy_sig != 5'd16)
	begin
		count_rdy_sig <= count_rdy_sig + 1;
		dout_rdy_d <= 1'b1;
	end
	else
	begin
		count_rdy_sig <= 5'd0;
		dout_rdy_d <= 1'b0;
	end
end

// Delay Data Ready Signal
always @(posedge clk_16x or posedge rst_p)
begin
	if(rst_p)
		dout_rdy <= 1'b0;
	else
		dout_rdy <= dout_rdy_d;
end


uar_sm uar_sm_inst( .clk_16x(clk_16x), .rst_p(rst_p), .din_rdy(valid_data), .shift_count(shift_count), .count_sample(count_sample),
		    .start_bit_sig(start_bit_sig), .data_bits_sig(data_bits_sig), .stop_bit_sig(stop_bit_sig) );

endmodule
