module mojo_top(
    // 50MHz clock input
    input clk,
    // Input from reset button (active low)
    input rst_n,
    // cclk input from AVR, high when AVR is ready
    input cclk,
    // Outputs to the 8 onboard LEDs
    output[7:0]led,
    // AVR SPI connections
    output spi_miso,
    input spi_ss,
    input spi_mosi,
    input spi_sck,
    // AVR ADC channel select
    output [3:0] spi_channel,
    // Serial connections
    input avr_tx, // AVR Tx => FPGA Rx
    output avr_rx, // AVR Rx => FPGA Tx
    input avr_rx_busy,	 // AVR Rx buffer full
	 output reg R,
	 output wire G,
	 output wire B,
	 output wire vga_h_sync,
	 output wire vga_v_sync
	);
	
	parameter n=40;
	parameter m=25;
	
	wire [n*m-1:0] block;
	reg [n*m-1:0] test;
	wire [n*m-1:0]arr;
	
	wire vga_HS;
	wire vga_VS;
	wire c1;
	
	wire [9:0] CounterX;
	wire [9:0] CounterY;
	
	wire r = rst;


wire rst = ~rst_n; // make reset active high
// these signals should be high-z when not used
assign spi_miso = 1'bz;
assign avr_rx = 1'bz;
assign spi_channel = 4'bzzzz;


assign block[0] = ((CounterX>=250&&CounterX<260)&&(CounterY>=200&&CounterY<220));
assign block[1] = ((CounterX>=260&&CounterX<270)&&(CounterY>=200&&CounterY<220));
assign block[2] = ((CounterX>=270&&CounterX<280)&&(CounterY>=200&&CounterY<220));
assign block[3] = ((CounterX>=280&&CounterX<290)&&(CounterY>=200&&CounterY<220));
assign block[4] = ((CounterX>=290&&CounterX<300)&&(CounterY>=200&&CounterY<220));

assign block[5] = ((CounterX>=300&&CounterX<310)&&(CounterY>=200&&CounterY<220));
assign block[6] = ((CounterX>=310&&CounterX<320)&&(CounterY>=200&&CounterY<220));
assign block[7] = ((CounterX>=320&&CounterX<330)&&(CounterY>=200&&CounterY<220));
assign block[8] = ((CounterX>=330&&CounterX<340)&&(CounterY>=200&&CounterY<220));
assign block[9] = ((CounterX>=340&&CounterX<350)&&(CounterY>=200&&CounterY<220));
assign block[10] = ((CounterX>=350&&CounterX<360)&&(CounterY>=200&&CounterY<220));
assign block[11] = ((CounterX>=360&&CounterX<370)&&(CounterY>=200&&CounterY<220));
assign block[12] = ((CounterX>=370&&CounterX<380)&&(CounterY>=200&&CounterY<220));
assign block[13] = ((CounterX>=380&&CounterX<390)&&(CounterY>=200&&CounterY<220));
assign block[14] = ((CounterX>=390&&CounterX<400)&&(CounterY>=200&&CounterY<220));


assign block[15] = ((CounterX>=400&&CounterX<410)&&(CounterY>=200&&CounterY<220));
assign block[16] = ((CounterX>=410&&CounterX<420)&&(CounterY>=200&&CounterY<220));
assign block[17] = ((CounterX>=420&&CounterX<430)&&(CounterY>=200&&CounterY<220));
assign block[18] = ((CounterX>=430&&CounterX<440)&&(CounterY>=200&&CounterY<220));
assign block[19] = ((CounterX>=440&&CounterX<450)&&(CounterY>=200&&CounterY<220));
assign block[20] = ((CounterX>=450&&CounterX<460)&&(CounterY>=200&&CounterY<220));
assign block[21] = ((CounterX>=460&&CounterX<470)&&(CounterY>=200&&CounterY<220));
assign block[22] = ((CounterX>=470&&CounterX<480)&&(CounterY>=200&&CounterY<220));
assign block[23] = ((CounterX>=480&&CounterX<490)&&(CounterY>=200&&CounterY<220));
assign block[24] = ((CounterX>=490&&CounterX<500)&&(CounterY>=200&&CounterY<220));

assign block[25] = ((CounterX>=500&&CounterX<510)&&(CounterY>=200&&CounterY<220));
assign block[26] = ((CounterX>=510&&CounterX<520)&&(CounterY>=200&&CounterY<220));
assign block[27] = ((CounterX>=520&&CounterX<530)&&(CounterY>=200&&CounterY<220));
assign block[28] = ((CounterX>=530&&CounterX<540)&&(CounterY>=200&&CounterY<220));
assign block[29] = ((CounterX>=540&&CounterX<550)&&(CounterY>=200&&CounterY<220));
assign block[30] = ((CounterX>=550&&CounterX<560)&&(CounterY>=200&&CounterY<220));
assign block[31] = ((CounterX>=560&&CounterX<570)&&(CounterY>=200&&CounterY<220));
assign block[32] = ((CounterX>=570&&CounterX<580)&&(CounterY>=200&&CounterY<220));
assign block[33] = ((CounterX>=580&&CounterX<590)&&(CounterY>=200&&CounterY<220));
assign block[34] = ((CounterX>=590&&CounterX<600)&&(CounterY>=200&&CounterY<220));

assign block[35] = ((CounterX>=600&&CounterX<610)&&(CounterY>=200&&CounterY<220));
assign block[36] = ((CounterX>=610&&CounterX<620)&&(CounterY>=200&&CounterY<220));
assign block[37] = ((CounterX>=620&&CounterX<630)&&(CounterY>=200&&CounterY<220));
assign block[38] = ((CounterX>=630&&CounterX<640)&&(CounterY>=200&&CounterY<220));
assign block[39] = ((CounterX>=640&&CounterX<650)&&(CounterY>=200&&CounterY<220));


//////////////////////////////////////////////////////////////////////////////////////////////////


assign block[40] = ((CounterX>=250&&CounterX<260)&&(CounterY>=220&&CounterY<240));
assign block[41] = ((CounterX>=260&&CounterX<270)&&(CounterY>=220&&CounterY<240));
assign block[42] = ((CounterX>=270&&CounterX<280)&&(CounterY>=220&&CounterY<240));
assign block[43] = ((CounterX>=280&&CounterX<290)&&(CounterY>=220&&CounterY<240));
assign block[44] = ((CounterX>=290&&CounterX<300)&&(CounterY>=220&&CounterY<240));
assign block[45] = ((CounterX>=300&&CounterX<310)&&(CounterY>=220&&CounterY<240));
assign block[46] = ((CounterX>=310&&CounterX<320)&&(CounterY>=220&&CounterY<240));
assign block[47] = ((CounterX>=320&&CounterX<330)&&(CounterY>=220&&CounterY<240));
assign block[48] = ((CounterX>=330&&CounterX<340)&&(CounterY>=220&&CounterY<240));
assign block[49] = ((CounterX>=340&&CounterX<350)&&(CounterY>=220&&CounterY<240));
assign block[50] = ((CounterX>=350&&CounterX<360)&&(CounterY>=220&&CounterY<240));
assign block[51] = ((CounterX>=360&&CounterX<370)&&(CounterY>=220&&CounterY<240));
assign block[52] = ((CounterX>=370&&CounterX<380)&&(CounterY>=220&&CounterY<240));
assign block[53] = ((CounterX>=380&&CounterX<390)&&(CounterY>=220&&CounterY<240));
assign block[54] = ((CounterX>=390&&CounterX<400)&&(CounterY>=220&&CounterY<240));

assign block[55] = ((CounterX>=400&&CounterX<410)&&(CounterY>=220&&CounterY<240));
assign block[56] = ((CounterX>=410&&CounterX<420)&&(CounterY>=220&&CounterY<240));
assign block[57] = ((CounterX>=420&&CounterX<430)&&(CounterY>=220&&CounterY<240));
assign block[58] = ((CounterX>=430&&CounterX<440)&&(CounterY>=220&&CounterY<240));
assign block[59] = ((CounterX>=440&&CounterX<450)&&(CounterY>=220&&CounterY<240));
assign block[60] = ((CounterX>=450&&CounterX<460)&&(CounterY>=220&&CounterY<240));
assign block[61] = ((CounterX>=460&&CounterX<470)&&(CounterY>=220&&CounterY<240));
assign block[62] = ((CounterX>=470&&CounterX<480)&&(CounterY>=220&&CounterY<240));
assign block[63] = ((CounterX>=480&&CounterX<490)&&(CounterY>=220&&CounterY<240));
assign block[64] = ((CounterX>=490&&CounterX<500)&&(CounterY>=220&&CounterY<240));

assign block[65] = ((CounterX>=500&&CounterX<510)&&(CounterY>=220&&CounterY<240));
assign block[66] = ((CounterX>=510&&CounterX<520)&&(CounterY>=220&&CounterY<240));
assign block[67] = ((CounterX>=520&&CounterX<530)&&(CounterY>=220&&CounterY<240));
assign block[68] = ((CounterX>=530&&CounterX<540)&&(CounterY>=220&&CounterY<240));
assign block[69] = ((CounterX>=540&&CounterX<550)&&(CounterY>=220&&CounterY<240));
assign block[70] = ((CounterX>=550&&CounterX<560)&&(CounterY>=220&&CounterY<240));
assign block[71] = ((CounterX>=560&&CounterX<570)&&(CounterY>=220&&CounterY<240));
assign block[72] = ((CounterX>=570&&CounterX<580)&&(CounterY>=220&&CounterY<240));
assign block[73] = ((CounterX>=580&&CounterX<590)&&(CounterY>=220&&CounterY<240));
assign block[74] = ((CounterX>=590&&CounterX<600)&&(CounterY>=220&&CounterY<240));
assign block[75] = ((CounterX>=600&&CounterX<610)&&(CounterY>=220&&CounterY<240));
assign block[76] = ((CounterX>=610&&CounterX<620)&&(CounterY>=220&&CounterY<240));
assign block[77] = ((CounterX>=620&&CounterX<630)&&(CounterY>=220&&CounterY<240));
assign block[78] = ((CounterX>=630&&CounterX<640)&&(CounterY>=220&&CounterY<240));
assign block[79] = ((CounterX>=640&&CounterX<650)&&(CounterY>=220&&CounterY<240));


////////////////////////////////////////////////////////////////////////////////////////////////


assign block[80] = ((CounterX>=250&&CounterX<260)&&(CounterY>=240&&CounterY<260));
assign block[81] = ((CounterX>=260&&CounterX<270)&&(CounterY>=240&&CounterY<260));
assign block[82] = ((CounterX>=270&&CounterX<280)&&(CounterY>=240&&CounterY<260));
assign block[83] = ((CounterX>=280&&CounterX<290)&&(CounterY>=240&&CounterY<260));
assign block[84] = ((CounterX>=290&&CounterX<300)&&(CounterY>=240&&CounterY<260));

assign block[85] = ((CounterX>=300&&CounterX<310)&&(CounterY>=240&&CounterY<260));
assign block[86] = ((CounterX>=310&&CounterX<320)&&(CounterY>=240&&CounterY<260));
assign block[87] = ((CounterX>=320&&CounterX<330)&&(CounterY>=240&&CounterY<260));
assign block[88] = ((CounterX>=330&&CounterX<340)&&(CounterY>=240&&CounterY<260));
assign block[89] = ((CounterX>=340&&CounterX<350)&&(CounterY>=240&&CounterY<260));
assign block[90] = ((CounterX>=350&&CounterX<360)&&(CounterY>=240&&CounterY<260));
assign block[91] = ((CounterX>=360&&CounterX<370)&&(CounterY>=240&&CounterY<260));
assign block[92] = ((CounterX>=370&&CounterX<380)&&(CounterY>=240&&CounterY<260));
assign block[93] = ((CounterX>=380&&CounterX<390)&&(CounterY>=240&&CounterY<260));
assign block[94] = ((CounterX>=390&&CounterX<400)&&(CounterY>=240&&CounterY<260));

assign block[95] = ((CounterX>=400&&CounterX<410)&&(CounterY>=240&&CounterY<260));
assign block[96] = ((CounterX>=410&&CounterX<420)&&(CounterY>=240&&CounterY<260));
assign block[97] = ((CounterX>=420&&CounterX<430)&&(CounterY>=240&&CounterY<260));
assign block[98] = ((CounterX>=430&&CounterX<440)&&(CounterY>=240&&CounterY<260));
assign block[99] = ((CounterX>=440&&CounterX<450)&&(CounterY>=240&&CounterY<260));
assign block[100] = ((CounterX>=450&&CounterX<460)&&(CounterY>=240&&CounterY<260));
assign block[101] = ((CounterX>=460&&CounterX<470)&&(CounterY>=240&&CounterY<260));
assign block[102] = ((CounterX>=470&&CounterX<480)&&(CounterY>=240&&CounterY<260));
assign block[103] = ((CounterX>=480&&CounterX<490)&&(CounterY>=240&&CounterY<260));
assign block[104] = ((CounterX>=490&&CounterX<500)&&(CounterY>=240&&CounterY<260));

assign block[105] = ((CounterX>=500&&CounterX<510)&&(CounterY>=240&&CounterY<260));
assign block[106] = ((CounterX>=510&&CounterX<520)&&(CounterY>=240&&CounterY<260));
assign block[107] = ((CounterX>=520&&CounterX<530)&&(CounterY>=240&&CounterY<260));
assign block[108] = ((CounterX>=530&&CounterX<540)&&(CounterY>=240&&CounterY<260));
assign block[109] = ((CounterX>=540&&CounterX<550)&&(CounterY>=240&&CounterY<260));
assign block[110] = ((CounterX>=550&&CounterX<560)&&(CounterY>=240&&CounterY<260));
assign block[111] = ((CounterX>=560&&CounterX<570)&&(CounterY>=240&&CounterY<260));
assign block[112] = ((CounterX>=570&&CounterX<580)&&(CounterY>=240&&CounterY<260));
assign block[113] = ((CounterX>=580&&CounterX<590)&&(CounterY>=240&&CounterY<260));
assign block[114] = ((CounterX>=590&&CounterX<600)&&(CounterY>=240&&CounterY<260));
assign block[115] = ((CounterX>=600&&CounterX<610)&&(CounterY>=240&&CounterY<260));
assign block[116] = ((CounterX>=610&&CounterX<620)&&(CounterY>=240&&CounterY<260));
assign block[117] = ((CounterX>=620&&CounterX<630)&&(CounterY>=240&&CounterY<260));
assign block[118] = ((CounterX>=630&&CounterX<640)&&(CounterY>=240&&CounterY<260));
assign block[119] = ((CounterX>=640&&CounterX<650)&&(CounterY>=240&&CounterY<260));


//////////////////////////////////////////////////////////////////////////////////////////


assign block[120] = ((CounterX>=250&&CounterX<260)&&(CounterY>=260&&CounterY<280));
assign block[121] = ((CounterX>=260&&CounterX<270)&&(CounterY>=260&&CounterY<280));
assign block[122] = ((CounterX>=270&&CounterX<280)&&(CounterY>=260&&CounterY<280));
assign block[123] = ((CounterX>=280&&CounterX<290)&&(CounterY>=260&&CounterY<280));
assign block[124] = ((CounterX>=290&&CounterX<300)&&(CounterY>=260&&CounterY<280));
assign block[125] = ((CounterX>=300&&CounterX<310)&&(CounterY>=260&&CounterY<280));
assign block[126] = ((CounterX>=310&&CounterX<320)&&(CounterY>=260&&CounterY<280));
assign block[127] = ((CounterX>=320&&CounterX<330)&&(CounterY>=260&&CounterY<280));
assign block[128] = ((CounterX>=330&&CounterX<340)&&(CounterY>=260&&CounterY<280));
assign block[129] = ((CounterX>=340&&CounterX<350)&&(CounterY>=260&&CounterY<280));
assign block[130] = ((CounterX>=350&&CounterX<360)&&(CounterY>=260&&CounterY<280));
assign block[131] = ((CounterX>=360&&CounterX<370)&&(CounterY>=260&&CounterY<280));
assign block[132] = ((CounterX>=370&&CounterX<380)&&(CounterY>=260&&CounterY<280));
assign block[133] = ((CounterX>=380&&CounterX<390)&&(CounterY>=260&&CounterY<280));
assign block[134] = ((CounterX>=390&&CounterX<400)&&(CounterY>=260&&CounterY<280));


assign block[135] = ((CounterX>=400&&CounterX<410)&&(CounterY>=260&&CounterY<280));
assign block[136] = ((CounterX>=410&&CounterX<420)&&(CounterY>=260&&CounterY<280));
assign block[137] = ((CounterX>=420&&CounterX<430)&&(CounterY>=260&&CounterY<280));
assign block[138] = ((CounterX>=430&&CounterX<440)&&(CounterY>=260&&CounterY<280));
assign block[139] = ((CounterX>=440&&CounterX<450)&&(CounterY>=260&&CounterY<280));
assign block[140] = ((CounterX>=450&&CounterX<460)&&(CounterY>=260&&CounterY<280));
assign block[141] = ((CounterX>=460&&CounterX<470)&&(CounterY>=260&&CounterY<280));
assign block[142] = ((CounterX>=470&&CounterX<480)&&(CounterY>=260&&CounterY<280));
assign block[143] = ((CounterX>=480&&CounterX<490)&&(CounterY>=260&&CounterY<280));
assign block[144] = ((CounterX>=490&&CounterX<500)&&(CounterY>=260&&CounterY<280));
assign block[145] = ((CounterX>=500&&CounterX<510)&&(CounterY>=260&&CounterY<280));
assign block[146] = ((CounterX>=510&&CounterX<520)&&(CounterY>=260&&CounterY<280));
assign block[147] = ((CounterX>=520&&CounterX<530)&&(CounterY>=260&&CounterY<280));
assign block[148] = ((CounterX>=530&&CounterX<540)&&(CounterY>=260&&CounterY<280));
assign block[149] = ((CounterX>=540&&CounterX<550)&&(CounterY>=260&&CounterY<280));
assign block[150] = ((CounterX>=550&&CounterX<560)&&(CounterY>=260&&CounterY<280));
assign block[151] = ((CounterX>=560&&CounterX<570)&&(CounterY>=260&&CounterY<280));
assign block[152] = ((CounterX>=570&&CounterX<580)&&(CounterY>=260&&CounterY<280));
assign block[153] = ((CounterX>=580&&CounterX<590)&&(CounterY>=260&&CounterY<280));
assign block[154] = ((CounterX>=590&&CounterX<600)&&(CounterY>=260&&CounterY<280));
assign block[155] = ((CounterX>=600&&CounterX<610)&&(CounterY>=260&&CounterY<280));
assign block[156] = ((CounterX>=610&&CounterX<620)&&(CounterY>=260&&CounterY<280));
assign block[157] = ((CounterX>=620&&CounterX<630)&&(CounterY>=260&&CounterY<280));
assign block[158] = ((CounterX>=630&&CounterX<640)&&(CounterY>=260&&CounterY<280));
assign block[159] = ((CounterX>=640&&CounterX<650)&&(CounterY>=260&&CounterY<280));


/////////////////////////////////////////////////////////////////////////////////////////


assign block[160] = ((CounterX>=250&&CounterX<260)&&(CounterY>=280&&CounterY<300));
assign block[161] = ((CounterX>=260&&CounterX<270)&&(CounterY>=280&&CounterY<300));
assign block[162] = ((CounterX>=270&&CounterX<280)&&(CounterY>=280&&CounterY<300));
assign block[163] = ((CounterX>=280&&CounterX<290)&&(CounterY>=280&&CounterY<300));
assign block[164] = ((CounterX>=290&&CounterX<300)&&(CounterY>=280&&CounterY<300));

assign block[165] = ((CounterX>=300&&CounterX<310)&&(CounterY>=280&&CounterY<300));
assign block[166] = ((CounterX>=310&&CounterX<320)&&(CounterY>=280&&CounterY<300));
assign block[167] = ((CounterX>=320&&CounterX<330)&&(CounterY>=280&&CounterY<300));
assign block[168] = ((CounterX>=330&&CounterX<340)&&(CounterY>=280&&CounterY<300));
assign block[169] = ((CounterX>=340&&CounterX<350)&&(CounterY>=280&&CounterY<300));
assign block[170] = ((CounterX>=350&&CounterX<360)&&(CounterY>=280&&CounterY<300));
assign block[171] = ((CounterX>=360&&CounterX<370)&&(CounterY>=280&&CounterY<300));
assign block[172] = ((CounterX>=370&&CounterX<380)&&(CounterY>=280&&CounterY<300));
assign block[173] = ((CounterX>=380&&CounterX<390)&&(CounterY>=280&&CounterY<300));
assign block[174] = ((CounterX>=390&&CounterX<400)&&(CounterY>=280&&CounterY<300));


assign block[175] = ((CounterX>=400&&CounterX<410)&&(CounterY>=280&&CounterY<300));
assign block[176] = ((CounterX>=410&&CounterX<420)&&(CounterY>=280&&CounterY<300));
assign block[177] = ((CounterX>=420&&CounterX<430)&&(CounterY>=280&&CounterY<300));
assign block[178] = ((CounterX>=430&&CounterX<440)&&(CounterY>=280&&CounterY<300));
assign block[179] = ((CounterX>=440&&CounterX<450)&&(CounterY>=280&&CounterY<300));
assign block[180] = ((CounterX>=450&&CounterX<460)&&(CounterY>=280&&CounterY<300));
assign block[181] = ((CounterX>=460&&CounterX<470)&&(CounterY>=280&&CounterY<300));
assign block[182] = ((CounterX>=470&&CounterX<480)&&(CounterY>=280&&CounterY<300));
assign block[183] = ((CounterX>=480&&CounterX<490)&&(CounterY>=280&&CounterY<300));
assign block[184] = ((CounterX>=490&&CounterX<500)&&(CounterY>=280&&CounterY<300));

