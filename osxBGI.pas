unit osxbgi;

{$MODE OBJFPC}

interface

//uses Neslib.Glfw3;

{$DEFINE DBGOUT}
const
	defaultTitle: pchar = 'Graphic window'#0;

{error codes}
const            grOk = smallint(  0);
        grNoInitGraph = smallint(- 1);
      grInvalidDriver = smallint(- 2);
        grInvalidMode = smallint(- 3);
          grNotWindow = smallint(- 4);
        grInvalidFont = smallint(- 5);
     grInvalidFontNum = smallint(- 6);
       grInvalidParam = smallint(- 7);
          grNoPalette = smallint(- 8);
           grNoOpenGL = smallint(- 9);
              grError = smallint(-10);

{graphics drivers}
const    Detect = smallint(0);
          D1bit = smallint(1);
          D4bit = smallint(2);
          D8bit = smallint(3);
      NoPalette = smallint(9);
       HercMono = D1bit;
            VGA = D4bit;
           SVGA = D8bit;

{graphics modes}
const   m320x200 = smallint( 1);
        m640x200 = smallint( 2);
        m640x350 = smallint( 3);
        m640x480 = smallint( 4);
        m720x350 = smallint( 5);
        m800x600 = smallint( 6);
       m1024x768 = smallint( 7);
      m1280x1024 = smallint( 8);
        mDefault = smallint(10);
      mMaximized = smallint(11);
        mFullScr = smallint(12);
         mCustom = smallint(13);
      HercMonoHi = m720x350;
           VGALo = m640x200;
          VGAMed = m640x350;
           VGAHi = m640x480;

{update constants}
const UpdateOff = word(0);
       UpdateOn = word(1);
      UpdateNow = word(2);

