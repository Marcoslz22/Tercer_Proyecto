`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:35:53 05/31/2016 
// Design Name: 
// Module Name:    Contador_AD_Mes 
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
module Contador_AD_Mes(
    input rst,
	 input [7:0]estado,
	 input [1:0] en,
    input [7:0] Cambio,
	 input got_data,
    input clk,
    output reg [(N-1):0] Cuenta
    );
	
	 
	 parameter N = 4;
	 parameter X = 12;

    always @(posedge clk)
	 if (rst)
	    Cuenta <= 1;
    else	if (en == 2'd1 && estado == 8'h7D)
         begin
	         if (Cambio == 8'h73 && got_data)
				begin
				   if (Cuenta == X)
				      Cuenta <= 1;
					else 
				      Cuenta <= Cuenta + 1'd1;
				end
				else if (Cambio == 8'h72 && got_data)
					  begin
				        if (Cuenta == 1)
						     Cuenta <= X;
					     else 
						     Cuenta <= Cuenta - 1'd1;
				     end
					  else 
					     Cuenta <= Cuenta;
	      end
	      else 
			   Cuenta <= Cuenta;
endmodule
