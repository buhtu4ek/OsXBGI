unit osxbgi;

{$MODE OBJFPC}

interface

{DEFINE DBGOUT}

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

{key constants}
const
  { Printable keys }
  GLFW_KEY_SPACE = 32;
  GLFW_KEY_APOSTROPHE = 39;
  GLFW_KEY_COMMA = 44;
  GLFW_KEY_MINUS = 45;
  GLFW_KEY_PERIOD = 46;
  GLFW_KEY_SLASH = 47;
  GLFW_KEY_0 = 48;
  GLFW_KEY_1 = 49;
  GLFW_KEY_2 = 50;
  GLFW_KEY_3 = 51;
  GLFW_KEY_4 = 52;
  GLFW_KEY_5 = 53;
  GLFW_KEY_6 = 54;
  GLFW_KEY_7 = 55;
  GLFW_KEY_8 = 56;
  GLFW_KEY_9 = 57;
  GLFW_KEY_SEMICOLON = 59;
  GLFW_KEY_EQUAL = 61;
  GLFW_KEY_A = 65;
  GLFW_KEY_B = 66;
  GLFW_KEY_C = 67;
  GLFW_KEY_D = 68;
  GLFW_KEY_E = 69;
  GLFW_KEY_F = 70;
  GLFW_KEY_G = 71;
  GLFW_KEY_H = 72;
  GLFW_KEY_I = 73;
  GLFW_KEY_J = 74;
  GLFW_KEY_K = 75;
  GLFW_KEY_L = 76;
  GLFW_KEY_M = 77;
  GLFW_KEY_N = 78;
  GLFW_KEY_O = 79;
  GLFW_KEY_P = 80;
  GLFW_KEY_Q = 81;
  GLFW_KEY_R = 82;
  GLFW_KEY_S = 83;
  GLFW_KEY_T = 84;
  GLFW_KEY_U = 85;
  GLFW_KEY_V = 86;
  GLFW_KEY_W = 87;
  GLFW_KEY_X = 88;
  GLFW_KEY_Y = 89;
  GLFW_KEY_Z = 90;
  GLFW_KEY_LEFT_BRACKET = 91;
  GLFW_KEY_BACKSLASH = 92;
  GLFW_KEY_RIGHT_BRACKET = 93;
  GLFW_KEY_GRAVE_ACCENT = 96;
  GLFW_KEY_WORLD_1 = 161;
  GLFW_KEY_WORLD_2 = 162;

const
  { Function keys }
  GLFW_KEY_ESCAPE = 256;
  GLFW_KEY_ENTER = 257;
  GLFW_KEY_TAB = 258;
  GLFW_KEY_BACKSPACE = 259;
  GLFW_KEY_INSERT = 260;
  GLFW_KEY_DELETE = 261;
  GLFW_KEY_RIGHT = 262;
  GLFW_KEY_LEFT = 263;
  GLFW_KEY_DOWN = 264;
  GLFW_KEY_UP = 265;
  GLFW_KEY_PAGE_UP = 266;
  GLFW_KEY_PAGE_DOWN = 267;
  GLFW_KEY_HOME = 268;
  GLFW_KEY_END = 269;
  GLFW_KEY_CAPS_LOCK = 280;
  GLFW_KEY_SCROLL_LOCK = 281;
  GLFW_KEY_NUM_LOCK = 282;
  GLFW_KEY_PRINT_SCREEN = 283;
  GLFW_KEY_PAUSE = 284;
  GLFW_KEY_F1 = 290;
  GLFW_KEY_F2 = 291;
  GLFW_KEY_F3 = 292;
  GLFW_KEY_F4 = 293;
  GLFW_KEY_F5 = 294;
  GLFW_KEY_F6 = 295;
  GLFW_KEY_F7 = 296;
  GLFW_KEY_F8 = 297;
  GLFW_KEY_F9 = 298;
  GLFW_KEY_F10 = 299;
  GLFW_KEY_F11 = 300;
  GLFW_KEY_F12 = 301;
  GLFW_KEY_F13 = 302;
  GLFW_KEY_F14 = 303;
  GLFW_KEY_F15 = 304;
  GLFW_KEY_F16 = 305;
  GLFW_KEY_F17 = 306;
  GLFW_KEY_F18 = 307;
  GLFW_KEY_F19 = 308;
  GLFW_KEY_F20 = 309;
  GLFW_KEY_F21 = 310;
  GLFW_KEY_F22 = 311;
  GLFW_KEY_F23 = 312;
  GLFW_KEY_F24 = 313;
  GLFW_KEY_F25 = 314;
  GLFW_KEY_KP_0 = 320;
  GLFW_KEY_KP_1 = 321;
  GLFW_KEY_KP_2 = 322;
  GLFW_KEY_KP_3 = 323;
  GLFW_KEY_KP_4 = 324;
  GLFW_KEY_KP_5 = 325;
  GLFW_KEY_KP_6 = 326;
  GLFW_KEY_KP_7 = 327;
  GLFW_KEY_KP_8 = 328;
  GLFW_KEY_KP_9 = 329;
  GLFW_KEY_KP_DECIMAL = 330;
  GLFW_KEY_KP_DIVIDE = 331;
  GLFW_KEY_KP_MULTIPLY = 332;
  GLFW_KEY_KP_SUBTRACT = 333;
  GLFW_KEY_KP_ADD = 334;
  GLFW_KEY_KP_ENTER = 335;
  GLFW_KEY_KP_EQUAL = 336;
  GLFW_KEY_LEFT_SHIFT = 340;
  GLFW_KEY_LEFT_CONTROL = 341;
  GLFW_KEY_LEFT_ALT = 342;
  GLFW_KEY_LEFT_SUPER = 343;
  GLFW_KEY_RIGHT_SHIFT = 344;
  GLFW_KEY_RIGHT_CONTROL = 345;
  GLFW_KEY_RIGHT_ALT = 346;
  GLFW_KEY_RIGHT_SUPER = 347;
  GLFW_KEY_MENU = 348;

  GLFW_KEY_LAST = GLFW_KEY_MENU;

