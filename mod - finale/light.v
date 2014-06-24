`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:47:43 05/26/2014 
// Design Name: 
// Module Name:    light 
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
module light(
	input clk,output reg G
    );
	 parameter n=15;
wire[n*n-1:0] test;
reg[n-1:0] R;
reg[n-1:0] C;
integer x=0, i, j, y, z;

always@(posedge clk) begin
	if(x<n*n) begin
		if(test[x] == 1'b1) begin
			y = x/n;
			z = x%n;
			for(i=0; i<n; i=i+1) begin
				if(i == y) begin
					R[i] <= 1'b0;
				end
				else begin
					R[i] <= 1'b1;
				end
			end
			for(j=0; j<n; j=j+1) begin
				if(j==z) begin
					C[j] <= 1'b1;
				end
				else begin
					C[j] <= 1'b0;
				end
			end
		end
		else begin
			for(i=0; i<n; i=i+1) begin
				R[i] <= 1'b1;
				C[i] <= 1'b0;
			end
		end
		x<=x+1;
	end
	else begin
		x<=x-n*n;
	end
end

endmodule