assign block[185] = ((CounterX>=500&&CounterX<510)&&(CounterY>=280&&CounterY<300));
assign block[186] = ((CounterX>=510&&CounterX<520)&&(CounterY>=280&&CounterY<300));
assign block[187] = ((CounterX>=520&&CounterX<530)&&(CounterY>=280&&CounterY<300));
assign block[188] = ((CounterX>=530&&CounterX<540)&&(CounterY>=280&&CounterY<300));
assign block[189] = ((CounterX>=540&&CounterX<550)&&(CounterY>=280&&CounterY<300));
assign block[190] = ((CounterX>=550&&CounterX<560)&&(CounterY>=280&&CounterY<300));
assign block[191] = ((CounterX>=560&&CounterX<570)&&(CounterY>=280&&CounterY<300));
assign block[192] = ((CounterX>=570&&CounterX<580)&&(CounterY>=280&&CounterY<300));
assign block[193] = ((CounterX>=580&&CounterX<590)&&(CounterY>=280&&CounterY<300));
assign block[194] = ((CounterX>=590&&CounterX<600)&&(CounterY>=280&&CounterY<300));

assign block[195] = ((CounterX>=600&&CounterX<610)&&(CounterY>=280&&CounterY<300));
assign block[196] = ((CounterX>=610&&CounterX<620)&&(CounterY>=280&&CounterY<300));
assign block[197] = ((CounterX>=620&&CounterX<630)&&(CounterY>=280&&CounterY<300));
assign block[198] = ((CounterX>=630&&CounterX<640)&&(CounterY>=280&&CounterY<300));
assign block[199] = ((CounterX>=640&&CounterX<650)&&(CounterY>=280&&CounterY<300));


///////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////


assign block[200] = ((CounterX>=250&&CounterX<260)&&(CounterY>=300&&CounterY<320));
assign block[201] = ((CounterX>=260&&CounterX<270)&&(CounterY>=300&&CounterY<320));
assign block[202] = ((CounterX>=270&&CounterX<280)&&(CounterY>=300&&CounterY<320));
assign block[203] = ((CounterX>=280&&CounterX<290)&&(CounterY>=300&&CounterY<320));
assign block[204] = ((CounterX>=290&&CounterX<300)&&(CounterY>=300&&CounterY<320));

assign block[205] = ((CounterX>=300&&CounterX<310)&&(CounterY>=300&&CounterY<320));
assign block[206] = ((CounterX>=310&&CounterX<320)&&(CounterY>=300&&CounterY<320));
assign block[207] = ((CounterX>=320&&CounterX<330)&&(CounterY>=300&&CounterY<320));
assign block[208] = ((CounterX>=330&&CounterX<340)&&(CounterY>=300&&CounterY<320));
assign block[209] = ((CounterX>=340&&CounterX<350)&&(CounterY>=300&&CounterY<320));
assign block[210] = ((CounterX>=350&&CounterX<360)&&(CounterY>=300&&CounterY<320));
assign block[211] = ((CounterX>=360&&CounterX<370)&&(CounterY>=300&&CounterY<320));
assign block[212] = ((CounterX>=370&&CounterX<380)&&(CounterY>=300&&CounterY<320));
assign block[213] = ((CounterX>=380&&CounterX<390)&&(CounterY>=300&&CounterY<320));
assign block[214] = ((CounterX>=390&&CounterX<400)&&(CounterY>=300&&CounterY<320));
assign block[215] = ((CounterX>=400&&CounterX<410)&&(CounterY>=300&&CounterY<320));
assign block[216] = ((CounterX>=410&&CounterX<420)&&(CounterY>=300&&CounterY<320));
assign block[217] = ((CounterX>=420&&CounterX<430)&&(CounterY>=300&&CounterY<320));
assign block[218] = ((CounterX>=430&&CounterX<440)&&(CounterY>=300&&CounterY<320));
assign block[219] = ((CounterX>=440&&CounterX<450)&&(CounterY>=300&&CounterY<320));
assign block[220] = ((CounterX>=450&&CounterX<460)&&(CounterY>=300&&CounterY<320));
assign block[221] = ((CounterX>=460&&CounterX<470)&&(CounterY>=300&&CounterY<320));
assign block[222] = ((CounterX>=470&&CounterX<480)&&(CounterY>=300&&CounterY<320));
assign block[223] = ((CounterX>=480&&CounterX<490)&&(CounterY>=300&&CounterY<320));
assign block[224] = ((CounterX>=490&&CounterX<500)&&(CounterY>=300&&CounterY<320));
assign block[225] = ((CounterX>=500&&CounterX<510)&&(CounterY>=300&&CounterY<320));
assign block[226] = ((CounterX>=510&&CounterX<520)&&(CounterY>=300&&CounterY<320));
assign block[227] = ((CounterX>=520&&CounterX<530)&&(CounterY>=300&&CounterY<320));
assign block[228] = ((CounterX>=530&&CounterX<540)&&(CounterY>=300&&CounterY<320));
assign block[229] = ((CounterX>=540&&CounterX<550)&&(CounterY>=300&&CounterY<320));
assign block[230] = ((CounterX>=550&&CounterX<560)&&(CounterY>=300&&CounterY<320));
assign block[231] = ((CounterX>=560&&CounterX<570)&&(CounterY>=300&&CounterY<320));
assign block[232] = ((CounterX>=570&&CounterX<580)&&(CounterY>=300&&CounterY<320));
assign block[233] = ((CounterX>=580&&CounterX<590)&&(CounterY>=300&&CounterY<320));
assign block[234] = ((CounterX>=590&&CounterX<600)&&(CounterY>=300&&CounterY<320));
assign block[235] = ((CounterX>=600&&CounterX<610)&&(CounterY>=300&&CounterY<320));
assign block[236] = ((CounterX>=610&&CounterX<620)&&(CounterY>=300&&CounterY<320));
assign block[237] = ((CounterX>=620&&CounterX<630)&&(CounterY>=300&&CounterY<320));
assign block[238] = ((CounterX>=630&&CounterX<640)&&(CounterY>=300&&CounterY<320));
assign block[239] = ((CounterX>=640&&CounterX<650)&&(CounterY>=300&&CounterY<320));


//////////////////////////////////////////////////////////////////////////////////////////////////

assign block[240] = ((CounterX>=250&&CounterX<260)&&(CounterY>=320&&CounterY<340));
assign block[241] = ((CounterX>=260&&CounterX<270)&&(CounterY>=320&&CounterY<340));
assign block[242] = ((CounterX>=270&&CounterX<280)&&(CounterY>=320&&CounterY<340));
assign block[243] = ((CounterX>=280&&CounterX<290)&&(CounterY>=320&&CounterY<340));
assign block[244] = ((CounterX>=290&&CounterX<300)&&(CounterY>=320&&CounterY<340));
assign block[245] = ((CounterX>=300&&CounterX<310)&&(CounterY>=320&&CounterY<340));
assign block[246] = ((CounterX>=310&&CounterX<320)&&(CounterY>=320&&CounterY<340));
assign block[247] = ((CounterX>=320&&CounterX<330)&&(CounterY>=320&&CounterY<340));
assign block[248] = ((CounterX>=330&&CounterX<340)&&(CounterY>=320&&CounterY<340));
assign block[249] = ((CounterX>=340&&CounterX<350)&&(CounterY>=320&&CounterY<340));
assign block[250] = ((CounterX>=350&&CounterX<360)&&(CounterY>=320&&CounterY<340));
assign block[251] = ((CounterX>=360&&CounterX<370)&&(CounterY>=320&&CounterY<340));
assign block[252] = ((CounterX>=370&&CounterX<380)&&(CounterY>=320&&CounterY<340));
assign block[253] = ((CounterX>=380&&CounterX<390)&&(CounterY>=320&&CounterY<340));
assign block[254] = ((CounterX>=390&&CounterX<400)&&(CounterY>=320&&CounterY<340));
assign block[255] = ((CounterX>=400&&CounterX<410)&&(CounterY>=320&&CounterY<340));
assign block[256] = ((CounterX>=410&&CounterX<420)&&(CounterY>=320&&CounterY<340));
assign block[257] = ((CounterX>=420&&CounterX<430)&&(CounterY>=320&&CounterY<340));
assign block[258] = ((CounterX>=430&&CounterX<440)&&(CounterY>=320&&CounterY<340));
assign block[259] = ((CounterX>=440&&CounterX<450)&&(CounterY>=320&&CounterY<340));
assign block[260] = ((CounterX>=450&&CounterX<460)&&(CounterY>=320&&CounterY<340));
assign block[261] = ((CounterX>=460&&CounterX<470)&&(CounterY>=320&&CounterY<340));
assign block[262] = ((CounterX>=470&&CounterX<480)&&(CounterY>=320&&CounterY<340));
assign block[263] = ((CounterX>=480&&CounterX<490)&&(CounterY>=320&&CounterY<340));
assign block[264] = ((CounterX>=490&&CounterX<500)&&(CounterY>=320&&CounterY<340));
assign block[265] = ((CounterX>=500&&CounterX<510)&&(CounterY>=320&&CounterY<340));
assign block[266] = ((CounterX>=510&&CounterX<520)&&(CounterY>=320&&CounterY<340));
assign block[267] = ((CounterX>=520&&CounterX<530)&&(CounterY>=320&&CounterY<340));
assign block[268] = ((CounterX>=530&&CounterX<540)&&(CounterY>=320&&CounterY<340));
assign block[269] = ((CounterX>=540&&CounterX<550)&&(CounterY>=320&&CounterY<340));
assign block[270] = ((CounterX>=550&&CounterX<560)&&(CounterY>=320&&CounterY<340));
assign block[271] = ((CounterX>=560&&CounterX<570)&&(CounterY>=320&&CounterY<340));
assign block[272] = ((CounterX>=570&&CounterX<580)&&(CounterY>=320&&CounterY<340));
assign block[273] = ((CounterX>=580&&CounterX<590)&&(CounterY>=320&&CounterY<340));
assign block[274] = ((CounterX>=590&&CounterX<600)&&(CounterY>=320&&CounterY<340));
assign block[275] = ((CounterX>=600&&CounterX<610)&&(CounterY>=320&&CounterY<340));
assign block[276] = ((CounterX>=610&&CounterX<620)&&(CounterY>=320&&CounterY<340));
assign block[277] = ((CounterX>=620&&CounterX<630)&&(CounterY>=320&&CounterY<340));
assign block[278] = ((CounterX>=630&&CounterX<640)&&(CounterY>=320&&CounterY<340));
assign block[279] = ((CounterX>=640&&CounterX<650)&&(CounterY>=320&&CounterY<340));


////////////////////////////////////////////////////////////////////////////////////////////////


assign block[280] = ((CounterX>=250&&CounterX<260)&&(CounterY>=340&&CounterY<360));
assign block[281] = ((CounterX>=260&&CounterX<270)&&(CounterY>=340&&CounterY<360));
assign block[282] = ((CounterX>=270&&CounterX<280)&&(CounterY>=340&&CounterY<360));
assign block[283] = ((CounterX>=280&&CounterX<290)&&(CounterY>=340&&CounterY<360));
assign block[284] = ((CounterX>=290&&CounterX<300)&&(CounterY>=340&&CounterY<360));
assign block[285] = ((CounterX>=300&&CounterX<310)&&(CounterY>=340&&CounterY<360));
assign block[286] = ((CounterX>=310&&CounterX<320)&&(CounterY>=340&&CounterY<360));
assign block[287] = ((CounterX>=320&&CounterX<330)&&(CounterY>=340&&CounterY<360));
assign block[288] = ((CounterX>=330&&CounterX<340)&&(CounterY>=340&&CounterY<360));
assign block[289] = ((CounterX>=340&&CounterX<350)&&(CounterY>=340&&CounterY<360));
assign block[290] = ((CounterX>=350&&CounterX<360)&&(CounterY>=340&&CounterY<360));
assign block[291] = ((CounterX>=360&&CounterX<370)&&(CounterY>=340&&CounterY<360));
assign block[292] = ((CounterX>=370&&CounterX<380)&&(CounterY>=340&&CounterY<360));
assign block[293] = ((CounterX>=380&&CounterX<390)&&(CounterY>=340&&CounterY<360));
assign block[294] = ((CounterX>=390&&CounterX<400)&&(CounterY>=340&&CounterY<360));
assign block[295] = ((CounterX>=400&&CounterX<410)&&(CounterY>=340&&CounterY<360));
assign block[296] = ((CounterX>=410&&CounterX<420)&&(CounterY>=340&&CounterY<360));
assign block[297] = ((CounterX>=420&&CounterX<430)&&(CounterY>=340&&CounterY<360));
assign block[298] = ((CounterX>=430&&CounterX<440)&&(CounterY>=340&&CounterY<360));
assign block[299] = ((CounterX>=440&&CounterX<450)&&(CounterY>=340&&CounterY<360));
assign block[300] = ((CounterX>=450&&CounterX<460)&&(CounterY>=340&&CounterY<360));
assign block[301] = ((CounterX>=460&&CounterX<470)&&(CounterY>=340&&CounterY<360));
assign block[302] = ((CounterX>=470&&CounterX<480)&&(CounterY>=340&&CounterY<360));
assign block[303] = ((CounterX>=480&&CounterX<490)&&(CounterY>=340&&CounterY<360));
assign block[304] = ((CounterX>=490&&CounterX<500)&&(CounterY>=340&&CounterY<360));
assign block[305] = ((CounterX>=500&&CounterX<510)&&(CounterY>=340&&CounterY<360));
assign block[306] = ((CounterX>=510&&CounterX<520)&&(CounterY>=340&&CounterY<360));
assign block[307] = ((CounterX>=520&&CounterX<530)&&(CounterY>=340&&CounterY<360));
assign block[308] = ((CounterX>=530&&CounterX<540)&&(CounterY>=340&&CounterY<360));
assign block[309] = ((CounterX>=540&&CounterX<550)&&(CounterY>=340&&CounterY<360));
assign block[310] = ((CounterX>=550&&CounterX<560)&&(CounterY>=340&&CounterY<360));
assign block[311] = ((CounterX>=560&&CounterX<570)&&(CounterY>=340&&CounterY<360));
assign block[312] = ((CounterX>=570&&CounterX<580)&&(CounterY>=340&&CounterY<360));
assign block[313] = ((CounterX>=580&&CounterX<590)&&(CounterY>=340&&CounterY<360));
assign block[314] = ((CounterX>=590&&CounterX<600)&&(CounterY>=340&&CounterY<360));

assign block[315] = ((CounterX>=600&&CounterX<610)&&(CounterY>=340&&CounterY<360));
assign block[316] = ((CounterX>=610&&CounterX<620)&&(CounterY>=340&&CounterY<360));
assign block[317] = ((CounterX>=620&&CounterX<630)&&(CounterY>=340&&CounterY<360));
assign block[318] = ((CounterX>=630&&CounterX<640)&&(CounterY>=340&&CounterY<360));
assign block[319] = ((CounterX>=640&&CounterX<650)&&(CounterY>=340&&CounterY<360));


//////////////////////////////////////////////////////////////////////////////////////////


assign block[320] = ((CounterX>=250&&CounterX<260)&&(CounterY>=360&&CounterY<380));
assign block[321] = ((CounterX>=260&&CounterX<270)&&(CounterY>=360&&CounterY<380));
assign block[322] = ((CounterX>=270&&CounterX<280)&&(CounterY>=360&&CounterY<380));
assign block[323] = ((CounterX>=280&&CounterX<290)&&(CounterY>=360&&CounterY<380));
assign block[324] = ((CounterX>=290&&CounterX<300)&&(CounterY>=360&&CounterY<380));
assign block[325] = ((CounterX>=300&&CounterX<310)&&(CounterY>=360&&CounterY<380));
assign block[326] = ((CounterX>=310&&CounterX<320)&&(CounterY>=360&&CounterY<380));
assign block[327] = ((CounterX>=320&&CounterX<330)&&(CounterY>=360&&CounterY<380));
assign block[328] = ((CounterX>=330&&CounterX<340)&&(CounterY>=360&&CounterY<380));
assign block[329] = ((CounterX>=340&&CounterX<350)&&(CounterY>=360&&CounterY<380));
assign block[330] = ((CounterX>=350&&CounterX<360)&&(CounterY>=360&&CounterY<380));
assign block[331] = ((CounterX>=360&&CounterX<370)&&(CounterY>=360&&CounterY<380));
assign block[332] = ((CounterX>=370&&CounterX<380)&&(CounterY>=360&&CounterY<380));
assign block[333] = ((CounterX>=380&&CounterX<390)&&(CounterY>=360&&CounterY<380));
assign block[334] = ((CounterX>=390&&CounterX<400)&&(CounterY>=360&&CounterY<380));
assign block[335] = ((CounterX>=400&&CounterX<410)&&(CounterY>=360&&CounterY<380));
assign block[336] = ((CounterX>=410&&CounterX<420)&&(CounterY>=360&&CounterY<380));
assign block[337] = ((CounterX>=420&&CounterX<430)&&(CounterY>=360&&CounterY<380));
assign block[338] = ((CounterX>=430&&CounterX<440)&&(CounterY>=360&&CounterY<380));
assign block[339] = ((CounterX>=440&&CounterX<450)&&(CounterY>=360&&CounterY<380));
assign block[340] = ((CounterX>=450&&CounterX<460)&&(CounterY>=360&&CounterY<380));
assign block[341] = ((CounterX>=460&&CounterX<470)&&(CounterY>=360&&CounterY<380));
assign block[342] = ((CounterX>=470&&CounterX<480)&&(CounterY>=360&&CounterY<380));
assign block[343] = ((CounterX>=480&&CounterX<490)&&(CounterY>=360&&CounterY<380));
assign block[344] = ((CounterX>=490&&CounterX<500)&&(CounterY>=360&&CounterY<380));
assign block[345] = ((CounterX>=500&&CounterX<510)&&(CounterY>=360&&CounterY<380));
assign block[346] = ((CounterX>=510&&CounterX<520)&&(CounterY>=360&&CounterY<380));
assign block[347] = ((CounterX>=520&&CounterX<530)&&(CounterY>=360&&CounterY<380));
assign block[348] = ((CounterX>=530&&CounterX<540)&&(CounterY>=360&&CounterY<380));
assign block[349] = ((CounterX>=540&&CounterX<550)&&(CounterY>=360&&CounterY<380));
assign block[350] = ((CounterX>=550&&CounterX<560)&&(CounterY>=360&&CounterY<380));
assign block[351] = ((CounterX>=560&&CounterX<570)&&(CounterY>=360&&CounterY<380));
assign block[352] = ((CounterX>=570&&CounterX<580)&&(CounterY>=360&&CounterY<380));
assign block[353] = ((CounterX>=580&&CounterX<590)&&(CounterY>=360&&CounterY<380));
assign block[354] = ((CounterX>=590&&CounterX<600)&&(CounterY>=360&&CounterY<380));

assign block[355] = ((CounterX>=600&&CounterX<610)&&(CounterY>=360&&CounterY<380));
assign block[356] = ((CounterX>=610&&CounterX<620)&&(CounterY>=360&&CounterY<380));
assign block[357] = ((CounterX>=620&&CounterX<630)&&(CounterY>=360&&CounterY<380));
assign block[358] = ((CounterX>=630&&CounterX<640)&&(CounterY>=360&&CounterY<380));
assign block[359] = ((CounterX>=640&&CounterX<650)&&(CounterY>=360&&CounterY<380));


/////////////////////////////////////////////////////////////////////////////////////////


