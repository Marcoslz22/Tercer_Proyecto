`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:13:24 06/01/2016 
// Design Name: 
// Module Name:    Senal_Escritura 
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
module Senal_Escritura(
    input [7:0] Tecla,
	 input reset_escritura,
	 input clk,
	 input got_data,
	 output reg Senal
    );
	 
	 always @(posedge clk)
	   if (reset_escritura)
		   Senal = 0;
	   else if (Tecla == 8'h70 && got_data)
		        Senal = 1;
		     else
		        Senal = Senal;
			
endmodule