const
	{ Windows virtual keys }
	VK_SPACE = GLFW_KEY_SPACE;
	VK_APOSTROPHE = GLFW_KEY_APOSTROPHE;
	VK_COMMA = GLFW_KEY_COMMA;
	VK_MINUS = GLFW_KEY_MINUS;
	VK_PERIOD = GLFW_KEY_PERIOD;
	VK_SLASH = GLFW_KEY_SLASH;
	VK_0 = GLFW_KEY_0;
	VK_1 = GLFW_KEY_1;
	VK_2 = GLFW_KEY_2;
	VK_3 = GLFW_KEY_3;
	VK_4 = GLFW_KEY_4;
	VK_5 = GLFW_KEY_5;
	VK_6 = GLFW_KEY_6;
	VK_7 = GLFW_KEY_7;
	VK_8 = GLFW_KEY_8;
	VK_9 = GLFW_KEY_9;
	VK_SEMICOLON = GLFW_KEY_SEMICOLON;
	VK_EQUAL = GLFW_KEY_EQUAL;
	VK_A = GLFW_KEY_A;
	VK_B = GLFW_KEY_B;
	VK_C = GLFW_KEY_C;
	VK_D = GLFW_KEY_D;
	VK_E = GLFW_KEY_E;
	VK_F = GLFW_KEY_F;
	VK_G = GLFW_KEY_G;
	VK_H = GLFW_KEY_H;
	VK_I = GLFW_KEY_I;
	VK_J = GLFW_KEY_J;
	VK_K = GLFW_KEY_K;
	VK_L = GLFW_KEY_L;
	VK_M = GLFW_KEY_M;
	VK_N = GLFW_KEY_N;
	VK_O = GLFW_KEY_O;
	VK_P = GLFW_KEY_P;
	VK_Q = GLFW_KEY_Q;
	VK_R = GLFW_KEY_R;
	VK_S = GLFW_KEY_S;
	VK_T = GLFW_KEY_T;
	VK_U = GLFW_KEY_U;
	VK_V = GLFW_KEY_V;
	VK_W = GLFW_KEY_W;
	VK_X = GLFW_KEY_X;
	VK_Y = GLFW_KEY_Y;
	VK_Z = GLFW_KEY_Z;
	VK_LEFT_BRACKET = GLFW_KEY_LEFT_BRACKET;
	VK_BACKSLASH = GLFW_KEY_BACKSLASH;
	VK_RIGHT_BRACKET = GLFW_KEY_RIGHT_BRACKET;
	VK_GRAVE_ACCENT = GLFW_KEY_GRAVE_ACCENT;
	VK_WORLD_1 = GLFW_KEY_WORLD_1;
	VK_WORLD_2 = GLFW_KEY_WORLD_2;
	VK_ESCAPE = GLFW_KEY_ESCAPE;
	VK_ENTER = GLFW_KEY_ENTER;
	VK_TAB = GLFW_KEY_TAB;
	VK_BACKSPACE = GLFW_KEY_BACKSPACE;
	VK_INSERT = GLFW_KEY_INSERT;
	VK_DELETE = GLFW_KEY_DELETE;
	VK_RIGHT = GLFW_KEY_RIGHT;
	VK_LEFT = GLFW_KEY_LEFT;
	VK_DOWN = GLFW_KEY_DOWN;
	VK_UP = GLFW_KEY_UP;
	VK_PAGE_UP = GLFW_KEY_PAGE_UP;
	VK_PAGE_DOWN = GLFW_KEY_PAGE_DOWN;
	VK_HOME = GLFW_KEY_HOME;
	VK_END = GLFW_KEY_END;
	VK_CAPS_LOCK = GLFW_KEY_CAPS_LOCK;
	VK_SCROLL_LOCK = GLFW_KEY_SCROLL_LOCK;
	VK_NUM_LOCK = GLFW_KEY_NUM_LOCK;
	VK_PRINT_SCREEN = GLFW_KEY_PRINT_SCREEN;
	VK_PAUSE = GLFW_KEY_PAUSE;
	VK_F1 = GLFW_KEY_F1;
	VK_F2 = GLFW_KEY_F2;
	VK_F3 = GLFW_KEY_F3;
	VK_F4 = GLFW_KEY_F4;
	VK_F5 = GLFW_KEY_F5;
	VK_F6 = GLFW_KEY_F6;
	VK_F7 = GLFW_KEY_F7;
	VK_F8 = GLFW_KEY_F8;
	VK_F9 = GLFW_KEY_F9;
	VK_F10 = GLFW_KEY_F10;
	VK_F11 = GLFW_KEY_F11;
	VK_F12 = GLFW_KEY_F12;
	VK_F13 = GLFW_KEY_F13;
	VK_F14 = GLFW_KEY_F14;
	VK_F15 = GLFW_KEY_F15;
	VK_F16 = GLFW_KEY_F16;
	VK_F17 = GLFW_KEY_F17;
	VK_F18 = GLFW_KEY_F18;
	VK_F19 = GLFW_KEY_F19;
	VK_F20 = GLFW_KEY_F20;
	VK_F21 = GLFW_KEY_F21;
	VK_F22 = GLFW_KEY_F22;
	VK_F23 = GLFW_KEY_F23;
	VK_F24 = GLFW_KEY_F24;
	VK_F25 = GLFW_KEY_F25;
	VK_KP_0 = GLFW_KEY_KP_0;
	VK_KP_1 = GLFW_KEY_KP_1;
	VK_KP_2 = GLFW_KEY_KP_2;
	VK_KP_3 = GLFW_KEY_KP_3;
	VK_KP_4 = GLFW_KEY_KP_4;
	VK_KP_5 = GLFW_KEY_KP_5;
	VK_KP_6 = GLFW_KEY_KP_6;
	VK_KP_7 = GLFW_KEY_KP_7;
	VK_KP_8 = GLFW_KEY_KP_8;
	VK_KP_9 = GLFW_KEY_KP_9;
	VK_KP_DECIMAL = GLFW_KEY_KP_DECIMAL;
	VK_KP_DIVIDE = GLFW_KEY_KP_DIVIDE;
	VK_KP_MULTIPLY = GLFW_KEY_KP_MULTIPLY;
	VK_KP_SUBTRACT = GLFW_KEY_KP_SUBTRACT;
	VK_KP_ADD = GLFW_KEY_KP_ADD;
	VK_KP_ENTER = GLFW_KEY_KP_ENTER;
	VK_KP_EQUAL = GLFW_KEY_KP_EQUAL;
	VK_LEFT_SHIFT = GLFW_KEY_LEFT_SHIFT;
	VK_LEFT_CONTROL = GLFW_KEY_LEFT_CONTROL;
	VK_LEFT_ALT = GLFW_KEY_LEFT_ALT;
	VK_LEFT_SUPER = GLFW_KEY_LEFT_SUPER;
	VK_RIGHT_SHIFT = GLFW_KEY_RIGHT_SHIFT;
	VK_RIGHT_CONTROL = GLFW_KEY_RIGHT_CONTROL;
	VK_RIGHT_ALT = GLFW_KEY_RIGHT_ALT;
	VK_RIGHT_SUPER = GLFW_KEY_RIGHT_SUPER;
	VK_MENU = GLFW_KEY_MENU;

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
function IsKeyPressed(VirtualKey: word): boolean;
function KeyPressed: boolean;
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