{color constants}
	AliceBlue = $FFF8F0;
	AlizarinCrimson = $3626E3;
	Amber = $00BFFF;
	Amethyst = $CC6699;
	AntiqueWhite = $D7EBFA;
	Aquamarine = $D4FF7F;
	Asparagus = $5BA07B;
	Azure = $FFFFF0;
	Beige = $DCF5F5;
	Bisque = $C4E4FF;
	Bistre = $1F2B3D;
	BitterLemon = $0DE0CA;
	Black = $000000;
	BlanchedAlmond = $CDEBFF;
	BlazeOrange = $0099FF;
	Blue = $FF0000;
	BlueViolet = $E22B8A;
	BondiBlue = $B69500;
	Brass = $42A6B5;
	BrightGreen = $00FF66;
	BrightTurquoise = $DEE808;
	BrightViolet = $CD00CD;
	Bronze = $327FCD;
	Brown = $2A2AA5;
	Buff = $82DCF0;
	Burgundy = $200090;
	BurlyWood = $87B8DE;
	BurntOrange = $0055CC;
	BurntSienna = $5174E9;
	BurntUmber = $24338A;
	CadetBlue = $A09E5F;
	CamouflageGreen = $6B8678;
	Cardinal = $3A1EC4;
	Carmine = $180096;
	Carrot = $2191ED;
	Casper = $D1BEAD;
	Celadon = $AFE1AC;
	Cerise = $6331DE;
	Cerulean = $A77B00;
	CeruleanBlue = $BE522A;
	Chartreuse = $00FF7F;
	Chocolate = $1E69D2;
	Cinnamon = $003F7B;
	Cobalt = $AB4700;
	Copper = $3373B8;
	Coral = $507FFF;
	Corn = $5DECFB;
	CornflowerBlue = $ED9564;
	Cornsilk = $DCF8FF;
	Cream = $D0FDFF;
	Crimson = $3C14DC;
	Cyan = $FFFF00;
	DarkBlue = $8B0000;
	DarkBrown = $214365;
	DarkCerulean = $7E4508;
	DarkChestnut = $606998;
	DarkCoral = $455BCD;
	DarkCyan = $8B8B00;
	DarkGoldenrod = $0B86B8;
	DarkGray = $545454;
	DarkGreen = $006400;
	DarkIndigo = $620031;
	DarkKhaki = $6BB7BD;
	DarkMagenta = $8B008B;
	DarkOlive = $326855;
	DarkOliveGreen = $2F6B55;
	DarkOrange = $008CFF;
	DarkOrchid = $CC3299;
	DarkPastelGreen = $3CC003;
	DarkPink = $8054E7;
	DarkRed = $00008B;
	DarkSalmon = $7A96E9;
	DarkScarlet = $190356;
	DarkSeaGreen = $8FBC8F;
	DarkSlateBlue = $8B3D48;
	DarkSlateGray = $4F4F2F;
	DarkSpringGreen = $457217;
	DarkTan = $518191;
	DarkTangerine = $12A8FF;
	DarkTeaGreen = $ADDBBA;
	DarkTerraCotta = $5C4ECC;
	DarkTurquoise = $D1CE00;
	DarkViolet = $D30094;
	DeepPink = $9314FF;
	DeepSkyBlue = $FFBF00;
	Denim = $BD6015;
	DimGray = $696969;
	DodgerBlue = $FF901E;
	Emerald = $78C850;
	Eggplant = $660099;
	FernGreen = $42794F;
	FireBrick = $2222B2;
	Flax = $82DCEE;
	FloralWhite = $F0FAFF;
	ForestGreen = $228B22;
	Fractal = $808080;
	Fuchsia = $A100F4;
	Gainsboro = $DCDCDC;
	Gamboge = $0F9BE4;
	GhostWhite = $FFF8F8;
	Gold = $00D7FF;
	Goldenrod = $20A5DA;
	Gray = $7E7E7E;
	GrayAsparagus = $455946;
	GrayTeaGreen = $BADACA;
	Green = $008000;
	GreenYellow = $2FFFAD;
	Heliotrope = $FF73DF;
	Honeydew = $F0FFF0;
	HotPink = $B469FF;
	IndianRed = $5C5CCD;
	Indigo = $82004B;
	InternationalKleinBlue = $A72F00;
	InternationalOrange = $004FFF;
	Ivory = $F0FFFF;
	Jade = $6BA800;
	Khaki = $8CE6F0;
	Lavender = $FAE6E6;
	LavenderBlush = $F5F0FF;
	LawnGreen = $00FC7C;
	Lemon = $10E9FD;
	LemonChiffon = $CDFAFF;
	LightBlue = $E6D8AD;
	LightBrown = $8CB4D2;
	LightCoral = $8080F0;
	LightCyan = $FFFFE0;
	LightGoldenrodYellow = $D2FAFA;
	LightGray = $A8A8A8;
	LightGreen = $90EE90;
	LightMagenta = $FF80FF;
	LightPink = $C1B6FF;
	LightRed = $8080FF;
	LightSalmon = $7AA0FF;
	LightSeaGreen = $AAB220;
	LightSkyBlue = $FACE87;
	LightSlateGray = $998877;
	LightSteelBlue = $DEC4B0;
	LightYellow = $E0FFFF;
	Lilac = $C8A2C8;
	Lime = $00FF00;
	LimeGreen = $32CD32;
	Linen = $E6F0FA;
	Magenta = $FF00FF;
	Malachite = $51DA0B;
	Maroon = $000080;
	Mauve = $FFB0E0;
	MediumAquamarine = $AACD66;
	MediumBlue = $CD0000;
	MediumOrchid = $D355BA;
	MediumPurple = $DB7093;
	MediumSeaGreen = $71B33C;
	MediumSlateBlue = $EE687B;
	MediumSpringGreen = $9AFA00;
	MediumTurquoise = $CCD148;
	MediumVioletRed = $8515C7;
	MidnightBlue = $701919;
	MintCream = $FAFFF5;
	MistyRose = $E1E4FF;
	Moccasin = $B5E4FF;
	MoneyGreen = $C0DCC0;
	Monza = $1E03C7;
	MossGreen = $ADDFAD;
	MountbattenPink = $8D7A99;
	Mustard = $58DBFF;
	NavajoWhite = $ADDEFF;
	Navy = $800000;
	Ochre = $2277CC;
	OldGold = $3BB5CF;
	OldLace = $E6F5FD;
	Olive = $008080;
	OliveDrab = $238E6B;
	Orange = $00A5FF;
	OrangeRed = $0045FF;
	Orchid = $D670DA;
	PaleBrown = $547698;
	PaleCarmine = $3540AF;
	PaleChestnut = $AFADDD;
	PaleCornflowerBlue = $EFCDAB;
	PaleGoldenrod = $AAE8EE;
	PaleGreen = $98FB98;
	PaleMagenta = $E584F9;
	PaleMauve = $666699;
	PalePink = $DDDAFA;
	PaleSandyBrown = $ABBDDA;
	PaleTurquoise = $EEEEAF;
	PaleVioletRed = $9370DB;
	PapayaWhip = $D5EFFF;
	PastelGreen = $77DD77;
	PastelPink = $DCD1FF;
	Peach = $B4E5FF;
	PeachOrange = $99CCFF;
	PeachPuff = $B9DAFF;
	PeachYellow = $ADDFFA;
	Pear = $31E2D1;
	Periwinkle = $FFCCCC;
	PersianBlue = $FF0066;
	Peru = $3F85CD;
	PineGreen = $6F7901;
	Pink = $CBC0FF;
	PinkOrange = $6699FF;
	Plum = $DDA0DD;
	PowderBlue = $E6E0B0;
	PrussianBlue = $533100;
	Puce = $9988CC;
	Pumpkin = $1875FF;
	Purple = $800080;
	RawUmber = $124A73;
	Red = $0000FF;
	Reef = $A2FFC9;
	RobinEggBlue = $CCCC00;
	RosyBrown = $8F8FBC;
	RoyalBlue = $E16941;
	Russet = $1B4680;
	Rust = $0E41B7;
	SaddleBrown = $13458B;
	Saffron = $30C4F4;
	Salmon = $7280FA;
	SandyBrown = $60A4F4;
	Sangria = $0A0092;
	Sapphire = $672508;
	Scarlet = $0024FF;
	SchoolBusYellow = $00D8FF;
	SeaGreen = $578B2E;
	SeaShell = $EEF5FF;
	SelectiveYellow = $00BAFF;
	Sepia = $144270;
	Sienna = $2D52A0;
	Silver = $C0C0C0;
	SkyBlue = $EBCE87;
	SlateBlue = $CD5A6A;
	SlateGray = $908070;
	Snow = $FAFAFF;
	SpringGreen = $7FFF00;
	SteelBlue = $B48246;
	SwampGreen = $8EB7AC;
	Taupe = $7E98BC;
	Tangerine = $00CCFF;
	Teal = $808000;
	TeaGreen = $C0F0D0;
	Tenne = $0057CD;
	TerraCotta = $5B72E2;
	Thistle = $D8BFD8;
	Tomato = $4763FF;
	Turquoise = $D0E040;
	Ultramarine = $8F0A12;
	Vermilion = $004DFF;
	Violet = $EE82EE;
	VioletEggplant = $991199;
	Viridian = $6D8240;
	Wheat = $B3DEF5;
	White = $FFFFFF;
	WhiteSmoke = $F5F5F5;
	Wisteria = $DCA0C9;
	Yellow = $00FFFF;
	YellowGreen = $32CD9A;
	Zinnwaldite = $AFC2EB;


