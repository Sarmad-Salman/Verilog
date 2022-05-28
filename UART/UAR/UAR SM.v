module uar_sm( clk_16x, rst_p, din_rdy, shift_count, count_sample,
	       start_bit_sig, data_bits_sig, stop_bit_sig );

input clk_16x, rst_p, din_rdy;
input [3:0] shift_count, count_sample;

output reg start_bit_sig, data_bits_sig, stop_bit_sig;

parameter [3:0] IDLE = 4'b0001;
parameter [3:0] START_BIT_ST = 4'b0010;
parameter [3:0] DATA_BITS_ST = 4'b0100;
parameter [3:0] STOP_BIT_ST = 4'b1000;

reg [3:0] rx_state;

// State Register, Next State & Output Logic
always @(posedge clk_16x or posedge rst_p)
begin
	if(rst_p)
		rx_state <= IDLE;
	else
	begin
		case(rx_state)
		IDLE: begin
			if(din_rdy)
				rx_state <= START_BIT_ST;
			else
				rx_state <= IDLE;
		end
		START_BIT_ST: begin
			if(shift_count == 4'd1)
				rx_state <= DATA_BITS_ST;
			else
				rx_state <= START_BIT_ST;
		end
		DATA_BITS_ST: begin
			if(shift_count == 4'd9)
				rx_state <= STOP_BIT_ST;
			else
				rx_state <= DATA_BITS_ST;
		end
		STOP_BIT_ST: begin
			if(count_sample == 4'd9)
				rx_state <= IDLE;
			else
				rx_state <= STOP_BIT_ST;
		end
		default: begin
			rx_state <= IDLE;
		end
		endcase
	end
end

always @(rx_state)
begin
	case(rx_state)
	IDLE: begin
		start_bit_sig = 1'b0;
		data_bits_sig = 1'b0;
		stop_bit_sig = 1'b0;
	end
	START_BIT_ST: begin
		start_bit_sig = 1'b1;
		data_bits_sig = 1'b0;
		stop_bit_sig = 1'b0;
	end
	DATA_BITS_ST: begin
		start_bit_sig = 1'b0;
		data_bits_sig = 1'b1;
		stop_bit_sig = 1'b0;
	end
	STOP_BIT_ST: begin
		start_bit_sig = 1'b0;
		data_bits_sig = 1'b0;
		stop_bit_sig = 1'b1;
	end
	default: begin
		start_bit_sig = 1'b0;
		data_bits_sig = 1'b0;
		stop_bit_sig = 1'b0;
	end
	endcase
end

endmodule