assign block[360] = ((CounterX>=250&&CounterX<260)&&(CounterY>=380&&CounterY<400));
assign block[361] = ((CounterX>=260&&CounterX<270)&&(CounterY>=380&&CounterY<400));
assign block[362] = ((CounterX>=270&&CounterX<280)&&(CounterY>=380&&CounterY<400));
assign block[363] = ((CounterX>=280&&CounterX<290)&&(CounterY>=380&&CounterY<400));
assign block[364] = ((CounterX>=290&&CounterX<300)&&(CounterY>=380&&CounterY<400));
assign block[365] = ((CounterX>=300&&CounterX<310)&&(CounterY>=380&&CounterY<400));
assign block[366] = ((CounterX>=310&&CounterX<320)&&(CounterY>=380&&CounterY<400));
assign block[367] = ((CounterX>=320&&CounterX<330)&&(CounterY>=380&&CounterY<400));
assign block[368] = ((CounterX>=330&&CounterX<340)&&(CounterY>=380&&CounterY<400));
assign block[369] = ((CounterX>=340&&CounterX<350)&&(CounterY>=380&&CounterY<400));
assign block[370] = ((CounterX>=350&&CounterX<360)&&(CounterY>=380&&CounterY<400));
assign block[371] = ((CounterX>=360&&CounterX<370)&&(CounterY>=380&&CounterY<400));
assign block[372] = ((CounterX>=370&&CounterX<380)&&(CounterY>=380&&CounterY<400));
assign block[373] = ((CounterX>=380&&CounterX<390)&&(CounterY>=380&&CounterY<400));
assign block[374] = ((CounterX>=390&&CounterX<400)&&(CounterY>=380&&CounterY<400));
assign block[375] = ((CounterX>=400&&CounterX<410)&&(CounterY>=380&&CounterY<400));
assign block[376] = ((CounterX>=410&&CounterX<420)&&(CounterY>=380&&CounterY<400));
assign block[377] = ((CounterX>=420&&CounterX<430)&&(CounterY>=380&&CounterY<400));
assign block[378] = ((CounterX>=430&&CounterX<440)&&(CounterY>=380&&CounterY<400));
assign block[379] = ((CounterX>=440&&CounterX<450)&&(CounterY>=380&&CounterY<400));
assign block[380] = ((CounterX>=450&&CounterX<460)&&(CounterY>=380&&CounterY<400));
assign block[381] = ((CounterX>=460&&CounterX<470)&&(CounterY>=380&&CounterY<400));
assign block[382] = ((CounterX>=470&&CounterX<480)&&(CounterY>=380&&CounterY<400));
assign block[383] = ((CounterX>=480&&CounterX<490)&&(CounterY>=380&&CounterY<400));
assign block[384] = ((CounterX>=490&&CounterX<500)&&(CounterY>=380&&CounterY<400));
assign block[385] = ((CounterX>=500&&CounterX<510)&&(CounterY>=380&&CounterY<400));
assign block[386] = ((CounterX>=510&&CounterX<520)&&(CounterY>=380&&CounterY<400));
assign block[387] = ((CounterX>=520&&CounterX<530)&&(CounterY>=380&&CounterY<400));
assign block[388] = ((CounterX>=530&&CounterX<540)&&(CounterY>=380&&CounterY<400));
assign block[389] = ((CounterX>=540&&CounterX<550)&&(CounterY>=380&&CounterY<400));
assign block[390] = ((CounterX>=550&&CounterX<560)&&(CounterY>=380&&CounterY<400));
assign block[391] = ((CounterX>=560&&CounterX<570)&&(CounterY>=380&&CounterY<400));
assign block[392] = ((CounterX>=570&&CounterX<580)&&(CounterY>=380&&CounterY<400));
assign block[393] = ((CounterX>=580&&CounterX<590)&&(CounterY>=380&&CounterY<400));
assign block[394] = ((CounterX>=590&&CounterX<600)&&(CounterY>=380&&CounterY<400));
assign block[395] = ((CounterX>=600&&CounterX<610)&&(CounterY>=380&&CounterY<400));
assign block[396] = ((CounterX>=610&&CounterX<620)&&(CounterY>=380&&CounterY<400));
assign block[397] = ((CounterX>=620&&CounterX<630)&&(CounterY>=380&&CounterY<400));
assign block[398] = ((CounterX>=630&&CounterX<640)&&(CounterY>=380&&CounterY<400));
assign block[399] = ((CounterX>=640&&CounterX<650)&&(CounterY>=380&&CounterY<400));


///////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////


assign block[400] = ((CounterX>=250&&CounterX<260)&&(CounterY>=400&&CounterY<420));
assign block[401] = ((CounterX>=260&&CounterX<270)&&(CounterY>=400&&CounterY<420));
assign block[402] = ((CounterX>=270&&CounterX<280)&&(CounterY>=400&&CounterY<420));
assign block[403] = ((CounterX>=280&&CounterX<290)&&(CounterY>=400&&CounterY<420));
assign block[404] = ((CounterX>=290&&CounterX<300)&&(CounterY>=400&&CounterY<420));

assign block[405] = ((CounterX>=300&&CounterX<310)&&(CounterY>=400&&CounterY<420));
assign block[406] = ((CounterX>=310&&CounterX<320)&&(CounterY>=400&&CounterY<420));
assign block[407] = ((CounterX>=320&&CounterX<330)&&(CounterY>=400&&CounterY<420));
assign block[408] = ((CounterX>=330&&CounterX<340)&&(CounterY>=400&&CounterY<420));
assign block[409] = ((CounterX>=340&&CounterX<350)&&(CounterY>=400&&CounterY<420));
assign block[410] = ((CounterX>=350&&CounterX<360)&&(CounterY>=400&&CounterY<420));
assign block[411] = ((CounterX>=360&&CounterX<370)&&(CounterY>=400&&CounterY<420));
assign block[412] = ((CounterX>=370&&CounterX<380)&&(CounterY>=400&&CounterY<420));
assign block[413] = ((CounterX>=380&&CounterX<390)&&(CounterY>=400&&CounterY<420));
assign block[414] = ((CounterX>=390&&CounterX<400)&&(CounterY>=400&&CounterY<420));
assign block[415] = ((CounterX>=400&&CounterX<410)&&(CounterY>=400&&CounterY<420));
assign block[416] = ((CounterX>=410&&CounterX<420)&&(CounterY>=400&&CounterY<420));
assign block[417] = ((CounterX>=420&&CounterX<430)&&(CounterY>=400&&CounterY<420));
assign block[418] = ((CounterX>=430&&CounterX<440)&&(CounterY>=400&&CounterY<420));
assign block[419] = ((CounterX>=440&&CounterX<450)&&(CounterY>=400&&CounterY<420));
assign block[420] = ((CounterX>=450&&CounterX<460)&&(CounterY>=400&&CounterY<420));
assign block[421] = ((CounterX>=460&&CounterX<470)&&(CounterY>=400&&CounterY<420));
assign block[422] = ((CounterX>=470&&CounterX<480)&&(CounterY>=400&&CounterY<420));
assign block[423] = ((CounterX>=480&&CounterX<490)&&(CounterY>=400&&CounterY<420));
assign block[424] = ((CounterX>=490&&CounterX<500)&&(CounterY>=400&&CounterY<420));

assign block[425] = ((CounterX>=500&&CounterX<510)&&(CounterY>=400&&CounterY<420));
assign block[426] = ((CounterX>=510&&CounterX<520)&&(CounterY>=400&&CounterY<420));
assign block[427] = ((CounterX>=520&&CounterX<530)&&(CounterY>=400&&CounterY<420));
assign block[428] = ((CounterX>=530&&CounterX<540)&&(CounterY>=400&&CounterY<420));
assign block[429] = ((CounterX>=540&&CounterX<550)&&(CounterY>=400&&CounterY<420));
assign block[430] = ((CounterX>=550&&CounterX<560)&&(CounterY>=400&&CounterY<420));
assign block[431] = ((CounterX>=560&&CounterX<570)&&(CounterY>=400&&CounterY<420));
assign block[432] = ((CounterX>=570&&CounterX<580)&&(CounterY>=400&&CounterY<420));
assign block[433] = ((CounterX>=580&&CounterX<590)&&(CounterY>=400&&CounterY<420));
assign block[434] = ((CounterX>=590&&CounterX<600)&&(CounterY>=400&&CounterY<420));
assign block[435] = ((CounterX>=600&&CounterX<610)&&(CounterY>=400&&CounterY<420));
assign block[436] = ((CounterX>=610&&CounterX<620)&&(CounterY>=400&&CounterY<420));
assign block[437] = ((CounterX>=620&&CounterX<630)&&(CounterY>=400&&CounterY<420));
assign block[438] = ((CounterX>=630&&CounterX<640)&&(CounterY>=400&&CounterY<420));
assign block[439] = ((CounterX>=640&&CounterX<650)&&(CounterY>=400&&CounterY<420));


//////////////////////////////////////////////////////////////////////////////////////////////////


assign block[440] = ((CounterX>=250&&CounterX<260)&&(CounterY>=420&&CounterY<440));
assign block[441] = ((CounterX>=260&&CounterX<270)&&(CounterY>=420&&CounterY<440));
assign block[442] = ((CounterX>=270&&CounterX<280)&&(CounterY>=420&&CounterY<440));
assign block[443] = ((CounterX>=280&&CounterX<290)&&(CounterY>=420&&CounterY<440));
assign block[444] = ((CounterX>=290&&CounterX<300)&&(CounterY>=420&&CounterY<440));
assign block[445] = ((CounterX>=300&&CounterX<310)&&(CounterY>=420&&CounterY<440));
assign block[446] = ((CounterX>=310&&CounterX<320)&&(CounterY>=420&&CounterY<440));
assign block[447] = ((CounterX>=320&&CounterX<330)&&(CounterY>=420&&CounterY<440));
assign block[448] = ((CounterX>=330&&CounterX<340)&&(CounterY>=420&&CounterY<440));
assign block[449] = ((CounterX>=340&&CounterX<350)&&(CounterY>=420&&CounterY<440));
assign block[450] = ((CounterX>=350&&CounterX<360)&&(CounterY>=420&&CounterY<440));
assign block[451] = ((CounterX>=360&&CounterX<370)&&(CounterY>=420&&CounterY<440));
assign block[452] = ((CounterX>=370&&CounterX<380)&&(CounterY>=420&&CounterY<440));
assign block[453] = ((CounterX>=380&&CounterX<390)&&(CounterY>=420&&CounterY<440));
assign block[454] = ((CounterX>=390&&CounterX<400)&&(CounterY>=420&&CounterY<440));
assign block[455] = ((CounterX>=400&&CounterX<410)&&(CounterY>=420&&CounterY<440));
assign block[456] = ((CounterX>=410&&CounterX<420)&&(CounterY>=420&&CounterY<440));
assign block[457] = ((CounterX>=420&&CounterX<430)&&(CounterY>=420&&CounterY<440));
assign block[458] = ((CounterX>=430&&CounterX<440)&&(CounterY>=420&&CounterY<440));
assign block[459] = ((CounterX>=440&&CounterX<450)&&(CounterY>=420&&CounterY<440));
assign block[460] = ((CounterX>=450&&CounterX<460)&&(CounterY>=420&&CounterY<440));
assign block[461] = ((CounterX>=460&&CounterX<470)&&(CounterY>=420&&CounterY<440));
assign block[462] = ((CounterX>=470&&CounterX<480)&&(CounterY>=420&&CounterY<440));
assign block[463] = ((CounterX>=480&&CounterX<490)&&(CounterY>=420&&CounterY<440));
assign block[464] = ((CounterX>=490&&CounterX<500)&&(CounterY>=420&&CounterY<440));
assign block[465] = ((CounterX>=500&&CounterX<510)&&(CounterY>=420&&CounterY<440));
assign block[466] = ((CounterX>=510&&CounterX<520)&&(CounterY>=420&&CounterY<440));
assign block[467] = ((CounterX>=520&&CounterX<530)&&(CounterY>=420&&CounterY<440));
assign block[468] = ((CounterX>=530&&CounterX<540)&&(CounterY>=420&&CounterY<440));
assign block[469] = ((CounterX>=540&&CounterX<550)&&(CounterY>=420&&CounterY<440));
assign block[470] = ((CounterX>=550&&CounterX<560)&&(CounterY>=420&&CounterY<440));
assign block[471] = ((CounterX>=560&&CounterX<570)&&(CounterY>=420&&CounterY<440));
assign block[472] = ((CounterX>=570&&CounterX<580)&&(CounterY>=420&&CounterY<440));
assign block[473] = ((CounterX>=580&&CounterX<590)&&(CounterY>=420&&CounterY<440));
assign block[474] = ((CounterX>=590&&CounterX<600)&&(CounterY>=420&&CounterY<440));
assign block[475] = ((CounterX>=600&&CounterX<610)&&(CounterY>=420&&CounterY<440));
assign block[476] = ((CounterX>=610&&CounterX<620)&&(CounterY>=420&&CounterY<440));
assign block[477] = ((CounterX>=620&&CounterX<630)&&(CounterY>=420&&CounterY<440));
assign block[478] = ((CounterX>=630&&CounterX<640)&&(CounterY>=420&&CounterY<440));
assign block[479] = ((CounterX>=640&&CounterX<650)&&(CounterY>=420&&CounterY<440));


////////////////////////////////////////////////////////////////////////////////////////////////


assign block[480] = ((CounterX>=250&&CounterX<260)&&(CounterY>=440&&CounterY<460));
assign block[481] = ((CounterX>=260&&CounterX<270)&&(CounterY>=440&&CounterY<460));
assign block[482] = ((CounterX>=270&&CounterX<280)&&(CounterY>=440&&CounterY<460));
assign block[483] = ((CounterX>=280&&CounterX<290)&&(CounterY>=440&&CounterY<460));
assign block[484] = ((CounterX>=290&&CounterX<300)&&(CounterY>=440&&CounterY<460));

assign block[485] = ((CounterX>=300&&CounterX<310)&&(CounterY>=440&&CounterY<460));
assign block[486] = ((CounterX>=310&&CounterX<320)&&(CounterY>=440&&CounterY<460));
assign block[487] = ((CounterX>=320&&CounterX<330)&&(CounterY>=440&&CounterY<460));
assign block[488] = ((CounterX>=330&&CounterX<340)&&(CounterY>=440&&CounterY<460));
assign block[489] = ((CounterX>=340&&CounterX<350)&&(CounterY>=440&&CounterY<460));
assign block[490] = ((CounterX>=350&&CounterX<360)&&(CounterY>=440&&CounterY<460));
assign block[491] = ((CounterX>=360&&CounterX<370)&&(CounterY>=440&&CounterY<460));
assign block[492] = ((CounterX>=370&&CounterX<380)&&(CounterY>=440&&CounterY<460));
assign block[493] = ((CounterX>=380&&CounterX<390)&&(CounterY>=440&&CounterY<460));
assign block[494] = ((CounterX>=390&&CounterX<400)&&(CounterY>=440&&CounterY<460));

assign block[495] = ((CounterX>=400&&CounterX<410)&&(CounterY>=440&&CounterY<460));
assign block[496] = ((CounterX>=410&&CounterX<420)&&(CounterY>=440&&CounterY<460));
assign block[497] = ((CounterX>=420&&CounterX<430)&&(CounterY>=440&&CounterY<460));
assign block[498] = ((CounterX>=430&&CounterX<440)&&(CounterY>=440&&CounterY<460));
assign block[499] = ((CounterX>=440&&CounterX<450)&&(CounterY>=440&&CounterY<460));
assign block[500] = ((CounterX>=450&&CounterX<460)&&(CounterY>=440&&CounterY<460));
assign block[501] = ((CounterX>=460&&CounterX<470)&&(CounterY>=440&&CounterY<460));
assign block[502] = ((CounterX>=470&&CounterX<480)&&(CounterY>=440&&CounterY<460));
assign block[503] = ((CounterX>=480&&CounterX<490)&&(CounterY>=440&&CounterY<460));
assign block[504] = ((CounterX>=490&&CounterX<500)&&(CounterY>=440&&CounterY<460));

assign block[505] = ((CounterX>=500&&CounterX<510)&&(CounterY>=440&&CounterY<460));
assign block[506] = ((CounterX>=510&&CounterX<520)&&(CounterY>=440&&CounterY<460));
assign block[507] = ((CounterX>=520&&CounterX<530)&&(CounterY>=440&&CounterY<460));
assign block[508] = ((CounterX>=530&&CounterX<540)&&(CounterY>=440&&CounterY<460));
assign block[509] = ((CounterX>=540&&CounterX<550)&&(CounterY>=440&&CounterY<460));
assign block[510] = ((CounterX>=550&&CounterX<560)&&(CounterY>=440&&CounterY<460));
assign block[511] = ((CounterX>=560&&CounterX<570)&&(CounterY>=440&&CounterY<460));
assign block[512] = ((CounterX>=570&&CounterX<580)&&(CounterY>=440&&CounterY<460));
assign block[513] = ((CounterX>=580&&CounterX<590)&&(CounterY>=440&&CounterY<460));
assign block[514] = ((CounterX>=590&&CounterX<600)&&(CounterY>=440&&CounterY<460));

assign block[515] = ((CounterX>=600&&CounterX<610)&&(CounterY>=440&&CounterY<460));
assign block[516] = ((CounterX>=610&&CounterX<620)&&(CounterY>=440&&CounterY<460));
assign block[517] = ((CounterX>=620&&CounterX<630)&&(CounterY>=440&&CounterY<460));
assign block[518] = ((CounterX>=630&&CounterX<640)&&(CounterY>=440&&CounterY<460));
assign block[519] = ((CounterX>=640&&CounterX<650)&&(CounterY>=440&&CounterY<460));


//////////////////////////////////////////////////////////////////////////////////////////


assign block[520] = ((CounterX>=250&&CounterX<260)&&(CounterY>=460&&CounterY<480));
assign block[521] = ((CounterX>=260&&CounterX<270)&&(CounterY>=460&&CounterY<480));
assign block[522] = ((CounterX>=270&&CounterX<280)&&(CounterY>=460&&CounterY<480));
assign block[523] = ((CounterX>=280&&CounterX<290)&&(CounterY>=460&&CounterY<480));
assign block[524] = ((CounterX>=290&&CounterX<300)&&(CounterY>=460&&CounterY<480));

assign block[525] = ((CounterX>=300&&CounterX<310)&&(CounterY>=460&&CounterY<480));
assign block[526] = ((CounterX>=310&&CounterX<320)&&(CounterY>=460&&CounterY<480));
assign block[527] = ((CounterX>=320&&CounterX<330)&&(CounterY>=460&&CounterY<480));
assign block[528] = ((CounterX>=330&&CounterX<340)&&(CounterY>=460&&CounterY<480));
assign block[529] = ((CounterX>=340&&CounterX<350)&&(CounterY>=460&&CounterY<480));
assign block[530] = ((CounterX>=350&&CounterX<360)&&(CounterY>=460&&CounterY<480));
assign block[531] = ((CounterX>=360&&CounterX<370)&&(CounterY>=460&&CounterY<480));
assign block[532] = ((CounterX>=370&&CounterX<380)&&(CounterY>=460&&CounterY<480));
assign block[533] = ((CounterX>=380&&CounterX<390)&&(CounterY>=460&&CounterY<480));
assign block[534] = ((CounterX>=390&&CounterX<400)&&(CounterY>=460&&CounterY<480));


assign block[535] = ((CounterX>=400&&CounterX<410)&&(CounterY>=460&&CounterY<480));
assign block[536] = ((CounterX>=410&&CounterX<420)&&(CounterY>=460&&CounterY<480));
assign block[537] = ((CounterX>=420&&CounterX<430)&&(CounterY>=460&&CounterY<480));
assign block[538] = ((CounterX>=430&&CounterX<440)&&(CounterY>=460&&CounterY<480));
assign block[539] = ((CounterX>=440&&CounterX<450)&&(CounterY>=460&&CounterY<480));
assign block[540] = ((CounterX>=450&&CounterX<460)&&(CounterY>=460&&CounterY<480));
assign block[541] = ((CounterX>=460&&CounterX<470)&&(CounterY>=460&&CounterY<480));
assign block[542] = ((CounterX>=470&&CounterX<480)&&(CounterY>=460&&CounterY<480));
assign block[543] = ((CounterX>=480&&CounterX<490)&&(CounterY>=460&&CounterY<480));
assign block[544] = ((CounterX>=490&&CounterX<500)&&(CounterY>=460&&CounterY<480));

assign block[545] = ((CounterX>=500&&CounterX<510)&&(CounterY>=460&&CounterY<480));
assign block[546] = ((CounterX>=510&&CounterX<520)&&(CounterY>=460&&CounterY<480));
assign block[547] = ((CounterX>=520&&CounterX<530)&&(CounterY>=460&&CounterY<480));
assign block[548] = ((CounterX>=530&&CounterX<540)&&(CounterY>=460&&CounterY<480));
assign block[549] = ((CounterX>=540&&CounterX<550)&&(CounterY>=460&&CounterY<480));
assign block[550] = ((CounterX>=550&&CounterX<560)&&(CounterY>=460&&CounterY<480));
assign block[551] = ((CounterX>=560&&CounterX<570)&&(CounterY>=460&&CounterY<480));
assign block[552] = ((CounterX>=570&&CounterX<580)&&(CounterY>=460&&CounterY<480));
assign block[553] = ((CounterX>=580&&CounterX<590)&&(CounterY>=460&&CounterY<480));
assign block[554] = ((CounterX>=590&&CounterX<600)&&(CounterY>=460&&CounterY<480));
assign block[555] = ((CounterX>=600&&CounterX<610)&&(CounterY>=460&&CounterY<480));
assign block[556] = ((CounterX>=610&&CounterX<620)&&(CounterY>=460&&CounterY<480));
assign block[557] = ((CounterX>=620&&CounterX<630)&&(CounterY>=460&&CounterY<480));
assign block[558] = ((CounterX>=630&&CounterX<640)&&(CounterY>=460&&CounterY<480));
assign block[559] = ((CounterX>=640&&CounterX<650)&&(CounterY>=460&&CounterY<480));


/////////////////////////////////////////////////////////////////////////////////////////


assign block[560] = ((CounterX>=250&&CounterX<260)&&(CounterY>=480&&CounterY<500));
assign block[561] = ((CounterX>=260&&CounterX<270)&&(CounterY>=480&&CounterY<500));
assign block[562] = ((CounterX>=270&&CounterX<280)&&(CounterY>=480&&CounterY<500));
assign block[563] = ((CounterX>=280&&CounterX<290)&&(CounterY>=480&&CounterY<500));
assign block[564] = ((CounterX>=290&&CounterX<300)&&(CounterY>=480&&CounterY<500));

assign block[565] = ((CounterX>=300&&CounterX<310)&&(CounterY>=480&&CounterY<500));
assign block[566] = ((CounterX>=310&&CounterX<320)&&(CounterY>=480&&CounterY<500));
assign block[567] = ((CounterX>=320&&CounterX<330)&&(CounterY>=480&&CounterY<500));
assign block[568] = ((CounterX>=330&&CounterX<340)&&(CounterY>=480&&CounterY<500));
assign block[569] = ((CounterX>=340&&CounterX<350)&&(CounterY>=480&&CounterY<500));
assign block[570] = ((CounterX>=350&&CounterX<360)&&(CounterY>=480&&CounterY<500));
assign block[571] = ((CounterX>=360&&CounterX<370)&&(CounterY>=480&&CounterY<500));
assign block[572] = ((CounterX>=370&&CounterX<380)&&(CounterY>=480&&CounterY<500));
assign block[573] = ((CounterX>=380&&CounterX<390)&&(CounterY>=480&&CounterY<500));
assign block[574] = ((CounterX>=390&&CounterX<400)&&(CounterY>=480&&CounterY<500));