{initialization exported routines}
procedure ClearDevice;
procedure CloseGraph;
//function CloseGraphRequest: boolean;
//procedure DetectGraph(out driver,mode:smallint);
//function GetDriverName: shortstring;
//function GetGraphMode: smallint;
//function GetMaxMode: smallint;
//function GetModeName(mode:smallint): shortstring;
//procedure GetModeRange(driver:smallint; out width,height:smallint);
//procedure GraphDefaults;
function GraphEnabled: boolean;
function GraphErrorMsg(errorcode:smallint): shortstring;
function GraphResult: smallint;
procedure InitGraph(var driver,mode:smallint; const title:shortstring);
//function OpenGLEnabled: boolean;
//procedure RestoreCrtMode;
//procedure SetGraphMode(mode:smallint);
//procedure SetOpenGLMode(direct:boolean);
//procedure SetWindowSize(width,height:word);
procedure UpdateGraph(bit:word);

{crt overrides}
function ReadKey: char;
procedure Delay(ms: longint);


{color management exported routines}
function GetBkColor: longword;
function GetColor: longword;
//procedure GetDefaultPalette(out palette:PaletteType);
//procedure GetNamesPalette(out palette:PaletteType);
//function GetMaxColor: longword;
//procedure GetPalette(out palette:PaletteType);
//function GetPaletteSize: smallint;
//function GetPixel(x,y:smallint): longword;
function GetRGBColor(r,g,b:word): longword;
procedure GetRGBComponents(color:longword; out r,g,b:word);
//procedure GetSystemPalette(out palette:PaletteType);
//procedure SetAllPalette(var palette);
procedure SetBkColor(color:longword);
procedure SetColor(color:longword);
procedure SetPalette(nrcolor,color:word);
procedure SetRGBPalette(nrcolor,r,g,b:word);


type
	        PointType = record
                          x,y: longint;
                        end;
     LineSettingsType = record
                          linestyle,pattern,thickness: word;
                        end;
        ArcCoordsType = record
                          x,y,xstart,ystart,xend,yend: smallint;
                        end;
{drawing style for lines}
const      SolidLn = word(0);
          DottedLn = word(1);
         DashDotLn = word(2);
          DashedLn = word(3);
      DashDotDotLn = word(4);
         UserBitLn = word(5);
            NullLn = word(6);
{thick constants for lines}
const   NormWidth = word(1);
      DoubleWidth = word(2);
      TripleWidth = word(3);
        QuadWidth = word(4);
       ThickWidth = TripleWidth;
{drawing primitives exported routines}
procedure Arc(x,y:smallint; start,stop,radius:word);
procedure Circle(x,y:smallint; radius:word);
//procedure DrawBezier(nrpoints:word; var polypoints);
procedure DrawPoly(nrpoints:word; var polypoints);
procedure Ellipse(x,y:smallint; start,stop,xradius,yradius:word);
//procedure GetArcCoords(out arccoords:ArcCoordsType);
//procedure GetLineSettings(out lineinfo:LineSettingsType);
procedure Line(x1,y1,x2,y2:smallint);
procedure LineRel(dx,dy:smallint);
procedure LineTo(x,y:smallint);
procedure MoveRel(dx,dy:smallint);
procedure MoveTo(x,y:smallint);
procedure PutPixel(x,y:smallint; color:longword);
procedure Rectangle(x1,y1,x2,y2:smallint);
//procedure RotEllipse(x,y,rot:smallint; xradius,yradius:word);
procedure SetLineStyle(linestyle,pattern,thickness:word);


type
	FillSettingsType = record
		pattern: word;
		color  : longword;
	end;

	FillPatternType = array [1..8] of byte;

{filling patterns}
const   EmptyFill = word(0);
        SolidFill = word(1);
         LineFill = word(2);
          ColFill = word(3);
        HatchFill = word(4);
        SlashFill = word(5);
      BkSlashFill = word(6);
       XHatchFill = word(7);
         UserFill = word(8);
           NoFill = word(9);

{Bar3D constants}
const
	TopOn = true;
	TopOff = false;

{flood mode constants}
const
	BorderFlood = smallint(0);
	SurfaceFlood = smallint(1);

{filled drawings exported routines}
procedure Bar(x1,y1,x2,y2:smallint);
procedure Bar3D(x1,y1,x2,y2:smallint; depth:word; top:boolean);
procedure Chord(x,y:smallint; start,stop,xradius,yradius:word);
procedure FillEllipse(x,y:smallint;xradius,yradius:word);
procedure FillPoly(nrpoints:word; var polypoints);
procedure FillRect(x1,y1,x2,y2:smallint);
//procedure FloodFill(x,y:smallint; color:longword);
//procedure GetFillPattern(out fillpattern:FillPatternType);
//procedure GetFillSettings(out fillinfo:FillSettingsType);
//procedure InvertRect(x1,y1,x2,y2:smallint);
procedure PieSlice(x,y:smallint; start,stop,radius:word);
procedure RoundRect(x1,y1,x2,y2,r:smallint);
procedure Sector(x,y:smallint; start,stop,xradius,yradius:word);
//procedure SetFillPattern(fillpattern:FillPatternType; color:longword);
procedure SetFillStyle(pattern:word; color:longword);
//procedure SetFloodMode(floodmode:smallint);

//var
//	graphWindow: PGLFWwindow;

implementation

uses gl,
	Neslib.Glfw3,
	ctypes, crt, strings;

type
	ColorType = record
		r, g, b: cfloat;
	end;

