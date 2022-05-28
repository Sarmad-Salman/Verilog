module uart_top(CLK, BTN_SOUTH, BTN_WEST, RS232_DCE_RXD, dout_rdy, dout_byte,
		d_rdy, d_byte, RS232_DCE_TXD, clk_x);

parameter SIZE = 11;
parameter MAX = 1302;

input CLK, dout_rdy;
input BTN_SOUTH;	// Active Low Reset
input BTN_WEST;		// Din Ready
input RS232_DCE_RXD;	// Receiver Pin
input [7:0] dout_byte;

output d_rdy;		// 1-bit ready input signal that indicates the data is ready at input for Tx
output clk_x;
output RS232_DCE_TXD;	// Monitoring Signal: 1-bit Tx data output from UART
output [7:0] d_byte;

reg clk_16x, d_rdy, drdy;
reg [3:0] count_div;
reg [7:0] d_byte;
reg [7:0] databyte;	//8-bit data input in UART for Tx
reg [SIZE-1:0] count_div_19200;

wire dout_rdy_wire, clk_x;
wire [7:0] dout_byte_wire;

//	---------------- CLOCK DIVIDER BLOCK for Baud Rate ----------------

always @(posedge CLK or posedge BTN_SOUTH)
begin
	if(BTN_SOUTH)
	begin
		count_div_19200 <= 0;
		clk_16x <= 1'b0;
	end

	else if(count_div_19200 == MAX-1) 
	begin
		count_div_19200 <= 0;
		clk_16x <= ~clk_16x;
	end

	else
	begin
		count_div_19200 <= count_div_19200 + 1;
		clk_16x <= clk_16x;
	end
end

// clk_16x = 19200 Hz
always @(posedge clk_16x or posedge BTN_SOUTH)
begin
	if(BTN_SOUTH)
		count_div <= 4'd0;
	else
		count_div <= count_div + 1;
end

// clk_x = 1200 Hz
assign clk_x = count_div[3];

always @(posedge CLK or posedge BTN_SOUTH)
begin
	if(BTN_SOUTH)
	begin
		d_rdy <= 1'b0;
		d_byte <= 8'd0;
	end

	else if(BTN_WEST)
	begin
		d_rdy <= dout_rdy;
		d_byte <= dout_byte;
	end

	else
	begin
		d_rdy <= dout_rdy_wire;
		d_byte <= dout_byte_wire;
	end
end

always @(posedge CLK or posedge BTN_SOUTH)
begin
	if(BTN_SOUTH)
	begin
		drdy <= 1'b0;
		databyte <= 8'd0;
	end

	else
	begin
		drdy <= d_rdy;
		databyte <= d_byte;
	end
end

// Transmitter
uat_top uat_top_inst( .clk_x(clk_x), .rst_p(BTN_SOUTH), .din_rdy(drdy), .din_byte(databyte), 
		      .ser_out(RS232_DCE_TXD) );

// Reciever
uar_top uar_top_inst( .clk_16x(clk_16x), .rst_p(BTN_SOUTH), .ser_in(RS232_DCE_RXD),
		      .dout_rdy(dout_rdy_wire), .dout_byte(dout_byte_wire) );

endmodule
