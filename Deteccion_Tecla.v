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
	 output Senal,
	 output [3:0] anodo,
	 output [7:0] catodo,
	 output [7:0] Parametro,
	 output [6:0] Salida_1,
	 output [5:0] Salida_2,
	 output [4:0] Salida_3
    );
	 
	 wire rx_done_tick;
	 wire [7:0] dout;
	 wire [7:0] Salida;
	 wire [7:0] catodo1;
	 wire [7:0] catodo2;
	 wire [7:0] catodo3;
	 wire [7:0] catodo4;
	 wire [1:0] Cuenta_ID;
	 wire [5:0] Cuenta_Segundos;
	 wire [5:0] Cuenta_Minutos;
	 wire [4:0] Cuenta_Horas;
	 wire [6:0] Cuenta_Year;
	 wire [3:0] Cuenta_Mes;
	 wire [4:0] Cuenta_Dia;
	 wire [7:0] Salida_E;
	 
	 assign Parametro = Salida;
	
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
	 
	 
	 Decodificador F3 (
    .Cuenta(Salida_1), 
    .catodo1(catodo1), 
	 .catodo2(catodo2), 
    .catodo3(catodo3), 
    .catodo4(catodo4)
    );
	 
	 Control F4 (
    .clk(clk), 
    .rst(reset), 
    .in3(catodo4), 
    .in2(catodo3), 
    .in1(catodo2), 
    .in0(catodo1), 
    .anodo(anodo), 
    .catodo(catodo)
    );
	 
	 Contador_ID F5 (
    .rst(reset), 
    .Cambio(dout), 
    .got_data(got_code_tick), 
    .clk(clk), 
    .Cuenta(Cuenta_ID)
    );
	 
	 Contador_AD_Segundos F6 (
	 .estado (Salida),
    .rst(reset), 
    .en(Cuenta_ID), 
    .Cambio(dout), 
    .got_data(got_code_tick), 
    .clk(clk), 
    .Cuenta(Cuenta_Segundos)
    ); 
	 
	 Contador_AD_Minutos F7 (
	 .estado (Salida),
    .rst(reset), 
    .en(Cuenta_ID), 
    .Cambio(dout), 
    .got_data(got_code_tick), 
    .clk(clk), 
    .Cuenta(Cuenta_Minutos)
    );
	 
	 Contador_AD_Horas F8 (
	 .estado (Salida),
    .rst(reset), 
    .en(Cuenta_ID), 
    .Cambio(dout), 
    .got_data(got_code_tick), 
    .clk(clk), 
    .Cuenta(Cuenta_Horas)
    );
	 
	 Contador_AD_Year F9(
	 .estado (Salida),
    .rst(reset), 
    .en(Cuenta_ID), 
    .Cambio(dout), 
    .got_data(got_code_tick), 
    .clk(clk), 
    .Cuenta(Cuenta_Year)
    );
	 
	 Contador_AD_Mes F10(
	 .estado (Salida),
    .rst(reset), 
    .en(Cuenta_ID), 
    .Cambio(dout), 
    .got_data(got_code_tick), 
    .clk(clk), 
    .Cuenta(Cuenta_Mes)
    );
	 
	 Contador_AD_Dia F11 (
	 .estado (Salida),
    .rst(reset), 
    .en(Cuenta_ID), 
    .Cambio(dout), 
    .got_data(got_code_tick), 
    .clk(clk), 
    .Cuenta(Cuenta_Dia)
    );
	 
	 Registro F12 (
    .clk(clk), 
    .reset(reset), 
    .en(got_code_tick), 
    .codigo(dout), 
    .Salida(Salida)
    );
	 
	 MUX F13 (
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
	 
	 
	 Senal_Escritura F14 (
    .Tecla(dout), 
	 .got_data (got_code_tick),
	 .reset_escritura (reset_escritura),
    .clk(clk), 
    .Senal(Senal)
    );







endmodule