var
	myKey : char;
	grEnabled: boolean;

	grDirect,grUpdate           : boolean;

	{grDriver,grMode,}grResult    : smallint;

	//maxX,maxY,origX,origY		: longint;
	actX,actY{,aspX,aspY}         : longint;

	ScreenH, ScreenW: integer;

	graphWindow: PGLFWwindow;

	frColor, bkColor,fillColor : ColorType;

	fillSettings                : FillSettingsType;

	visualPage,activePage       : word;

{$CALLING CDECL} 

procedure MyKeyCallback(window: PGLFWwindow; a,b,c,d:cint);
begin
	//writeln('key cb: (',a:5,b:5,c:5,d:5,')');
end;

procedure MyCharCallback(window: PGLFWwindow; a:cuint);
begin
	//writeln('char cb: (',a:5,'*',chr(a),'*)');
	myKey := chr(a);
end;

procedure MyResizeCallback(window: PGLFWwindow; w,h:cint);
begin
	glfwSetWindowSize(graphWindow, ScreenW, ScreenH);
end;

procedure MyErrorCallback(error: Integer; const description: PAnsiChar); cdecl;
begin
	writeln('Error ',error,':', description);
end;

{$CALLING DEFAULT} 

Function ColorToColorType(color: longword) : ColorType; forward;

procedure InitGraph(var driver,mode:smallint; const title:shortstring);
var
	res : integer;
	newTitle : pchar;
	width, height: cint;
begin
	grResult := grError;

	glfwSetErrorCallback(@MyErrorCallback);

	res := glfwInit();
	if( res = 0 ) then
	begin
		writeln('LIB init failed. Res =', res);
		exit;
	end;
{$IFDEF DBGOUT}
	writeln('GLFW initialized');
{$ENDIF}

	ScreenW := 640;
	ScreenH := 480;

	newTitle := nil;
	newTitle := StrAlloc (length(title)+1);
	
	if (title = '') or (StrPCopy (newTitle,title)<>newTitle) then
	begin
		StrDispose(newTitle);
		newTitle := nil;
		newTitle := StrAlloc (length(defaultTitle)+1);
		
		if StrPCopy (newTitle,defaultTitle)<>newTitle then
		begin			
			exit;	
		end;
	end;

	//* Create a windowed mode window and its OpenGL context */
	graphWindow := nil;	

	glfwWindowHint(GLFW_CONTEXT_VERSION_MAJOR, 2);
	glfwWindowHint(GLFW_CONTEXT_VERSION_MINOR, 1);

	glfwWindowHint(GLFW_DOUBLEBUFFER, GLFW_TRUE);

	glfwWindowHint(GLFW_RESIZABLE, GLFW_FALSE);
	glfwWindowHint(GLFW_DEPTH_BITS, 0);
	glfwWindowHint(GLFW_RED_BITS, 8);
	glfwWindowHint(GLFW_GREEN_BITS, 8);
	glfwWindowHint(GLFW_BLUE_BITS, 8);

	graphWindow := glfwCreateWindow(ScreenW, ScreenH, newTitle, nil, nil);

	if (newTitle <> nil) then
		StrDispose(newTitle);

	if( graphWindow = nil ) then
	begin	
		writeln('Create window failed');

		glfwTerminate();

		exit;
	end;

{$IFDEF DBGOUT}
	writeln('window created');
{$ENDIF}

	glfwGetFramebufferSize(graphWindow, @width, @height);
{$IFDEF DBGOUT}
	writeln('glfwGetFramebufferSize returned ', width:6, height:6);
{$ENDIF}

	//glViewport(0, 0, width, height);


	//Make the window's context current */
	glfwMakeContextCurrent(graphWindow);

	glfwSetKeyCallback(graphWindow, @MyKeyCallback);
	glfwSetCharCallback(graphWindow, @MyCharCallback);
	glfwSetWindowSizeCallback(graphWindow, @MyResizeCallback);

{$IFDEF DBGOUT}
	writeln('callbacks set');
{$ENDIF}

	glMatrixMode(GL_PROJECTION);
	glLoadidentity();
	glScalef(2/(ScreenW + 1),-2/(ScreenH + 1),1);	
	glTranslatef(-ScreenW/2,-ScreenH/2,0);
	
	glClear(GL_COLOR_BUFFER_BIT);

	actX := 0;
	actY := 0;

	visualPage := 0;
	activePage := 0;
	
	grDirect := true;
	grUpdate := true;

	grResult := grOk;

	grEnabled := true;
end;

procedure ClearDevice;
begin
{$IFDEF DBGOUT}
	writeln('ClearDevice');
{$ENDIF}

	if (grEnabled) then
	begin
		if grDirect then glfwSwapBuffers(graphWindow);
		
		glClearColor(bkColor.r, bkColor.g, bkColor.b, 1.0 );

		glClear(GL_COLOR_BUFFER_BIT);

		if grDirect then glfwSwapBuffers(graphWindow);

		actX := 0;
		acty := 0;
	end;
end;

procedure CloseGraph;
begin
	if (grEnabled) then
	begin
		glfwTerminate();

		grEnabled := false;
	end;
end;

function GraphEnabled: boolean;
begin
	GraphEnabled:=grEnabled;
end;

function GraphErrorMsg(errorcode:smallint): shortstring;
var
	msg: shortstring;
begin
	case errorcode of
	grOk :
		begin
			GraphErrorMsg:='';
			Exit;
		end;
	grInvalidDriver  : msg:='Invalid graphics driver';
	grInvalidMode    : msg:='Invalid graphics mode';
	grNotWindow      : msg:='Creation of graphics window failed';
	grNoInitGraph    : msg:='Graphics window not initialized. Use InitGraph';
	grInvalidFont    : msg:='Invalid font selection';
	grInvalidFontNum : msg:='Invalid font number';
	grInvalidParam   : msg:='Invalid parameter value';
	grNoPalette      : msg:='No palette available. Change graphics driver';
	grNoOpenGL       : msg:='OpenGL driver not initialized';
	grError          : msg:='General graphics error';
	else
		msg:='Unrecognized error code';
	end;

	GraphErrorMsg := 'Error: ' + msg;
