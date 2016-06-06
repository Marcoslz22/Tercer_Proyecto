`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:47:43 06/03/2016 
// Design Name: 
// Module Name:    Registro_Reset_Alarma 
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
module Registro_Reset_Alarma(
    input [7:0] Tecla ,
	 input clk,
	 input got_data,
	 output reg Salida_Reset
    );
	 
	 always @(posedge clk)
	    if (Tecla == 8'h79 && got_data)
		    Salida_Reset = 1;
       else 
		    Salida_Reset = 0;
          		 

endmodule
