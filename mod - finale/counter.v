`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:04:01 06/09/2014 
// Design Name: 
// Module Name:    counter 
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
module counter(input clk, output CounterX, output CounterY
    );
reg [9:0] CounterX;
reg [9:0] CounterY;
wire CounterXmaxed = (CounterX==767);

always @(posedge clk)
if(CounterXmaxed)
  CounterX <= 0;
else
  CounterX <= CounterX + 1;

always @(posedge clk)
if(CounterXmaxed)
    CounterY <= CounterY + 1;

endmodule

