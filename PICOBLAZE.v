`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:12:45 05/24/2016 
// Design Name: 
// Module Name:    PICOBLAZE 
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
module PICOBLAZE(
input  interrupt,
input  sleep,
input  clk,
input  [7:0]in_port,
input  rst,
output write_strobe,
output k_write_strobe,
output read_strobe,
output [7:0]out_port,
output [7:0]port_id,
output interrupt_ack


   );

wire bram_enable;
wire [7:0] Dir,Dato;
wire [11:0] address;
wire rdl;
wire [17:0] instruction;
wire reset;


assign reset= rdl || rst; 

kcpsm6 kcpsm6 (
    .address(address), 
    .instruction(instruction), 
    .bram_enable(bram_enable), 
    .in_port(in_port), 
    .out_port(out_port), 
    .port_id(port_id), 
    .write_strobe(write_strobe), 
    .k_write_strobe(k_write_strobe), 
    .read_strobe(read_strobe), 
    .interrupt(interrupt), 
    .interrupt_ack(interrupt_ack), 
    .sleep(sleep), 
    .reset(reset), 
    .clk(clk)
    ); 
hhh pBlaze (
    .address(address), 
    .instruction(instruction), 
    .enable(bram_enable), 
    .rdl(rdl), 
    .clk(clk)
    );

endmodule
