`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:16:18 05/22/2016 
// Design Name: 
// Module Name:    MUX_DECO_FF 
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
///////
module MUX_DECO_FF( 
input  rst,
input  clk,
input  listo,
input  listo_lee,
input  listo_escribe,
input  [7:0]seleccion,
input  [7:0]tecla,
input  [7:0]tecla2,
input  [7:0] tecla3,
input  [7:0]RG1,
input  [7:0]RG2,
input  [7:0]RG3,
output [7:0]salida_picoblaze

    );
	 
wire [7:0]salida_mux_deco;

MUX_DECO MUX_DECO (
    .seleccion(seleccion), 
    .listo(listo), 
    .listo_lee(listo_lee), 
    .listo_escribe(listo_escribe), 
    .salida_mux_deco(salida_mux_deco),
	 .tecla(tecla),
	 .tecla2(tecla2),
	 .tecla3(tecla3),
	 .RG1(RG1),
	 .RG2(RG2),
	 .RG3(RG3)
    );
	 
FFD FFD (
    .rst(rst), 
    .clk(clk), 
    .dato_mux(salida_mux_deco), 
    .salida_picoblaze(salida_picoblaze)
    );

endmodule
