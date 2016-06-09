`timescale 1ns / 1ps

module clk_div(clk ,out_clk);
output reg out_clk;
input clk ;


always @(posedge clk)

	begin
      out_clk <= ~out_clk;	
	end
	
endmodule
 
