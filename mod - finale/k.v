`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:54:23 06/13/2014 
// Design Name: 
// Module Name:    k 
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
module con(input clk, output h,output k
    );
wire [3:0] k;
wire [3:0] h;
always@(posedge clk) begin
	if(h==16) begin
		h <=0;
		k <= k+1;
	end
	if(k==16) begin
		k <=0;
		h <=0;
	end
h <= h+1;
end
endmodule
