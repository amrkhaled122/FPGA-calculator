`timescale 1ns / 1ps



module SelectCounter #(parameter n = 4)
(input clk, rst, en, output [1:0]sel_out);
wire clk_out;
ClockDivider #(100000)DUT_33(clk, rst, clk_out);
bin_counter_xbits #(2,n) DUT_44(clk_out, rst,en,sel_out);

endmodule