`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:06:29 04/09/2016 
// Design Name: 
// Module Name:    Buffer_Triestado_Salida 
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
module Buffer_Triestado_Salida(
    input [7:0] Deco_out,
    input en,
    output [7:0] RTC_in
    );
	 
	 assign RTC_in = en ? Deco_out : 8'bz; 
		 
endmodule
