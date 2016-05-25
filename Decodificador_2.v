`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:40:48 05/22/2016 
// Design Name: 
// Module Name:    Decodificador_2 
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
module Decodificador_2(
     input [3:0] Codigo_D,
	  output reg [7:0] catodo2
    );
    
	 always @(*)
	    begin
	    case (Codigo_D)
		    4'h0: begin
			           catodo2 <= 8'b00000011;
			        end 
			 4'h1: begin
						 catodo2 <= 8'b10011111;
			        end 
			 4'h2: begin
						 catodo2 <= 8'b00100101;
			        end 
			 4'h3: begin
						 catodo2 <= 8'b00001101;
			        end 
			 4'h4: begin
						 catodo2 <= 8'b10011001;
			        end 
			 4'h5: begin
						 catodo2 <= 8'b01001001;
			        end 
			 4'h6: begin
						 catodo2 <= 8'b01000001;
			        end 
			 4'h7: begin
						 catodo2 <= 8'b00011111;
			        end 
			 4'h8: begin
						 catodo2 <= 8'b00000001;
			        end 
			 4'h9: begin
						 catodo2 <= 8'b00011001;
			        end 
			 4'hA: begin
						 catodo2 <= 8'b10011001;
			        end 
			 4'hB: begin
						 catodo2 <= 8'b010010011;
			        end 
			 4'hC: begin
						 catodo2 <= 8'b01000001;
			        end 
			 4'hD: begin
						 catodo2 <= 8'b00011111;
			        end 
			 4'hE: begin
						 catodo2 <= 8'b00000001;
			        end 
			 4'hF: begin
						 catodo2 <= 8'b00011001;
			        end 
			 default: begin
						 catodo2 <= 8'b10011111;
                   end 	
        endcase		
		end	 
endmodule 