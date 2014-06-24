`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:41:13 05/26/2014 
// Design Name: 
// Module Name:    callpin 
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
module callpin(input clk,input wire [63:0] next,output reg R,output reg G,output reg B,input wire [63:0] block,
input wire [9:0] CounterX,input wire [9:0] CounterY

    );
	 integer k=0;
	 always@(posedge clk) begin
	B = 1'b0;
 R = 1'b0;
 //G = CounterX==200||CounterX==360||CounterY==200||CounterY==360||CounterX==220||CounterX==240||CounterY==220||CounterY==240||CounterX==260||CounterX==280||CounterY==260||CounterY==280||CounterX==300||CounterX==320||CounterY==300||CounterY==320||CounterX==340||CounterY==340;
G=1'b0;
end
endmodule
