`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:25:03 06/03/2016 
// Design Name: 
// Module Name:    Registro_Guardar 
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
module Registro_Guardar(
    input [7:0] Tecla,
	 input clk,
	 input reset,
	 output reg [7:0] Salida_Guardar
    );
	 
	 always @(posedge clk)
	    if (reset)
		    Salida_Guardar = 8'hFF;
		 else if (Tecla == 8'h70)
		         Salida_Guardar = Tecla;
		      else 
		         Salida_Guardar = Salida_Guardar;
		
endmodule