assign block[575] = ((CounterX>=400&&CounterX<410)&&(CounterY>=480&&CounterY<500));
assign block[576] = ((CounterX>=410&&CounterX<420)&&(CounterY>=480&&CounterY<500));
assign block[577] = ((CounterX>=420&&CounterX<430)&&(CounterY>=480&&CounterY<500));
assign block[578] = ((CounterX>=430&&CounterX<440)&&(CounterY>=480&&CounterY<500));
assign block[579] = ((CounterX>=440&&CounterX<450)&&(CounterY>=480&&CounterY<500));
assign block[580] = ((CounterX>=450&&CounterX<460)&&(CounterY>=480&&CounterY<500));
assign block[581] = ((CounterX>=460&&CounterX<470)&&(CounterY>=480&&CounterY<500));
assign block[582] = ((CounterX>=470&&CounterX<480)&&(CounterY>=480&&CounterY<500));
assign block[583] = ((CounterX>=480&&CounterX<490)&&(CounterY>=480&&CounterY<500));
assign block[584] = ((CounterX>=490&&CounterX<500)&&(CounterY>=480&&CounterY<500));

assign block[585] = ((CounterX>=500&&CounterX<510)&&(CounterY>=480&&CounterY<500));
assign block[586] = ((CounterX>=510&&CounterX<520)&&(CounterY>=480&&CounterY<500));
assign block[587] = ((CounterX>=520&&CounterX<530)&&(CounterY>=480&&CounterY<500));
assign block[588] = ((CounterX>=530&&CounterX<540)&&(CounterY>=480&&CounterY<500));
assign block[589] = ((CounterX>=540&&CounterX<550)&&(CounterY>=480&&CounterY<500));
assign block[590] = ((CounterX>=550&&CounterX<560)&&(CounterY>=480&&CounterY<500));
assign block[591] = ((CounterX>=560&&CounterX<570)&&(CounterY>=480&&CounterY<500));
assign block[592] = ((CounterX>=570&&CounterX<580)&&(CounterY>=480&&CounterY<500));
assign block[593] = ((CounterX>=580&&CounterX<590)&&(CounterY>=480&&CounterY<500));
assign block[594] = ((CounterX>=590&&CounterX<600)&&(CounterY>=480&&CounterY<500));

assign block[595] = ((CounterX>=600&&CounterX<610)&&(CounterY>=480&&CounterY<500));
assign block[596] = ((CounterX>=610&&CounterX<620)&&(CounterY>=480&&CounterY<500));
assign block[597] = ((CounterX>=620&&CounterX<630)&&(CounterY>=480&&CounterY<500));
assign block[598] = ((CounterX>=630&&CounterX<640)&&(CounterY>=480&&CounterY<500));
assign block[599] = ((CounterX>=640&&CounterX<650)&&(CounterY>=480&&CounterY<500));


///////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////


assign block[600] = ((CounterX>=250&&CounterX<260)&&(CounterY>=500&&CounterY<520));
assign block[601] = ((CounterX>=260&&CounterX<270)&&(CounterY>=500&&CounterY<520));
assign block[602] = ((CounterX>=270&&CounterX<280)&&(CounterY>=500&&CounterY<520));
assign block[603] = ((CounterX>=280&&CounterX<290)&&(CounterY>=500&&CounterY<520));
assign block[604] = ((CounterX>=290&&CounterX<300)&&(CounterY>=500&&CounterY<520));

assign block[605] = ((CounterX>=300&&CounterX<310)&&(CounterY>=500&&CounterY<520));
assign block[606] = ((CounterX>=310&&CounterX<320)&&(CounterY>=500&&CounterY<520));
assign block[607] = ((CounterX>=320&&CounterX<330)&&(CounterY>=500&&CounterY<520));
assign block[608] = ((CounterX>=330&&CounterX<340)&&(CounterY>=500&&CounterY<520));
assign block[609] = ((CounterX>=340&&CounterX<350)&&(CounterY>=500&&CounterY<520));
assign block[610] = ((CounterX>=350&&CounterX<360)&&(CounterY>=500&&CounterY<520));
assign block[611] = ((CounterX>=360&&CounterX<370)&&(CounterY>=500&&CounterY<520));
assign block[612] = ((CounterX>=370&&CounterX<380)&&(CounterY>=500&&CounterY<520));
assign block[613] = ((CounterX>=380&&CounterX<390)&&(CounterY>=500&&CounterY<520));
assign block[614] = ((CounterX>=390&&CounterX<400)&&(CounterY>=500&&CounterY<520));


assign block[615] = ((CounterX>=400&&CounterX<410)&&(CounterY>=500&&CounterY<520));
assign block[616] = ((CounterX>=410&&CounterX<420)&&(CounterY>=500&&CounterY<520));
assign block[617] = ((CounterX>=420&&CounterX<430)&&(CounterY>=500&&CounterY<520));
assign block[618] = ((CounterX>=430&&CounterX<440)&&(CounterY>=500&&CounterY<520));
assign block[619] = ((CounterX>=440&&CounterX<450)&&(CounterY>=500&&CounterY<520));
assign block[620] = ((CounterX>=450&&CounterX<460)&&(CounterY>=500&&CounterY<520));
assign block[621] = ((CounterX>=460&&CounterX<470)&&(CounterY>=500&&CounterY<520));
assign block[622] = ((CounterX>=470&&CounterX<480)&&(CounterY>=500&&CounterY<520));
assign block[623] = ((CounterX>=480&&CounterX<490)&&(CounterY>=500&&CounterY<520));
assign block[624] = ((CounterX>=490&&CounterX<500)&&(CounterY>=500&&CounterY<520));

assign block[625] = ((CounterX>=500&&CounterX<510)&&(CounterY>=500&&CounterY<520));
assign block[626] = ((CounterX>=510&&CounterX<520)&&(CounterY>=500&&CounterY<520));
assign block[627] = ((CounterX>=520&&CounterX<530)&&(CounterY>=500&&CounterY<520));
assign block[628] = ((CounterX>=530&&CounterX<540)&&(CounterY>=500&&CounterY<520));
assign block[629] = ((CounterX>=540&&CounterX<550)&&(CounterY>=500&&CounterY<520));
assign block[630] = ((CounterX>=550&&CounterX<560)&&(CounterY>=500&&CounterY<520));
assign block[631] = ((CounterX>=560&&CounterX<570)&&(CounterY>=500&&CounterY<520));
assign block[632] = ((CounterX>=570&&CounterX<580)&&(CounterY>=500&&CounterY<520));
assign block[633] = ((CounterX>=580&&CounterX<590)&&(CounterY>=500&&CounterY<520));
assign block[634] = ((CounterX>=590&&CounterX<600)&&(CounterY>=500&&CounterY<520));

assign block[635] = ((CounterX>=600&&CounterX<610)&&(CounterY>=500&&CounterY<520));
assign block[636] = ((CounterX>=610&&CounterX<620)&&(CounterY>=500&&CounterY<520));
assign block[637] = ((CounterX>=620&&CounterX<630)&&(CounterY>=500&&CounterY<520));
assign block[638] = ((CounterX>=630&&CounterX<640)&&(CounterY>=500&&CounterY<520));
assign block[639] = ((CounterX>=640&&CounterX<650)&&(CounterY>=500&&CounterY<520));


//////////////////////////////////////////////////////////////////////////////////////////////////

assign block[640] = ((CounterX>=250&&CounterX<260)&&(CounterY>=520&&CounterY<540));
assign block[641] = ((CounterX>=260&&CounterX<270)&&(CounterY>=520&&CounterY<540));
assign block[642] = ((CounterX>=270&&CounterX<280)&&(CounterY>=520&&CounterY<540));
assign block[643] = ((CounterX>=280&&CounterX<290)&&(CounterY>=520&&CounterY<540));
assign block[644] = ((CounterX>=290&&CounterX<300)&&(CounterY>=520&&CounterY<540));

assign block[645] = ((CounterX>=300&&CounterX<310)&&(CounterY>=520&&CounterY<540));
assign block[646] = ((CounterX>=310&&CounterX<320)&&(CounterY>=520&&CounterY<540));
assign block[647] = ((CounterX>=320&&CounterX<330)&&(CounterY>=520&&CounterY<540));
assign block[648] = ((CounterX>=330&&CounterX<340)&&(CounterY>=520&&CounterY<540));
assign block[649] = ((CounterX>=340&&CounterX<350)&&(CounterY>=520&&CounterY<540));
assign block[650] = ((CounterX>=350&&CounterX<360)&&(CounterY>=520&&CounterY<540));
assign block[651] = ((CounterX>=360&&CounterX<370)&&(CounterY>=520&&CounterY<540));
assign block[652] = ((CounterX>=370&&CounterX<380)&&(CounterY>=520&&CounterY<540));
assign block[653] = ((CounterX>=380&&CounterX<390)&&(CounterY>=520&&CounterY<540));
assign block[654] = ((CounterX>=390&&CounterX<400)&&(CounterY>=520&&CounterY<540));

assign block[655] = ((CounterX>=400&&CounterX<410)&&(CounterY>=520&&CounterY<540));
assign block[656] = ((CounterX>=410&&CounterX<420)&&(CounterY>=520&&CounterY<540));
assign block[657] = ((CounterX>=420&&CounterX<430)&&(CounterY>=520&&CounterY<540));
assign block[658] = ((CounterX>=430&&CounterX<440)&&(CounterY>=520&&CounterY<540));
assign block[659] = ((CounterX>=440&&CounterX<450)&&(CounterY>=520&&CounterY<540));
assign block[660] = ((CounterX>=450&&CounterX<460)&&(CounterY>=520&&CounterY<540));
assign block[661] = ((CounterX>=460&&CounterX<470)&&(CounterY>=520&&CounterY<540));
assign block[662] = ((CounterX>=470&&CounterX<480)&&(CounterY>=520&&CounterY<540));
assign block[663] = ((CounterX>=480&&CounterX<490)&&(CounterY>=520&&CounterY<540));
assign block[664] = ((CounterX>=490&&CounterX<500)&&(CounterY>=520&&CounterY<540));

assign block[665] = ((CounterX>=500&&CounterX<510)&&(CounterY>=520&&CounterY<540));
assign block[666] = ((CounterX>=510&&CounterX<520)&&(CounterY>=520&&CounterY<540));
assign block[667] = ((CounterX>=520&&CounterX<530)&&(CounterY>=520&&CounterY<540));
assign block[668] = ((CounterX>=530&&CounterX<540)&&(CounterY>=520&&CounterY<540));
assign block[669] = ((CounterX>=540&&CounterX<550)&&(CounterY>=520&&CounterY<540));
assign block[670] = ((CounterX>=550&&CounterX<560)&&(CounterY>=520&&CounterY<540));
assign block[671] = ((CounterX>=560&&CounterX<570)&&(CounterY>=520&&CounterY<540));
assign block[672] = ((CounterX>=570&&CounterX<580)&&(CounterY>=520&&CounterY<540));
assign block[673] = ((CounterX>=580&&CounterX<590)&&(CounterY>=520&&CounterY<540));
assign block[674] = ((CounterX>=590&&CounterX<600)&&(CounterY>=520&&CounterY<540));

assign block[675] = ((CounterX>=600&&CounterX<610)&&(CounterY>=520&&CounterY<540));
assign block[676] = ((CounterX>=610&&CounterX<620)&&(CounterY>=520&&CounterY<540));
assign block[677] = ((CounterX>=620&&CounterX<630)&&(CounterY>=520&&CounterY<540));
assign block[678] = ((CounterX>=630&&CounterX<640)&&(CounterY>=520&&CounterY<540));
assign block[679] = ((CounterX>=640&&CounterX<650)&&(CounterY>=520&&CounterY<540));


////////////////////////////////////////////////////////////////////////////////////////////////


assign block[680] = ((CounterX>=250&&CounterX<260)&&(CounterY>=540&&CounterY<560));
assign block[681] = ((CounterX>=260&&CounterX<270)&&(CounterY>=540&&CounterY<560));
assign block[682] = ((CounterX>=270&&CounterX<280)&&(CounterY>=540&&CounterY<560));
assign block[683] = ((CounterX>=280&&CounterX<290)&&(CounterY>=540&&CounterY<560));
assign block[684] = ((CounterX>=290&&CounterX<300)&&(CounterY>=540&&CounterY<560));

assign block[685] = ((CounterX>=300&&CounterX<310)&&(CounterY>=540&&CounterY<560));
assign block[686] = ((CounterX>=310&&CounterX<320)&&(CounterY>=540&&CounterY<560));
assign block[687] = ((CounterX>=320&&CounterX<330)&&(CounterY>=540&&CounterY<560));
assign block[688] = ((CounterX>=330&&CounterX<340)&&(CounterY>=540&&CounterY<560));
assign block[689] = ((CounterX>=340&&CounterX<350)&&(CounterY>=540&&CounterY<560));
assign block[690] = ((CounterX>=350&&CounterX<360)&&(CounterY>=540&&CounterY<560));
assign block[691] = ((CounterX>=360&&CounterX<370)&&(CounterY>=540&&CounterY<560));
assign block[692] = ((CounterX>=370&&CounterX<380)&&(CounterY>=540&&CounterY<560));
assign block[693] = ((CounterX>=380&&CounterX<390)&&(CounterY>=540&&CounterY<560));
assign block[694] = ((CounterX>=390&&CounterX<400)&&(CounterY>=540&&CounterY<560));

assign block[695] = ((CounterX>=400&&CounterX<410)&&(CounterY>=540&&CounterY<560));
assign block[696] = ((CounterX>=410&&CounterX<420)&&(CounterY>=540&&CounterY<560));
assign block[697] = ((CounterX>=420&&CounterX<430)&&(CounterY>=540&&CounterY<560));
assign block[698] = ((CounterX>=430&&CounterX<440)&&(CounterY>=540&&CounterY<560));
assign block[699] = ((CounterX>=440&&CounterX<450)&&(CounterY>=540&&CounterY<560));
assign block[700] = ((CounterX>=450&&CounterX<460)&&(CounterY>=540&&CounterY<560));
assign block[701] = ((CounterX>=460&&CounterX<470)&&(CounterY>=540&&CounterY<560));
assign block[702] = ((CounterX>=470&&CounterX<480)&&(CounterY>=540&&CounterY<560));
assign block[703] = ((CounterX>=480&&CounterX<490)&&(CounterY>=540&&CounterY<560));
assign block[704] = ((CounterX>=490&&CounterX<500)&&(CounterY>=540&&CounterY<560));

assign block[705] = ((CounterX>=500&&CounterX<510)&&(CounterY>=540&&CounterY<560));
assign block[706] = ((CounterX>=510&&CounterX<520)&&(CounterY>=540&&CounterY<560));
assign block[707] = ((CounterX>=520&&CounterX<530)&&(CounterY>=540&&CounterY<560));
assign block[708] = ((CounterX>=530&&CounterX<540)&&(CounterY>=540&&CounterY<560));
assign block[709] = ((CounterX>=540&&CounterX<550)&&(CounterY>=540&&CounterY<560));
assign block[710] = ((CounterX>=550&&CounterX<560)&&(CounterY>=540&&CounterY<560));
assign block[711] = ((CounterX>=560&&CounterX<570)&&(CounterY>=540&&CounterY<560));
assign block[712] = ((CounterX>=570&&CounterX<580)&&(CounterY>=540&&CounterY<560));
assign block[713] = ((CounterX>=580&&CounterX<590)&&(CounterY>=540&&CounterY<560));
assign block[714] = ((CounterX>=590&&CounterX<600)&&(CounterY>=540&&CounterY<560));

assign block[715] = ((CounterX>=600&&CounterX<610)&&(CounterY>=540&&CounterY<560));
assign block[716] = ((CounterX>=610&&CounterX<620)&&(CounterY>=540&&CounterY<560));
assign block[717] = ((CounterX>=620&&CounterX<630)&&(CounterY>=540&&CounterY<560));
assign block[718] = ((CounterX>=630&&CounterX<640)&&(CounterY>=540&&CounterY<560));
assign block[719] = ((CounterX>=640&&CounterX<650)&&(CounterY>=540&&CounterY<560));


/////////////////////////////////////////////////////////////////////////////////////////


assign block[720] = ((CounterX>=250&&CounterX<260)&&(CounterY>=560&&CounterY<580));
assign block[721] = ((CounterX>=260&&CounterX<270)&&(CounterY>=560&&CounterY<580));
assign block[722] = ((CounterX>=270&&CounterX<280)&&(CounterY>=560&&CounterY<580));
assign block[723] = ((CounterX>=280&&CounterX<290)&&(CounterY>=560&&CounterY<580));
assign block[724] = ((CounterX>=290&&CounterX<300)&&(CounterY>=560&&CounterY<580));

assign block[725] = ((CounterX>=300&&CounterX<310)&&(CounterY>=560&&CounterY<580));
assign block[726] = ((CounterX>=310&&CounterX<320)&&(CounterY>=560&&CounterY<580));
assign block[727] = ((CounterX>=320&&CounterX<330)&&(CounterY>=560&&CounterY<580));
assign block[728] = ((CounterX>=330&&CounterX<340)&&(CounterY>=560&&CounterY<580));
assign block[729] = ((CounterX>=340&&CounterX<350)&&(CounterY>=560&&CounterY<580));
assign block[730] = ((CounterX>=350&&CounterX<360)&&(CounterY>=560&&CounterY<580));
assign block[731] = ((CounterX>=360&&CounterX<370)&&(CounterY>=560&&CounterY<580));
assign block[732] = ((CounterX>=370&&CounterX<380)&&(CounterY>=560&&CounterY<580));
assign block[733] = ((CounterX>=380&&CounterX<390)&&(CounterY>=560&&CounterY<580));
assign block[734] = ((CounterX>=390&&CounterX<400)&&(CounterY>=560&&CounterY<580));

assign block[735] = ((CounterX>=400&&CounterX<410)&&(CounterY>=560&&CounterY<580));
assign block[736] = ((CounterX>=410&&CounterX<420)&&(CounterY>=560&&CounterY<580));
assign block[737] = ((CounterX>=420&&CounterX<430)&&(CounterY>=560&&CounterY<580));
assign block[738] = ((CounterX>=430&&CounterX<440)&&(CounterY>=560&&CounterY<580));
assign block[739] = ((CounterX>=440&&CounterX<450)&&(CounterY>=560&&CounterY<580));
assign block[740] = ((CounterX>=450&&CounterX<460)&&(CounterY>=560&&CounterY<580));
assign block[741] = ((CounterX>=460&&CounterX<470)&&(CounterY>=560&&CounterY<580));
assign block[742] = ((CounterX>=470&&CounterX<480)&&(CounterY>=560&&CounterY<580));
assign block[743] = ((CounterX>=480&&CounterX<490)&&(CounterY>=560&&CounterY<580));
assign block[744] = ((CounterX>=490&&CounterX<500)&&(CounterY>=560&&CounterY<580));

assign block[745] = ((CounterX>=500&&CounterX<510)&&(CounterY>=560&&CounterY<580));
assign block[746] = ((CounterX>=510&&CounterX<520)&&(CounterY>=560&&CounterY<580));
assign block[747] = ((CounterX>=520&&CounterX<530)&&(CounterY>=560&&CounterY<580));
assign block[748] = ((CounterX>=530&&CounterX<540)&&(CounterY>=560&&CounterY<580));
assign block[749] = ((CounterX>=540&&CounterX<550)&&(CounterY>=560&&CounterY<580));
assign block[750] = ((CounterX>=550&&CounterX<560)&&(CounterY>=560&&CounterY<580));
assign block[751] = ((CounterX>=560&&CounterX<570)&&(CounterY>=560&&CounterY<580));
assign block[752] = ((CounterX>=570&&CounterX<580)&&(CounterY>=560&&CounterY<580));
assign block[753] = ((CounterX>=580&&CounterX<590)&&(CounterY>=560&&CounterY<580));
assign block[754] = ((CounterX>=590&&CounterX<600)&&(CounterY>=560&&CounterY<580));

assign block[755] = ((CounterX>=600&&CounterX<610)&&(CounterY>=560&&CounterY<580));
assign block[756] = ((CounterX>=610&&CounterX<620)&&(CounterY>=560&&CounterY<580));
assign block[757] = ((CounterX>=620&&CounterX<630)&&(CounterY>=560&&CounterY<580));
assign block[758] = ((CounterX>=630&&CounterX<640)&&(CounterY>=560&&CounterY<580));
assign block[759] = ((CounterX>=640&&CounterX<650)&&(CounterY>=560&&CounterY<580));


/////////////////////////////////////////////////////////////////////////////////////////


assign block[760] = ((CounterX>=250&&CounterX<260)&&(CounterY>=580&&CounterY<600));
assign block[761] = ((CounterX>=260&&CounterX<270)&&(CounterY>=580&&CounterY<600));
assign block[762] = ((CounterX>=270&&CounterX<280)&&(CounterY>=580&&CounterY<600));
assign block[763] = ((CounterX>=280&&CounterX<290)&&(CounterY>=580&&CounterY<600));
assign block[764] = ((CounterX>=290&&CounterX<300)&&(CounterY>=580&&CounterY<600));

