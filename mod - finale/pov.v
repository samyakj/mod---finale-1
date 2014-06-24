`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:21:02 05/26/2014 
// Design Name: 
// Module Name:    pov 
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
module pov(
	input clk,
	input [63:0] next,
	//input [7:0] Cin,
	output reg [7:0] a,
	output reg [7:0] b
    );
	 
	 reg [3:0] i = 4'b0; reg [3:0] j = 4'b0;
	 	 always@( posedge clk) begin
		if(i===4'b1000) begin
			i<=0;
			j<=0;
		end
		if(j===4'b1000) begin
			j<=0;
			i<=i+1;
		end
		if(next[i*8+j===1'b1]) begin
			if(i===4'b0001) begin
	a[0] <=1'b0;
	a[1] <= 1'b1;
	a[2] <= 1'b1;
	a[3] <= 1'b1;
	a[4] <= 1'b1;
	a[5] <= 1'b1;
	a[6] <= 1'b1;
	a[7] <= 1'b1;	end 
	else if(i===4'b0010) begin
	a[0] <=1'b1;
	a[1] <= 1'b0;
	a[2] <= 1'b1;
	a[3] <= 1'b1;
	a[4] <= 1'b1;
	a[5] <= 1'b1;
	a[6] <= 1'b1;
	a[7] <= 1'b1;	end 
	else if(i===4'b0011) begin
	a[0] <=1'b1;
	a[1] <= 1'b1;
	a[2] <= 1'b0;
	a[3] <= 1'b1;
	a[4] <= 1'b1;
	a[5] <= 1'b1;
	a[6] <= 1'b1;
	a[7] <= 1'b1;	end 
	else if(i===4'b0100) begin
	a[0] <=1'b1;
	a[1] <= 1'b1;
	a[2] <= 1'b1;
	a[3] <= 1'b0;
	a[4] <= 1'b1;
	a[5] <= 1'b1;
	a[6] <= 1'b1;
	a[7] <= 1'b1;	end 
	else if(i===4'b0101) begin
	a[0] <=1'b1;
	a[1] <= 1'b1;
	a[2] <= 1'b1;
	a[3] <= 1'b1;
	a[4] <= 1'b0;
	a[5] <= 1'b1;
	a[6] <= 1'b1;
	a[7] <= 1'b1;	end 
	else if(i===4'b0110) begin
	a[0] <=1'b1;
	a[1] <= 1'b1;
	a[2] <= 1'b1;
	a[3] <= 1'b1;
	a[4] <= 1'b1;
	a[5] <= 1'b0;
	a[6] <= 1'b1;
	a[7] <= 1'b1;	end 
	else if(i===4'b0111) begin
	a[0] <=1'b1;
	a[1] <= 1'b1;
	a[2] <= 1'b1;
	a[3] <= 1'b1;
	a[4] <= 1'b1;
	a[5] <= 1'b1;
	a[6] <= 1'b0;
	a[7] <= 1'b1;	end 
	else if(i===4'b1000) begin
	a[0] <=1'b1;
	a[1] <= 1'b1;
	a[2] <= 1'b1;
	a[3] <= 1'b1;
	a[4] <= 1'b1;
	a[5] <= 1'b1;
	a[6] <= 1'b1;
	a[7] <= 1'b0;	end 
	/*else begin
	a[0] <=1'b1;
	a[1] <= 1'b1;
	a[2] <= 1'b1;
	a[3] <= 1'b1;
	a[4] <= 1'b1;
	a[5] <= 1'b1;
	a[6] <= 1'b1;
	a[7] <= 1'b1;	end */
	
	if(j===4'b0000) begin
	b[0] <=1'b1;
	b[1] <= 1'b0;
	b[2] <= 1'b0;
	b[3] <= 1'b0;
	b[4] <= 1'b0;
	b[5] <= 1'b0;
	b[6] <= 1'b0;
	b[7] <= 1'b0;	end 
	else if(j===4'b0001) begin
	b[0] <=1'b0;
	b[1] <= 1'b1;
	b[2] <= 1'b0;
	b[3] <= 1'b0;
	b[4] <= 1'b0;
	b[5] <= 1'b0;
	b[6] <= 1'b0;
	b[7] <= 1'b0;	end 
	else if(j===4'b0010) begin
	b[0] <=1'b0;
	b[1] <= 1'b0;
	b[2] <= 1'b1;
	b[3] <= 1'b0;
	b[4] <= 1'b0;
	b[5] <= 1'b0;
	b[6] <= 1'b0;
	b[7] <= 1'b0;	end 
	else if(j===4'b0011) begin
	b[0] <=1'b0;
	b[1] <= 1'b0;
	b[2] <= 1'b0;
	b[3] <= 1'b1;
	b[4] <= 1'b0;
	b[5] <= 1'b0;
	b[6] <= 1'b0;
	b[7] <= 1'b0;	end 
	else if(j===4'b0100) begin
	b[0] <=1'b0;
	b[1] <= 1'b0;
	b[2] <= 1'b0;
	b[3] <= 1'b0;
	b[4] <= 1'b1;
	b[5] <= 1'b0;
	b[6] <= 1'b0;
	b[7] <= 1'b0;	end 
	else if(j===4'b0101) begin
	b[0] <=1'b0;
	b[1] <= 1'b0;
	b[2] <= 1'b0;
	b[3] <= 1'b0;
	b[4] <= 1'b0;
	b[5] <= 1'b1;
	b[6] <= 1'b0;
	b[7] <= 1'b0;	end 
	else if(j===4'b0110) begin
	b[0] <=1'b0;
	b[1] <= 1'b0;
	b[2] <= 1'b0;
	b[3] <= 1'b0;
	b[4] <= 1'b0;
	b[5] <= 1'b0;
	b[6] <= 1'b1;
	b[7] <= 1'b0;	end 
	else if(j===4'b0111) begin
	b[0] <=1'b0;
	b[1] <= 1'b0;
	b[2] <= 1'b0;
	b[3] <= 1'b0;
	b[4] <= 1'b0;
	b[5] <= 1'b0;
	b[6] <= 1'b0;
	b[7] <= 1'b1;	end 
	j <= j+1;
    end
else begin
a[0] <=1'b1;
	a[1] <= 1'b1;
	a[2] <= 1'b1;
	a[3] <= 1'b1;
	a[4] <= 1'b1;
	a[5] <= 1'b1;
	a[6] <= 1'b1;
	a[7] <= 1'b1;
b[0] <=1'b0;
	b[1] <= 1'b0;
	b[2] <= 1'b0;
	b[3] <= 1'b0;
	b[4] <= 1'b0;
	b[5] <= 1'b0;
	b[6] <= 1'b0;
	b[7] <= 1'b0;
	 j <=j+1;
end
end
endmodule
