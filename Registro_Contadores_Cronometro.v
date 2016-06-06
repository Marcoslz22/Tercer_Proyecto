`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:57:40 06/02/2016 
// Design Name: 
// Module Name:    Registro_Contadores_Cronometro 
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
module Registro_Contadores_Cronometro(
    input clk,
    input [7:0] Segundos,
	 input [7:0] Minutos,
	 input [7:0] Horas,
	 input [7:0] Tecla, 
	 output reg [7:0] Segundos_R,
	 output reg [7:0] Minutos_R,
	 output reg [7:0] Horas_R
    );
	 
	 always @(posedge clk)
	    if ( Tecla == 8'h75)
		 begin
		    Segundos_R <= Segundos;
			 Minutos_R <= Minutos;
			 Horas_R <= Horas;
		 end 
		 else
		 begin
		    Segundos_R <= Segundos_R;
			 Minutos_R <= Minutos_R;
			 Horas_R <= Horas_R;
		 end 


endmodule
