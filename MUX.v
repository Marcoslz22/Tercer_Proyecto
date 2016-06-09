`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:06:55 06/01/2016 
// Design Name: 
// Module Name:    MUX 
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
module MUX(
    input clk,
	 input [7:0] Estado,
	 input [5:0] Cuenta_Segundos, 
	 input [5:0] Cuenta_Minutos, 
	 input [4:0] Cuenta_Horas, 
	 input [4:0] Cuenta_Year, 
	 input [3:0] Cuenta_Mes, 
	 input [6:0] Cuenta_Dia, 
	 output reg [7:0] Salida_1,
	 output reg [7:0] Salida_2, 
	 output reg [7:0] Salida_3 
    );
	 
	 always @(posedge clk)
       if (Estado == 8'h6C || Estado == 8'h75)
		 begin
          Salida_1 <= Cuenta_Segundos;
			 Salida_2 <= Cuenta_Minutos;
			 Salida_3 <= Cuenta_Horas;
		 end
       else 
		 begin
          Salida_1 <= Cuenta_Year;
			 Salida_2 <= Cuenta_Mes;
			 Salida_3 <= Cuenta_Dia;
		 end 
		 
endmodule
