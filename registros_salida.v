`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:29:09 05/22/2016 
// Design Name: 
// Module Name:    registros_salida 
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
module registros_salida( 
	input Write_Strobe,
	input [7:0] Out_Port,
	input [7:0] Port_ID ,
	input [2:0] rst , //de la maquina
	input clk,
	output reg [7:0] Dir,
	output reg [7:0] Dato,
	output reg contro_listo,
	output reg contro_lee,
	output reg contro_escribe
    );
	 
	 // asigancion de las posiciones del bus de entrada
	 wire rst_DIR, rst_DAT, rst_C_LI, rst_C_E, rst_C_LE;
	 
	 assign rst_C_LI=rst  [0];
	 assign rst_C_E= rst  [1];
	 assign rst_C_LE= rst [2];
	 
	 //logica del programa
	 always @(posedge clk)
		if (Write_Strobe)
			begin
				case (Port_ID)
					8'b00000001   : //control_listo 
						begin
							if (rst_C_LI)//me lo da la maquina
								contro_listo<=1'b0;
							else
								begin
									if (Out_Port==8'b00000001)
											contro_listo<=1'b1;
									else 
											contro_listo<=1'b0;
								end
						end
					8'b00000010   : 
						begin
							if (rst_C_E)//me lo da la maquina
								contro_escribe<=1'b0;
							else
								begin
									if (Out_Port==8'b00000001)
											contro_escribe<=1'b1;
									else 
											contro_escribe<=1'b0;
								end
						end
					8'b00000011   : 
						begin
							if (rst_C_LE)//me lo da la maquina
								contro_lee<=1'b0;
							else
								begin
									if (Out_Port==8'b00000001)
											contro_lee<=1'b1;
									else 
											contro_lee<=1'b0;
								end
						end
					8'b00000100   : Dir<=Out_Port; 
					
					8'b00000101   : Dato<=Out_Port; 

					default :
							begin
								
							end
				endcase
			end
		else
			case(rst)
				3'b001 : contro_listo<=  1'b0;
				3'b010 : contro_lee <=   1'b0;
				3'b011 : contro_escribe<=1'b0;
				default: 
					begin
						contro_listo<=  1'b1;
						contro_lee <=   1'b1;
						contro_escribe<=1'b1;
					end
			endcase

endmodule
