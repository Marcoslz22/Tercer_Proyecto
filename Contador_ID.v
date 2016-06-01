`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:37:34 05/31/2016 
// Design Name: 
// Module Name:    Contador_ID 
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
module Contador_ID(
    input rst,
    input [7:0] Cambio,
	 input got_data,
    input clk,
    output reg [(N-1):0] Cuenta
    );
	
	 
	 parameter N = 2;
	 parameter X = 2;

    always @(posedge clk)
       if (rst)
         Cuenta <= 0;
       else if (Cambio == 8'h7A && got_data)
				  begin
				     if (Cuenta == X)
						   Cuenta <= 0;
					  else 
						   Cuenta <= Cuenta + 1'd1;
				  end
				else if (Cambio == 8'h69 && got_data)
					  begin
				        if (Cuenta == 0)
						     Cuenta <= X;
					     else 
						     Cuenta <= Cuenta - 1'd1;
				     end
					  else 
					     Cuenta <= Cuenta;
endmodule