assign block[765] = ((CounterX>=300&&CounterX<310)&&(CounterY>=580&&CounterY<600));
assign block[766] = ((CounterX>=310&&CounterX<320)&&(CounterY>=580&&CounterY<600));
assign block[767] = ((CounterX>=320&&CounterX<330)&&(CounterY>=580&&CounterY<600));
assign block[768] = ((CounterX>=330&&CounterX<340)&&(CounterY>=580&&CounterY<600));
assign block[769] = ((CounterX>=340&&CounterX<350)&&(CounterY>=580&&CounterY<600));
assign block[770] = ((CounterX>=350&&CounterX<360)&&(CounterY>=580&&CounterY<600));
assign block[771] = ((CounterX>=360&&CounterX<370)&&(CounterY>=580&&CounterY<600));
assign block[772] = ((CounterX>=370&&CounterX<380)&&(CounterY>=580&&CounterY<600));
assign block[773] = ((CounterX>=380&&CounterX<390)&&(CounterY>=580&&CounterY<600));
assign block[774] = ((CounterX>=390&&CounterX<400)&&(CounterY>=580&&CounterY<600));

assign block[775] = ((CounterX>=400&&CounterX<410)&&(CounterY>=580&&CounterY<600));
assign block[776] = ((CounterX>=410&&CounterX<420)&&(CounterY>=580&&CounterY<600));
assign block[777] = ((CounterX>=420&&CounterX<430)&&(CounterY>=580&&CounterY<600));
assign block[778] = ((CounterX>=430&&CounterX<440)&&(CounterY>=580&&CounterY<600));
assign block[779] = ((CounterX>=440&&CounterX<450)&&(CounterY>=580&&CounterY<600));
assign block[780] = ((CounterX>=450&&CounterX<460)&&(CounterY>=580&&CounterY<600));
assign block[781] = ((CounterX>=460&&CounterX<470)&&(CounterY>=580&&CounterY<600));
assign block[782] = ((CounterX>=470&&CounterX<480)&&(CounterY>=580&&CounterY<600));
assign block[783] = ((CounterX>=480&&CounterX<490)&&(CounterY>=580&&CounterY<600));
assign block[784] = ((CounterX>=490&&CounterX<500)&&(CounterY>=580&&CounterY<600));

assign block[785] = ((CounterX>=500&&CounterX<510)&&(CounterY>=580&&CounterY<600));
assign block[786] = ((CounterX>=510&&CounterX<520)&&(CounterY>=580&&CounterY<600));
assign block[787] = ((CounterX>=520&&CounterX<530)&&(CounterY>=580&&CounterY<600));
assign block[788] = ((CounterX>=530&&CounterX<540)&&(CounterY>=580&&CounterY<600));
assign block[789] = ((CounterX>=540&&CounterX<550)&&(CounterY>=580&&CounterY<600));
assign block[790] = ((CounterX>=550&&CounterX<560)&&(CounterY>=580&&CounterY<600));
assign block[791] = ((CounterX>=560&&CounterX<570)&&(CounterY>=580&&CounterY<600));
assign block[792] = ((CounterX>=570&&CounterX<580)&&(CounterY>=580&&CounterY<600));
assign block[793] = ((CounterX>=580&&CounterX<590)&&(CounterY>=580&&CounterY<600));
assign block[794] = ((CounterX>=590&&CounterX<600)&&(CounterY>=580&&CounterY<600));

assign block[795] = ((CounterX>=600&&CounterX<610)&&(CounterY>=580&&CounterY<600));
assign block[796] = ((CounterX>=610&&CounterX<620)&&(CounterY>=580&&CounterY<600));
assign block[797] = ((CounterX>=620&&CounterX<630)&&(CounterY>=580&&CounterY<600));
assign block[798] = ((CounterX>=630&&CounterX<640)&&(CounterY>=580&&CounterY<600));
assign block[799] = ((CounterX>=640&&CounterX<650)&&(CounterY>=580&&CounterY<600));



///////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////




assign block[800] = ((CounterX>=250&&CounterX<260)&&(CounterY>=600&&CounterY<620));
assign block[801] = ((CounterX>=260&&CounterX<270)&&(CounterY>=600&&CounterY<620));
assign block[802] = ((CounterX>=270&&CounterX<280)&&(CounterY>=600&&CounterY<620));
assign block[803] = ((CounterX>=280&&CounterX<290)&&(CounterY>=600&&CounterY<620));
assign block[804] = ((CounterX>=290&&CounterX<300)&&(CounterY>=600&&CounterY<620));

assign block[805] = ((CounterX>=300&&CounterX<310)&&(CounterY>=600&&CounterY<620));
assign block[806] = ((CounterX>=310&&CounterX<320)&&(CounterY>=600&&CounterY<620));
assign block[807] = ((CounterX>=320&&CounterX<330)&&(CounterY>=600&&CounterY<620));
assign block[808] = ((CounterX>=330&&CounterX<340)&&(CounterY>=600&&CounterY<620));
assign block[809] = ((CounterX>=340&&CounterX<350)&&(CounterY>=600&&CounterY<620));
assign block[810] = ((CounterX>=350&&CounterX<360)&&(CounterY>=600&&CounterY<620));
assign block[811] = ((CounterX>=360&&CounterX<370)&&(CounterY>=600&&CounterY<620));
assign block[812] = ((CounterX>=370&&CounterX<380)&&(CounterY>=600&&CounterY<620));
assign block[813] = ((CounterX>=380&&CounterX<390)&&(CounterY>=600&&CounterY<620));
assign block[814] = ((CounterX>=390&&CounterX<400)&&(CounterY>=600&&CounterY<620));


assign block[815] = ((CounterX>=400&&CounterX<410)&&(CounterY>=600&&CounterY<620));
assign block[816] = ((CounterX>=410&&CounterX<420)&&(CounterY>=600&&CounterY<620));
assign block[817] = ((CounterX>=420&&CounterX<430)&&(CounterY>=600&&CounterY<620));
assign block[818] = ((CounterX>=430&&CounterX<440)&&(CounterY>=600&&CounterY<620));
assign block[819] = ((CounterX>=440&&CounterX<450)&&(CounterY>=600&&CounterY<620));
assign block[820] = ((CounterX>=450&&CounterX<460)&&(CounterY>=600&&CounterY<620));
assign block[821] = ((CounterX>=460&&CounterX<470)&&(CounterY>=600&&CounterY<620));
assign block[822] = ((CounterX>=470&&CounterX<480)&&(CounterY>=600&&CounterY<620));
assign block[823] = ((CounterX>=480&&CounterX<490)&&(CounterY>=600&&CounterY<620));
assign block[824] = ((CounterX>=490&&CounterX<500)&&(CounterY>=600&&CounterY<620));
assign block[825] = ((CounterX>=500&&CounterX<510)&&(CounterY>=600&&CounterY<620));
assign block[826] = ((CounterX>=510&&CounterX<520)&&(CounterY>=600&&CounterY<620));
assign block[827] = ((CounterX>=520&&CounterX<530)&&(CounterY>=600&&CounterY<620));
assign block[828] = ((CounterX>=530&&CounterX<540)&&(CounterY>=600&&CounterY<620));
assign block[829] = ((CounterX>=540&&CounterX<550)&&(CounterY>=600&&CounterY<620));
assign block[830] = ((CounterX>=550&&CounterX<560)&&(CounterY>=600&&CounterY<620));
assign block[831] = ((CounterX>=560&&CounterX<570)&&(CounterY>=600&&CounterY<620));
assign block[832] = ((CounterX>=570&&CounterX<580)&&(CounterY>=600&&CounterY<620));
assign block[833] = ((CounterX>=580&&CounterX<590)&&(CounterY>=600&&CounterY<620));
assign block[834] = ((CounterX>=590&&CounterX<600)&&(CounterY>=600&&CounterY<620));

assign block[835] = ((CounterX>=600&&CounterX<610)&&(CounterY>=600&&CounterY<620));
assign block[836] = ((CounterX>=610&&CounterX<620)&&(CounterY>=600&&CounterY<620));
assign block[837] = ((CounterX>=620&&CounterX<630)&&(CounterY>=600&&CounterY<620));
assign block[838] = ((CounterX>=630&&CounterX<640)&&(CounterY>=600&&CounterY<620));
assign block[839] = ((CounterX>=640&&CounterX<650)&&(CounterY>=600&&CounterY<620));

//////////////////////////////////////////////////////////////////////////////////////////////////


assign block[840] = ((CounterX>=250&&CounterX<260)&&(CounterY>=620&&CounterY<640));
assign block[841] = ((CounterX>=260&&CounterX<270)&&(CounterY>=620&&CounterY<640));
assign block[842] = ((CounterX>=270&&CounterX<280)&&(CounterY>=620&&CounterY<640));
assign block[843] = ((CounterX>=280&&CounterX<290)&&(CounterY>=620&&CounterY<640));
assign block[844] = ((CounterX>=290&&CounterX<300)&&(CounterY>=620&&CounterY<640));
assign block[845] = ((CounterX>=300&&CounterX<310)&&(CounterY>=620&&CounterY<640));
assign block[846] = ((CounterX>=310&&CounterX<320)&&(CounterY>=620&&CounterY<640));
assign block[847] = ((CounterX>=320&&CounterX<330)&&(CounterY>=620&&CounterY<640));
assign block[848] = ((CounterX>=330&&CounterX<340)&&(CounterY>=620&&CounterY<640));
assign block[849] = ((CounterX>=340&&CounterX<350)&&(CounterY>=620&&CounterY<640));
assign block[850] = ((CounterX>=350&&CounterX<360)&&(CounterY>=620&&CounterY<640));
assign block[851] = ((CounterX>=360&&CounterX<370)&&(CounterY>=620&&CounterY<640));
assign block[852] = ((CounterX>=370&&CounterX<380)&&(CounterY>=620&&CounterY<640));
assign block[853] = ((CounterX>=380&&CounterX<390)&&(CounterY>=620&&CounterY<640));
assign block[854] = ((CounterX>=390&&CounterX<400)&&(CounterY>=620&&CounterY<640));
assign block[855] = ((CounterX>=400&&CounterX<410)&&(CounterY>=620&&CounterY<640));
assign block[856] = ((CounterX>=410&&CounterX<420)&&(CounterY>=620&&CounterY<640));
assign block[857] = ((CounterX>=420&&CounterX<430)&&(CounterY>=620&&CounterY<640));
assign block[858] = ((CounterX>=430&&CounterX<440)&&(CounterY>=620&&CounterY<640));
assign block[859] = ((CounterX>=440&&CounterX<450)&&(CounterY>=620&&CounterY<640));
assign block[860] = ((CounterX>=450&&CounterX<460)&&(CounterY>=620&&CounterY<640));
assign block[861] = ((CounterX>=460&&CounterX<470)&&(CounterY>=620&&CounterY<640));
assign block[862] = ((CounterX>=470&&CounterX<480)&&(CounterY>=620&&CounterY<640));
assign block[863] = ((CounterX>=480&&CounterX<490)&&(CounterY>=620&&CounterY<640));
assign block[864] = ((CounterX>=490&&CounterX<500)&&(CounterY>=620&&CounterY<640));

assign block[865] = ((CounterX>=500&&CounterX<510)&&(CounterY>=620&&CounterY<640));
assign block[866] = ((CounterX>=510&&CounterX<520)&&(CounterY>=620&&CounterY<640));
assign block[867] = ((CounterX>=520&&CounterX<530)&&(CounterY>=620&&CounterY<640));
assign block[868] = ((CounterX>=530&&CounterX<540)&&(CounterY>=620&&CounterY<640));
assign block[869] = ((CounterX>=540&&CounterX<550)&&(CounterY>=620&&CounterY<640));
assign block[870] = ((CounterX>=550&&CounterX<560)&&(CounterY>=620&&CounterY<640));
assign block[871] = ((CounterX>=560&&CounterX<570)&&(CounterY>=620&&CounterY<640));
assign block[872] = ((CounterX>=570&&CounterX<580)&&(CounterY>=620&&CounterY<640));
assign block[873] = ((CounterX>=580&&CounterX<590)&&(CounterY>=620&&CounterY<640));
assign block[874] = ((CounterX>=590&&CounterX<600)&&(CounterY>=620&&CounterY<640));
assign block[875] = ((CounterX>=600&&CounterX<610)&&(CounterY>=620&&CounterY<640));
assign block[876] = ((CounterX>=610&&CounterX<620)&&(CounterY>=620&&CounterY<640));
assign block[877] = ((CounterX>=620&&CounterX<630)&&(CounterY>=620&&CounterY<640));
assign block[878] = ((CounterX>=630&&CounterX<640)&&(CounterY>=620&&CounterY<640));
assign block[879] = ((CounterX>=640&&CounterX<650)&&(CounterY>=620&&CounterY<640));
////////////////////////////////////////////////////////////////////////////////////////////////


assign block[880] = ((CounterX>=250&&CounterX<260)&&(CounterY>=640&&CounterY<660));
assign block[881] = ((CounterX>=260&&CounterX<270)&&(CounterY>=640&&CounterY<660));
assign block[882] = ((CounterX>=270&&CounterX<280)&&(CounterY>=640&&CounterY<660));
assign block[883] = ((CounterX>=280&&CounterX<290)&&(CounterY>=640&&CounterY<660));
assign block[884] = ((CounterX>=290&&CounterX<300)&&(CounterY>=640&&CounterY<660));
assign block[885] = ((CounterX>=300&&CounterX<310)&&(CounterY>=640&&CounterY<660));
assign block[886] = ((CounterX>=310&&CounterX<320)&&(CounterY>=640&&CounterY<660));
assign block[887] = ((CounterX>=320&&CounterX<330)&&(CounterY>=640&&CounterY<660));
assign block[888] = ((CounterX>=330&&CounterX<340)&&(CounterY>=640&&CounterY<660));
assign block[889] = ((CounterX>=340&&CounterX<350)&&(CounterY>=640&&CounterY<660));
assign block[890] = ((CounterX>=350&&CounterX<360)&&(CounterY>=640&&CounterY<660));
assign block[891] = ((CounterX>=360&&CounterX<370)&&(CounterY>=640&&CounterY<660));
assign block[892] = ((CounterX>=370&&CounterX<380)&&(CounterY>=640&&CounterY<660));
assign block[893] = ((CounterX>=380&&CounterX<390)&&(CounterY>=640&&CounterY<660));
assign block[894] = ((CounterX>=390&&CounterX<400)&&(CounterY>=640&&CounterY<660));

assign block[895] = ((CounterX>=400&&CounterX<410)&&(CounterY>=640&&CounterY<660));
assign block[896] = ((CounterX>=410&&CounterX<420)&&(CounterY>=640&&CounterY<660));
assign block[897] = ((CounterX>=420&&CounterX<430)&&(CounterY>=640&&CounterY<660));
assign block[898] = ((CounterX>=430&&CounterX<440)&&(CounterY>=640&&CounterY<660));
assign block[899] = ((CounterX>=440&&CounterX<450)&&(CounterY>=640&&CounterY<660));
assign block[900] = ((CounterX>=450&&CounterX<460)&&(CounterY>=640&&CounterY<660));
assign block[901] = ((CounterX>=460&&CounterX<470)&&(CounterY>=640&&CounterY<660));
assign block[902] = ((CounterX>=470&&CounterX<480)&&(CounterY>=640&&CounterY<660));
assign block[903] = ((CounterX>=480&&CounterX<490)&&(CounterY>=640&&CounterY<660));
assign block[904] = ((CounterX>=490&&CounterX<500)&&(CounterY>=640&&CounterY<660));
assign block[905] = ((CounterX>=500&&CounterX<510)&&(CounterY>=640&&CounterY<660));
assign block[906] = ((CounterX>=510&&CounterX<520)&&(CounterY>=640&&CounterY<660));
assign block[907] = ((CounterX>=520&&CounterX<530)&&(CounterY>=640&&CounterY<660));
assign block[908] = ((CounterX>=530&&CounterX<540)&&(CounterY>=640&&CounterY<660));
assign block[909] = ((CounterX>=540&&CounterX<550)&&(CounterY>=640&&CounterY<660));
assign block[910] = ((CounterX>=550&&CounterX<560)&&(CounterY>=640&&CounterY<660));
assign block[911] = ((CounterX>=560&&CounterX<570)&&(CounterY>=640&&CounterY<660));
assign block[912] = ((CounterX>=570&&CounterX<580)&&(CounterY>=640&&CounterY<660));
assign block[913] = ((CounterX>=580&&CounterX<590)&&(CounterY>=640&&CounterY<660));
assign block[914] = ((CounterX>=590&&CounterX<600)&&(CounterY>=640&&CounterY<660));
assign block[915] = ((CounterX>=600&&CounterX<610)&&(CounterY>=640&&CounterY<660));
assign block[916] = ((CounterX>=610&&CounterX<620)&&(CounterY>=640&&CounterY<660));
assign block[917] = ((CounterX>=620&&CounterX<630)&&(CounterY>=640&&CounterY<660));
assign block[918] = ((CounterX>=630&&CounterX<640)&&(CounterY>=640&&CounterY<660));
assign block[919] = ((CounterX>=640&&CounterX<650)&&(CounterY>=640&&CounterY<660));
//////////////////////////////////////////////////////////////////////////////////////////


assign block[920] = ((CounterX>=250&&CounterX<260)&&(CounterY>=660&&CounterY<680));
assign block[921] = ((CounterX>=260&&CounterX<270)&&(CounterY>=660&&CounterY<680));
assign block[922] = ((CounterX>=270&&CounterX<280)&&(CounterY>=660&&CounterY<680));
assign block[923] = ((CounterX>=280&&CounterX<290)&&(CounterY>=660&&CounterY<680));
assign block[924] = ((CounterX>=290&&CounterX<300)&&(CounterY>=660&&CounterY<680));
assign block[925] = ((CounterX>=300&&CounterX<310)&&(CounterY>=660&&CounterY<680));
assign block[926] = ((CounterX>=310&&CounterX<320)&&(CounterY>=660&&CounterY<680));
assign block[927] = ((CounterX>=320&&CounterX<330)&&(CounterY>=660&&CounterY<680));
assign block[928] = ((CounterX>=330&&CounterX<340)&&(CounterY>=660&&CounterY<680));
assign block[929] = ((CounterX>=340&&CounterX<350)&&(CounterY>=660&&CounterY<680));
assign block[930] = ((CounterX>=350&&CounterX<360)&&(CounterY>=660&&CounterY<680));
assign block[931] = ((CounterX>=360&&CounterX<370)&&(CounterY>=660&&CounterY<680));
assign block[932] = ((CounterX>=370&&CounterX<380)&&(CounterY>=660&&CounterY<680));
assign block[933] = ((CounterX>=380&&CounterX<390)&&(CounterY>=660&&CounterY<680));
assign block[934] = ((CounterX>=390&&CounterX<400)&&(CounterY>=660&&CounterY<680));

assign block[935] = ((CounterX>=400&&CounterX<410)&&(CounterY>=660&&CounterY<680));
assign block[936] = ((CounterX>=410&&CounterX<420)&&(CounterY>=660&&CounterY<680));
assign block[937] = ((CounterX>=420&&CounterX<430)&&(CounterY>=660&&CounterY<680));
assign block[938] = ((CounterX>=430&&CounterX<440)&&(CounterY>=660&&CounterY<680));
assign block[939] = ((CounterX>=440&&CounterX<450)&&(CounterY>=660&&CounterY<680));
assign block[940] = ((CounterX>=450&&CounterX<460)&&(CounterY>=660&&CounterY<680));
assign block[941] = ((CounterX>=460&&CounterX<470)&&(CounterY>=660&&CounterY<680));
assign block[942] = ((CounterX>=470&&CounterX<480)&&(CounterY>=660&&CounterY<680));
assign block[943] = ((CounterX>=480&&CounterX<490)&&(CounterY>=660&&CounterY<680));
assign block[944] = ((CounterX>=490&&CounterX<500)&&(CounterY>=660&&CounterY<680));
assign block[945] = ((CounterX>=500&&CounterX<510)&&(CounterY>=660&&CounterY<680));
assign block[946] = ((CounterX>=510&&CounterX<520)&&(CounterY>=660&&CounterY<680));
assign block[947] = ((CounterX>=520&&CounterX<530)&&(CounterY>=660&&CounterY<680));
assign block[948] = ((CounterX>=530&&CounterX<540)&&(CounterY>=660&&CounterY<680));
assign block[949] = ((CounterX>=540&&CounterX<550)&&(CounterY>=660&&CounterY<680));
assign block[950] = ((CounterX>=550&&CounterX<560)&&(CounterY>=660&&CounterY<680));
assign block[951] = ((CounterX>=560&&CounterX<570)&&(CounterY>=660&&CounterY<680));
assign block[952] = ((CounterX>=570&&CounterX<580)&&(CounterY>=660&&CounterY<680));
assign block[953] = ((CounterX>=580&&CounterX<590)&&(CounterY>=660&&CounterY<680));
assign block[954] = ((CounterX>=590&&CounterX<600)&&(CounterY>=660&&CounterY<680));
assign block[955] = ((CounterX>=600&&CounterX<610)&&(CounterY>=660&&CounterY<680));
assign block[956] = ((CounterX>=610&&CounterX<620)&&(CounterY>=660&&CounterY<680));
assign block[957] = ((CounterX>=620&&CounterX<630)&&(CounterY>=660&&CounterY<680));
assign block[958] = ((CounterX>=630&&CounterX<640)&&(CounterY>=660&&CounterY<680));
assign block[959] = ((CounterX>=640&&CounterX<650)&&(CounterY>=660&&CounterY<680));
/////////////////////////////////////////////////////////////////////////////////////////


