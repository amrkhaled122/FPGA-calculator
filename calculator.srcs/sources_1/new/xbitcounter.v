`timescale 1ns / 1ps




module bin_counter_xbits #(parameter x = 4, n = 12)
(input clk, reset,enable, output reg [x-1:0]count);

always @(posedge clk, posedge reset) begin
 if (reset == 1 || count == n-1)
 count <= 0;
 else if ( enable == 0 )
 count <= count ;
 
 else
 count <= count + 1; // non-blocking assignment
// normal operation
end
endmodule