end;

function GraphResult: smallint;
begin
	GraphResult:=grResult;
	grResult:=grOk;
end;


function ReadKey: char;
begin
{$IFDEF DBGOUT}
	writeln('Readkey()');
{$ENDIF}

	if (grEnabled) then
	begin
		while (myKey = #0) and (glfwWindowShouldClose(graphWindow) = 0 ) do
		begin
			glfwPollEvents();
		end;
		myKey := #0;
	end
	else
		Result := crt.readkey();
end;

procedure Delay(ms: longint);
var
	curTime, endTime: cdouble;
begin
{$IFDEF DBGOUT}
	writeln('Delay(',ms,')');
{$ENDIF}

	if (grEnabled) then
	begin
		curTime := glfwGetTime;
		endTime := curTime + ms / 1000;

		while (curTime < endTime) do
		begin
			glfwPollEvents();
			curTime := glfwGetTime;
		end;
	end
	else
		crt.Delay(ms);
end;

procedure Line(x1,y1,x2,y2:smallint);
begin
	MoveTo(x1,y1);
	LineTo(x2,y2);
end;

procedure LineRel(dx,dy:smallint);
begin
 	LineTo(actX+dx,actY+dy);
end;

procedure LineTo(x,y:smallint);
begin
	grResult:=grOK;
	if not grEnabled then begin
		grResult:=grNoInitGraph;
		Exit;
	end;

{$IFDEF DBGOUT}
	writeln('drawing line (',actX:5, ActY:5, x:5, y:5,') color(', frColor.r:8:3,frColor.g:8:3,frColor.b:8:3,')' );
{$ENDIF}

	if grDirect then glfwSwapBuffers(graphWindow);

	glBegin(GL_LINES);

	glColor3f(frColor.r,frColor.g,frColor.b);
	glVertex2i(actX, actY);

	//glColor3f(frColor.r,frColor.g,frColor.b);
	glVertex2i(x,y);

	glEnd();

	if grDirect then glfwSwapBuffers(graphWindow);

	MoveTo(x,y);
end;

procedure MoveRel(dx,dy:smallint);
begin
	Inc(actX,dx); Inc(actY,dy);
	MoveTo(actX,actY);
end;

procedure MoveTo(x,y:smallint);
begin
	grResult:=grOK;
	if not(grEnabled) then begin
		grResult:=grNoInitGraph;
		Exit;
	end;
	
	actX:=x; actY:=y;
end;

procedure PutPixel(x,y:smallint; color:longword);
var
	newColor: ColorType;
begin
{$IFDEF DBGOUT}
	writeln('Putpixel (',x:5, Y:5, color:12,')' );
{$ENDIF}

	grResult:=grOK;
	if not grEnabled then begin
		grResult:=grNoInitGraph;
		Exit;
	end;

	newColor := ColorToColorType(color);

	if grDirect then glfwSwapBuffers(graphWindow);

	glBegin(GL_POINTS);

	glColor3f(newColor.r,newColor.g,newColor.b);
	glVertex2i(x, Y);

	glEnd();

	if grDirect then glfwSwapBuffers(graphWindow);
	
end;


procedure Rectangle(x1,y1,x2,y2:smallint);
begin
{$IFDEF DBGOUT}
	writeln('drawing Rectangle (',x1:5, Y1:5, x2:5, y2:5,')' );
{$ENDIF}
	grResult:=grOK;
	if not grEnabled then begin
		grResult:=grNoInitGraph;
		Exit;
	end;

	if (x2 < x1) or (y2 < y1) then
	begin
		grResult:=grInvalidParam;
		Exit;
	end;

	if grDirect then glfwSwapBuffers(graphWindow);

	glBegin(GL_LINE_LOOP);

	glColor3f(frColor.r,frColor.g,frColor.b);
	glVertex2i(x1, Y1);

	glColor3f(frColor.r,frColor.g,frColor.b);
	glVertex2i(x2, Y1);

	glColor3f(frColor.r,frColor.g,frColor.b);
	glVertex2i(x2, Y2);

	glColor3f(frColor.r,frColor.g,frColor.b);
	glVertex2i(x1, Y2);

	glEnd();

	if grDirect then glfwSwapBuffers(graphWindow);
end;

procedure Ellipse(x,y:smallint; start,stop,xradius,yradius:word);
var
	fi, fistep, fistop: double;
begin
	grResult:=grOK;
	if not grEnabled then
	begin
		grResult:=grNoInitGraph;
		Exit;
	end;

	if start > stop then
	begin
		grResult:=grInvalidParam;
		Exit;
	end;

	if (xradius > yradius) then
		fistep := 1 / xradius
	else
		fistep := 1 / yradius;

	fi := PI * start / 180;
	fistop := PI * stop / 180;

	{$IFDEF DBGOUT}
	writeln('drawing Ellipse (',x:5, Y:5, start:5, stop:5, xradius:5, yradius:5,') steps ',((fistop - fi) / fistep):3:1);
	{$ENDIF}

	if grDirect then glfwSwapBuffers(graphWindow);

	glBegin(GL_LINE_STRIP);

	while fi <= fistop do
	begin
		glColor3f(frColor.r,frColor.g,frColor.b);
		glVertex2d(x + xradius*cos(fi), y-yradius*sin(fi));
		fi := fi + fistep;
	end;

	glEnd();

	if grDirect then glfwSwapBuffers(graphWindow);		
end;

procedure FillEllipse(x,y:smallint;xradius,yradius:word);
var
	fi, fistep, fistop: double;
begin
	grResult:=grOK;
	if not grEnabled then
	begin
		grResult:=grNoInitGraph;
		Exit;
	end;

	if (xradius > yradius) then
		fistep := 1 / xradius
	else
		fistep := 1 / yradius;
	
	fistop := 2*PI;

	{$IFDEF DBGOUT}
	writeln('FillEllipse (',x:5, Y:5, xradius:5, yradius:5,') steps ',(2*PI / fistep):3:1);
	{$ENDIF}

	if grDirect then glfwSwapBuffers(graphWindow);

	glBegin(GL_POLYGON);

	glColor3f(fillColor.r,fillColor.g,fillColor.b);

	fi := 0;
	while fi <= fistop do
	begin		
		glVertex2d(x + xradius*cos(fi), y-yradius*sin(fi));
		fi := fi + fistep;
	end;

	glEnd();

	glBegin(GL_LINE_LOOP);

	glColor3f(frColor.r,frColor.g,frColor.b);

	fi := 0;
	while fi <= fistop do
	begin		
		glVertex2d(x + xradius*cos(fi), y-yradius*sin(fi));
		fi := fi + fistep;
	end;

	glEnd();

	if grDirect then glfwSwapBuffers(graphWindow);
end;

procedure Chord(x,y:smallint; start,stop,xradius,yradius:word);
var
	fi, fistep, fistop: double;
begin
	grResult:=grOK;
	if not grEnabled then
	begin
		grResult:=grNoInitGraph;
		Exit;
	end;

	if stop < start then
	begin
		grResult:=grInvalidParam;
		Exit;
	end;

	if (xradius > yradius) then
		fistep := 1 / xradius
	else
		fistep := 1 / yradius;
	
	fistop := stop*PI/180;

	{$IFDEF DBGOUT}
	writeln('Chord (',x:5, Y:5, start:5,stop:5 ,xradius:5, yradius:5,') steps ',((fistop - start*PI/180) / fistep):3:1);
	{$ENDIF}

	if grDirect then glfwSwapBuffers(graphWindow);

	glBegin(GL_POLYGON);

	glColor3f(fillColor.r,fillColor.g,fillColor.b);

	fi := start*PI/180;
	while fi <= fistop do
	begin		
		glVertex2d(x + xradius*cos(fi), y-yradius*sin(fi));
		fi := fi + fistep;
	end;

	glEnd();

	glBegin(GL_LINE_LOOP);

	glColor3f(frColor.r,frColor.g,frColor.b);

	fi := start*PI/180;
	while fi <= fistop do
	begin		
		glVertex2d(x + xradius*cos(fi), y-yradius*sin(fi));
		fi := fi + fistep;
	end;

	glEnd();

	if grDirect then glfwSwapBuffers(graphWindow);
end;

procedure Sector(x,y:smallint; start,stop,xradius,yradius:word);
var
	fi, fistep, fistop: double;
begin
	grResult:=grOK;
	if not grEnabled then
	begin
		grResult:=grNoInitGraph;
		Exit;
	end;

	if stop < start then
	begin
		grResult:=grInvalidParam;
		Exit;
	end;

	if (xradius > yradius) then
		fistep := 1 / xradius
	else
		fistep := 1 / yradius;
	
	fistop := stop*PI/180;

	{$IFDEF DBGOUT}
	writeln('Sector (',x:5, Y:5, start:5,stop:5 ,xradius:5, yradius:5,') steps ',((fistop - start*PI/180) / fistep):3:1);
	{$ENDIF}

	if grDirect then glfwSwapBuffers(graphWindow);

	glBegin(GL_POLYGON);

	glColor3f(fillColor.r,fillColor.g,fillColor.b);

	glVertex2d(x, y);

	fi := start*PI/180;
	while fi <= fistop do
	begin		
		glVertex2d(x + xradius*cos(fi), y-yradius*sin(fi));
		fi := fi + fistep;
	end;

	glEnd();

	glBegin(GL_LINE_LOOP);

	glColor3f(frColor.r,frColor.g,frColor.b);

	glVertex2d(x, y);

	fi := start*PI/180;
	while fi <= fistop do
	begin		
		glVertex2d(x + xradius*cos(fi), y-yradius*sin(fi));
		fi := fi + fistep;
	end;

	glEnd();

	if grDirect then glfwSwapBuffers(graphWindow);
end;

procedure PieSlice(x,y:smallint; start,stop,radius:word);
begin
	Sector(x,y,start, stop, radius, radius);
end;

procedure DrawPoly(nrpoints:word; var polypoints);
var
	size,i: longint;
	points: array of PointType;
begin
	grResult:=grOK;
	if not(grEnabled) then
	begin
		grResult:=grNoInitGraph;
		Exit;
	end;

	if (nrpoints < 3) then
	begin
		grResult:=grInvalidParam;
		Exit;
	end;

	SetLength(points,nrpoints);
	size:=nrpoints*SizeOf(PointType);
	Move(polypoints,points[0],size);

	if grDirect then glfwSwapBuffers(graphWindow);

	glBegin(GL_LINE_STRIP);

	glColor3f(frColor.r,frColor.g,frColor.b);

	for i:=0 to nrpoints-1 do with points[i] do
	begin
		glVertex2i(x, y);
	end;

	glEnd();

	if grDirect then glfwSwapBuffers(graphWindow);

	SetLength(points,0);
end;

procedure FillPoly(nrpoints:word; var polypoints);
var
	size,i: longint;
	points: array of PointType;
begin
	grResult:=grOK;
	if not(grEnabled) then
	begin
		grResult:=grNoInitGraph;
		Exit;
	end;

	if (nrpoints < 3) then
	begin
		grResult:=grInvalidParam;
		Exit;
	end;

	SetLength(points,nrpoints);
	size:=nrpoints*SizeOf(PointType);
	Move(polypoints,points[0],size);

	if grDirect then glfwSwapBuffers(graphWindow);

	glBegin(GL_POLYGON);

	glColor3f(fillColor.r,fillColor.g,fillColor.b);

	for i:=0 to nrpoints-1 do with points[i] do
	begin
		glVertex2i(x, y);
	end;

	glEnd();

	glBegin(GL_LINE_LOOP);

	glColor3f(frColor.r,frColor.g,frColor.b);

	for i:=0 to nrpoints-1 do with points[i] do
	begin
		glVertex2i(x, y);
	end;

	glEnd();

	if grDirect then glfwSwapBuffers(graphWindow);

	SetLength(points,0);
end;

procedure Arc(x,y:smallint; start,stop,radius:word);
begin
	Ellipse(x,y,start,stop, radius, radius);	
end;

procedure Circle(x,y:smallint; radius:word);
begin
	Ellipse(x,y, 0, 360, radius, radius);
end;

procedure Bar(x1,y1,x2,y2:smallint);
begin
	grResult:=grOK;
	if not grEnabled then begin
		grResult:=grNoInitGraph;
		Exit;
	end;

	if (x2 < x1) or (y2 < y1) then
	begin
		grResult:=grInvalidParam;
		Exit;
	end;

{$IFDEF DBGOUT}
	writeln('Bar (',x1:5, Y1:5, x2:5, y2:5,')' );
{$ENDIF}

	if (fillSettings.pattern = NoFill) then exit;

	if grDirect then glfwSwapBuffers(graphWindow);

	glBegin(GL_POLYGON);

	glColor3f(fillColor.r,fillColor.g,fillColor.b);
	glVertex2i(x1, Y1);
	glVertex2i(x2, Y1);
	glVertex2i(x2, Y2);
	glVertex2i(x1, Y2);
	glEnd();

	if grDirect then glfwSwapBuffers(graphWindow);
end;

procedure FillRect(x1,y1,x2,y2:smallint);
begin
	Bar(x1,y1,x2,y2);
	if (grResult <> grOK) then Exit;

	if grDirect then glfwSwapBuffers(graphWindow);

	glBegin(GL_LINE_LOOP);

	glColor3f(frColor.r,frColor.g,frColor.b);
	
	glVertex2i(x1, Y1);
	glVertex2i(x2, Y1);
	glVertex2i(x2, Y2);
	glVertex2i(x1, Y2);

	glEnd();

	if grDirect then glfwSwapBuffers(graphWindow);	
end;


procedure Bar3D(x1,y1,x2,y2:smallint; depth:word; top:boolean);
begin
	FillRect(x1,y1,x2,y2);
	if (grResult <> grOK) then Exit;

	if grDirect then glfwSwapBuffers(graphWindow);

	if top then
	begin
		glBegin(GL_LINE_STRIP);
		glColor3f(frColor.r,frColor.g,frColor.b);

		glVertex2i(x1,			y1);
		glVertex2i(x1+depth,	y1-depth);
		glVertex2i(x2+depth,	y1-depth);
		glVertex2i(x2,			y1);

		glEnd();
	end;

	if (depth <> 0) then
	begin
		glBegin(GL_LINE_STRIP);
		glColor3f(frColor.r,frColor.g,frColor.b);

		glVertex2i(x2+depth,	y1-depth);
		glVertex2i(x2+depth,	y2-depth);
		glVertex2i(x2,			y2);

		glEnd();
	end;

	if grDirect then glfwSwapBuffers(graphWindow);
end;

procedure RoundRectInternalGL(x1,y1,x2,y2: smallint; xradius, yradius: word; fistep: cfloat);
var
	fi,fistop: cfloat;
begin
	fi := pi;
	fistop := 3*pi/2;

	while fi <= fistop do
	begin		
		glVertex2d(x1 + xradius + xradius*cos(fi), y1 + yradius + yradius*sin(fi));
		fi := fi + fistep;
	end;

	fi := 3*pi/2;
	fistop := 2*pi;

	while fi <= fistop do
	begin		
		glVertex2d(x2 - xradius + xradius*cos(fi), y1 + yradius + yradius*sin(fi));
		fi := fi + fistep;
	end;

	fi := 0;
	fistop := pi/2;

	while fi <= fistop do
	begin		
		glVertex2d(x2 - xradius + xradius*cos(fi), y2 - yradius + yradius*sin(fi));
		fi := fi + fistep;
	end;

	fi := pi/2;
	fistop := pi;

	while fi <= fistop do
	begin		
		glVertex2d(x1 + xradius + xradius*cos(fi), y2 - yradius + yradius*sin(fi));
		fi := fi + fistep;
	end;
end;

procedure RoundRect(x1,y1,x2,y2,r:smallint);
var
	xradius,yradius: word;
	fistep : cfloat;
begin
	grResult:=grOK;
	if not grEnabled then begin
		grResult:=grNoInitGraph;
		Exit;
	end;

	if (x2 < x1) or (y2 < y1) then
	begin
		grResult:=grInvalidParam;
		Exit;
	end;

{$IFDEF DBGOUT}
	writeln('RoundRect (',x1:5, Y1:5, x2:5, y2:5,r:5,') size(',x2-x1:5,y2-y1:5,')' );
{$ENDIF}

	if (r = 0) then
	begin
		FillRect(x1,y1,x2,y2);
		exit;
	end;	

	if (x2 - x1) > (2*r) then
		xradius := r
	else
		xradius := (x2-x1) div 2;

	if (y2 - y1) > (2*r) then
		yradius := r
	else
		yradius := (y2-y1) div 2;


	if (xradius > yradius) then
		fistep := 1 / xradius
	else
		fistep := 1 / yradius;

{$IFDEF DBGOUT}
	writeln('	RoundRect radii (',xradius:5, Yradius:5,') steps: ', (pi/(2*fistep)):4:1 );
{$ENDIF}

	if grDirect then glfwSwapBuffers(graphWindow);

	glBegin(GL_POLYGON);

	glColor3f(fillColor.r,fillColor.g,fillColor.b);

	RoundRectInternalGL(x1,y1,x2,y2,xradius,yradius, fistep);	

	glEnd();


	glBegin(GL_LINE_LOOP);

	glColor3f(frColor.r,frColor.g,frColor.b);

	RoundRectInternalGL(x1,y1,x2,y2,xradius,yradius, fistep);	

	glEnd();

	if grDirect then glfwSwapBuffers(graphWindow);
end;

//
// Color routines
//

Function ColorToColorType(color: longword) : ColorType;
begin
	//ColorToColorType.r := color mod 256 - 128;
	//ColorToColorType.g := (color div 256) mod 256 - 128;
	//ColorToColorType.b := ((color div 256) div 256) mod 256 - 128;		

	ColorToColorType.r := (color mod 256) / 255;
	ColorToColorType.g := ((color div 256) mod 256) / 255;
	ColorToColorType.b := (((color div 256) div 256) mod 256) / 255;
end;

function ColorTypeToColor(ct: ColorType): longword;
begin
	ColorTypeToColor := round(ct.b * 255) * 256 * 256 + round(ct.g * 255) * 256 + round(ct.r * 255);
end;

procedure SetBkColor(color:longword);
begin
	grResult:=grOK;
	if not(grEnabled) then begin
		grResult:=grNoInitGraph;
		Exit;
	end;

	bkColor := ColorToColorType(color);

{$IFDEF DBGOUT}
	writeln('bkColor is (',bkColor.r:8:3, bkColor.g:8:3, bkColor.b:8:3,')' );
{$ENDIF}
end;

procedure SetColor(color:longword);
begin
	grResult:=grOK;
	if not(grEnabled) then begin
		grResult:=grNoInitGraph;
		Exit;
	end;

	frColor := ColorToColorType(color);

{$IFDEF DBGOUT}
	writeln('frColor is (',frColor.r:8:3, frColor.g:8:3, frColor.b:8:3,')' );
{$ENDIF}
end;



function GetBkColor: longword;
begin
	GetBkColor := ColorTypeToColor(bkColor);
end;

function GetColor: longword;
begin
	GetColor := ColorTypeToColor(frColor);
end;

function GetRGBColor(r,g,b:word): longword;
begin
	GetRGBColor := b * 256 * 256 + g * 256 + r;
end;

procedure GetRGBComponents(color:longword; out r,g,b:word);
begin
	r := color mod 256;
	g := (color div 256) mod 256;
	b := ((color div 256) div 256) mod 256;
end;

procedure SetPalette(nrcolor,color:word);
begin
	// Just a stub
	if not(grEnabled) then
		grResult:=grNoInitGraph
	else
		grResult:=grNoPalette;
end;

procedure SetLineStyle(linestyle,pattern,thickness:word);
begin
{$IFDEF DBGOUT}
	writeln('SetLineStyle (',linestyle:5, pattern:5, thickness:5,')' );
{$ENDIF}

	glLineWidth(thickness);
end;

procedure SetRGBPalette(nrcolor,r,g,b:word);
begin
	// Just a stub
	if not(grEnabled) then
		grResult:=grNoInitGraph
	else
		grResult:=grNoPalette;
end;

procedure SetFillStyle(pattern:word; color:longword);
begin
	grResult:=grOK;
	if not(grEnabled) then
	begin
		grResult:=grNoInitGraph;
		Exit;
	end;

	case pattern of
	SolidFill  : fillColor := ColorToColorType(color);

	EmptyFill  :
	begin
		pattern:=SolidFill;
		fillColor := bkColor;
	end;
	//LineFill   : lbHatch:=HS_HORIZONTAL;
	//ColFill    : lbHatch:=HS_VERTICAL;
	//HatchFill  : lbHatch:=HS_CROSS;
	//SlashFill  : lbHatch:=HS_BDIAGONAL;
	//BkSlashFill: lbHatch:=HS_FDIAGONAL;
	//XHatchFill : lbHatch:=HS_DIAGCROSS;
	//UserFill   : begin
	//               lbStyle:=BS_PATTERN;
	//               lbHatch:={$IFNDEF FPC}longint{$ENDIF}(grPattern); //Delphi needs this typecast
	//             end;
	NoFill     : ;//lbStyle:=BS_NULL;
	else
		grResult:=grInvalidParam;
		Exit;
	end;

	fillSettings.pattern:=pattern;
	fillSettings.color:=color;
end;

//
// Other
//


procedure UpdateGraph(bit:word);
begin
	case bit of
	UpdateOff:
		//if grUpdate then
		begin
			grUpdate:=false; grDirect:=false;
		end;

	UpdateOn:
		//if not(grUpdate) then
		begin
			grUpdate:=true;
			grDirect:=true;
			//SetVisualPage(visualPage);
		end;
	
	UpdateNow:
		if not grDirect then
			glfwSwapBuffers(graphWindow);
	end;
end;

end.