assign block[960] = ((CounterX>=250&&CounterX<260)&&(CounterY>=680&&CounterY<700));
assign block[961] = ((CounterX>=260&&CounterX<270)&&(CounterY>=680&&CounterY<700));
assign block[962] = ((CounterX>=270&&CounterX<280)&&(CounterY>=680&&CounterY<700));
assign block[963] = ((CounterX>=280&&CounterX<290)&&(CounterY>=680&&CounterY<700));
assign block[964] = ((CounterX>=290&&CounterX<300)&&(CounterY>=680&&CounterY<700));
assign block[965] = ((CounterX>=300&&CounterX<310)&&(CounterY>=680&&CounterY<700));
assign block[966] = ((CounterX>=310&&CounterX<320)&&(CounterY>=680&&CounterY<700));
assign block[967] = ((CounterX>=320&&CounterX<330)&&(CounterY>=680&&CounterY<700));
assign block[968] = ((CounterX>=330&&CounterX<340)&&(CounterY>=680&&CounterY<700));
assign block[969] = ((CounterX>=340&&CounterX<350)&&(CounterY>=680&&CounterY<700));
assign block[970] = ((CounterX>=350&&CounterX<360)&&(CounterY>=680&&CounterY<700));
assign block[971] = ((CounterX>=360&&CounterX<370)&&(CounterY>=680&&CounterY<700));
assign block[972] = ((CounterX>=370&&CounterX<380)&&(CounterY>=680&&CounterY<700));
assign block[973] = ((CounterX>=380&&CounterX<390)&&(CounterY>=680&&CounterY<700));
assign block[974] = ((CounterX>=390&&CounterX<400)&&(CounterY>=680&&CounterY<700));
assign block[975] = ((CounterX>=400&&CounterX<410)&&(CounterY>=680&&CounterY<700));
assign block[976] = ((CounterX>=410&&CounterX<420)&&(CounterY>=680&&CounterY<700));
assign block[977] = ((CounterX>=420&&CounterX<430)&&(CounterY>=680&&CounterY<700));
assign block[978] = ((CounterX>=430&&CounterX<440)&&(CounterY>=680&&CounterY<700));
assign block[979] = ((CounterX>=440&&CounterX<450)&&(CounterY>=680&&CounterY<700));
assign block[980] = ((CounterX>=450&&CounterX<460)&&(CounterY>=680&&CounterY<700));
assign block[981] = ((CounterX>=460&&CounterX<470)&&(CounterY>=680&&CounterY<700));
assign block[982] = ((CounterX>=470&&CounterX<480)&&(CounterY>=680&&CounterY<700));
assign block[983] = ((CounterX>=480&&CounterX<490)&&(CounterY>=680&&CounterY<700));
assign block[984] = ((CounterX>=490&&CounterX<500)&&(CounterY>=680&&CounterY<700));
assign block[985] = ((CounterX>=500&&CounterX<510)&&(CounterY>=680&&CounterY<700));
assign block[986] = ((CounterX>=510&&CounterX<520)&&(CounterY>=680&&CounterY<700));
assign block[987] = ((CounterX>=520&&CounterX<530)&&(CounterY>=680&&CounterY<700));
assign block[988] = ((CounterX>=530&&CounterX<540)&&(CounterY>=680&&CounterY<700));
assign block[989] = ((CounterX>=540&&CounterX<550)&&(CounterY>=680&&CounterY<700));
assign block[990] = ((CounterX>=550&&CounterX<560)&&(CounterY>=680&&CounterY<700));
assign block[991] = ((CounterX>=560&&CounterX<570)&&(CounterY>=680&&CounterY<700));
assign block[992] = ((CounterX>=570&&CounterX<580)&&(CounterY>=680&&CounterY<700));
assign block[993] = ((CounterX>=580&&CounterX<590)&&(CounterY>=680&&CounterY<700));
assign block[994] = ((CounterX>=590&&CounterX<600)&&(CounterY>=680&&CounterY<700));
assign block[995] = ((CounterX>=600&&CounterX<610)&&(CounterY>=680&&CounterY<700));
assign block[996] = ((CounterX>=610&&CounterX<620)&&(CounterY>=680&&CounterY<700));
assign block[997] = ((CounterX>=620&&CounterX<630)&&(CounterY>=680&&CounterY<700));
assign block[998] = ((CounterX>=630&&CounterX<640)&&(CounterY>=680&&CounterY<700));
assign block[999] = ((CounterX>=640&&CounterX<650)&&(CounterY>=680&&CounterY<700));




count timer (
	.clk(clk),
	.b(c1)
	); 

counter count(
.clk(clk),
.CounterX(CounterX),
.CounterY(CounterY)
);



vga v(
.clk(clk),
.CounterX(CounterX),
.CounterY(CounterY),
.vga_HS(vga_HS),
.vga_VS(vga_VS)

);

reg [3:0] add =4'b0;
	 integer i,j;

always@(posedge clk) begin
if(rst) begin
test  = 1000'b0000000000_0000000000_00000000000_0000000000_0000000000_0000000000_00000000000_0000000000_0000000000_0000000000_00000000000_0000000000_0000000000_0000000000_00000110000_0000000000_0000000000_0000000000_00000110000_0000000000_0000000000_0000100000_00000000000_0000000000_0000000000_0001110000_00000000000_0000000000_0000000000_0000010000_00000000000_0111000000_0000000000_0000000000_00000000000_0000000000_0000000000_0000000000_00000000000_0000000000_0000000000_0000000000_00000000000_0000000000_0000000000_0000000000_00001110000_0000000000_0000000000_0000000000_00000000000_0000000000_0000000000_0000000000_00000000000_0000000000_0011100000_0000000000_00000000000_0000000000_0000000000_0000000000_00000000000_0000000000_0000000000_0000000000_00100000000_0000000000_0000000000_0000000000_11100000000_0000000000_0000000000_0000000000_01000000000_0000000000_0000000000_0000000000_00000000000_0000000000_0000000000_0000000000_00000000000_0000000000_0000010000_0000000000_00000000000_0000000000_0000001000_0000000000_00000000000_0000000000_0000111000_0000000000_00000000000_0000000000_0000000000_0000000000_00000000000_0000000000;

R=(test[1]&block[1])|(test[0]&block[0])|(test[2]&block[2])|(test[3]&block[3])|(test[4]&block[4])|(test[5]&block[5])|
(test[6]&block[6])|(test[7]&block[7])|(test[8]&block[8])|(test[9]&block[9])|(test[10]&block[10])|(test[11]&block[11])|
(test[12]&block[12])|(test[13]&block[13])|(test[14]&block[14])|(test[15]&block[15])|(test[16]&block[16])|(test[17]&block[17])|
(test[18]&block[18])|(test[19]&block[19])|(test[20]&block[20])|(test[21]&block[21])|(test[22]&block[22])|(test[23]&block[23])|
(test[24]&block[24])|(test[25]&block[25])|(test[26]&block[26])|(test[27]&block[27])|(test[28]&block[28])|(test[29]&block[29])|
(test[30]&block[30])|(test[31]&block[31])|(test[32]&block[32])|(test[33]&block[33])|(test[34]&block[34])|(test[35]&block[35])|
(test[36]&block[36])|(test[37]&block[37])|(test[38]&block[38])|(test[39]&block[39])|(test[40]&block[40])|(test[41]&block[41])|
(test[42]&block[42])|(test[43]&block[43])|(test[44]&block[44])|(test[45]&block[45])|(test[46]&block[46])|(test[47]&block[47])|
(test[48]&block[48])|(test[49]&block[49])|(test[50]&block[50])|(test[51]&block[51])|(test[52]&block[52])|(test[53]&block[53])|
(test[54]&block[54])|(test[55]&block[55])|(test[56]&block[56])|(test[57]&block[57])|(test[58]&block[58])|(test[59]&block[59])|
(test[61]&block[61])|(test[60]&block[60])|(test[62]&block[62])|(test[63]&block[63])|(test[64]&block[64])|(test[65]&block[65])|
(test[66]&block[66])|(test[67]&block[67])|(test[68]&block[68])|(test[69]&block[69])|(test[71]&block[71])|(test[70]&block[70])|
(test[72]&block[72])|(test[73]&block[73])|(test[74]&block[74])|(test[75]&block[75])|(test[76]&block[76])|(test[77]&block[77])|
(test[78]&block[78])|(test[79]&block[79])|(test[81]&block[81])|(test[80]&block[80])|(test[82]&block[82])|(test[83]&block[83])|
(test[84]&block[84])|(test[85]&block[85])|(test[86]&block[86])|(test[87]&block[87])|(test[88]&block[88])|(test[89]&block[89])|
(test[91]&block[91])|(test[90]&block[90])|(test[92]&block[92])|(test[93]&block[93])|(test[94]&block[94])|(test[95]&block[95])|
(test[96]&block[96])|(test[97]&block[97])|(test[98]&block[98])|(test[99]&block[99])|(test[100]&block[100])|(test[101]&block[101])|
(test[102]&block[102])|(test[103]&block[103])|(test[104]&block[104])|(test[105]&block[105])|(test[106]&block[106])|
(test[107]&block[107])|(test[108]&block[108])|(test[109]&block[109])|(test[110]&block[110])|(test[111]&block[111])|
(test[112]&block[112])|(test[113]&block[113])|(test[114]&block[114])|(test[115]&block[115])|(test[116]&block[116])|
(test[117]&block[117])|(test[118]&block[118])|(test[119]&block[119])|(test[120]&block[120])|(test[121]&block[121])|
(test[122]&block[122])|(test[123]&block[123])|(test[124]&block[124])|(test[125]&block[125])|(test[126]&block[126])|
(test[127]&block[127])|(test[128]&block[128])|(test[129]&block[129])|(test[130]&block[130])|(test[131]&block[131])|
(test[132]&block[132])|(test[133]&block[133])|(test[134]&block[134])|(test[135]&block[135])|(test[136]&block[136])|
(test[137]&block[137])|(test[138]&block[138])|(test[139]&block[139])|(test[140]&block[140])|(test[141]&block[141])|
(test[142]&block[142])|(test[143]&block[143])|(test[144]&block[144])|(test[145]&block[145])|(test[146]&block[146])|
(test[147]&block[147])|(test[148]&block[148])|(test[149]&block[149])|(test[150]&block[150])|(test[151]&block[151])|
(test[152]&block[152])|(test[153]&block[153])|(test[154]&block[154])|(test[155]&block[155])|(test[156]&block[156])|
(test[157]&block[157])|(test[158]&block[158])|(test[159]&block[159])|(test[161]&block[161])|(test[160]&block[160])|
(test[162]&block[162])|(test[163]&block[163])|(test[164]&block[164])|(test[165]&block[165])|(test[166]&block[166])|
(test[167]&block[167])|(test[168]&block[168])|(test[169]&block[169])|(test[171]&block[171])|(test[170]&block[170])|
(test[172]&block[172])|(test[173]&block[173])|(test[174]&block[174])|(test[175]&block[175])|(test[176]&block[176])|
(test[177]&block[177])|(test[178]&block[178])|(test[179]&block[179])|(test[181]&block[181])|(test[180]&block[180])|
(test[182]&block[182])|(test[183]&block[183])|(test[184]&block[184])|(test[185]&block[185])|(test[186]&block[186])|
(test[187]&block[187])|(test[188]&block[188])|(test[189]&block[189])|(test[191]&block[191])|(test[190]&block[190])|
(test[192]&block[192])|(test[193]&block[193])|(test[194]&block[194])|(test[195]&block[195])|(test[196]&block[196])|
(test[197]&block[197])|(test[198]&block[198])|(test[199]&block[199])|(test[201]&block[201])|(test[200]&block[200])|
(test[202]&block[202])|(test[203]&block[203])|(test[204]&block[204])|(test[205]&block[205])|(test[206]&block[206])|
(test[207]&block[207])|(test[208]&block[208])|(test[209]&block[209])|(test[210]&block[210])|(test[211]&block[211])|
(test[212]&block[212])|(test[213]&block[213])|(test[214]&block[214])|(test[215]&block[215])|(test[216]&block[216])|
(test[217]&block[217])|(test[218]&block[218])|(test[219]&block[219])|(test[220]&block[220])|(test[221]&block[221])|
(test[222]&block[222])|(test[223]&block[223])|(test[224]&block[224])|(test[225]&block[225])|(test[226]&block[226])|
(test[227]&block[227])|(test[228]&block[228])|(test[229]&block[229])|(test[230]&block[230])|(test[231]&block[231])|
(test[232]&block[232])|(test[233]&block[233])|(test[234]&block[234])|(test[235]&block[235])|(test[236]&block[236])|
(test[237]&block[237])|(test[238]&block[238])|(test[239]&block[239])|(test[240]&block[240])|(test[241]&block[241])|
(test[242]&block[242])|(test[243]&block[243])|(test[244]&block[244])|(test[245]&block[245])|(test[246]&block[246])|
(test[247]&block[247])|(test[248]&block[248])|(test[249]&block[249])|(test[250]&block[250])|(test[251]&block[251])|
(test[252]&block[252])|(test[253]&block[253])|(test[254]&block[254])|(test[255]&block[255])|(test[256]&block[256])|
(test[257]&block[257])|(test[258]&block[258])|(test[259]&block[259])|(test[261]&block[261])|(test[260]&block[260])|
(test[262]&block[262])|(test[263]&block[263])|(test[264]&block[264])|(test[265]&block[265])|(test[266]&block[266])|
(test[267]&block[267])|(test[268]&block[268])|(test[269]&block[269])|(test[271]&block[271])|(test[270]&block[270])|
(test[272]&block[272])|(test[273]&block[273])|(test[274]&block[274])|(test[275]&block[275])|(test[276]&block[276])|
(test[277]&block[277])|(test[278]&block[278])|(test[279]&block[279])|(test[281]&block[281])|(test[280]&block[280])|
(test[282]&block[282])|(test[283]&block[283])|(test[284]&block[284])|(test[285]&block[285])|(test[286]&block[286])|
(test[287]&block[287])|(test[288]&block[288])|(test[289]&block[289])|(test[291]&block[291])|(test[290]&block[290])|
(test[292]&block[292])|(test[293]&block[293])|(test[294]&block[294])|(test[295]&block[295])|(test[296]&block[296])|
(test[297]&block[297])|(test[298]&block[298])|(test[299]&block[299])|(test[301]&block[301])|(test[300]&block[300])|
(test[302]&block[302])|(test[303]&block[303])|(test[304]&block[304])|(test[305]&block[305])|(test[306]&block[306])|
(test[307]&block[307])|(test[308]&block[308])|(test[309]&block[309])|(test[310]&block[310])|(test[311]&block[311])|
(test[312]&block[312])|(test[313]&block[313])|(test[314]&block[314])|(test[315]&block[315])|(test[316]&block[316])|
(test[317]&block[317])|(test[318]&block[318])|(test[319]&block[319])|(test[320]&block[320])|(test[321]&block[321])|
(test[322]&block[322])|(test[323]&block[323])|(test[324]&block[324])|(test[325]&block[325])|(test[326]&block[326])|
(test[327]&block[327])|(test[328]&block[328])|(test[329]&block[329])|(test[330]&block[330])|(test[331]&block[331])|
(test[332]&block[332])|(test[333]&block[333])|(test[334]&block[334])|(test[335]&block[335])|(test[336]&block[336])|
(test[337]&block[337])|(test[338]&block[338])|(test[339]&block[339])|(test[340]&block[340])|(test[341]&block[341])|
(test[342]&block[342])|(test[343]&block[343])|(test[344]&block[344])|(test[345]&block[345])|(test[346]&block[346])|
(test[347]&block[347])|(test[348]&block[348])|(test[349]&block[349])|(test[350]&block[350])|(test[351]&block[351])|
(test[352]&block[352])|(test[353]&block[353])|(test[354]&block[354])|(test[355]&block[355])|(test[356]&block[356])|
(test[357]&block[357])|(test[358]&block[358])|(test[359]&block[359])|(test[361]&block[361])|(test[360]&block[360])|
(test[362]&block[362])|(test[363]&block[363])|(test[364]&block[364])|(test[365]&block[365])|(test[366]&block[366])|
(test[367]&block[367])|(test[368]&block[368])|(test[369]&block[369])|(test[371]&block[371])|(test[370]&block[370])|
(test[372]&block[372])|(test[373]&block[373])|(test[374]&block[374])|(test[375]&block[375])|(test[376]&block[376])|
(test[377]&block[377])|(test[378]&block[378])|(test[379]&block[379])|(test[381]&block[381])|(test[380]&block[380])|
(test[382]&block[382])|(test[383]&block[383])|(test[384]&block[384])|(test[385]&block[385])|(test[386]&block[386])|
(test[387]&block[387])|(test[388]&block[388])|(test[389]&block[389])|(test[391]&block[391])|(test[390]&block[390])|
(test[392]&block[392])|(test[393]&block[393])|(test[394]&block[394])|(test[395]&block[395])|(test[396]&block[396])|
(test[397]&block[397])|(test[398]&block[398])|(test[399]&block[399])|(test[401]&block[401])|(test[400]&block[400])|
(test[402]&block[402])|(test[403]&block[403])|(test[404]&block[404])|(test[405]&block[405])|(test[406]&block[406])|
(test[407]&block[407])|(test[408]&block[408])|(test[409]&block[409])|(test[410]&block[410])|(test[411]&block[411])|
(test[412]&block[412])|(test[413]&block[413])|(test[414]&block[414])|(test[415]&block[415])|(test[416]&block[416])|
(test[417]&block[417])|(test[418]&block[418])|(test[419]&block[419])|(test[420]&block[420])|(test[421]&block[421])|
(test[422]&block[422])|(test[423]&block[423])|(test[424]&block[424])|(test[425]&block[425])|(test[426]&block[426])|
(test[427]&block[427])|(test[428]&block[428])|(test[429]&block[429])|(test[430]&block[430])|(test[431]&block[431])|
(test[432]&block[432])|(test[433]&block[433])|(test[434]&block[434])|(test[435]&block[435])|(test[436]&block[436])|
(test[437]&block[437])|(test[438]&block[438])|(test[439]&block[439])|(test[440]&block[440])|(test[441]&block[441])|
(test[442]&block[442])|(test[443]&block[443])|(test[444]&block[444])|(test[445]&block[445])|(test[446]&block[446])|
(test[447]&block[447])|(test[448]&block[448])|(test[449]&block[449])|(test[450]&block[450])|(test[451]&block[451])|
(test[452]&block[452])|(test[453]&block[453])|(test[454]&block[454])|(test[455]&block[455])|(test[456]&block[456])|
(test[457]&block[457])|(test[458]&block[458])|(test[459]&block[459])|(test[461]&block[461])|(test[460]&block[460])|
(test[462]&block[462])|(test[463]&block[463])|(test[464]&block[464])|(test[465]&block[465])|(test[466]&block[466])|
(test[467]&block[467])|(test[468]&block[468])|(test[469]&block[469])|(test[471]&block[471])|(test[470]&block[470])|
(test[472]&block[472])|(test[473]&block[473])|(test[474]&block[474])|(test[475]&block[475])|(test[476]&block[476])|
(test[477]&block[477])|(test[478]&block[478])|(test[479]&block[479])|(test[481]&block[481])|(test[480]&block[480])|
(test[482]&block[482])|(test[483]&block[483])|(test[484]&block[484])|(test[485]&block[485])|(test[486]&block[486])|
(test[487]&block[487])|(test[488]&block[488])|(test[489]&block[489])|(test[491]&block[491])|(test[490]&block[490])|
(test[492]&block[492])|(test[493]&block[493])|(test[494]&block[494])|(test[495]&block[495])|(test[496]&block[496])|
(test[497]&block[497])|(test[498]&block[498])|(test[499]&block[499])|(test[501]&block[501])|(test[500]&block[500])|
(test[502]&block[502])|(test[503]&block[503])|(test[504]&block[504])|(test[505]&block[505])|(test[506]&block[506])|
(test[507]&block[507])|(test[508]&block[508])|(test[509]&block[509])|(test[510]&block[510])|(test[511]&block[511])|
(test[512]&block[512])|(test[513]&block[513])|(test[514]&block[514])|(test[515]&block[515])|(test[516]&block[516])|
(test[517]&block[517])|(test[518]&block[518])|(test[519]&block[519])|(test[520]&block[520])|(test[521]&block[521])|
(test[522]&block[522])|(test[523]&block[523])|(test[524]&block[524])|(test[525]&block[525])|(test[526]&block[526])|
(test[527]&block[527])|(test[528]&block[528])|(test[529]&block[529])|(test[530]&block[530])|(test[531]&block[531])|
(test[532]&block[532])|(test[533]&block[533])|(test[534]&block[534])|(test[535]&block[535])|(test[536]&block[536])|
(test[537]&block[537])|(test[538]&block[538])|(test[539]&block[539])|(test[540]&block[540])|(test[541]&block[541])|
(test[542]&block[542])|(test[543]&block[543])|(test[544]&block[544])|(test[545]&block[545])|(test[546]&block[546])|
(test[547]&block[547])|(test[548]&block[548])|(test[549]&block[549])|(test[550]&block[550])|(test[551]&block[551])|
(test[552]&block[552])|(test[553]&block[553])|(test[554]&block[554])|(test[555]&block[555])|(test[556]&block[556])|
(test[557]&block[557])|(test[558]&block[558])|(test[559]&block[559])|(test[561]&block[561])|(test[560]&block[560])|
(test[562]&block[562])|(test[563]&block[563])|(test[564]&block[564])|(test[565]&block[565])|(test[566]&block[566])|
(test[567]&block[567])|(test[568]&block[568])|(test[569]&block[569])|(test[571]&block[571])|(test[570]&block[570])|
(test[572]&block[572])|(test[573]&block[573])|(test[574]&block[574])|(test[575]&block[575])|(test[576]&block[576])|
(test[577]&block[577])|(test[578]&block[578])|(test[579]&block[579])|(test[581]&block[581])|(test[580]&block[580])|
(test[582]&block[582])|(test[583]&block[583])|(test[584]&block[584])|(test[585]&block[585])|(test[586]&block[586])|
(test[587]&block[587])|(test[588]&block[588])|(test[589]&block[589])|(test[591]&block[591])|(test[590]&block[590])|
(test[592]&block[592])|(test[593]&block[593])|(test[594]&block[594])|(test[595]&block[595])|(test[596]&block[596])|
(test[597]&block[597])|(test[598]&block[598])|(test[599]&block[599])|(test[601]&block[601])|(test[600]&block[600])|
(test[602]&block[602])|(test[603]&block[603])|(test[604]&block[604])|(test[605]&block[605])|(test[606]&block[606])|
(test[607]&block[607])|(test[608]&block[608])|(test[609]&block[609])|(test[610]&block[610])|(test[611]&block[611])|
(test[612]&block[612])|(test[613]&block[613])|(test[614]&block[614])|(test[615]&block[615])|(test[616]&block[616])|
(test[617]&block[617])|(test[618]&block[618])|(test[619]&block[619])|(test[620]&block[620])|(test[621]&block[621])|
(test[622]&block[622])|(test[623]&block[623])|(test[624]&block[624])|(test[625]&block[625])|(test[626]&block[626])|
(test[627]&block[627])|(test[628]&block[628])|(test[629]&block[629])|(test[630]&block[630])|(test[631]&block[631])|
(test[632]&block[632])|(test[633]&block[633])|(test[634]&block[634])|(test[635]&block[635])|(test[636]&block[636])|
(test[637]&block[637])|(test[638]&block[638])|(test[639]&block[639])|(test[640]&block[640])|(test[641]&block[641])|
(test[642]&block[642])|(test[643]&block[643])|(test[644]&block[644])|(test[645]&block[645])|(test[646]&block[646])|
(test[647]&block[647])|(test[648]&block[648])|(test[649]&block[649])|(test[650]&block[650])|(test[651]&block[651])|
(test[652]&block[652])|(test[653]&block[653])|(test[654]&block[654])|(test[655]&block[655])|(test[656]&block[656])|
(test[657]&block[657])|(test[658]&block[658])|(test[659]&block[659])|(test[661]&block[661])|(test[660]&block[660])|
(test[662]&block[662])|(test[663]&block[663])|(test[664]&block[664])|(test[665]&block[665])|(test[666]&block[666])|
(test[667]&block[667])|(test[668]&block[668])|(test[669]&block[669])|(test[671]&block[671])|(test[670]&block[670])|
(test[672]&block[672])|(test[673]&block[673])|(test[674]&block[674])|(test[675]&block[675])|(test[676]&block[676])|
(test[677]&block[677])|(test[678]&block[678])|(test[679]&block[679])|(test[681]&block[681])|(test[680]&block[680])|
(test[682]&block[682])|(test[683]&block[683])|(test[684]&block[684])|(test[685]&block[685])|(test[686]&block[686])|
(test[687]&block[687])|(test[688]&block[688])|(test[689]&block[689])|(test[691]&block[691])|(test[690]&block[690])|
(test[692]&block[692])|(test[693]&block[693])|(test[694]&block[694])|(test[695]&block[695])|(test[696]&block[696])|
(test[697]&block[697])|(test[698]&block[698])|(test[699]&block[699])|(test[701]&block[701])|(test[700]&block[700])|
(test[702]&block[702])|(test[703]&block[703])|(test[704]&block[704])|(test[705]&block[705])|(test[706]&block[706])|
(test[707]&block[707])|(test[708]&block[708])|(test[709]&block[709])|(test[710]&block[710])|(test[711]&block[711])|
(test[712]&block[712])|(test[713]&block[713])|(test[714]&block[714])|(test[715]&block[715])|(test[716]&block[716])|
(test[717]&block[717])|(test[718]&block[718])|(test[719]&block[719])|(test[720]&block[720])|(test[721]&block[721])|
(test[722]&block[722])|(test[723]&block[723])|(test[724]&block[724])|(test[725]&block[725])|(test[726]&block[726])|
(test[727]&block[727])|(test[728]&block[728])|(test[729]&block[729])|(test[730]&block[730])|(test[731]&block[731])|
(test[732]&block[732])|(test[733]&block[733])|(test[734]&block[734])|(test[735]&block[735])|(test[736]&block[736])|
(test[737]&block[737])|(test[738]&block[738])|(test[739]&block[739])|(test[740]&block[740])|(test[741]&block[741])|
(test[742]&block[742])|(test[743]&block[743])|(test[744]&block[744])|(test[745]&block[745])|(test[746]&block[746])|
(test[747]&block[747])|(test[748]&block[748])|(test[749]&block[749])|(test[750]&block[750])|(test[751]&block[751])|
(test[752]&block[752])|(test[753]&block[753])|(test[754]&block[754])|(test[755]&block[755])|(test[756]&block[756])|
(test[757]&block[757])|(test[758]&block[758])|(test[759]&block[759])|(test[761]&block[761])|(test[760]&block[760])|
(test[762]&block[762])|(test[763]&block[763])|(test[764]&block[764])|(test[765]&block[765])|(test[766]&block[766])|
(test[767]&block[767])|(test[768]&block[768])|(test[769]&block[769])|(test[771]&block[771])|(test[770]&block[770])|
(test[772]&block[772])|(test[773]&block[773])|(test[774]&block[774])|(test[775]&block[775])|(test[776]&block[776])|
(test[777]&block[777])|(test[778]&block[778])|(test[779]&block[779])|(test[781]&block[781])|(test[780]&block[780])|
(test[782]&block[782])|(test[783]&block[783])|(test[784]&block[784])|(test[785]&block[785])|(test[786]&block[786])|
(test[787]&block[787])|(test[788]&block[788])|(test[789]&block[789])|(test[791]&block[791])|(test[790]&block[790])|
(test[792]&block[792])|(test[793]&block[793])|(test[794]&block[794])|(test[795]&block[795])|(test[796]&block[796])|
(test[797]&block[797])|(test[798]&block[798])|(test[799]&block[799])|(test[801]&block[801])|(test[800]&block[800])|
(test[802]&block[802])|(test[803]&block[803])|(test[804]&block[804])|(test[805]&block[805])|(test[806]&block[806])|
(test[807]&block[807])|(test[808]&block[808])|(test[809]&block[809])|(test[810]&block[810])|(test[811]&block[811])|
(test[812]&block[812])|(test[813]&block[813])|(test[814]&block[814])|(test[815]&block[815])|(test[816]&block[816])|
(test[817]&block[817])|(test[818]&block[818])|(test[819]&block[819])|(test[820]&block[820])|(test[821]&block[821])|
(test[822]&block[822])|(test[823]&block[823])|(test[824]&block[824])|(test[825]&block[825])|(test[826]&block[826])|
(test[827]&block[827])|(test[828]&block[828])|(test[829]&block[829])|(test[830]&block[830])|(test[831]&block[831])|
(test[832]&block[832])|(test[833]&block[833])|(test[834]&block[834])|(test[835]&block[835])|(test[836]&block[836])|
(test[837]&block[837])|(test[838]&block[838])|(test[839]&block[839])|(test[840]&block[840])|(test[841]&block[841])|
(test[842]&block[842])|(test[843]&block[843])|(test[844]&block[844])|(test[845]&block[845])|(test[846]&block[846])|
(test[847]&block[847])|(test[848]&block[848])|(test[849]&block[849])|(test[850]&block[850])|(test[851]&block[851])|
(test[852]&block[852])|(test[853]&block[853])|(test[854]&block[854])|(test[855]&block[855])|(test[856]&block[856])|
(test[857]&block[857])|(test[858]&block[858])|(test[859]&block[859])|(test[861]&block[861])|(test[860]&block[860])|
(test[862]&block[862])|(test[863]&block[863])|(test[864]&block[864])|(test[865]&block[865])|(test[866]&block[866])|
(test[867]&block[867])|(test[868]&block[868])|(test[869]&block[869])|(test[871]&block[871])|(test[870]&block[870])|
(test[872]&block[872])|(test[873]&block[873])|(test[874]&block[874])|(test[875]&block[875])|(test[876]&block[876])|
(test[877]&block[877])|(test[878]&block[878])|(test[879]&block[879])|(test[881]&block[881])|(test[880]&block[880])|
(test[882]&block[882])|(test[883]&block[883])|(test[884]&block[884])|(test[885]&block[885])|(test[886]&block[886])|
(test[887]&block[887])|(test[888]&block[888])|(test[889]&block[889])|(test[891]&block[891])|(test[890]&block[890])|
(test[892]&block[892])|(test[893]&block[893])|(test[894]&block[894])|(test[895]&block[895])|(test[896]&block[896])|
(test[897]&block[897])|(test[898]&block[898])|(test[899]&block[899])|(test[901]&block[901])|(test[900]&block[900])|
(test[902]&block[902])|(test[903]&block[903])|(test[904]&block[904])|(test[905]&block[905])|(test[906]&block[906])|
(test[907]&block[907])|(test[908]&block[908])|(test[909]&block[909])|(test[910]&block[910])|(test[911]&block[911])|
(test[912]&block[912])|(test[913]&block[913])|(test[914]&block[914])|(test[915]&block[915])|(test[916]&block[916])|
(test[917]&block[917])|(test[918]&block[918])|(test[919]&block[919])|(test[920]&block[920])|(test[921]&block[921])|
(test[922]&block[922])|(test[923]&block[923])|(test[924]&block[924])|(test[925]&block[925])|(test[926]&block[926])|
(test[927]&block[927])|(test[928]&block[928])|(test[929]&block[929])|(test[930]&block[930])|(test[931]&block[931])|
(test[932]&block[932])|(test[933]&block[933])|(test[934]&block[934])|(test[935]&block[935])|(test[936]&block[936])|
(test[937]&block[937])|(test[938]&block[938])|(test[939]&block[939])|(test[940]&block[940])|(test[941]&block[941])|
(test[942]&block[942])|(test[943]&block[943])|(test[944]&block[944])|(test[945]&block[945])|(test[946]&block[946])|
(test[947]&block[947])|(test[948]&block[948])|(test[949]&block[949])|(test[950]&block[950])|(test[951]&block[951])|
(test[952]&block[952])|(test[953]&block[953])|(test[954]&block[954])|(test[955]&block[955])|(test[956]&block[956])|
(test[957]&block[957])|(test[958]&block[958])|(test[959]&block[959])|(test[961]&block[961])|(test[960]&block[960])|
(test[962]&block[962])|(test[963]&block[963])|(test[964]&block[964])|(test[965]&block[965])|(test[966]&block[966])|
(test[967]&block[967])|(test[968]&block[968])|(test[969]&block[969])|(test[971]&block[971])|(test[970]&block[970])|
(test[972]&block[972])|(test[973]&block[973])|(test[974]&block[974])|(test[975]&block[975])|(test[976]&block[976])|
(test[977]&block[977])|(test[978]&block[978])|(test[979]&block[979])|(test[981]&block[981])|(test[980]&block[980])|
(test[982]&block[982])|(test[983]&block[983])|(test[984]&block[984])|(test[985]&block[985])|(test[986]&block[986])|
(test[987]&block[987])|(test[988]&block[988])|(test[989]&block[989])|(test[991]&block[991])|(test[990]&block[990])|
(test[992]&block[992])|(test[993]&block[993])|(test[994]&block[994])|(test[995]&block[995])|(test[996]&block[996])|
(test[997]&block[997])|(test[998]&block[998])|(test[999]&block[999]);
end
	else  begin
