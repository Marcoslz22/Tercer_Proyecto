`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:36:33 04/17/2016 
// Design Name: 
// Module Name:    control_digitos_2 
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
module control_digitos_2
	(
	input  [7:0] estado,
	input  [3:0]RG1_Unit,
   input  [3:0]RG2_Unit,
   input  [3:0]RG3_Unit,
	input escribiendo,
	input en_out,
	input wire clk,
	input wire [3:0] dig1_Unit,
	input  [3:0] direccion,
	output reg [3:0] dig_Unit_Ho, dig_Unit_min, dig_Unit_seg, dig_Unit_mes, dig_Unit_dia, dig_Unit_an, dig_Unit_Ho_Ti, dig_Unit_min_Ti, dig_Unit_seg_Ti
	);
	
	always @(posedge clk)
	if (~escribiendo)
		if (en_out)
			case (direccion)
				4'b0000://horas
							dig_Unit_Ho<=dig1_Unit;		
						
				4'b0001://minutos
							dig_Unit_min<=dig1_Unit;	

				4'b0010://segundos
							dig_Unit_seg<=dig1_Unit;		

				4'b0011://meses
							dig_Unit_mes<=dig1_Unit;		

				4'b0100://dias
							dig_Unit_dia<=dig1_Unit;	

				4'b0101://años
							dig_Unit_an<=dig1_Unit;	

				4'b0110://Horas timer
							dig_Unit_Ho_Ti<=dig1_Unit;	
				4'b0111://minutos timer

						   dig_Unit_min_Ti<=dig1_Unit;					
				4'b1000: //segundos timer
				
						   dig_Unit_seg_Ti<=dig1_Unit;
				default:
							begin
								dig_Unit_Ho<=dig_Unit_Ho;	
								dig_Unit_min<=dig_Unit_min;
								dig_Unit_seg<=dig_Unit_seg;
								dig_Unit_mes<=dig_Unit_mes;
								dig_Unit_an<=dig_Unit_an;
								dig_Unit_dia<=dig_Unit_dia;
								dig_Unit_Ho_Ti<=dig_Unit_Ho_Ti;
								dig_Unit_min_Ti<=dig_Unit_min_Ti;
								dig_Unit_seg_Ti<=dig_Unit_seg_Ti;
							end
							
			endcase
		else
			begin
				dig_Unit_Ho<=dig_Unit_Ho;
				dig_Unit_min<=dig_Unit_min;
				dig_Unit_seg<=dig_Unit_seg;
				dig_Unit_mes<=dig_Unit_mes;
				dig_Unit_dia<=dig_Unit_dia;
				dig_Unit_an<=dig_Unit_an;
				dig_Unit_Ho_Ti<=dig_Unit_Ho_Ti;
				dig_Unit_min_Ti<=dig_Unit_min_Ti;
				dig_Unit_seg_Ti<=dig_Unit_seg_Ti;
			end
	else 
		case (estado)
			8'h7d:
					begin
						if (direccion==4'b0011)
							dig_Unit_mes<=RG2_Unit;
						else
						if (direccion==4'b0100)
							dig_Unit_dia<=RG1_Unit;
						else
						if (direccion==4'b0101)
							dig_Unit_an<=RG3_Unit;
						else
							begin
							dig_Unit_mes<=dig_Unit_mes;
							dig_Unit_dia<=dig_Unit_dia;
							dig_Unit_an<=dig_Unit_an;
							end
					end
			8'h6c:
					begin
						if (direccion==4'b0000)
							dig_Unit_Ho<=RG3_Unit;
						else
						if (direccion==4'b0001)
							dig_Unit_min<=RG2_Unit;
						else
						if (direccion==4'b0010)
							dig_Unit_seg<=RG1_Unit;
						else
							begin
							dig_Unit_Ho<=dig_Unit_Ho;
							dig_Unit_min<=dig_Unit_min;
							dig_Unit_seg<=dig_Unit_seg;
							end
					end
			8'h75:
					begin
						if (direccion==4'b0110)
							dig_Unit_Ho_Ti<=RG3_Unit;
						else
						if (direccion==4'b0111)
							dig_Unit_min_Ti<=RG2_Unit;
						else
						if (direccion==4'b1000)
							dig_Unit_seg_Ti<=RG1_Unit;
						else
							begin
							dig_Unit_Ho_Ti<=dig_Unit_Ho_Ti;
							dig_Unit_min_Ti<=dig_Unit_min_Ti;
							dig_Unit_seg_Ti<=dig_Unit_seg_Ti;
							end
					end
			default:
						begin
							dig_Unit_Ho<=dig_Unit_Ho;
							dig_Unit_min<=dig_Unit_min;
							dig_Unit_seg<=dig_Unit_seg;
							dig_Unit_mes<=dig_Unit_mes;
							dig_Unit_dia<=dig_Unit_dia;
							dig_Unit_an<=dig_Unit_an;
							dig_Unit_Ho_Ti<=dig_Unit_Ho_Ti;
							dig_Unit_min_Ti<=dig_Unit_min_Ti;
							dig_Unit_seg_Ti<=dig_Unit_seg_Ti;
						end
		endcase
	endmodule
