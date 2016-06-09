`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:47:06 04/11/2016 
// Design Name: 
// Module Name:    Control_de_Tiempos 
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
module Control_de_Tiempos(
	 input enable_inicio,         
	 input enable_escribir,
	 input clk,
	 input enable_leer,
	 input [3:0] estado,
	 input [2:0] Estado_m,
    output reg A_D,
	 output reg CS,
	 output reg RD,
	 output reg WR,
	 output reg HI,
	 output reg Dato_Dir,
	 output reg listo,
	 output reg en_out
    );
    
	 
	 always @(posedge clk)
	   begin
	    if (enable_escribir || enable_inicio )
		 begin
		    case (estado)
          4'd0: begin
					    CS <= 1; 
						 RD <= 1;
						 A_D <= 1;
						 WR <= 1;
						 HI <= 1;
						 Dato_Dir <= 0;
						 listo <= 0;
						 en_out <= 0;
						 
					 end 
          4'd1: begin 
					    CS <= 1; 
						 RD <= 1;
						 A_D <= 0;
						 WR <= 1;
						 HI <= 1;
						 Dato_Dir <= 0;
						 listo <= 0;
						 en_out <= 0;
					 end 
          4'd2: begin
					    CS <= 0; 
						 RD <= 1;
						 A_D <= 0;
						 WR <= 0;
						 HI <= 1;
						 Dato_Dir <= 0;
						 listo <= 0;
						 en_out <= 0;
			       end
          4'd3: begin
					    CS <= 0; 
						 RD <= 1;
						 A_D <= 0;
						 WR <= 0;
						 HI <= 1;
						 Dato_Dir <= 0;
						 listo <= 0;
						 en_out <= 0;
			       end
          4'd4: begin 
					    CS <= 0; 
						 RD <= 1;
						 A_D <= 0;
						 WR <= 0;
						 HI <= 0;
						 Dato_Dir <= 0;
						 listo <= 0;
						 en_out <= 0;
					 end
          4'd5: begin 
					    CS <= 1; 
						 RD <= 1;
						 A_D <= 0;
						 WR <= 1;
						 HI <= 1;
						 Dato_Dir <= 0;
						 listo <= 0;
						 en_out <= 0;
                end						 
          4'd6: begin 
					    CS <= 1; 
						 RD <= 1;
						 A_D <= 1;
						 WR <= 1;
						 HI <= 1;
						 Dato_Dir <= 1;
						 listo <= 0;
						 en_out <= 0;
                end						 
          4'd7: begin 
					    CS <= 0; 
						 RD <= 1;
						 A_D <= 1;
						 WR <= 0;
						 HI <= 1;
						 Dato_Dir <= 1;
						 listo <= 0;
						 en_out <= 0;
                end						 
          4'd8: begin 
					    CS <= 0; 
						 RD <= 1;
						 A_D <= 1;
						 WR <= 0;
						 HI <= 1;
						 Dato_Dir <= 1;
						 listo <= 0;
						 en_out <= 0;
					 end 
          4'd9: begin 
					    CS <= 0; 
						 RD <= 1;
						 A_D <= 1;
						 WR <= 0;
						 HI <= 0;
						 Dato_Dir <= 1;
						 listo <= 0;
						 en_out <= 0;
					 end 
          4'd10: begin 
					    CS <= 1; 
						 RD <= 1;
						 A_D <= 1;
						 WR <= 1;
						 HI <= 1;
						 Dato_Dir <= 1;
						 listo <= 0;
						 en_out <= 0;
					  end
          4'd11: begin 
					    CS <= 1; 
						 RD <= 1;
						 A_D <= 1;
						 WR <= 1;
						 HI <= 1;
						 Dato_Dir <= 1;
						 listo <= 1;
						 en_out <= 0;
					  end 	 
          default: begin
					    CS <= 1; 
						 RD <= 1;
						 A_D <= 1;
						 WR <= 1;
						 HI <= 1;
						 Dato_Dir <= 0;
						 listo <= 0;
						 en_out <= 0;
			          end 
          endcase			 
		 end
		 else 
		 if (enable_leer)
		 begin
		 if (Estado_m == 3'd1)
		 begin
		    case (estado)
          4'd0: begin
					    CS <= 1; 
						 RD <= 1;
						 A_D <= 1;
						 WR <= 1;
						 HI <= 1;
						 Dato_Dir <= 0;
						 listo <= 0;
						 en_out <= 0;
					 end 
          4'd1: begin 
					    CS <= 1; 
						 RD <= 1;
						 A_D <= 0;
						 WR <= 1;
						 HI <= 1;
						 Dato_Dir <= 0;
						 listo <= 0;
						 en_out <= 0;
					 end 
          4'd2: begin
					    CS <= 0; 
						 RD <= 1;
						 A_D <= 0;
						 WR <= 0;
						 HI <= 1;
						 Dato_Dir <= 0;
						 listo <= 0;
						 en_out <= 0;
			       end
          4'd3: begin
					    CS <= 0; 
						 RD <= 1;
						 A_D <= 0;
						 WR <= 0;
						 HI <= 1;
						 Dato_Dir <= 0;
						 listo <= 0;
						 en_out <= 0;
			       end
          4'd4: begin 
					    CS <= 0; 
						 RD <= 1;
						 A_D <= 0;
						 WR <= 0;
						 HI <= 0;
						 Dato_Dir <= 0;
						 listo <= 0;
						 en_out <= 0;
					 end
          4'd5: begin 
					    CS <= 1; 
						 RD <= 1;
						 A_D <= 0;
						 WR <= 1;
						 HI <= 1;
						 Dato_Dir <= 0;
						 listo <= 0;
						 en_out <= 0;
                end						 
          4'd6: begin 
					    CS <= 1; 
						 RD <= 1;
						 A_D <= 1;
						 WR <= 1;
						 HI <= 1;
						 Dato_Dir <= 1;
						 listo <= 0;
						 en_out <= 0;
                end						 
          4'd7: begin 
					    CS <= 0; 
						 RD <= 0;
						 A_D <= 1;
						 WR <= 1;
						 HI <= 1;
						 Dato_Dir <= 1;
						 listo <= 0;
						 en_out <= 0;
                end						 
          4'd8: begin 
					    CS <= 0; 
						 RD <= 0;
						 A_D <= 1;
						 WR <= 1;
						 HI <= 1;
						 Dato_Dir <= 1;
						 listo <= 0;
						 en_out <= 0;
					 end 
          4'd9: begin 
					    CS <= 0; 
						 RD <= 0;
						 A_D <= 1;
						 WR <= 1;
						 HI <= 1;
						 Dato_Dir <= 1;
						 listo <= 0;
						 en_out <= 0;
					 end
          4'd10: begin 
					    CS <= 1; 
						 RD <= 1;
						 A_D <= 1;
						 WR <= 1;
						 HI <= 1;
						 Dato_Dir <= 1;
						 listo <= 0;
						 en_out <= 0;
					  end
          4'd11: begin 
					    CS <= 1; 
						 RD <= 1;
						 A_D <= 1;
						 WR <= 1;
						 HI <= 1;
						 Dato_Dir <= 1;
						 listo <= 1;
						 en_out <= 0;
					  end 	 
          default: begin
					    CS <= 1; 
						 RD <= 1;
						 A_D <= 1;
						 WR <= 1;
						 HI <= 1;
						 Dato_Dir <= 0;
						 listo <= 0;
						 en_out <= 0;
			          end 
          endcase		
		 end
		 else
		 begin
		    		    case (estado)
          4'd0: begin
					    CS <= 1; 
						 RD <= 1;
						 A_D <= 1;
						 WR <= 1;
						 HI <= 1;
						 Dato_Dir <= 0;
						 listo <= 0;
						 en_out <= 0;
					 end 
          4'd1: begin 
					    CS <= 1; 
						 RD <= 1;
						 A_D <= 0;
						 WR <= 1;
						 HI <= 1;
						 Dato_Dir <= 0;
						 listo <= 0;
						 en_out <= 0;
					 end 
          4'd2: begin
					    CS <= 0; 
						 RD <= 1;
						 A_D <= 0;
						 WR <= 0;
						 HI <= 1;
						 Dato_Dir <= 0;
						 listo <= 0;
						 en_out <= 0;
			       end
          4'd3: begin
					    CS <= 0; 
						 RD <= 1;
						 A_D <= 0;
						 WR <= 0;
						 HI <= 1;
						 Dato_Dir <= 0;
						 listo <= 0;
						 en_out <= 0;
			       end
          4'd4: begin 
					    CS <= 0; 
						 RD <= 1;
						 A_D <= 0;
						 WR <= 0;
						 HI <= 0;
						 Dato_Dir <= 0;
						 listo <= 0;
						 en_out <= 0;
					 end
          4'd5: begin 
					    CS <= 1; 
						 RD <= 1;
						 A_D <= 0;
						 WR <= 1;
						 HI <= 1;
						 Dato_Dir <= 0;
						 listo <= 0;
						 en_out <= 0;
                end						 
          4'd6: begin 
					    CS <= 1; 
						 RD <= 1;
						 A_D <= 1;
						 WR <= 1;
						 HI <= 1;
						 Dato_Dir <= 1;
						 listo <= 0;
						 en_out <= 0;
                end						 
          4'd7: begin 
					    CS <= 0; 
						 RD <= 0;
						 A_D <= 1;
						 WR <= 1;
						 HI <= 1;
						 Dato_Dir <= 1;
						 listo <= 0;
						 en_out <= 0;
                end						 
          4'd8: begin 
					    CS <= 0; 
						 RD <= 0;
						 A_D <= 1;
						 WR <= 1;
						 HI <= 1;
						 Dato_Dir <= 1;
						 listo <= 0;
						 en_out <= 0;
					 end 
          4'd9: begin 
					    CS <= 0; 
						 RD <= 0;
						 A_D <= 1;
						 WR <= 1;
						 HI <= 1;
						 Dato_Dir <= 1;
						 listo <= 0;
						 en_out <= 1;
					 end
          4'd10: begin 
					    CS <= 1; 
						 RD <= 1;
						 A_D <= 1;
						 WR <= 1;
						 HI <= 1;
						 Dato_Dir <= 1;
						 listo <= 0;
						 en_out <= 0;
					  end
          4'd11: begin 
					    CS <= 1; 
						 RD <= 1;
						 A_D <= 1;
						 WR <= 1;
						 HI <= 1;
						 Dato_Dir <= 1;
						 listo <= 1;
						 en_out <= 0;
					  end 	 
          default: begin
					    CS <= 1; 
						 RD <= 1;
						 A_D <= 1;
						 WR <= 1;
						 HI <= 1;
						 Dato_Dir <= 0;
						 listo <= 0;
						 en_out <= 0;
			          end 
          endcase		
		 end 
		 end
		 else 
		 begin
		    CS <= 1; 
			 RD <= 1;
			 A_D <= 1;
			 WR <= 1;
			 HI <= 1;
			 Dato_Dir <= 0;
			 listo <= 0;
			 en_out <= 0;
		 end
	  end 
endmodule
