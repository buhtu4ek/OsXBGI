program example;

uses
	osxbgi;
	//wingraph, wincrt;

//
// TESTING app
//
var
	gd,gm: SmallInt;

	tmpcolor,etaloncolor : Longint;
 
	r,g,b: word;

	i: integer;

	polyPoints: array [1..5] of PointType;

	key: Char;

procedure ReadKeyTest();
begin
	writeln('Readkey test. Press Esc to exit');
	key := readkey();
	while key <> chr(27) do
	begin
		writeln(ord(key),' *',key,'*');
		key := readkey();
	end;
end;

procedure TestText();
begin
	//SetColor(white);
	OutTextXY(10,200, 'the quick brown fox jumps over the lazy dog 1234567890');
	//OutTextXY(10,200, 's');

	SetColor(yellow);
	OutTextXY(10,400, 'THE QUICK BROWN FOX JUMPS OVER THE LAZY DOG 1234567890');
	//OutTextXY(10,400, 'S');
end;

procedure TestBorders();
var
	i: Integer;
begin
	for i := 0 to 480 do
	begin
		if (i mod 2) = 0 then
			line(-10, i, 300, i);
	end;

	SetColor(yellow);
	Rectangle(0,0,99,99);

	Rectangle(500,-1,640,99);

	Rectangle(500,300,639,480);

	Rectangle(-1,300,99,479);	
end;

begin 
	gd := nopalette;
	gm := m640x480;
	InitGraph(gd,gm,'Hello World');	

	if (GraphResult <> grOK) then
	begin
		writeln('Cannot init graphics');
		exit;
	end;

	//writeln('GLFW_KEY_UP=',GLFW_KEY_UP);

	//ReadKeyTest();
	//exit;
	readkey();
	UpdateGraph(UpdateOff);
	//UpdateGraph(UpdateOn);

	SetBkColor(red);
	ClearDevice();	

	SetBkColor(darkred);
	ClearDevice();	

	TestText();

	UpdateGraph(UpdateNow);
	readkey;
	exit;




	line(10,10,20,20);
	LineTo(0,50);
	//readkey;

	SetLineStyle(0,0,3);
	LineTo(0,0);
	LineTo(320,0);
	//readkey;

	SetColor(BLue);	
	SetBkColor(green);
	ClearDevice();
	//readkey;

	LineTo(640,480);
	SetColor(BlazeOrange);
	LineTo(100,480);
	//readkey;

	Ellipse(200,200, 20, 300, 40, 60);
	//readkey;

	SetColor(Bronze);
	SetLineStyle(0,0,1);
	Circle(200,250, 50);
	//readkey;

	SetColor(white);
	SetLineStyle(0,0,5);
	Arc(100,150, 90, 270, 20);
	//readkey;


	Rectangle(500, 20, 600, 40);
	//readkey;

	SetFillStyle(SolidFill, yellow);
	bar(500, 120, 590, 140);
	//readkey;

	SetFillStyle(EmptyFill, yellow);
	SetBkColor(lightgray);
	bar(520, 140, 610, 160);
	readkey;

	
	SetBkColor(black);
	SetFillStyle(SolidFill, darkgreen);
	SetLineStyle(SolidLn,0,1);
	SetColor(yellow);
	ClearDevice();

	bar3d(400, 300, 470, 320, 10, true);
	bar3d(400, 360, 470, 380, 5, true);
	bar3d(500, 300, 570, 320, 10, false);
	bar3d(500, 360, 570, 380, 5, false);

	FillRect(300, 300, 370, 320);
	bar(300, 360, 370, 380);

	//InvertRect(300, 420, 370, 440);

	for i := 0 to 6 do
	begin
		RoundRect(250 + i*50, 420, 250 + i*50 + 40, 440, i*5);
	end;

	FillEllipse(100, 50, 20, 30);

	Chord(200, 40, 0, 90, 20, 30);
	Chord(300, 40, 0, 135, 20, 30);
	Chord(400, 40, 0, 180, 20, 30);
	Chord(500, 40, 0, 270, 20, 30);
	Chord(600, 40, 45, 180, 20, 30);


	Sector(200, 140, 0, 90, 20, 30);
	Sector(300, 140, 0, 135, 20, 30);
	Sector(400, 140, 0, 180, 20, 30);
	Sector(500, 140, 0, 270, 20, 30);
	Sector(600, 140, 45, 180, 20, 30);

	PieSlice(200, 240, 0, 90, 30);
	PieSlice(300, 240, 0, 135, 30);
	PieSlice(400, 240, 0, 180, 30);
	PieSlice(500, 240, 0, 270, 30);
	PieSlice(600, 240, 45, 180, 30);

	polyPoints[1].x := 100; polyPoints[1].y := 400;
	polyPoints[2].x := 140; polyPoints[2].y := 420;
	polyPoints[3].x := 120; polyPoints[3].y := 425;
	polyPoints[4].x := 122; polyPoints[4].y := 440;
	polyPoints[5].x :=  80; polyPoints[5].y := 480;
	FillPoly(5, polyPoints);

	inc(polyPoints[1].x, 50);
	inc(polyPoints[2].x, 50);
	inc(polyPoints[3].x, 50);
	inc(polyPoints[4].x, 50);
	inc(polyPoints[5].x, 50);
	DrawPoly(5, polyPoints);

	readkey;

	(*
	UpdateGraph(UpdateOff);
	SetBkColor(black);
	ClearDevice();

	SetLineStyle(0,0,1);

	for i := 0 to 255 do
	begin
		SetColor(getRgBColor(0,i,0));
		line(10+i, 30, 10+i, 230);
	end;

	UpdateGraph(UpdateNow);
	UpdateGraph(UpdateOn);
	readkey;
	*)



	tmpcolor := 500;
	etaloncolor := 500;
	SetBkColor(tmpcolor);
	etaloncolor := getbkColor();
	writeln('bkColor check', tmpcolor:6, etaloncolor:6);

	SetColor(tmpcolor);
	etaloncolor := getColor();
	writeln('frColor check', tmpcolor:6, etaloncolor:6);

	etalonColor := getRgBColor(50, 100, 150);
	getRGBComponents(etalonColor, r,g,b);
	writeln('get rgb check (50,100,150) ', r:6, g:6, b:6);

	readkey;
	writeln('REadkey test. Press Shift+R to exit');
	key := readkey();
	while key <> 'R' do
	begin
		writeln(ord(key),' *',key,'*');
		key := readkey();
	end;


	CloseGraph();

	writeln('7');
	readkey();
end.
