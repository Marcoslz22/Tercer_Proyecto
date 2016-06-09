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
	input [7:0] Port_ID,
	input rst , //de la maquina
	input reset,
	input clk,
	output reg [7:0] Dir,
	output reg [7:0] Dato,
	output reg [3:0] direccion,
	output reg contro_listo,
	output reg contro_lee,
	output reg contro_escribe,
	output reg [2:0]bandera
    );

	 //logica del programa
	 always @(posedge clk )
	 if (reset)
		begin
			contro_listo<=1'b0;
			contro_escribe<=1'b0;
			contro_lee<=1'b0;
			Dir<=8'b00000000;
			Dato<=8'b00000000;
			direccion<=4'b0000;
			bandera<=3'b0;
			
		end
	else
	begin
		if (Write_Strobe)
			begin
				case (Port_ID)
					8'b00000001   : //control_listo 
						begin
							if (rst)//me lo da la maquina
								contro_listo<=1'b0;
							else
								begin
									if (Out_Port==8'b00000001) 
											begin
											contro_listo<=1'b1;
											contro_lee<=1'b0;
											contro_escribe<=1'b0;
											end
									else 
									begin
											contro_listo<=1'b0;
											contro_lee<=contro_lee;
											contro_escribe<=contro_escribe;
										end
								end
						end
					8'b00000010   : 
						begin
							if (rst)//me lo da la maquina
								contro_escribe<=1'b0;
							else
								begin
									if (Out_Port==8'b00000001)
										begin
											contro_escribe<=1'b1;
											contro_lee<=1'b0;
											contro_listo<=1'b0;
										end
									else 
									begin
											contro_escribe<=1'b0;
											contro_lee<=contro_lee;
											contro_listo<=contro_listo;
									end
								end
						end
					8'b00000011   : 
						begin
							if (rst)//me lo da la maquina
								contro_lee<=1'b0;
							else
								begin
									if (Out_Port==8'b00000001)
											begin
												contro_lee<=1'b1;
												contro_listo<=1'b0;
												contro_escribe<=1'b0;
											end
									else 
											begin
												contro_lee<=1'b0;
												contro_listo<=contro_listo;
												contro_escribe<=contro_escribe;
											end								end
						end
					8'b00000100   : Dato<=Out_Port; 
					
					8'b00000101   : begin
					
											Dir<=Out_Port; 
											
											if(Out_Port==8'hf1)
												bandera<=3'b1;
											else
												bandera<=3'b0;
											
										 end
					8'b00000110   : 
										begin
											case(Out_Port)
												8'b00000000: direccion<=4'b0000;
												8'b00000001: direccion<=4'b0001;
												8'b00000010: direccion<=4'b0010;
												8'b00000011: direccion<=4'b0011;
												8'b00000100: direccion<=4'b0100;
												8'b00000101: direccion<=4'b0101;
												8'b00000110: direccion<=4'b0110;
												8'b00000111: direccion<=4'b0111;
												8'b00001000: direccion<=4'b1000;
												default: direccion<=direccion;
											endcase
										end
					default :
							begin
								contro_listo<=contro_listo;
								contro_lee<=contro_lee;
								contro_escribe<=contro_escribe;
								direccion<=direccion;
								Dir<=Dir;
								Dato<=Dato;
								bandera<=bandera;
							end
				endcase
			end
		else
			if (rst)
				begin
					contro_listo<=  1'b0;
					contro_lee <=   1'b0;
					contro_escribe<=1'b0;
				end
			else
				begin
					contro_listo<=contro_listo;
					contro_lee <=contro_lee;
					contro_escribe<=contro_escribe;
				end
	end
endmodule
