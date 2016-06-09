`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:34:42 06/01/2016 
// Design Name: 
// Module Name:    Control_de_modo 
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
module Control_de_modo(
    input [7:0] Tecla,
	 input [7:0] reset_escritura,
	 input clk,
	 input got_data,
	 output reg Senal
    );
	 
	 always @(posedge clk)
	   if (reset_escritura == 8'd1)
		   Senal = 0;
	   else if ((Tecla == 8'h6C || Tecla == 8'h75 || Tecla == 8'h7D) && got_data)
		        Senal = 1;
		     else
		        Senal = Senal;
			
endmodule
