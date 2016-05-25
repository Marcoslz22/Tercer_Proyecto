`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:40:18 03/10/2016 
// Design Name: 
// Module Name:    Decodificador 
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
module Decodificador(
   input [3:0] Codigo_U,
	output reg [7:0] catodo1,catodo3,catodo4
    );
    
	 always @(*)
	    begin
	    case (Codigo_U)
		    4'h0: begin
			           catodo1 <= 8'b00000011;
					     catodo3 <= 8'b00000011;
					     catodo4 <= 8'b00000011;
			        end 
			 4'h1: begin
						 catodo1 <= 8'b10011111;
						 catodo3 <= 8'b00000011;
						 catodo4 <= 8'b00000011; 
			        end 
			 4'h2: begin
						 catodo1 <= 8'b00100101;
						 catodo3 <= 8'b00000011;
						 catodo4 <= 8'b00000011;
			        end 
			 4'h3: begin
						 catodo1 <= 8'b00001101;
						 catodo3 <= 8'b00000011;
						 catodo4 <= 8'b00000011;
			        end 
			 4'h4: begin
						 catodo1 <= 8'b10011001;
						 catodo3 <= 8'b00000011;
						 catodo4 <= 8'b00000011;
			        end 
			 4'h5: begin
						 catodo1 <= 8'b01001001;
						 catodo3 <= 8'b00000011;
						 catodo4 <= 8'b00000011;
			        end 
			 4'h6: begin
						 catodo1 <= 8'b01000001;
						 catodo3 <= 8'b00000011;
						 catodo4 <= 8'b00000011;
			        end 
			 4'h7: begin
						 catodo1 <= 8'b00011111;
						 catodo3 <= 8'b00000011;
						 catodo4 <= 8'b00000011;
			        end 
			 4'h8: begin
						 catodo1 <= 8'b00000001;
						 catodo3 <= 8'b00000011;
						 catodo4 <= 8'b00000011;
			        end 
			 4'h9: begin
						 catodo1 <= 8'b00011001;
						 catodo3 <= 8'b00000011;
						 catodo4 <= 8'b00000011;
			        end 
			 4'hA: begin
						 catodo1 <= 8'b10011001;
						 catodo3 <= 8'b00000011;
						 catodo4 <= 8'b00000011;
			        end 
			 4'hB: begin
						 catodo1 <= 8'b01001001;
						 catodo3 <= 8'b00000011;
						 catodo4 <= 8'b00000011;
			        end 
			 4'hC: begin
						 catodo1 <= 8'b01000001;
						 catodo3 <= 8'b00000011;
						 catodo4 <= 8'b00000011;
			        end 
			 4'hD: begin
						 catodo1 <= 8'b00011111;
						 catodo3 <= 8'b00000011;
						 catodo4 <= 8'b00000011;
			        end 
			 4'hE: begin
						 catodo1 <= 8'b00000001;
						 catodo3 <= 8'b00000011;
						 catodo4 <= 8'b00000011;
			        end 
			 4'hF: begin
						 catodo1 <= 8'b00011001;
						 catodo3 <= 8'b00000011;
						 catodo4 <= 8'b00000011;
			        end 
			 default: begin
						 catodo1 <= 8'b10011111;
						 catodo3 <= 8'b10011111; 
						 catodo4 <= 8'b10011111;
                   end 	
        endcase		
		end	 
endmodule
