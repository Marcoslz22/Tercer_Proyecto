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
	 output [3:0] anodo,
	 output [7:0] catodo
    );
	 
	 wire rx_done_tick;
	 wire [7:0] dout;
	 wire [7:0] Salida;
	 wire [7:0] catodo1;
	 wire [7:0] catodo2;
	 wire [7:0] catodo3;
	 wire [7:0] catodo4;
	 wire [5:0] cuenta;
	
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
    .Cuenta(cuenta), 
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
	 
	 Contador_AD F5 (
    .rst(reset), 
    .Cambio(dout), 
    .got_data(got_code_tick), 
    .clk(clk), 
    .Cuenta(cuenta)
    );
	 


endmodule
