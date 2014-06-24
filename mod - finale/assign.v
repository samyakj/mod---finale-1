`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:21:49 06/19/2014 
// Design Name: 
// Module Name:    assign 
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
module asign(
	output reg R,
	input reg [5:0]i
	
    );
	 always@(posedge clk)
		R<=block[i];


endmodule
