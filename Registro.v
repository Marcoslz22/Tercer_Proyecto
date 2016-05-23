`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:40:57 05/22/2016 
// Design Name: 
// Module Name:    Registro 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Registro(
    input clk,
	 input reset,
	 input en,
	 input [7:0]codigo,
	 output reg [7:0] Salida
    );
	 
	 always @ (posedge clk, posedge reset)
	 begin
	    if (reset)
		    Salida = 8'd0;
		 else if (en)
		         Salida = codigo;
				else 
				   Salida = Salida;			 
	 end 
	 


endmodule
