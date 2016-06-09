`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:03:46 05/24/2016 
// Design Name: 
// Module Name:    MUX_SALIDA 
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
module MUX_SALIDA(

input [7:0] direccion,
input [7:0] dato,
input seleccion,
output [7:0] salida_bus

    );

   assign salida_bus = seleccion ? dato : direccion;

endmodule
