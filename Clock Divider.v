module clkdiv(clk_out, rst, en, clk_in);
input clk_in, rst, en;
output clk_out;
reg clk_out = 1'b0;
reg [27:0] counter;

always@(posedge rst or posedge clk_in)
begin
    if (rst==1 || en==0)
        begin
            clk_out <= 0;
            counter <= 0;
        end
    else
        begin
            counter <= counter + 1;
            if ( counter == 25000000)
                begin
                    counter <= 0;
                    clk_out <= ~clk_out;
                end
        end
end
endmodule  