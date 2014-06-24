`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:04:35 06/15/2014 
// Design Name: 
// Module Name:    clk 
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
module clk(input clk,output reg newclk
    );
reg count = 0;

  always @ (posedge clk) begin
  if(count == 0) begin
    newclk <=1'b1;
	 count <= 1'b1;
  end
  else  begin
  newclk <= 1'b0;
  count <= 1'b0; 
  end
  end

endmodule