// Text routines
procedure OutText(const textstring:shortstring);
procedure OutTextXY(x,y:smallint; const textstring:shortstring);


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
	//windows,
	ctypes, crt, strings, math;


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

const KeyBufSize = 32;

var
	bufRIndex, bufWIndex, bufCurSize : word;

	nr_readkey,nr_inputkey  : longint;
	keyBuf                  : array[0..KeyBufSize-1] of char;

	pressedKeys : array[0..GLFW_KEY_LAST] of boolean;
	


procedure AddKey(c:char); forward;
procedure AddExtKey(c:char);  forward;
procedure TranslateKeys(code:cint); forward;

{$CALLING CDECL} 

procedure MyKeyCallback(window: PGLFWwindow; key,scancode,action,mods : cint);
begin
{$IFDEF DBGOUT}	
	writeln('key cb: (',key:5,scancode:5,action:5,mods:5,')');
{$ENDIF}

	if (action = GLFW_PRESS) then
	begin
		TranslateKeys(key);
	end;

	if (key >=0) and (key <= GLFW_KEY_LAST) then
	begin
		if (action = GLFW_PRESS) then
		begin
			pressedKeys[key] := true;
		end;

		if (action = GLFW_RELEASE) then
		begin
			pressedKeys[key] := false;
		end;
	end;
end;

procedure MyCharCallback(window: PGLFWwindow; a:cuint);
begin
{$IFDEF DBGOUT}	
	writeln('char cb: (',a:5,'*',chr(a),'*)');
{$ENDIF}	
	AddKey(chr(a));
end;

procedure MyResizeCallback(window: PGLFWwindow; w,h:cint);
begin
	glfwSetWindowSize(graphWindow, ScreenW, ScreenH);
end;

procedure MyErrorCallback(error: Integer; const description: PAnsiChar); cdecl;
begin
{$IFDEF DBGOUT}
	writeln('Error ',error,':', description);
{$ENDIF}
end;

{$CALLING DEFAULT} 

Function ColorToColorType(color: longword) : ColorType; forward;

procedure InitGraph(var driver,mode:smallint; const title:shortstring);
var
	res : integer;
	newTitle : pchar;
	width, height: cint;
	i: integer;
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

	case mode of
	m320x200:
		begin
			ScreenW := 320;
			ScreenH := 200;
		end;
	m640x200:
		begin
			ScreenW := 640;
			ScreenH := 200;
		end;
	m640x350:
		begin
			ScreenW := 640;
			ScreenH := 350;
		end;
	m640x480:
		begin
			ScreenW := 640;
			ScreenH := 480;
		end;
	m800x600:
		begin
			ScreenW := 800;
			ScreenH := 600;
		end;
	m720x350:
		begin
			ScreenW := 720;
			ScreenH := 350;
		end;
	m1024x768:
		begin
			ScreenW := 1024;
			ScreenH := 768;
		end;
	m1280x1024:
		begin
			ScreenW := 1280;
			ScreenH := 1024;
		end;
	//mDefault:
	//mMaximized:
	//mFullScr:
	//mCustom:
			
	else 
		ScreenW := 640;
		ScreenH := 480;
	end;



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
	//glScalef(2/(ScreenW + 1),-2/(ScreenH + 1),1);	
	glScalef(2/(ScreenW),-2/(ScreenH),1);
	glTranslatef(-(ScreenW - 2)/2,-ScreenH/2,0);
	
	glClear(GL_COLOR_BUFFER_BIT);

	actX := 0;
	actY := 0;

	visualPage := 0;
	activePage := 0;
	
	grDirect := true;
	grUpdate := true;

	grResult := grOk;

	grEnabled := true;

	bufRIndex := 0;
	bufWIndex := 0;
	bufCurSize := 0;

	SetColor(white);
	SetBkColor(black);
	SetFillStyle(solidFill, white);

	for i := 0 to GLFW_KEY_LAST do
	begin
		pressedKeys[i] := false;
	end;

	UpdateGraph(UpdateOn);
	ClearDevice();
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

