module uat_sm( clk_x, rst_p, din_rdy, shift_count, start_bit_sig, data_bits_sig, stop_bit_sig );

input clk_x, rst_p, din_rdy;
input [2:0] shift_count;

output reg start_bit_sig, data_bits_sig, stop_bit_sig;

parameter [3:0] IDLE = 4'b0001;
parameter [3:0] START_BIT_ST = 4'b0010;
parameter [3:0] DATA_BITS_ST = 4'b0100;
parameter [3:0] STOP_BIT_ST = 4'b1000;

reg [3:0] tx_state;

always @(posedge clk_x or posedge rst_p)
begin
	if(rst_p)
		tx_state <= 4'd0;
	else
	begin
		case(tx_state)

		IDLE: begin
			if(din_rdy)
				tx_state <= START_BIT_ST;
			else
				tx_state <= IDLE;
		end

		START_BIT_ST: begin
			tx_state <= DATA_BITS_ST;
		end

		DATA_BITS_ST: begin
			if(shift_count == 3'd7)
				tx_state <= STOP_BIT_ST;
			else
				tx_state <= DATA_BITS_ST;
		end

		STOP_BIT_ST: begin
			if(din_rdy)
				tx_state <= START_BIT_ST;
			else
				tx_state <= IDLE;
		end

		default: begin
			tx_state <= IDLE;
		end

		endcase
	end
end

always @(tx_state)
begin
	case(tx_state)

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
