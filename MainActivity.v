`timescale 1ns / 1ps

module MainActivity
	(
   input  [7:0] estado,
   input  [7:0]RG1_P,
   input  [7:0]RG2_P,
   input  [7:0]RG3_P,
   input escribiendo,
   input en_out,
   input  [3:0] dig0, dig1,
   input  [3:0] direccion,
	input  clk, reset, off_alarma,on_alarma,//clock signal 100M
   output [7:0] COLOUR_OUT,//bit patters for colour that goes to VGA port
   output HS,					//Horizontal Synch signal that goes into VGA port
   output VS,					//Vertical Synch signal that goes into VGA port7
   output  [7:0] seg_Ti,
	output  [7:0] min_Ti,
	output  [7:0] hor_Ti
	);
	
	reg DOWNCOUNTER = 0;
	reg [7:0] COLOUR_IN, COLOUR_IN_co, COLOUR_IN_fe, COLOUR_IN_re, COLOUR_IN_cr;
	reg en_conf, en_fecha, en_reloj, en_crono;
	wire [31:0] STATE1,STATE2, STATE3, STATE4;
	wire TrigRefresh;			//Trigger gives a pulse when displayed refreshed
	wire [9:0] ADDRH;			//wire for getting Horizontal pixel value
	wire [8:0] ADDRV;			//wire for getting vertical pixel value
	
	
	   // signal declaration
   //reg [1:0] state_reg, state_next;
   wire CLK;
   wire [8:0] text_on;
   wire [2:0] text_rgb;
	
	wire [3:0] RG1_Unit;
   wire [3:0] RG2_Unit;
   wire [3:0] RG3_Unit;
	
	wire [3:0] RG1_Dec;
   wire [3:0] RG2_Dec;
   wire [3:0] RG3_Dec;
	
	assign RG1_Unit= RG1_P[3:0];
	assign RG2_Unit= RG2_P[3:0];
	assign RG3_Unit= RG3_P[3:0];
	
	assign RG1_Dec= RG1_P[7:4];
	assign RG2_Dec= RG2_P[7:4];
	assign RG3_Dec= RG3_P[7:4];
	
	
	clk_div clk_div (
    .clk(clk),  
    .out_clk(CLK)
    );

	//Divisor a 25MHz		
	always @(posedge CLK)begin     
		DOWNCOUNTER <= ~DOWNCOUNTER;	//Slow down the counter to 25MHz
	end
		
	//VGA Interface gets values of ADDRH & ADDRV and by puting COLOUR_IN, gets valid output COLOUR_OUT
	VGAInterface VGA(
				.CLK(DOWNCOUNTER),
			   .COLOUR_IN (COLOUR_IN),
				.COLOUR_OUT(COLOUR_OUT),
				.HS(HS),
				.VS(VS),
				.REFRESH(TrigRefresh),
				.ADDRH(ADDRH),
				.ADDRV(ADDRV),
				.DOWNCOUNTER(DOWNCOUNTER)
				);
				
    VGA_text text_unit
   ( 
	 .estado(estado),
	 .RG1_Unit(RG1_Unit),
    .RG2_Unit(RG2_Unit),
    .RG3_Unit(RG3_Unit),
	 .RG1_Dec(RG1_Dec),
    .RG2_Dec(RG2_Dec),
    .RG3_Dec(RG3_Dec),
	 .escribiendo(escribiendo),
	 .en_out(en_out),
    .CLK(DOWNCOUNTER), .off_alarma(off_alarma), .on_alarma(on_alarma), .direccion(direccion),
	 .dig0_Dec(dig0), .dig1_Unit(dig1),
    .pix_x(ADDRH), .pix_y(ADDRV),
    .text_on(text_on),
    .text_rgb(text_rgb),
	 .seg_Ti(seg_Ti),
	 .min_Ti(min_Ti),
	 .hor_Ti(hor_Ti)
   );
	
	



	
//------DATO-FECHA-------------------------------------------------------------------------------------



	
//-------------------COLOCACION DE IMAGENES-----------------------------------------------------

//------INFORMACIÓN DE CONFIGURACIÓN------------------------------------------------------------
   localparam  Xc = 360;
	localparam  Yc = 30;	
	reg [7:0] COLOUR_DATA [0:configuracion2-1];
	parameter configuracion2 = 16'd46872;	
	parameter configuracion2X = 8'd248;	
	parameter configuracion2Y = 8'd189;	
	
	initial
	$readmemh ("Instrucciones.png.list", COLOUR_DATA);
	
	assign STATE1 = ((ADDRH-Xc)*configuracion2Y)+ADDRV-Yc;
	
	always @(posedge CLK) begin
		if (ADDRH>=Xc  && ADDRH<Xc +configuracion2X
			&& ADDRV>=Yc && ADDRV<Yc+configuracion2Y)
				begin
					COLOUR_IN_co <= COLOUR_DATA[{STATE1}];
					en_conf<=1;
				end
			else
				begin 
					COLOUR_IN_co <= 8'hFF;
					en_conf<=0;
				end
	end
//------------------------------------------------------------------------------------------------

//------TITULO-FECHA-------------------------------------------------------------------------------------
	localparam  Xf = 0;
	localparam  Yf = 45;	
	reg [7:0] COLOUR_DATA_f [0:fecha-1];
	parameter fecha = 13'd3936;	
	parameter fechaX = 7'd123;	
	parameter fechaY = 6'd32;	
	
	initial
	$readmemh ("Fecha.png.list", COLOUR_DATA_f);
	
	assign STATE2 = ((ADDRH-Xf)*fechaY)+ADDRV-Yf;
	
	always @(posedge CLK) begin
		if (ADDRH>=Xf && ADDRH<Xf+fechaX
			&& ADDRV>=Yf && ADDRV<Yf+fechaY)
			begin
				COLOUR_IN_fe <= COLOUR_DATA_f[{STATE2}];
				en_fecha<=1;
			end
			else
			begin
				COLOUR_IN_fe <= 8'hFF;
				en_fecha<=0;
			end
	end
//------------------------------------------------------------------------------------------------

//------TITULO-RELOJ-------------------------------------------------------------------------------------
	
	localparam  Xr = 0;
	localparam  Yr = 166;	
	reg [7:0] COLOUR_DATA_r [0:reloj-1];
	parameter reloj = 13'd4446;	
	parameter relojX = 7'd114;	
	parameter relojY = 6'd39;	
	
	initial
	$readmemh ("Hora.png.list", COLOUR_DATA_r);
	
	assign STATE3 = ((ADDRH-Xr)*relojY)+ADDRV-Yr;
	
	always @(posedge CLK) begin
		if (ADDRH>=Xr && ADDRH<Xr+relojX
			&& ADDRV>=Yr && ADDRV<Yr+relojY)
			begin
				COLOUR_IN_re <= COLOUR_DATA_r[{STATE3}];
				en_reloj<=1;
			end
			else
			begin
				COLOUR_IN_re <= 8'hFF;
				en_reloj<=0;
			end
	end
//------------------------------------------------------------------------------------------------

//------TITULO-CRONOMETRO-------------------------------------------------------------------------------------
	
   localparam  Xcr = 0;
	localparam  Ycr = 286;	
	reg [7:0] COLOUR_DATA_cr [0:cronometro-1];
	parameter cronometro = 14'd9102;	
	parameter cronometroX = 8'd222;	
	parameter cronometroY = 6'd41;	
	
	initial
	$readmemh ("Cronometro.png.list", COLOUR_DATA_cr);
	
	assign STATE4 = ((ADDRH-Xcr)*cronometroY)+ADDRV-Ycr;
	
	always @(posedge CLK) begin
		if (ADDRH>=Xcr && ADDRH<Xcr+cronometroX
			&& ADDRV>=Ycr && ADDRV<Ycr+cronometroY)
			begin
				COLOUR_IN_cr <= COLOUR_DATA_cr[{STATE4}];
				en_crono<=1;
			end
			else
			begin
				COLOUR_IN_cr <= 8'hFF;
				en_crono<=0;
			end
	end
//------------------------------------------------------------------------------------------------
wire [7:0]color;
assign color={text_rgb[2],text_rgb[2],text_rgb[1],text_rgb[1],text_rgb[1],text_rgb[0],text_rgb[0],text_rgb[0]};

//--------MUX------------------------------------------------------------------------------------

always @ (posedge DOWNCOUNTER )

begin
	if (text_on[2])
		COLOUR_IN<=color;
	else if (text_on[4])
		COLOUR_IN<=color;
	else if (text_on[3])
		COLOUR_IN<=color;
	else if (text_on[3])
		COLOUR_IN<=color;
	else if (en_fecha)
		COLOUR_IN<=COLOUR_IN_fe;
	else if (en_reloj)
		COLOUR_IN<=COLOUR_IN_re;
	else if (en_crono)
		COLOUR_IN<=COLOUR_IN_cr;
	else if (en_conf)
	begin
		COLOUR_IN<=COLOUR_IN_co;
	end
	else 
		COLOUR_IN<=COLOUR_IN;
end
endmodule
