`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:09:55 06/20/2014 
// Design Name: 
// Module Name:    plzchalja 
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
module plzchalja(input clk, output reg [63:0] next );
always@(posedge clk) begin
 next  = 64'b1;
end
endmodule