procedure AddKeyInternal(c:char);
begin
{$IFDEF DBGOUT}
	writeln('AddkeyInternal: ', ord(c));
{$ENDIF}

	keyBuf[bufWIndex] := c;
	bufWIndex := (bufWIndex + 1) mod KeyBufSize;
	inc(bufCurSize);
end;

procedure AddKey(c:char);
begin
{$IFDEF DBGOUT}
	writeln('Addkey: ', ord(c));
{$ENDIF}

	if (bufCurSize < KeyBufSize) then
	begin
		AddKeyInternal(c);
	end;
end;

procedure AddExtKey(c:char);
begin
	if ((bufCurSize+1) < KeyBufSize) then
	begin
		AddKeyInternal(#0);
		AddKeyInternal(c);
	end;
end;

procedure TranslateKeys(code:cint);
var
	shift_key,ctrl_key,alt_key: boolean;
	num_lock: boolean;
begin
	shift_key := (glfwGetKey(graphWindow, GLFW_KEY_LEFT_SHIFT) <> GLFW_RELEASE) or (glfwGetKey(graphWindow, GLFW_KEY_RIGHT_SHIFT) <> GLFW_RELEASE);
	ctrl_key := (glfwGetKey(graphWindow, GLFW_KEY_LEFT_CONTROL) <> GLFW_RELEASE) or (glfwGetKey(graphWindow, GLFW_KEY_RIGHT_CONTROL) <> GLFW_RELEASE);
	alt_key := (glfwGetKey(graphWindow, GLFW_KEY_LEFT_ALT) <> GLFW_RELEASE) or (glfwGetKey(graphWindow, GLFW_KEY_RIGHT_ALT) <> GLFW_RELEASE);

{$IFDEF DBGOUT}
	writeln('TranslateKeys: (',code:5,shift_key:6,ctrl_key:6,alt_key:6,')');
{$ENDIF}

	case code of
	GLFW_KEY_SPACE : if alt_key then AddExtKey(#11);
	GLFW_KEY_TAB: if ctrl_key then AddKey(#30);
	GLFW_KEY_ESCAPE: Addkey(#27);
	//VK_BACK: if alt_key then AddExtKey(#14);
	//VK_RETURN: if alt_key then AddExtKey(#166);
	//VK_APPS: AddExtKey(#151);
	GLFW_KEY_INSERT: if ctrl_key then AddExtKey(#146) else
	           if alt_key then AddExtKey(#162) else AddExtKey(#82);
	GLFW_KEY_DELETE: if ctrl_key then AddExtKey(#147) else
	           if alt_key then AddExtKey(#163) else AddExtKey(#83);
	GLFW_KEY_HOME: if ctrl_key then AddExtKey(#119) else
	         if alt_key then AddExtKey(#164) else AddExtKey(#71);
	GLFW_KEY_END: if ctrl_key then AddExtKey(#117) else
	        if alt_key then AddExtKey(#165) else AddExtKey(#79);
	//VK_NEXT: if ctrl_key then AddExtKey(#118) else
	//         if alt_key then AddExtKey(#161) else AddExtKey(#81);
	//VK_PRIOR: if ctrl_key then AddExtKey(#132) else
	//          if alt_key then AddExtKey(#153) else AddExtKey(#73);
	GLFW_KEY_UP: if ctrl_key then AddExtKey(#141) else
	       if alt_key then AddExtKey(#152) else AddExtKey(#72);
	GLFW_KEY_DOWN: if ctrl_key then AddExtKey(#145) else
	         if alt_key then AddExtKey(#160) else AddExtKey(#80);
	GLFW_KEY_LEFT: if ctrl_key then AddExtKey(#115) else
	         if alt_key then AddExtKey(#155) else AddExtKey(#75);
	GLFW_KEY_RIGHT: if ctrl_key then AddExtKey(#116) else
	          if alt_key then AddExtKey(#157) else AddExtKey(#77);
	GLFW_KEY_F1..GLFW_KEY_F10: if shift_key then AddExtKey(chr(code-GLFW_KEY_F1+84)) else
	               if ctrl_key then AddExtKey(chr(code-GLFW_KEY_F1+94)) else
	               if alt_key then AddExtKey(chr(code-GLFW_KEY_F1+104))
	                          else AddExtKey(chr(code-GLFW_KEY_F1+59));
	GLFW_KEY_F11,GLFW_KEY_F12: if shift_key then AddExtKey(chr(code+13)) else
	               if ctrl_key then AddExtKey(chr(code+15)) else
	               if alt_key then AddExtKey(chr(code+17))
	                          else AddExtKey(chr(code+11));
	GLFW_KEY_PAUSE: if alt_key then AddExtKey(#169) else
	          if not(ctrl_key) then AddExtKey(#12);

	GLFW_KEY_KP_1:; // At this moment GLFW does not distinguish bewtween Keypad Numlock on and off
	GLFW_KEY_KP_2:; // so handling of these keys are left for char callback
	GLFW_KEY_KP_3:;
	GLFW_KEY_KP_4:;
	GLFW_KEY_KP_5:; //if ctrl_key then AddExtKey(#143) else if alt_key then AddExtKey(#76) else AddExtKey(#76);
	GLFW_KEY_KP_6:;
	GLFW_KEY_KP_7:;
	GLFW_KEY_KP_8:;
	GLFW_KEY_KP_9:;
	GLFW_KEY_KP_0:;
	GLFW_KEY_KP_DECIMAL:
		if ctrl_key then AddExtKey(#150) else
		if alt_key then AddExtKey(#114);

	GLFW_KEY_KP_DIVIDE: if ctrl_key then AddExtKey(#148) else
	           if alt_key then AddExtKey(#69);
	GLFW_KEY_KP_MULTIPLY: if ctrl_key then AddExtKey(#149) else
	             if alt_key then AddExtKey(#70);
	GLFW_KEY_KP_SUBTRACT: if ctrl_key then AddExtKey(#142) else
	             if alt_key then AddExtKey(#74);
	GLFW_KEY_KP_ADD: if ctrl_key then AddExtKey(#144) else
	        if alt_key then AddExtKey(#78);
	
	else
{$IFDEF DBGOUT}
	writeln('TranslateKeys: else');
{$ENDIF}	
		if ctrl_key then case code of
			ord('0')          : AddExtKey(#10);
			ord('1')..ord('9'): AddExtKey(chr(code-48));
		end;

    	if alt_key then case code of
					ord('A'): AddExtKey(#30);
					ord('B'): AddExtKey(#48);
					ord('C'): AddExtKey(#46);
					ord('D'): AddExtKey(#32);
					ord('E'): AddExtKey(#18);
					ord('F'): AddExtKey(#33);
					ord('G'): AddExtKey(#34);
					ord('H'): AddExtKey(#35);
					ord('I'): AddExtKey(#23);
					ord('J'): AddExtKey(#36);
					ord('K'): AddExtKey(#37);
					ord('L'): AddExtKey(#38);
					ord('M'): AddExtKey(#50);
					ord('N'): AddExtKey(#49);
					ord('O'): AddExtKey(#24);
					ord('P'): AddExtKey(#25);
					ord('Q'): AddExtKey(#16);
					ord('R'): AddExtKey(#19);
					ord('S'): AddExtKey(#31);
					ord('T'): AddExtKey(#20);
					ord('U'): AddExtKey(#22);
					ord('V'): AddExtKey(#47);
					ord('W'): AddExtKey(#17);
					ord('X'): AddExtKey(#45);
					ord('Y'): AddExtKey(#21);
					ord('Z'): AddExtKey(#44);
					ord('0'): AddExtKey(#129);
					ord('1')..ord('9'): AddExtKey(chr(code+71));
                    end;
//*)                    
	end;
end;


function ReadKey: char;
begin
{$IFDEF DBGOUT}
	writeln('Readkey()');
{$ENDIF}

	if (grEnabled) then
	begin
		while (bufCurSize = 0) and (glfwWindowShouldClose(graphWindow) = 0 ) do
		begin
			glfwPollEvents();
		end;

		if (glfwWindowShouldClose(graphWindow) <> 0) then
		begin
			//THINK: should it be handled directly
			halt;
		end;

		Readkey := keyBuf[bufRIndex];
		bufRIndex := (bufRIndex + 1) mod KeyBufSize;
		dec(bufCurSize);
	end
	else
	begin
{$IFDEF DBGOUT}
		writeln('Readkey(): crt');
{$ENDIF}
		Result := crt.readkey();
	end;

{$IFDEF DBGOUT}
		writeln('Readkey() returns:', result );
{$ENDIF}
end;

function IsKeyPressed(VirtualKey: word): boolean;
begin
	if (VirtualKey > GLFW_KEY_LAST) then
		IsKeyPressed := false
	else
		IsKeyPressed := pressedKeys[VirtualKey];
end;

function KeyPressed: boolean;
begin

	if (grEnabled) then
	begin
		glfwPollEvents();

		if (glfwWindowShouldClose(graphWindow) <> 0) then
		begin
			//THINK: should it be handled directly
			halt;
		end;

		KeyPressed := (bufCurSize <> 0);
	end
	else
	begin
		Result := crt.KeyPressed();
	end;
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
		if (glfwWindowShouldClose(graphWindow) <> 0) then
		begin
			//THINK: should it be handled directly
			halt;
		end;

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

	while fi < fistop do
	begin
		glColor3f(frColor.r,frColor.g,frColor.b);
		glVertex2d(x + xradius*cos(fi), y-yradius*sin(fi));
		fi := fi + fistep;
	end;
	glVertex2d(x + xradius*cos(fistop), y-yradius*sin(fistop));

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
	while fi < fistop do
	begin		
		glVertex2d(x + xradius*cos(fi), y-yradius*sin(fi));
		fi := fi + fistep;
	end;
	glVertex2d(x + xradius*cos(fistop), y-yradius*sin(fistop));

	glEnd();

	glBegin(GL_LINE_LOOP);

	glColor3f(frColor.r,frColor.g,frColor.b);

	fi := 0;
	while fi < fistop do
	begin		
		glVertex2d(x + xradius*cos(fi), y-yradius*sin(fi));
		fi := fi + fistep;
	end;
	glVertex2d(x + xradius*cos(fistop), y-yradius*sin(fistop));

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
	while fi < fistop do
	begin		
		glVertex2d(x + xradius*cos(fi), y-yradius*sin(fi));
		fi := fi + fistep;
	end;
	glVertex2d(x + xradius*cos(fistop), y-yradius*sin(fistop));

	glEnd();

	glBegin(GL_LINE_LOOP);

	glColor3f(frColor.r,frColor.g,frColor.b);

	fi := start*PI/180;
	while fi < fistop do
	begin		
		glVertex2d(x + xradius*cos(fi), y-yradius*sin(fi));
		fi := fi + fistep;
	end;
	glVertex2d(x + xradius*cos(fistop), y-yradius*sin(fistop));


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
	while fi < fistop do
	begin		
		glVertex2d(x + xradius*cos(fi), y-yradius*sin(fi));
		fi := fi + fistep;
	end;
	glVertex2d(x + xradius*cos(fistop), y-yradius*sin(fistop));

	glEnd();

	glBegin(GL_LINE_LOOP);

	glColor3f(frColor.r,frColor.g,frColor.b);

	glVertex2d(x, y);

	fi := start*PI/180;
	while fi < fistop do
	begin		
		glVertex2d(x + xradius*cos(fi), y-yradius*sin(fi));
		fi := fi + fistep;
	end;
	glVertex2d(x + xradius*cos(fistop), y-yradius*sin(fistop));

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

	while fi < fistop do
	begin		
		glVertex2d(x1 + xradius + xradius*cos(fi), y1 + yradius + yradius*sin(fi));
		fi := fi + fistep;
	end;
	glVertex2d(x1 + xradius + xradius*cos(fistop), y1 + yradius + yradius*sin(fistop));

	fi := 3*pi/2;
	fistop := 2*pi;

	while fi < fistop do
	begin		
		glVertex2d(x2 - xradius + xradius*cos(fi), y1 + yradius + yradius*sin(fi));
		fi := fi + fistep;
	end;
	glVertex2d(x2 - xradius + xradius*cos(fistop), y1 + yradius + yradius*sin(fistop));

	fi := 0;
	fistop := pi/2;

	while fi < fistop do
	begin		
		glVertex2d(x2 - xradius + xradius*cos(fi), y2 - yradius + yradius*sin(fi));
		fi := fi + fistep;
	end;
	glVertex2d(x2 - xradius + xradius*cos(fistop), y2 - yradius + yradius*sin(fistop));

	fi := pi/2;
	fistop := pi;

	while fi < fistop do
	begin		
		glVertex2d(x1 + xradius + xradius*cos(fi), y2 - yradius + yradius*sin(fi));
		fi := fi + fistep;
	end;
	glVertex2d(x1 + xradius + xradius*cos(fistop), y2 - yradius + yradius*sin(fistop));
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
		if not grDirect then
		begin
			glfwSwapBuffers(graphWindow);

			grUpdate:=true;
			grDirect:=true;			
			//SetVisualPage(visualPage);
		end;
	
	UpdateNow:
		if not grDirect then
			glfwSwapBuffers(graphWindow);
	end;
end;

const
	FontWidth = 6;
	FontHeigth = 11;

	FontSpacing = 2;

procedure UnknownSymbol(var x,y : integer);
begin
	Rectangle(x, y-FontHeigth, x+FontWidth, y);
end;

procedure UpperA(var x,y : integer);
begin
	MoveTo(x,y);

	lineTo(round(x+FontWidth/2), y-FontHeigth);
	lineTo(x+FontWidth, y);

	line(round(x+FontWidth/4), round(y-FontHeigth/2 + 1), round(x+3*FontWidth/4), round(y-FontHeigth/2 + 1));
end;

procedure UpperB(var x,y : integer);
var
	xradius, yradius: Integer;
begin

	xradius := FontWidth div 2;
	yradius := (FontHeigth+4) div 4;

	MoveTo(x,y);
	LineRel(0, - FontHeigth);

	Ellipse(x, y - FontHeigth + yradius, 0, 90, xradius, yradius);
	Ellipse(x, y - FontHeigth + yradius, 270, 360, xradius, yradius);

	Ellipse(x, y - yradius, 0, 90, FontWidth, yradius);
	Ellipse(x, y - yradius, 270, 360, FontWidth, yradius);
end;

procedure UpperC(var x,y : integer);
begin
	Ellipse(x+FontWidth div 2, y-FontHeigth div 2, 50, 310, FontWidth div 2, FontHeigth div 2);
end;

procedure UpperD(var x,y : integer);
begin
	Ellipse(x+FontWidth div 2, y-FontHeigth div 2, 0, 90, FontWidth div 2, FontHeigth div 2);
	Ellipse(x+FontWidth div 2, y-FontHeigth div 2, 270, 360, FontWidth div 2, FontHeigth div 2);
	moveto(x+FontWidth div 2, y);
	lineTo(x,y);
	linerel(0, -FontHeigth);
	LineRel(FontWidth div 2,0);
end;

procedure UpperE(var x,y : integer);
begin
	MoveTo(x+FontWidth, y - FontHeigth);
	LineRel(-FontWidth, 0);
	LineRel(0,FontHeigth);
	LineRel(FontWidth, 0);
	MoveRel(0, -(FontHeigth div 2));
	LineRel(-FontWidth, 0);
end;

procedure UpperF(var x,y : integer);
begin
	moveto(x,y);
	lineTo(x, y-FontHeigth);
	lineto(x+FontWidth, y-FontHeigth);
	line(x, y-FontHeigth div 2, x + FontWidth - FontWidth div 4, y-FontHeigth div 2);
end;

procedure UpperG(var x,y : integer);
begin
	Ellipse(x+FontWidth div 2, y-FontHeigth div 2, 50, 270, FontWidth div 2, FontHeigth div 2);
	MoveTo(x + FontWidth - FontWidth div 2, y);
	linerel(FontWidth div 2, 0);
	LineRel(0, -FontHeigth div 3);
	LineRel(-FontWidth div 2, 0);
end;

procedure UpperH(var x,y : integer);
begin
	line(x, y, x, y-FontHeigth);
	line(x + FontWidth, y, x+ FontWidth, y-FontHeigth);
	line(x, y-FontHeigth div 2, x + FontWidth, y-FontHeigth div 2);
end;

procedure UpperI(var x,y : integer);
begin
	line(x + FontWidth div 4, y-FontHeigth, x + FontWidth - FontWidth div 4, y-FontHeigth);
	line(x + FontWidth div 4, y, x + FontWidth - FontWidth div 4, y);

	Line(x+ FontWidth div 2, y, x+FontWidth div 2, y-FontHeigth);
end;

procedure UpperJ(var x,y : integer);
begin
	line(x+FontWidth, y-FontHeigth, x+FontWidth div 2, y-FontHeigth);
	line(x+FontWidth, y-FontHeigth, x+FontWidth, y-FontWidth div 2);
	arc(x+FontWidth div 2, y - FontWidth div 2, 180, 360, FontWidth div 2);
end;

procedure UpperK(var x,y : integer);
begin
	line(x,y, x, y-FontHeigth);
	moveto(x+FontWidth, y-FontHeigth);
	lineto(x, y-FontHeigth div 2);
	lineto(x+FontWidth, y);
end;

procedure UpperL(var x,y : integer);
begin
	moveto(x, y-FontHeigth);
	lineTo(x,y);
	lineTo(x+FontWidth, y);
end;

procedure UpperM(var x,y : integer);
begin	
	MoveTo(x, y);
	lineTo(x + FontWidth div 4, y-FontHeigth);
	lineto(x+ FontWidth div 2, y-FontHeigth div 2);
	lineTo(x + FontWidth - FontWidth div 4, y - FontHeigth);
	lineTo(x + FontWidth, y);
end;

procedure UpperN(var x,y : integer);
begin
	moveto(x,y);
	LineRel(0, -FontHeigth);
	LineRel(FontWidth, FontHeigth);
	LineRel(0, -FontHeigth);
end;

procedure UpperO(var x,y : integer);
begin
	Ellipse(x+FontWidth div 2, y-FontHeigth div 2, 0, 360, FontWidth div 2, FontHeigth div 2);
end;

procedure UpperP(var x,y : integer);
var
	H3: Integer;
begin
	h3 := ceil(FontHeigth/3);

	Line(x,y,x,y-FontHeigth);
	Ellipse(x, y - FontHeigth + h3, 0, 90, FontWidth, h3);
	Ellipse(x, y - FontHeigth + h3, 270, 360, FontWidth, h3);
end;

procedure UpperQ(var x,y : integer);
begin	
	Ellipse(x+FontWidth div 2, y-FontHeigth div 2, 0, 360, FontWidth div 2, FontHeigth div 2);
	line(x+FontWidth div 2, y-FontHeigth div 4, x+FontWidth, y+FontHeigth div 4);
end;

procedure UpperR(var x,y : integer);
var
	h3: Integer;
begin
	h3 := round(FontHeigth/4);

	Line(x,y,x,y-FontHeigth);
	Ellipse(x, y - FontHeigth + h3, 0, 90, FontWidth, h3);
	Ellipse(x, y - FontHeigth + h3, 270, 360, FontWidth, h3);

	line(x, y - FontHeigth + 2*h3, x + FontWidth, y);
end;

procedure UpperS(var x,y : integer);	
var
	xradius, yradius: Integer;
begin

	xradius := FontWidth div 2;
	yradius := (FontHeigth+4) div 4;

	Ellipse(x + xradius, y - FontHeigth + yradius, 30, 280, xradius, yradius);
	Ellipse(x + xradius, y - yradius, 0, 100, xradius, yradius);
	Ellipse(x + xradius, y - yradius, 210, 360, xradius, yradius);
end;

procedure UpperT(var x,y : integer);
begin
	line(x, y-FontHeigth, x + FontWidth, y-FontHeigth);

	Line(x+ FontWidth div 2, y, x+FontWidth div 2, y-FontHeigth);
end;

procedure UpperU(var x,y : integer);
begin
	line(x, y-FontHeigth, x, y-FontWidth div 2);
	line(x+FontWidth, y-FontHeigth, x+FontWidth, y-FontWidth div 2);
	arc(x+FontWidth div 2, y - FontWidth div 2, 180, 360, FontWidth div 2);
end;


procedure UpperV(var x,y : integer);
begin
	MoveTo(x,y-FontHeigth);

	lineTo(round(x+FontWidth/2), y);
	lineTo(x+FontWidth, y-FontHeigth);
end;

procedure UpperW(var x,y : integer);	
begin
	MoveTo(x, y - FontHeigth);
	lineTo(x + FontWidth div 4, y);
	lineto(x+ FontWidth div 2, y-FontHeigth div 2);
	lineTo(x + FontWidth - FontWidth div 4, y);
	lineTo(x + FontWidth, y - FontHeigth);
end;

procedure UpperX(var x,y : integer);
begin
	line (x,y, x+ FontWidth, y-FontHeigth);
	line (x,y-FontHeigth, x+ FontWidth, y);
end;

procedure UpperY(var x,y : integer);
begin
	MoveTo(x, y-FontHeigth);
	LineTo(x + FontWidth div 2, y - FontHeigth div 2);
	LineTo(x + FontWidth, y - FontHeigth);

	MoveTo(x+FontWidth div 2, y-FontHeigth div 2);
	LineTo(x+FontWidth div 2, y);
end;

procedure LetterSpace(var x,y : integer);
begin	
end;

procedure UpperZ(var x,y : integer);
begin
	moveto(x, y - FontHeigth);
	LineRel(FontWidth, 0);
	LineRel(-FontWidth, FontHeigth);
	LineRel(FontWidth, 0);
end;

procedure Symbol0(var x,y : integer);
begin
	UpperO(x,y);

	line(x,y,x+FontWidth,y-FontHeigth);
end;

procedure Symbol1(var x,y : integer);
begin
	line(x + FontWidth div 4, y, x + FontWidth - FontWidth div 4, y);
	MoveTo(x + FontWidth div 2, y);
	LineRel(0, -FontHeigth);
	LineTo(x, y-FontHeigth + FontHeigth div 4);	
end;

procedure Symbol2(var x,y : integer);
var
	yradius: Integer;
begin
	yradius := (FontHeigth + 4) div 4;

	Ellipse(x + FontWidth - FontWidth div 2, y - FontHeigth + yradius, 0, 180, FontWidth div 2, yradius);

	MoveTo(x + FontWidth, y - FontHeigth + yradius);
	lineto(x,y);
	LineRel(FontWidth, 0);
end;

procedure Symbol3(var x,y : integer);
var
	yradius: Integer;
begin
	yradius := (FontHeigth + 4) div 4;
	Ellipse(x + FontWidth div 2, y - FontHeigth + yradius, 0, 120, FontWidth div 2, yradius);
	Ellipse(x + FontWidth div 2, y - FontHeigth + yradius, 260, 360, FontWidth div 2, yradius);

	Ellipse(x + FontWidth div 2, y - yradius, 0, 100, FontWidth div 2, yradius);
	Ellipse(x + FontWidth div 2, y - yradius, 240, 360, FontWidth div 2, yradius);
end;

procedure Symbol4(var x,y : integer);
begin
	MoveTo(x + ((FontWidth * 3) div 4), y);
	LineRel(0, -FontHeigth);
	LineTo(x, y-FontHeigth div 3);
	LineRel(FontWidth, 0);	
end;

procedure Symbol5(var x,y : integer);
var
	yradius: Integer;
begin
	yradius := (FontHeigth + 3) div 4;

	Ellipse(x, y - yradius, 0, 90, FontWidth, yradius);
	Ellipse(x, y - yradius, 270, 360, FontWidth, yradius);

	moveto(x, y - 2*yradius);
	lineto(x, y - FontHeigth);
	lineto(x + FontWidth, y - FontHeigth);
end;

procedure Symbol6(var x,y : integer);
var
	yradius: Integer;
begin
	yradius := (FontHeigth + 4) div 4;
	Ellipse(x + FontWidth div 2, y - FontHeigth div 2, 90, 270, FontWidth div 2, FontHeigth div 2);
	Ellipse(x + FontWidth div 2, y - yradius, 0, 360, FontWidth div 2, yradius);
end;

procedure Symbol7(var x,y : integer);
begin
	MoveTo(x, y - FontHeigth);
	LineRel(FontWidth, 0);
	LineRel(-FontWidth, FontHeigth);
end;

procedure Symbol8(var x,y : integer);
var
	yradius: Integer;
begin
	yradius := (FontHeigth + 4) div 4;
	Ellipse(x + FontWidth div 2, y - FontHeigth + yradius, 0, 360, FontWidth div 2, yradius);
	Ellipse(x + FontWidth div 2, y - yradius, 0, 360, FontWidth div 2, yradius);
end;

procedure Symbol9(var x,y : integer);
var
	yradius: Integer;
begin
	yradius := (FontHeigth + 4) div 4;

	Ellipse(x + FontWidth div 2, y - FontHeigth div 2, 0, 90, FontWidth div 2, FontHeigth div 2);
	Ellipse(x + FontWidth div 2, y - FontHeigth div 2, 270, 360, FontWidth div 2, FontHeigth div 2);
	
	Ellipse(x + FontWidth div 2, y - FontHeigth + yradius, 0, 360, FontWidth div 2, yradius);
end;

procedure OutText(const textstring:shortstring);
var
	i: Integer;
	x,y: integer;
begin
{$IFDEF DBGOUT}	
	writeln('Outtext with string: "',textstring,'"');
{$ENDIF}	
	
	grResult:=grOK;
	if not(grEnabled) then begin
		grResult:=grNoInitGraph;
		Exit;
	end;

	

	for i:= 1 to length(textstring) do
	begin
		x := actX;
		y := actY;

		case textstring[i] of
		' ' : LetterSpace(x,y);
		'a', 'A' : UpperA(x,y);
		'b', 'B' : UpperB(x,y);
		'c', 'C' : UpperC(x,y);
		'd', 'D' : UpperD(x,y);
		'e', 'E' : UpperE(x,y);
		'f', 'F' : UpperF(x,y);
		'g', 'G' : UpperG(x,y);
		'h', 'H' : UpperH(x,y);
		'i', 'I' : UpperI(x,y);
		'j', 'J' : UpperJ(x,y);
		'k', 'K' : UpperK(x,y);
		'l', 'L' : UpperL(x,y);		
		'm', 'M' : UpperM(x,y);
		'n', 'N' : UpperN(x,y);
		'o', 'O' : UpperO(x,y);
		'p', 'P' : UpperP(x,y);
		'q', 'Q' : UpperQ(x,y);
		'r', 'R' : UpperR(x,y);
		's', 'S' : UpperS(x,y);
		't', 'T' : UpperT(x,y);
		'u', 'U' : UpperU(x,y);
		'v', 'V' : UpperV(x,y);
		'w', 'W' : UpperW(x,y);
		'x', 'X' : UpperX(x,y);
		'y', 'Y' : UpperY(x,y);
		'z', 'Z' : UpperZ(x,y);
		'1' : Symbol1(x,y);
		'2' : Symbol2(x,y);
		'3' : Symbol3(x,y);
		'4' : Symbol4(x,y);
		'5' : Symbol5(x,y);
		'6' : Symbol6(x,y);
		'7' : Symbol7(x,y);
		'8' : Symbol8(x,y);
		'9' : Symbol9(x,y);
		'0' : Symbol0(x,y);
		else
			UnknownSymbol(x, y);
		end;

		actX := x + FontWidth + FontSpacing;

		actY := y;
	end;
end;

procedure OutTextXY(x,y:smallint; const textstring:shortstring);
begin
{$IFDEF DBGOUT}	
	writeln('OuttextXY(',x,',',y,') with string: "',textstring,'"');
{$ENDIF}	

	grResult:=grOK;
	if not(grEnabled) then begin
		grResult:=grNoInitGraph;
		Exit;
	end;

	MoveTo(x,y);

	OutText(textstring);
end;


end.