`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:12:38 06/05/2016 
// Design Name: 
// Module Name:    Prueba_Alarma 
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
module Prueba_Alarma(
    input clk,
	 input got_data,
	 input [7:0] Tecla,
	 input [7:0] Segundos,
	 input [7:0] Minutos,
	 input [7:0] Horas,
	 input [7:0] Segundos_RTC,
	 input [7:0] Minutos_RTC,
	 input [7:0] Horas_RTC,
	 output [7:0] Flag_Pico,
	 output Flag_VGA
    );
	 
	 wire Salida_Reset;
	 wire [7:0] Salida_Estado_Cronometro;
	 wire [7:0] Salida_Guardar;
	 wire [7:0] Segundos_R;
	 wire [7:0] Minutos_R;
	 wire [7:0] Horas_R;
	 
	 Registro_Estado_Cronometro F1 (
    .Tecla(Tecla), 
    .clk(clk), 
    .reset(Salida_Reset), 
    .Salida_Estado_Cronometro(Salida_Estado_Cronometro)
    );
	 
	 Registro_Guardar F2 (
    .Tecla(Tecla), 
    .clk(clk), 
    .reset(Salida_Reset), 
    .Salida_Guardar(Salida_Guardar)
    );
	 
	 Registro_Reset_Alarma F3 (
    .Tecla(Tecla), 
    .clk(clk), 
    .got_data(got_data), 
    .Salida_Reset(Salida_Reset)
    );
	 
	 Registro_Contadores_Cronometro F4 (
    .clk(clk), 
    .Segundos(Segundos), 
    .Minutos(Minutos), 
    .Horas(Horas), 
    .Tecla(Salida_Estado_Cronometro), 
    .Segundos_R(Segundos_R), 
    .Minutos_R(Minutos_R), 
    .Horas_R(Horas_R)
    );
	 
	 Banderas_Alarma F5 (
    .Segundos(Segundos_R), 
    .Minutos(Minutos_R), 
    .Horas(Horas_R), 
    .Segundos_RTC(Segundos_RTC), 
    .Minutos_RTC(Minutos_RTC), 
    .Horas_RTC(Horas_RTC), 
    .Estado(Salida_Estado_Cronometro), 
    .Guardar(Salida_Guardar), 
    .clk(clk), 
    .reset(Salida_Reset), 
    .Flag_Pico(Flag_Pico), 
    .Flag_VGA(Flag_VGA)
    );
	
endmodule
