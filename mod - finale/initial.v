`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:53:55 05/26/2014 
// Design Name: 
// Module Name:    initial 
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
module initials(input clk, input [9:0] CounterX, input wire [9:0] CounterY,output reg [7:0] block
    );
	 parameter n=8;
	 always@(posedge clk) begin
if((CounterX>=200&&CounterX<210)&&(CounterY>=200&&CounterY<210))
block <=1;
else if((CounterX>=210&&CounterX<220)&&(CounterY>=200&&CounterY<210))
block <=2;
else if((CounterX>=220&&CounterX<230)&&(CounterY>=200&&CounterY<210))
block <=3;
else if((CounterX>=230&&CounterX<240)&&(CounterY>=200&&CounterY<210))
block <=4;
else if((CounterX>=240&&CounterX<250)&&(CounterY>=200&&CounterY<210))
block <=5;
else if((CounterX>=250&&CounterX<260)&&(CounterY>=200&&CounterY<210))
block <=6;
else if((CounterX>=260&&CounterX<270)&&(CounterY>=200&&CounterY<210))
block <=7;
else if((CounterX>=270&&CounterX<280)&&(CounterY>=200&&CounterY<210))
block <=8;
else if((CounterX>=200&&CounterX<210)&&(CounterY>=210&&CounterY<220))
block <=9;
else if((CounterX>=210&&CounterX<220)&&(CounterY>=210&&CounterY<220))
block <=10;
else if((CounterX>=220&&CounterX<230)&&(CounterY>=210&&CounterY<220))
block <=11;
else if((CounterX>=230&&CounterX<240)&&(CounterY>=210&&CounterY<220))
block <=12;
else if((CounterX>=240&&CounterX<250)&&(CounterY>=210&&CounterY<220))
block <=13;
else if((CounterX>=250&&CounterX<260)&&(CounterY>=210&&CounterY<220))
block <=14;
else if((CounterX>=260&&CounterX<270)&&(CounterY>=210&&CounterY<220))
block <=15;
else if((CounterX>=270&&CounterX<280)&&(CounterY>=210&&CounterY<220))
block <=16;
else if((CounterX>=200&&CounterX<210)&&(CounterY>=220&&CounterY<230))
block <=17;
else if((CounterX>=210&&CounterX<220)&&(CounterY>=220&&CounterY<230))
block <=18;
else if((CounterX>=220&&CounterX<230)&&(CounterY>=220&&CounterY<230))
block <=19;
else if((CounterX>=230&&CounterX<240)&&(CounterY>=220&&CounterY<230))
block <=20;
else if((CounterX>=240&&CounterX<250)&&(CounterY>=220&&CounterY<230))
block <=21;
else if((CounterX>=250&&CounterX<260)&&(CounterY>=220&&CounterY<230))
block <=22;
else if((CounterX>=260&&CounterX<270)&&(CounterY>=220&&CounterY<230))
block <=23;
else if((CounterX>=270&&CounterX<280)&&(CounterY>=220&&CounterY<230))
block <=24;
else if((CounterX>=200&&CounterX<210)&&(CounterY>=230&&CounterY<240))
block <=25;
else if((CounterX>=210&&CounterX<220)&&(CounterY>=230&&CounterY<240))
block <=26;
else if((CounterX>=220&&CounterX<230)&&(CounterY>=230&&CounterY<240))
block <=27;
else if((CounterX>=230&&CounterX<240)&&(CounterY>=230&&CounterY<240))
block <=28;
else if((CounterX>=240&&CounterX<250)&&(CounterY>=230&&CounterY<240))
block <=29;
else if((CounterX>=250&&CounterX<260)&&(CounterY>=230&&CounterY<240))
block <=30;
else if((CounterX>=260&&CounterX<270)&&(CounterY>=230&&CounterY<240))
block <=31;
else if((CounterX>=270&&CounterX<280)&&(CounterY>=230&&CounterY<240))
block <=32;
else if((CounterX>=200&&CounterX<210)&&(CounterY>=240&&CounterY<250))
block <=33;
else if((CounterX>=210&&CounterX<220)&&(CounterY>=240&&CounterY<250))
block <=34;
else if((CounterX>=220&&CounterX<230)&&(CounterY>=240&&CounterY<250))
block <=35;
else if((CounterX>=230&&CounterX<240)&&(CounterY>=240&&CounterY<250))
block <=36;
else if((CounterX>=240&&CounterX<250)&&(CounterY>=240&&CounterY<250))
block <=37;
else if((CounterX>=250&&CounterX<260)&&(CounterY>=240&&CounterY<250))
block <=38;
else if((CounterX>=260&&CounterX<270)&&(CounterY>=240&&CounterY<250))
block <=39;
else if((CounterX>=270&&CounterX<280)&&(CounterY>=240&&CounterY<250))
block <=40;
else if((CounterX>=200&&CounterX<210)&&(CounterY>=250&&CounterY<260))
block <=41;
else if((CounterX>=210&&CounterX<220)&&(CounterY>=250&&CounterY<260))
block <=42;
else if((CounterX>=220&&CounterX<230)&&(CounterY>=250&&CounterY<260))
block <=43;
else if((CounterX>=230&&CounterX<240)&&(CounterY>=250&&CounterY<260))
block <=44;
else if((CounterX>=240&&CounterX<250)&&(CounterY>=250&&CounterY<260))
block <=45;
else if((CounterX>=250&&CounterX<260)&&(CounterY>=250&&CounterY<260))
block <=46;
else if((CounterX>=260&&CounterX<270)&&(CounterY>=250&&CounterY<260))
block <=47;
else if((CounterX>=270&&CounterX<280)&&(CounterY>=250&&CounterY<260))
block <=48;
else if((CounterX>=200&&CounterX<210)&&(CounterY>=260&&CounterY<270))
block <=49;
else if((CounterX>=210&&CounterX<220)&&(CounterY>=260&&CounterY<270))
block <=50;
else if((CounterX>=220&&CounterX<230)&&(CounterY>=260&&CounterY<270))
block <=51;
else if((CounterX>=230&&CounterX<240)&&(CounterY>=260&&CounterY<270))
block <=52;
else if((CounterX>=240&&CounterX<250)&&(CounterY>=260&&CounterY<270))
block <=53;
else if((CounterX>=250&&CounterX<260)&&(CounterY>=260&&CounterY<270))
block <=54;
else if((CounterX>=260&&CounterX<270)&&(CounterY>=260&&CounterY<270))
block <=55;
else if((CounterX>=270&&CounterX<280)&&(CounterY>=260&&CounterY<270))
block <=56;
else if((CounterX>=200&&CounterX<210)&&(CounterY>=270&&CounterY<280))
block <=57;
else if((CounterX>=210&&CounterX<220)&&(CounterY>=270&&CounterY<280))
block <=58;
else if((CounterX>=220&&CounterX<230)&&(CounterY>=270&&CounterY<280))
block <=59;
else if((CounterX>=230&&CounterX<240)&&(CounterY>=270&&CounterY<280))
block <=60;
else if((CounterX>=240&&CounterX<250)&&(CounterY>=270&&CounterY<280))
block <=61;
else if((CounterX>=250&&CounterX<260)&&(CounterY>=270&&CounterY<280))
block <=62;
else if((CounterX>=260&&CounterX<270)&&(CounterY>=270&&CounterY<280))
block <=63;
else if((CounterX>=270&&CounterX<280)&&(CounterY>=270&&CounterY<280))
block <=64;
else block <=0;
/*else if((CounterX>=200&&CounterX<=210)&&(CounterY>=200&&CounterY<=210))
block <=1;
else if((CounterX>=200&&CounterX<=210)&&(CounterY>=200&&CounterY<=210))
block <=1;
else if((CounterX>=200&&CounterX<=210)&&(CounterY>=200&&CounterY<=210))
block <=1;
else if((CounterX>=200&&CounterX<=210)&&(CounterY>=200&&CounterY<=210))
block <=1;
else if((CounterX>=200&&CounterX<=210)&&(CounterY>=200&&CounterY<=210))
block <=1;
else if((CounterX>=200&&CounterX<=210)&&(CounterY>=200&&CounterY<=210))
block <=1;
else if((CounterX>=200&&CounterX<=210)&&(CounterY>=200&&CounterY<=210))
block <=1;
else if((CounterX>=200&&CounterX<=210)&&(CounterY>=200&&CounterY<=210))
block <=1;
else if((CounterX>=200&&CounterX<=210)&&(CounterY>=200&&CounterY<=210))
block <=1;
else if((CounterX>=200&&CounterX<=210)&&(CounterY>=200&&CounterY<=210))
block <=1;
else if((CounterX>=200&&CounterX<=210)&&(CounterY>=200&&CounterY<=210))
block <=1;
else if((CounterX>=200&&CounterX<=210)&&(CounterY>=200&&CounterY<=210))
block <=1;
else if((CounterX>=200&&CounterX<=210)&&(CounterY>=200&&CounterY<=210))
block <=1;
else if((CounterX>=200&&CounterX<=210)&&(CounterY>=200&&CounterY<=210))
block <=1;
else if((CounterX>=200&&CounterX<=210)&&(CounterY>=200&&CounterY<=210))
block <=1;
else if((CounterX>=200&&CounterX<=210)&&(CounterY>=200&&CounterY<=210))
block <=1;
else if((CounterX>=200&&CounterX<=210)&&(CounterY>=200&&CounterY<=210))
block <=1;
else if((CounterX>=200&&CounterX<=210)&&(CounterY>=200&&CounterY<=210))
block <=1;
else if((CounterX>=200&&CounterX<=210)&&(CounterY>=200&&CounterY<=210))
block <=1;
else if((CounterX>=200&&CounterX<=210)&&(CounterY>=200&&CounterY<=210))
block <=1;
else if((CounterX>=200&&CounterX<=210)&&(CounterY>=200&&CounterY<=210))
block <=1;
else if((CounterX>=200&&CounterX<=210)&&(CounterY>=200&&CounterY<=210))
block <=1;
else if((CounterX>=200&&CounterX<=210)&&(CounterY>=200&&CounterY<=210))
block <=1;
else if((CounterX>=200&&CounterX<=210)&&(CounterY>=200&&CounterY<=210))
block <=1;
else if((CounterX>=200&&CounterX<=210)&&(CounterY>=200&&CounterY<=210))
block <=1;
else if((CounterX>=200&&CounterX<=210)&&(CounterY>=200&&CounterY<=210))
block <=1;
else if((CounterX>=200&&CounterX<=210)&&(CounterY>=200&&CounterY<=210))
block <=1;
else if((CounterX>=200&&CounterX<=210)&&(CounterY>=200&&CounterY<=210))
block <=1;
else if((CounterX>=200&&CounterX<=210)&&(CounterY>=200&&CounterY<=210))
block <=1;
else if((CounterX>=200&&CounterX<=210)&&(CounterY>=200&&CounterY<=210))
block <=1;
else if((CounterX>=200&&CounterX<=210)&&(CounterY>=200&&CounterY<=210))
block <=1;
else if((CounterX>=200&&CounterX<=210)&&(CounterY>=200&&CounterY<=210))
block <=1;
else if((CounterX>=200&&CounterX<=210)&&(CounterY>=200&&CounterY<=210))
block <=1;
else if((CounterX>=200&&CounterX<=210)&&(CounterY>=200&&CounterY<=210))
block <=1;
else if((CounterX>=200&&CounterX<=210)&&(CounterY>=200&&CounterY<=210))
block <=1;
else if((CounterX>=200&&CounterX<=210)&&(CounterY>=200&&CounterY<=210))
block <=1;
else if((CounterX>=200&&CounterX<=210)&&(CounterY>=200&&CounterY<=210))
block <=1;
else if((CounterX>=200&&CounterX<=210)&&(CounterY>=200&&CounterY<=210))
block <=1;
else if((CounterX>=200&&CounterX<=210)&&(CounterY>=200&&CounterY<=210))
block <=1;
else if((CounterX>=200&&CounterX<=210)&&(CounterY>=200&&CounterY<=210))
block <=1;
else if((CounterX>=200&&CounterX<=210)&&(CounterY>=200&&CounterY<=210))
block <=1;
else if((CounterX>=200&&CounterX<=210)&&(CounterY>=200&&CounterY<=210))
block <=1;
else if((CounterX>=200&&CounterX<=210)&&(CounterY>=200&&CounterY<=210))
block <=1;
else if((CounterX>=200&&CounterX<=210)&&(CounterY>=200&&CounterY<=210))
block <=1;
else if((CounterX>=200&&CounterX<=210)&&(CounterY>=200&&CounterY<=210))
block <=1;*/
end
endmodule
