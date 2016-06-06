`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    04:12:35 06/03/2016 
// Design Name: 
// Module Name:    Banderas_Alarma 
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
module Banderas_Alarma(
    input [7:0] Segundos,
	 input [7:0] Minutos,
	 input [7:0] Horas,
    input [7:0] Segundos_RTC,
	 input [7:0] Minutos_RTC,
	 input [7:0] Horas_RTC,
	 input [7:0] Estado,
	 input [7:0] Guardar,
	 input clk,
	 input reset,
	 output reg [7:0] Flag_Pico,
	 output reg Flag_VGA
    );
	 
	 always @(posedge clk)
	    if (reset)
			begin
				Flag_Pico <= 8'd0;
				Flag_VGA <= 0;
			end 
		 else 
			 if ((Guardar == 8'h70)&&(Estado == 8'h75))
					begin
						if ((Segundos_RTC == Segundos )&& (Minutos_RTC == Minutos) && (Horas_RTC == Horas ) && (Segundos_RTC != 8'h00) && (Minutos_RTC != 8'h00) && (Minutos_RTC != 8'h00))
							begin
								Flag_Pico <= 8'd1;
								Flag_VGA <= 1;
							end
						else 
						begin
							Flag_Pico <= Flag_Pico;
			   		   Flag_VGA <= Flag_VGA;
						end 
					end
			else 
				begin
					Flag_Pico <= 8'd0;
					Flag_VGA <= 0;
				end
endmodule