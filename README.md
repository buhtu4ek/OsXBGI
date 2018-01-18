# OsXBGI
Borland Graphics Interface (BGI) Pascal (FPC) implementation for OS-X

This unit implements standard Pascal Graph unit that is not available for FPC under OSX.

This unit may be compiled either for Windows or OSX.
There are already several better Windows implementations (WinGraph or standard FPC Graph)
so this unit is intended to be used primarily with OSX.

This implementation uses GLFW (OpenGL) as the base.

Pascal bindings for GLFW was taken from https://github.com/neslib/DelphiGlfw
Neslib.Glfw3.pas is used.

You'll need a compiled dynamic library: libglfw.3.2.dylib for this unit to work.


Constants and color names are taken from WinGraph(http://math.ubbcluj.ro/~sberinde/wingraph/)

There are also some functions that overrides crt ones: 
function ReadKey: char;
procedure Delay(ms: longint);

Many functions are not implemented yet:

function CloseGraphRequest: boolean;
procedure DetectGraph(out driver,mode:smallint);
function GetDriverName: shortstring;
function GetGraphMode: smallint;
function GetMaxMode: smallint;
function GetModeName(mode:smallint): shortstring;
procedure GetModeRange(driver:smallint; out width,height:smallint);
procedure GraphDefaults;
function OpenGLEnabled: boolean;
procedure RestoreCrtMode;
procedure SetGraphMode(mode:smallint);
procedure SetOpenGLMode(direct:boolean);
procedure SetWindowSize(width,height:word);

procedure GetDefaultPalette(out palette:PaletteType);
procedure GetNamesPalette(out palette:PaletteType);
function GetMaxColor: longword;
procedure GetPalette(out palette:PaletteType);
function GetPaletteSize: smallint;
function GetPixel(x,y:smallint): longword;
procedure GetSystemPalette(out palette:PaletteType);
procedure SetAllPalette(var palette);

procedure DrawBezier(nrpoints:word; var polypoints);
procedure GetArcCoords(out arccoords:ArcCoordsType);
procedure GetLineSettings(out lineinfo:LineSettingsType);
procedure RotEllipse(x,y,rot:smallint; xradius,yradius:word);

procedure FloodFill(x,y:smallint; color:longword);
procedure GetFillPattern(out fillpattern:FillPatternType);
procedure GetFillSettings(out fillinfo:FillSettingsType);
procedure InvertRect(x1,y1,x2,y2:smallint);
procedure SetFillPattern(fillpattern:FillPatternType; color:longword);
procedure SetFloodMode(floodmode:smallint);
