`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:07:44 05/27/2014 
// Design Name: 
// Module Name:    clock 
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
module clock(input clk,output wire b
    );
reg [50:0] d;
wire [50:0] dInc = d[50] ? (49) : (49 - 50000000);
wire [50:0] dN = d + dInc;
always @(posedge clk)
begin
  d = dN;
end
assign b = ~d[49];  // clock B tick whenever d[24] is zero

endmodule