for(i=0;i<m;i=i+1) begin
for(j=0;j<n;j=j+1) begin

if ( i===0 && j===0)
begin
add = arr[1]+arr[n]+arr[n+1]+arr[n-1]+arr[2*n-1]+arr[n*(m-1)]+arr[n*(m-1)+1]+arr[n*m-1];
end
else if ( i===0 && j===n-1)
begin
add = arr[n-2]+arr[2*n-2]+arr[2*n-1]+arr[n*m-2]+arr[n*m-1]+arr[n*(m-1)]+arr[0]+arr[n];
end 
else if ( i===m-1 && j===n-1)
begin
add = arr[0]+arr[n-1]+arr[n-2]+arr[n*(m-2)]+arr[n*(m-1)]+arr[n*(m-1)-2]+arr[n*(m-1)-1]+arr[n*m-2];
end 
else if ( i===m-1 && j===0)
begin
add = arr[n*(m-2)]+arr[n*(m-2)+1]+arr[n*(m-1)+1]+arr[n*(m-1)-1]+arr[n*m-1]+arr[0]+arr[1]+arr[n-1];
end 
else if ( i===0 && j!==n-1 && j!==0)
begin
add = arr[j-1] + arr[j+1] + arr[n+j] + arr[n-1+j] +arr[j+n+1]+arr[n*(m-1)+j] + arr[n*(m-1)+1+j] + arr[n*(m-1)-1+j];
end 
else if ( i===m-1 && j!=n-1 && j!=0)
begin
add = arr[i*n+j-1] + arr[i*n+j+1] + arr[(i-1)*n+j] + arr[(i-1)*n+j-1] +arr[(i-1)*n+j+1]+arr[1+j] + arr[j] + arr[j-1];
end 
else if ( j===0 && i!=m-1 && i!=0)
begin
add = arr[(i-1)*n] + arr[(i+1)*n] + arr[i*n+1] + arr[(i-1)*n+1] +arr[(i+1)*n+1]+arr[(i-1)*n+n-1] + arr[(i+1)*n+n-1] + arr[i*n+n-1];
end 
else if ( j===n-1 && i!=m-1 && i!=0)
begin
add = arr[(i-1)*n+n-2] + arr[(i+1)*n+n-2] + arr[i*n+n-2] + arr[(i-1)*n+n-1] +arr[(i+1)*n+n-1]+arr[(i-1)*n] + arr[(i+1)*n] + arr[i*n];
end 
else begin
add = arr[i*n+j-1]+ arr[i*n+j+1]+ arr[(i-1)*n+j]+ arr[(i-1)*n+j-1]+ arr[(i-1)*n+j+1]+ arr[(i+1)*n+j]+ 
arr[(i+1)*n+j-1]+ arr[(i+1)*n+j+1]; 
end

