`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:59:16 05/22/2016 
// Design Name: 
// Module Name:    Deteccion_Tecla 
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
module Deteccion_Tecla(
    input clk,
	 input reset,
	 input ps2d,
	 input ps2c,
	 input reset_escritura,
	 input [7:0] Segundos_RTC,
	 input [7:0] Minutos_RTC,
	 input [7:0] Horas_RTC,
	 output [7:0] Senal,
	 output Senal_2_ren,
	 output [7:0] Parametro,
	 output [7:0] Salida_1,
	 output [7:0] Salida_2,
	 output [7:0] Salida_3,
	 output [7:0] VGA_1,
	 output [7:0] VGA_2,
	 output [7:0] VGA_3,
	 output Flag_VGA,
	 output [7:0] Flag_Pico,
	 output [7:0] Salida_G
    );
	 
	 wire rx_done_tick; 
	 wire [7:0] dout;
	 wire [7:0] Salida;
	 wire [1:0] Cuenta_ID;
	 wire [5:0] Cuenta_Segundos;
	 wire [5:0] Cuenta_Minutos;
	 wire [4:0] Cuenta_Horas;
	 wire [4:0] Cuenta_Year;
	 wire [3:0] Cuenta_Mes;
	 wire [6:0] Cuenta_Dia;
	 wire [7:0] Segundos_R;
	 wire [7:0] Minutos_R;
	 wire [7:0] Horas_R;
	 wire [7:0] Salida_Guardar;
	 wire [7:0] Salida_Estado_Cronometro;	 
	 wire reset_crono;
	 wire Salida_Reset;
	 
	 assign Parametro = Salida;
	 assign Salida_G = Salida_Guardar;
	
	 ps2_rx F1 (
    .clk(clk), 
    .reset(reset), 
    .ps2d(ps2d), 
    .ps2c(ps2c), 
    .rx_en(1'b1), 
    .rx_done_tick(rx_done_tick), 
    .dout(dout)
    );
	 
	 kb_code F2 (
    .clk(clk), 
    .reset(reset), 
    .scan_done_tick(rx_done_tick), 
    .scan_out(dout), 
    .got_code_tick(got_code_tick)
    );
	 
	 
	 Contador_ID F3 (
    .rst(reset), 
    .Cambio(dout), 
    .got_data(got_code_tick), 
    .clk(clk), 
    .Cuenta(Cuenta_ID)
    );
	 
	 Contador_AD_Segundos F4 (
	 .estado (Salida),
    .rst(reset), 
    .en(Cuenta_ID), 
    .Cambio(dout), 
    .got_data(got_code_tick), 
    .clk(clk), 
    .Cuenta(Cuenta_Segundos)
    ); 
	 
	 Contador_AD_Minutos F5 (
	 .estado (Salida),
    .rst(reset), 
    .en(Cuenta_ID), 
    .Cambio(dout), 
    .got_data(got_code_tick), 
    .clk(clk), 
    .Cuenta(Cuenta_Minutos)
    );
	 
	 Contador_AD_Horas F6 (
	 .estado (Salida),
    .rst(reset), 
    .en(Cuenta_ID), 
    .Cambio(dout), 
    .got_data(got_code_tick), 
    .clk(clk), 
    .Cuenta(Cuenta_Horas)
    );
	 
	 Contador_AD_Year F7(
	 .estado (Salida),
    .rst(reset), 
    .en(Cuenta_ID), 
    .Cambio(dout), 
    .got_data(got_code_tick), 
    .clk(clk), 
    .Cuenta(Cuenta_Year)
    );
	 
	 Contador_AD_Mes F8(
	 .estado (Salida),
    .rst(reset), 
    .en(Cuenta_ID), 
    .Cambio(dout), 
    .got_data(got_code_tick), 
    .clk(clk), 
    .Cuenta(Cuenta_Mes)
    );
	 
	 Contador_AD_Dia F9 (
	 .estado (Salida),
    .rst(reset), 
    .en(Cuenta_ID), 
    .Cambio(dout), 
    .got_data(got_code_tick), 
    .clk(clk), 
    .Cuenta(Cuenta_Dia)
    );
	 
	 Registro F10 (
    .clk(clk), 
    .reset(reset), 
    .en(got_code_tick), 
    .codigo(dout), 
    .Salida(Salida)
    );
	 
	 MUX F11 (
    .clk(clk), 
    .Estado(Salida), 
    .Cuenta_Segundos(Cuenta_Segundos), 
    .Cuenta_Minutos(Cuenta_Minutos), 
    .Cuenta_Horas(Cuenta_Horas), 
    .Cuenta_Year(Cuenta_Year), 
    .Cuenta_Mes(Cuenta_Mes), 
    .Cuenta_Dia(Cuenta_Dia), 
    .Salida_1(Salida_1), 
    .Salida_2(Salida_2), 
    .Salida_3(Salida_3)
    );
	 
	 Senal_Escritura F12 (
    .Tecla(dout), 
	 .got_data (got_code_tick),
	 .reset_escritura (reset_escritura),
    .clk(clk), 
    .Senal(Senal)
    );
	 
	 Control_de_modo F13 (
    .Tecla(dout), 
    .reset_escritura(Senal), 
    .clk(clk), 
    .got_data(got_code_tick), 
    .Senal(Senal_2_ren)
    );
	 
    Decodificador_VGA F14 (
    .clk(clk), 
    .Contador_1(Salida_1), 
    .Contador_2(Salida_2), 
    .Contador_3(Salida_3), 
    .VGA_1(VGA_1), 
    .VGA_2(VGA_2), 
    .VGA_3(VGA_3)
    );
	 
	 
	 Registro_Contadores_Cronometro F15(
    .clk(clk), 
    .Segundos(VGA_1), 
    .Minutos(VGA_2), 
    .Horas(VGA_3), 
    .Tecla(Salida_Estado_Cronometro), 
    .Segundos_R(Segundos_R), 
    .Minutos_R(Minutos_R), 
    .Horas_R(Horas_R)
    );
	 

	 Registro_Guardar F16 (
    .Tecla(dout), 
    .clk(clk), 
    .reset(reset), 
    .Salida_Guardar(Salida_Guardar)
    );
	 
	 Registro_Estado_Cronometro F17 (
    .Tecla(dout), 
    .clk(clk), 
    .reset(Salida_Reset), 
    .Salida_Estado_Cronometro(Salida_Estado_Cronometro)
    );
	 
	 Banderas_Alarma F18 (
    .Segundos(Segundos_R), 
    .Minutos(Minutos_R), 
    .Horas(Horas_R), 
    .Segundos_RTC(Segundos_RTC), 
    .Minutos_RTC(Minutos_RTC), 
    .Horas_RTC(Horas_RTC), 
    .Estado(Salida_Estado_Cronometro), 
    .Guardar(Salida_Guardar), 
    .clk(clk), 
    .reset(reset), 
    .Flag_Pico(Flag_Pico)
    );
	


endmodule
