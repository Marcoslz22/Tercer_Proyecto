`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:41:05 06/03/2016 
// Design Name: 
// Module Name:    Registro_Estado_Cronometro 
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
module Registro_Estado_Cronometro(
    input [7:0] Tecla,
	 input clk,
	 input reset,
	 output reg [7:0] Salida_Estado_Cronometro
    );
	 
	 always @(posedge clk)
	    if (reset)
		    Salida_Estado_Cronometro = 8'hFF;
		 else if (Tecla == 8'h75)
		         Salida_Estado_Cronometro = Tecla;
		      else 
		         Salida_Estado_Cronometro = Salida_Estado_Cronometro;
endmodule