if (arr[i*n+j]===1'b1) begin
if(add===4'b0010||add===4'b0011) begin
test[i*n+j] = 1'b1;
end else begin
test[i*n+j] = 1'b0;
end end 
else begin 
if(add===4'b0011) begin
test[i*n+j] = 1'b1; end
else begin test[i*n+j] = 1'b0; end
end end end

R=(test[1]&block[1])|(test[0]&block[0])|(test[2]&block[2])|(test[3]&block[3])|(test[4]&block[4])|(test[5]&block[5])|
(test[6]&block[6])|(test[7]&block[7])|(test[8]&block[8])|(test[9]&block[9])|(test[10]&block[10])|(test[11]&block[11])|
(test[12]&block[12])|(test[13]&block[13])|(test[14]&block[14])|(test[15]&block[15])|(test[16]&block[16])|(test[17]&block[17])|
(test[18]&block[18])|(test[19]&block[19])|(test[20]&block[20])|(test[21]&block[21])|(test[22]&block[22])|(test[23]&block[23])|
(test[24]&block[24])|(test[25]&block[25])|(test[26]&block[26])|(test[27]&block[27])|(test[28]&block[28])|(test[29]&block[29])|
(test[30]&block[30])|(test[31]&block[31])|(test[32]&block[32])|(test[33]&block[33])|(test[34]&block[34])|(test[35]&block[35])|
(test[36]&block[36])|(test[37]&block[37])|(test[38]&block[38])|(test[39]&block[39])|(test[40]&block[40])|(test[41]&block[41])|
(test[42]&block[42])|(test[43]&block[43])|(test[44]&block[44])|(test[45]&block[45])|(test[46]&block[46])|(test[47]&block[47])|
(test[48]&block[48])|(test[49]&block[49])|(test[50]&block[50])|(test[51]&block[51])|(test[52]&block[52])|(test[53]&block[53])|
(test[54]&block[54])|(test[55]&block[55])|(test[56]&block[56])|(test[57]&block[57])|(test[58]&block[58])|(test[59]&block[59])|
(test[61]&block[61])|(test[60]&block[60])|(test[62]&block[62])|(test[63]&block[63])|(test[64]&block[64])|(test[65]&block[65])|
(test[66]&block[66])|(test[67]&block[67])|(test[68]&block[68])|(test[69]&block[69])|(test[71]&block[71])|(test[70]&block[70])|
(test[72]&block[72])|(test[73]&block[73])|(test[74]&block[74])|(test[75]&block[75])|(test[76]&block[76])|(test[77]&block[77])|
(test[78]&block[78])|(test[79]&block[79])|(test[81]&block[81])|(test[80]&block[80])|(test[82]&block[82])|(test[83]&block[83])|
(test[84]&block[84])|(test[85]&block[85])|(test[86]&block[86])|(test[87]&block[87])|(test[88]&block[88])|(test[89]&block[89])|
(test[91]&block[91])|(test[90]&block[90])|(test[92]&block[92])|(test[93]&block[93])|(test[94]&block[94])|(test[95]&block[95])|
(test[96]&block[96])|(test[97]&block[97])|(test[98]&block[98])|(test[99]&block[99])|(test[100]&block[100])|(test[101]&block[101])|
(test[102]&block[102])|(test[103]&block[103])|(test[104]&block[104])|(test[105]&block[105])|(test[106]&block[106])|
(test[107]&block[107])|(test[108]&block[108])|(test[109]&block[109])|(test[110]&block[110])|(test[111]&block[111])|
(test[112]&block[112])|(test[113]&block[113])|(test[114]&block[114])|(test[115]&block[115])|(test[116]&block[116])|
(test[117]&block[117])|(test[118]&block[118])|(test[119]&block[119])|(test[120]&block[120])|(test[121]&block[121])|
(test[122]&block[122])|(test[123]&block[123])|(test[124]&block[124])|(test[125]&block[125])|(test[126]&block[126])|
(test[127]&block[127])|(test[128]&block[128])|(test[129]&block[129])|(test[130]&block[130])|(test[131]&block[131])|
(test[132]&block[132])|(test[133]&block[133])|(test[134]&block[134])|(test[135]&block[135])|(test[136]&block[136])|
(test[137]&block[137])|(test[138]&block[138])|(test[139]&block[139])|(test[140]&block[140])|(test[141]&block[141])|
(test[142]&block[142])|(test[143]&block[143])|(test[144]&block[144])|(test[145]&block[145])|(test[146]&block[146])|
(test[147]&block[147])|(test[148]&block[148])|(test[149]&block[149])|(test[150]&block[150])|(test[151]&block[151])|
(test[152]&block[152])|(test[153]&block[153])|(test[154]&block[154])|(test[155]&block[155])|(test[156]&block[156])|
(test[157]&block[157])|(test[158]&block[158])|(test[159]&block[159])|(test[161]&block[161])|(test[160]&block[160])|
(test[162]&block[162])|(test[163]&block[163])|(test[164]&block[164])|(test[165]&block[165])|(test[166]&block[166])|
(test[167]&block[167])|(test[168]&block[168])|(test[169]&block[169])|(test[171]&block[171])|(test[170]&block[170])|
(test[172]&block[172])|(test[173]&block[173])|(test[174]&block[174])|(test[175]&block[175])|(test[176]&block[176])|
(test[177]&block[177])|(test[178]&block[178])|(test[179]&block[179])|(test[181]&block[181])|(test[180]&block[180])|
(test[182]&block[182])|(test[183]&block[183])|(test[184]&block[184])|(test[185]&block[185])|(test[186]&block[186])|
(test[187]&block[187])|(test[188]&block[188])|(test[189]&block[189])|(test[191]&block[191])|(test[190]&block[190])|
(test[192]&block[192])|(test[193]&block[193])|(test[194]&block[194])|(test[195]&block[195])|(test[196]&block[196])|
(test[197]&block[197])|(test[198]&block[198])|(test[199]&block[199])|(test[201]&block[201])|(test[200]&block[200])|
(test[202]&block[202])|(test[203]&block[203])|(test[204]&block[204])|(test[205]&block[205])|(test[206]&block[206])|
(test[207]&block[207])|(test[208]&block[208])|(test[209]&block[209])|(test[210]&block[210])|(test[211]&block[211])|
(test[212]&block[212])|(test[213]&block[213])|(test[214]&block[214])|(test[215]&block[215])|(test[216]&block[216])|
(test[217]&block[217])|(test[218]&block[218])|(test[219]&block[219])|(test[220]&block[220])|(test[221]&block[221])|
(test[222]&block[222])|(test[223]&block[223])|(test[224]&block[224])|(test[225]&block[225])|(test[226]&block[226])|
(test[227]&block[227])|(test[228]&block[228])|(test[229]&block[229])|(test[230]&block[230])|(test[231]&block[231])|
(test[232]&block[232])|(test[233]&block[233])|(test[234]&block[234])|(test[235]&block[235])|(test[236]&block[236])|
(test[237]&block[237])|(test[238]&block[238])|(test[239]&block[239])|(test[240]&block[240])|(test[241]&block[241])|
(test[242]&block[242])|(test[243]&block[243])|(test[244]&block[244])|(test[245]&block[245])|(test[246]&block[246])|
(test[247]&block[247])|(test[248]&block[248])|(test[249]&block[249])|(test[250]&block[250])|(test[251]&block[251])|
(test[252]&block[252])|(test[253]&block[253])|(test[254]&block[254])|(test[255]&block[255])|(test[256]&block[256])|
(test[257]&block[257])|(test[258]&block[258])|(test[259]&block[259])|(test[261]&block[261])|(test[260]&block[260])|
(test[262]&block[262])|(test[263]&block[263])|(test[264]&block[264])|(test[265]&block[265])|(test[266]&block[266])|
(test[267]&block[267])|(test[268]&block[268])|(test[269]&block[269])|(test[271]&block[271])|(test[270]&block[270])|
(test[272]&block[272])|(test[273]&block[273])|(test[274]&block[274])|(test[275]&block[275])|(test[276]&block[276])|
(test[277]&block[277])|(test[278]&block[278])|(test[279]&block[279])|(test[281]&block[281])|(test[280]&block[280])|
(test[282]&block[282])|(test[283]&block[283])|(test[284]&block[284])|(test[285]&block[285])|(test[286]&block[286])|
(test[287]&block[287])|(test[288]&block[288])|(test[289]&block[289])|(test[291]&block[291])|(test[290]&block[290])|
(test[292]&block[292])|(test[293]&block[293])|(test[294]&block[294])|(test[295]&block[295])|(test[296]&block[296])|
(test[297]&block[297])|(test[298]&block[298])|(test[299]&block[299])|(test[301]&block[301])|(test[300]&block[300])|
(test[302]&block[302])|(test[303]&block[303])|(test[304]&block[304])|(test[305]&block[305])|(test[306]&block[306])|
(test[307]&block[307])|(test[308]&block[308])|(test[309]&block[309])|(test[310]&block[310])|(test[311]&block[311])|
(test[312]&block[312])|(test[313]&block[313])|(test[314]&block[314])|(test[315]&block[315])|(test[316]&block[316])|
(test[317]&block[317])|(test[318]&block[318])|(test[319]&block[319])|(test[320]&block[320])|(test[321]&block[321])|
(test[322]&block[322])|(test[323]&block[323])|(test[324]&block[324])|(test[325]&block[325])|(test[326]&block[326])|
(test[327]&block[327])|(test[328]&block[328])|(test[329]&block[329])|(test[330]&block[330])|(test[331]&block[331])|
(test[332]&block[332])|(test[333]&block[333])|(test[334]&block[334])|(test[335]&block[335])|(test[336]&block[336])|
(test[337]&block[337])|(test[338]&block[338])|(test[339]&block[339])|(test[340]&block[340])|(test[341]&block[341])|
(test[342]&block[342])|(test[343]&block[343])|(test[344]&block[344])|(test[345]&block[345])|(test[346]&block[346])|
(test[347]&block[347])|(test[348]&block[348])|(test[349]&block[349])|(test[350]&block[350])|(test[351]&block[351])|
(test[352]&block[352])|(test[353]&block[353])|(test[354]&block[354])|(test[355]&block[355])|(test[356]&block[356])|
(test[357]&block[357])|(test[358]&block[358])|(test[359]&block[359])|(test[361]&block[361])|(test[360]&block[360])|
(test[362]&block[362])|(test[363]&block[363])|(test[364]&block[364])|(test[365]&block[365])|(test[366]&block[366])|
(test[367]&block[367])|(test[368]&block[368])|(test[369]&block[369])|(test[371]&block[371])|(test[370]&block[370])|
(test[372]&block[372])|(test[373]&block[373])|(test[374]&block[374])|(test[375]&block[375])|(test[376]&block[376])|
(test[377]&block[377])|(test[378]&block[378])|(test[379]&block[379])|(test[381]&block[381])|(test[380]&block[380])|
(test[382]&block[382])|(test[383]&block[383])|(test[384]&block[384])|(test[385]&block[385])|(test[386]&block[386])|
(test[387]&block[387])|(test[388]&block[388])|(test[389]&block[389])|(test[391]&block[391])|(test[390]&block[390])|
(test[392]&block[392])|(test[393]&block[393])|(test[394]&block[394])|(test[395]&block[395])|(test[396]&block[396])|
(test[397]&block[397])|(test[398]&block[398])|(test[399]&block[399])|(test[401]&block[401])|(test[400]&block[400])|
(test[402]&block[402])|(test[403]&block[403])|(test[404]&block[404])|(test[405]&block[405])|(test[406]&block[406])|
(test[407]&block[407])|(test[408]&block[408])|(test[409]&block[409])|(test[410]&block[410])|(test[411]&block[411])|
(test[412]&block[412])|(test[413]&block[413])|(test[414]&block[414])|(test[415]&block[415])|(test[416]&block[416])|
(test[417]&block[417])|(test[418]&block[418])|(test[419]&block[419])|(test[420]&block[420])|(test[421]&block[421])|
(test[422]&block[422])|(test[423]&block[423])|(test[424]&block[424])|(test[425]&block[425])|(test[426]&block[426])|
(test[427]&block[427])|(test[428]&block[428])|(test[429]&block[429])|(test[430]&block[430])|(test[431]&block[431])|
(test[432]&block[432])|(test[433]&block[433])|(test[434]&block[434])|(test[435]&block[435])|(test[436]&block[436])|
(test[437]&block[437])|(test[438]&block[438])|(test[439]&block[439])|(test[440]&block[440])|(test[441]&block[441])|
(test[442]&block[442])|(test[443]&block[443])|(test[444]&block[444])|(test[445]&block[445])|(test[446]&block[446])|
(test[447]&block[447])|(test[448]&block[448])|(test[449]&block[449])|(test[450]&block[450])|(test[451]&block[451])|
(test[452]&block[452])|(test[453]&block[453])|(test[454]&block[454])|(test[455]&block[455])|(test[456]&block[456])|
(test[457]&block[457])|(test[458]&block[458])|(test[459]&block[459])|(test[461]&block[461])|(test[460]&block[460])|
(test[462]&block[462])|(test[463]&block[463])|(test[464]&block[464])|(test[465]&block[465])|(test[466]&block[466])|
(test[467]&block[467])|(test[468]&block[468])|(test[469]&block[469])|(test[471]&block[471])|(test[470]&block[470])|
(test[472]&block[472])|(test[473]&block[473])|(test[474]&block[474])|(test[475]&block[475])|(test[476]&block[476])|
(test[477]&block[477])|(test[478]&block[478])|(test[479]&block[479])|(test[481]&block[481])|(test[480]&block[480])|
(test[482]&block[482])|(test[483]&block[483])|(test[484]&block[484])|(test[485]&block[485])|(test[486]&block[486])|
(test[487]&block[487])|(test[488]&block[488])|(test[489]&block[489])|(test[491]&block[491])|(test[490]&block[490])|
(test[492]&block[492])|(test[493]&block[493])|(test[494]&block[494])|(test[495]&block[495])|(test[496]&block[496])|
(test[497]&block[497])|(test[498]&block[498])|(test[499]&block[499])|(test[501]&block[501])|(test[500]&block[500])|
(test[502]&block[502])|(test[503]&block[503])|(test[504]&block[504])|(test[505]&block[505])|(test[506]&block[506])|
(test[507]&block[507])|(test[508]&block[508])|(test[509]&block[509])|(test[510]&block[510])|(test[511]&block[511])|
(test[512]&block[512])|(test[513]&block[513])|(test[514]&block[514])|(test[515]&block[515])|(test[516]&block[516])|
(test[517]&block[517])|(test[518]&block[518])|(test[519]&block[519])|(test[520]&block[520])|(test[521]&block[521])|
(test[522]&block[522])|(test[523]&block[523])|(test[524]&block[524])|(test[525]&block[525])|(test[526]&block[526])|
(test[527]&block[527])|(test[528]&block[528])|(test[529]&block[529])|(test[530]&block[530])|(test[531]&block[531])|
(test[532]&block[532])|(test[533]&block[533])|(test[534]&block[534])|(test[535]&block[535])|(test[536]&block[536])|
(test[537]&block[537])|(test[538]&block[538])|(test[539]&block[539])|(test[540]&block[540])|(test[541]&block[541])|
(test[542]&block[542])|(test[543]&block[543])|(test[544]&block[544])|(test[545]&block[545])|(test[546]&block[546])|
(test[547]&block[547])|(test[548]&block[548])|(test[549]&block[549])|(test[550]&block[550])|(test[551]&block[551])|
(test[552]&block[552])|(test[553]&block[553])|(test[554]&block[554])|(test[555]&block[555])|(test[556]&block[556])|
(test[557]&block[557])|(test[558]&block[558])|(test[559]&block[559])|(test[561]&block[561])|(test[560]&block[560])|
(test[562]&block[562])|(test[563]&block[563])|(test[564]&block[564])|(test[565]&block[565])|(test[566]&block[566])|
(test[567]&block[567])|(test[568]&block[568])|(test[569]&block[569])|(test[571]&block[571])|(test[570]&block[570])|
(test[572]&block[572])|(test[573]&block[573])|(test[574]&block[574])|(test[575]&block[575])|(test[576]&block[576])|
(test[577]&block[577])|(test[578]&block[578])|(test[579]&block[579])|(test[581]&block[581])|(test[580]&block[580])|
(test[582]&block[582])|(test[583]&block[583])|(test[584]&block[584])|(test[585]&block[585])|(test[586]&block[586])|
(test[587]&block[587])|(test[588]&block[588])|(test[589]&block[589])|(test[591]&block[591])|(test[590]&block[590])|
(test[592]&block[592])|(test[593]&block[593])|(test[594]&block[594])|(test[595]&block[595])|(test[596]&block[596])|
(test[597]&block[597])|(test[598]&block[598])|(test[599]&block[599])|(test[601]&block[601])|(test[600]&block[600])|
(test[602]&block[602])|(test[603]&block[603])|(test[604]&block[604])|(test[605]&block[605])|(test[606]&block[606])|
(test[607]&block[607])|(test[608]&block[608])|(test[609]&block[609])|(test[610]&block[610])|(test[611]&block[611])|
(test[612]&block[612])|(test[613]&block[613])|(test[614]&block[614])|(test[615]&block[615])|(test[616]&block[616])|
(test[617]&block[617])|(test[618]&block[618])|(test[619]&block[619])|(test[620]&block[620])|(test[621]&block[621])|
(test[622]&block[622])|(test[623]&block[623])|(test[624]&block[624])|(test[625]&block[625])|(test[626]&block[626])|
(test[627]&block[627])|(test[628]&block[628])|(test[629]&block[629])|(test[630]&block[630])|(test[631]&block[631])|
(test[632]&block[632])|(test[633]&block[633])|(test[634]&block[634])|(test[635]&block[635])|(test[636]&block[636])|
(test[637]&block[637])|(test[638]&block[638])|(test[639]&block[639])|(test[640]&block[640])|(test[641]&block[641])|
(test[642]&block[642])|(test[643]&block[643])|(test[644]&block[644])|(test[645]&block[645])|(test[646]&block[646])|
(test[647]&block[647])|(test[648]&block[648])|(test[649]&block[649])|(test[650]&block[650])|(test[651]&block[651])|
(test[652]&block[652])|(test[653]&block[653])|(test[654]&block[654])|(test[655]&block[655])|(test[656]&block[656])|
(test[657]&block[657])|(test[658]&block[658])|(test[659]&block[659])|(test[661]&block[661])|(test[660]&block[660])|
(test[662]&block[662])|(test[663]&block[663])|(test[664]&block[664])|(test[665]&block[665])|(test[666]&block[666])|
(test[667]&block[667])|(test[668]&block[668])|(test[669]&block[669])|(test[671]&block[671])|(test[670]&block[670])|
(test[672]&block[672])|(test[673]&block[673])|(test[674]&block[674])|(test[675]&block[675])|(test[676]&block[676])|
(test[677]&block[677])|(test[678]&block[678])|(test[679]&block[679])|(test[681]&block[681])|(test[680]&block[680])|
(test[682]&block[682])|(test[683]&block[683])|(test[684]&block[684])|(test[685]&block[685])|(test[686]&block[686])|
(test[687]&block[687])|(test[688]&block[688])|(test[689]&block[689])|(test[691]&block[691])|(test[690]&block[690])|
(test[692]&block[692])|(test[693]&block[693])|(test[694]&block[694])|(test[695]&block[695])|(test[696]&block[696])|
(test[697]&block[697])|(test[698]&block[698])|(test[699]&block[699])|(test[701]&block[701])|(test[700]&block[700])|
(test[702]&block[702])|(test[703]&block[703])|(test[704]&block[704])|(test[705]&block[705])|(test[706]&block[706])|
(test[707]&block[707])|(test[708]&block[708])|(test[709]&block[709])|(test[710]&block[710])|(test[711]&block[711])|
(test[712]&block[712])|(test[713]&block[713])|(test[714]&block[714])|(test[715]&block[715])|(test[716]&block[716])|
(test[717]&block[717])|(test[718]&block[718])|(test[719]&block[719])|(test[720]&block[720])|(test[721]&block[721])|
(test[722]&block[722])|(test[723]&block[723])|(test[724]&block[724])|(test[725]&block[725])|(test[726]&block[726])|
(test[727]&block[727])|(test[728]&block[728])|(test[729]&block[729])|(test[730]&block[730])|(test[731]&block[731])|
(test[732]&block[732])|(test[733]&block[733])|(test[734]&block[734])|(test[735]&block[735])|(test[736]&block[736])|
(test[737]&block[737])|(test[738]&block[738])|(test[739]&block[739])|(test[740]&block[740])|(test[741]&block[741])|
(test[742]&block[742])|(test[743]&block[743])|(test[744]&block[744])|(test[745]&block[745])|(test[746]&block[746])|
(test[747]&block[747])|(test[748]&block[748])|(test[749]&block[749])|(test[750]&block[750])|(test[751]&block[751])|
(test[752]&block[752])|(test[753]&block[753])|(test[754]&block[754])|(test[755]&block[755])|(test[756]&block[756])|
(test[757]&block[757])|(test[758]&block[758])|(test[759]&block[759])|(test[761]&block[761])|(test[760]&block[760])|
(test[762]&block[762])|(test[763]&block[763])|(test[764]&block[764])|(test[765]&block[765])|(test[766]&block[766])|
(test[767]&block[767])|(test[768]&block[768])|(test[769]&block[769])|(test[771]&block[771])|(test[770]&block[770])|
(test[772]&block[772])|(test[773]&block[773])|(test[774]&block[774])|(test[775]&block[775])|(test[776]&block[776])|
(test[777]&block[777])|(test[778]&block[778])|(test[779]&block[779])|(test[781]&block[781])|(test[780]&block[780])|
(test[782]&block[782])|(test[783]&block[783])|(test[784]&block[784])|(test[785]&block[785])|(test[786]&block[786])|
(test[787]&block[787])|(test[788]&block[788])|(test[789]&block[789])|(test[791]&block[791])|(test[790]&block[790])|
(test[792]&block[792])|(test[793]&block[793])|(test[794]&block[794])|(test[795]&block[795])|(test[796]&block[796])|
(test[797]&block[797])|(test[798]&block[798])|(test[799]&block[799])|(test[801]&block[801])|(test[800]&block[800])|
(test[802]&block[802])|(test[803]&block[803])|(test[804]&block[804])|(test[805]&block[805])|(test[806]&block[806])|
(test[807]&block[807])|(test[808]&block[808])|(test[809]&block[809])|(test[810]&block[810])|(test[811]&block[811])|
(test[812]&block[812])|(test[813]&block[813])|(test[814]&block[814])|(test[815]&block[815])|(test[816]&block[816])|
(test[817]&block[817])|(test[818]&block[818])|(test[819]&block[819])|(test[820]&block[820])|(test[821]&block[821])|
(test[822]&block[822])|(test[823]&block[823])|(test[824]&block[824])|(test[825]&block[825])|(test[826]&block[826])|
(test[827]&block[827])|(test[828]&block[828])|(test[829]&block[829])|(test[830]&block[830])|(test[831]&block[831])|
(test[832]&block[832])|(test[833]&block[833])|(test[834]&block[834])|(test[835]&block[835])|(test[836]&block[836])|
(test[837]&block[837])|(test[838]&block[838])|(test[839]&block[839])|(test[840]&block[840])|(test[841]&block[841])|
(test[842]&block[842])|(test[843]&block[843])|(test[844]&block[844])|(test[845]&block[845])|(test[846]&block[846])|
(test[847]&block[847])|(test[848]&block[848])|(test[849]&block[849])|(test[850]&block[850])|(test[851]&block[851])|
(test[852]&block[852])|(test[853]&block[853])|(test[854]&block[854])|(test[855]&block[855])|(test[856]&block[856])|
(test[857]&block[857])|(test[858]&block[858])|(test[859]&block[859])|(test[861]&block[861])|(test[860]&block[860])|
(test[862]&block[862])|(test[863]&block[863])|(test[864]&block[864])|(test[865]&block[865])|(test[866]&block[866])|
(test[867]&block[867])|(test[868]&block[868])|(test[869]&block[869])|(test[871]&block[871])|(test[870]&block[870])|
(test[872]&block[872])|(test[873]&block[873])|(test[874]&block[874])|(test[875]&block[875])|(test[876]&block[876])|
(test[877]&block[877])|(test[878]&block[878])|(test[879]&block[879])|(test[881]&block[881])|(test[880]&block[880])|
(test[882]&block[882])|(test[883]&block[883])|(test[884]&block[884])|(test[885]&block[885])|(test[886]&block[886])|
(test[887]&block[887])|(test[888]&block[888])|(test[889]&block[889])|(test[891]&block[891])|(test[890]&block[890])|
(test[892]&block[892])|(test[893]&block[893])|(test[894]&block[894])|(test[895]&block[895])|(test[896]&block[896])|
(test[897]&block[897])|(test[898]&block[898])|(test[899]&block[899])|(test[901]&block[901])|(test[900]&block[900])|
(test[902]&block[902])|(test[903]&block[903])|(test[904]&block[904])|(test[905]&block[905])|(test[906]&block[906])|
(test[907]&block[907])|(test[908]&block[908])|(test[909]&block[909])|(test[910]&block[910])|(test[911]&block[911])|
(test[912]&block[912])|(test[913]&block[913])|(test[914]&block[914])|(test[915]&block[915])|(test[916]&block[916])|
(test[917]&block[917])|(test[918]&block[918])|(test[919]&block[919])|(test[920]&block[920])|(test[921]&block[921])|
(test[922]&block[922])|(test[923]&block[923])|(test[924]&block[924])|(test[925]&block[925])|(test[926]&block[926])|
(test[927]&block[927])|(test[928]&block[928])|(test[929]&block[929])|(test[930]&block[930])|(test[931]&block[931])|
(test[932]&block[932])|(test[933]&block[933])|(test[934]&block[934])|(test[935]&block[935])|(test[936]&block[936])|
(test[937]&block[937])|(test[938]&block[938])|(test[939]&block[939])|(test[940]&block[940])|(test[941]&block[941])|
(test[942]&block[942])|(test[943]&block[943])|(test[944]&block[944])|(test[945]&block[945])|(test[946]&block[946])|
(test[947]&block[947])|(test[948]&block[948])|(test[949]&block[949])|(test[950]&block[950])|(test[951]&block[951])|
(test[952]&block[952])|(test[953]&block[953])|(test[954]&block[954])|(test[955]&block[955])|(test[956]&block[956])|
(test[957]&block[957])|(test[958]&block[958])|(test[959]&block[959])|(test[961]&block[961])|(test[960]&block[960])|
(test[962]&block[962])|(test[963]&block[963])|(test[964]&block[964])|(test[965]&block[965])|(test[966]&block[966])|
(test[967]&block[967])|(test[968]&block[968])|(test[969]&block[969])|(test[971]&block[971])|(test[970]&block[970])|
(test[972]&block[972])|(test[973]&block[973])|(test[974]&block[974])|(test[975]&block[975])|(test[976]&block[976])|
(test[977]&block[977])|(test[978]&block[978])|(test[979]&block[979])|(test[981]&block[981])|(test[980]&block[980])|
(test[982]&block[982])|(test[983]&block[983])|(test[984]&block[984])|(test[985]&block[985])|(test[986]&block[986])|
(test[987]&block[987])|(test[988]&block[988])|(test[989]&block[989])|(test[991]&block[991])|(test[990]&block[990])|
(test[992]&block[992])|(test[993]&block[993])|(test[994]&block[994])|(test[995]&block[995])|(test[996]&block[996])|
(test[997]&block[997])|(test[998]&block[998])|(test[999]&block[999]);
	end
	
end



assign led = 8'b0;
assign vga_h_sync = ~vga_HS;
assign vga_v_sync = ~vga_VS;

assign G = 1'b0; 
assign B = 1'b0;/*CounterX==260||CounterX==270||CounterX==280||CounterX==290||CounterX==300||CounterX==310||CounterX==320||
CounterX==330||CounterX==340||CounterX==350||CounterX==360||CounterX==370||CounterX==380||CounterX==390||CounterX==400||
CounterX==410||CounterX==420||CounterX==430||CounterX==440||CounterX==450||CounterX==460||CounterX==470||CounterX==480||
CounterX==490||CounterX==500||CounterX==510||CounterX==520||CounterX==530||CounterX==540||CounterX==550||CounterX==560||
CounterX==570||CounterX==580||CounterX==590||CounterX==600||CounterX==610||CounterX==620||CounterX==630||CounterX==640||
CounterX==650||CounterX==250||
CounterY==200||CounterY==220||CounterY==240||CounterY==260||CounterY==280||CounterY==300||CounterY==320||CounterY==340||
CounterY==360||CounterY==380||CounterY==400||CounterY==420||CounterY==440||CounterY==460||CounterY==480||CounterY==500||
CounterY==520||CounterY==540||CounterY==560||CounterY==580||CounterY==600||CounterY==620||CounterY==640||CounterY==660||
CounterY==680||CounterY==700;*/

copy cat(
.rst(rst),
.clk(c1),
.arr(arr),
.next(test)
);


endmodule