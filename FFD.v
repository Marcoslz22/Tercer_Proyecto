`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:07:31 05/22/2016 
// Design Name: 
// Module Name:    FFD 
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
module FFD(
input wire rst,
input wire clk,
input wire [7:0] dato_mux,
output reg [7:0] salida_picoblaze
    );
   always @(posedge clk or posedge rst)
      if (rst) begin
         salida_picoblaze <= 8'h00;
      end else begin
         salida_picoblaze <= dato_mux;
      end

endmodule
