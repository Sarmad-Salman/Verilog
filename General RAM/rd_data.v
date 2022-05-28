task rd_data;
integer j, rd_ptr;
begin
rd_ptr = $fopen ("output_files/data_rd.txt");
for (j=0; j<=(2**26)-1; j=j+1) begin
@(posedge clk) begin
addr_r=j;
#1 $fdisplay (rd_ptr, "%b", dout_ram);
end
end
$fclose (rd_ptr);
end
endtask