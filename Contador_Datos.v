`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:52:20 04/03/2016 
// Design Name: 
// Module Name:    Contador_Datos 
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
module Contador_Datos(
    input rst,
    input S,
    input B,
    input clk,
    input W_R,
    input en,
	 input [6:0] condicion_c2,
    output reg [6:0] c_2
    );
	 
	 reg estado = 1'd0;
	 reg estado2 = 1'd0;
	 wire en_2;
	 wire [6:0] N;
	 
	 assign en_2 = ~W_R;
    assign N = condicion_c2 ;	  
	 
	  
    always @(posedge clk)
      if (W_R || rst)
         c_2 <= 6'd0;
      else if (en && en_2)
		        begin
				  if (S)
				  begin
						
						  if (!estado)
						
						  begin
						   estado <= 1'd1;
				         if (c_2 >= N)
						   c_2 <= 6'd0;
						   else 
						   c_2 <= c_2 + 1'd1;
				        end
						
						else  c_2 <= c_2;
						
				  end
				  else 
				  begin
				  estado <= 1'd0;
				  if (B)
		                begin
							 
							 if (!estado2)
							 
							   begin
							   estado2 <= 1'd1;
							   if (!c_2)
							   c_2 <= N;
							   else
                        c_2 <= c_2 - 1'd1;	
							   end
							 
							 else
							 
							   begin
						      c_2 <= c_2;						 
							   end
							 
							 end
					else estado2 <= 1'd0;
        	end
			end


endmodule
