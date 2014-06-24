`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:43:41 05/25/2014 
// Design Name: 
// Module Name:    pin 
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
module pin( input arr,output next,input clk,input rst
    );
	 parameter n=8;
	 wire [n*n-1:0] arr;
	 reg [n*n-1:0] next;
	 reg [3:0] add =4'b0;
	 integer i,j;
	 always@(posedge clk,posedge rst) begin
	 if(rst) begin
 next  <= 64'b1;//0000000000011100000000000000000000000000000000000000000000000000;

	/*next [255:240] <= 16'b0000000000000000;
	next [239:224] <= 16'b0000000000000000;
	next [223:208] <= 17'b0000000000000000;	
	next [207:192] <= 16'b0000000000000000;
	next [191:176] <= 16'b0000000000000000;
	next [175:160] <= 16'b0000000000000000;	
	next [159:144] <= 16'b0000000011100000;
	next [143:128] <= 16'b0000000000000000;
	next [127:112] <= 16'b0000000000000000;
	next [111:96]  <= 16'b0000000000000000;
	next [95:80]   <= 16'b0000000000000000;
	next [79:64]   <= 16'b0000001100000000;
	next [63:48]   <= 16'b0000001100000000;
	next [47:32]   <= 16'b0000000000000000;
	next [31:16]   <= 16'b0000000000000000;
	next [15:0]    <= 16'b0000000000000000;*/


	 end else begin
	 for(i=0;i<n;i=i+1) begin
for(j=0;j<n;j=j+1) begin

if ( i===0 && j===0)
begin
add = arr[1]+arr[n]+arr[n+1]+arr[n-1]+arr[2*n-1]+arr[n*(n-1)]+arr[n*(n-1)+1]+arr[n*n-1];
end
else if ( i===0 && j===n-1)
begin
add = arr[n-2]+arr[2*n-2]+arr[2*n-1]+arr[n*n-2]+arr[n*n-1]+arr[n*(n-1)]+arr[0]+arr[n];
end 
else if ( i===n-1 && j===n-1)
begin
add = arr[0]+arr[n-1]+arr[n-2]+arr[n*(n-2)]+arr[n*(n-1)]+arr[n*(n-1)-2]+arr[n*(n-1)-1]+arr[n*n-2];
end 
else if ( i===n-1 && j===0)
begin
add = arr[n*(n-2)]+arr[n*(n-2)+1]+arr[n*(n-1)+1]+arr[n*(n-1)-1]+arr[n*n-1]+arr[0]+arr[1]+arr[n-1];
end 
else if ( i===0 && j!==n-1 && j!==0)
begin
add = arr[j-1] + arr[j+1] + arr[n+j] + arr[n-1+j] +arr[j+n+1]+arr[n*(n-1)+j] + arr[n*(n-1)+1+j] + arr[n*(n-1)-1+j];
end 
else if ( i===n-1 && j!=n-1 && j!=0)
begin
add = arr[i*n+j-1] + arr[i*n+j+1] + arr[(i-1)*n+j] + arr[(i-1)*n+j-1] +arr[(i-1)*n+j+1]+arr[1+j] + arr[j] + arr[j-1];
end 
else if ( j===0 && i!=n-1 && i!=0)
begin
add = arr[(i-1)*n] + arr[(i+1)*n] + arr[i*n+1] + arr[(i-1)*n+1] +arr[(i+1)*n+1]+arr[(i-1)*n+n-1] + arr[(i+1)*n+n-1] + arr[i*n+n-1];
end 
else if ( j===n-1 && i!=n-1 && i!=0)
begin
add = arr[(i-1)*n+n-2] + arr[(i+1)*n+n-2] + arr[i*n+n-2] + arr[(i-1)*n+n-1] +arr[(i+1)*n+n-1]+arr[(i-1)*n] + arr[(i+1)*n] + arr[i*n];
end 
else begin
add = arr[i*n+j-1]+ arr[i*n+j+1]+ arr[(i-1)*n+j]+ arr[(i-1)*n+j-1]+ arr[(i-1)*n+j+1]+ arr[(i+1)*n+j]+ 
arr[(i+1)*n+j-1]+ arr[(i+1)*n+j+1]; 
end

if (arr[i*n+j]===1'b1) begin
if(add===4'b0010||add===4'b0011) begin
next[i*n+j] <= 1'b1;
end else begin
next[i*n+j] <= 1'b0;
end end 
else begin 
if(add===4'b0011) begin
next [i*n+j] <= 1'b1; end
else begin next[i*n+j] <= 1'b0; end
end end end
end 
end
endmodule
