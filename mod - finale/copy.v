`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:59:35 05/27/2014 
// Design Name: 
// Module Name:    copy 
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
module copy(input clk, input next,output arr,input rst
    );
	 parameter n=40;
	 parameter m=25;
	 wire [n*m-1:0] next;
	 reg [n*m-1:0] arr;
	 integer i,j,k;
always@(posedge clk) begin
for(i=0;i<n*m;i=i+1) begin
arr[i] <= next[i];
end
 end
endmodule
