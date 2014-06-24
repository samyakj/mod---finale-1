`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:32:50 05/26/2014 
// Design Name: 
// Module Name:    count 
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
module count (clk, b);
  input             clk;            // synthesis attribute PERIOD clk "50 MHz"
  reg        [25:0] count = 0;
  output reg        b = 0;   // one pulse per second

  always @ (posedge clk) begin
    b <= (count == 10000000 - 2);
    count <= b ? 0 : count + 1;
  end
endmodule