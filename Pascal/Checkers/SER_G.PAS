unit Ser_g;

interface
uses
  graph;

const
  way='tp\tp\v70\bgi';

  procedure MDelay(time:longint);
  procedure chel;
  procedure Bird;
  procedure InitG(s:string);

implementation

procedure MDelay(time:longint);
var
  ticks:longint absolute 0:$46c;
begin
  time:=round(time*0.185)+ticks;
  repeat
  until ticks>time;
end;

procedure chel;
begin
  setcolor(14);
  line(100,100,70,50);
  line(100,100,130,50);
  line(70,50,60,50);
  line(130,50,140,50);
  circle(100,100,40);
  circle(80,100,5);
  circle(120,100,5);
  ellipse(100,240,0,360,50,100);
  line(70,190,60,217);
  line(70,190,30,150);
  line(60,217,30,150);
  line(130,190,140,217);
  line(130,190,170,150);
  line(140,217,170,150);
  line(80,332,80,400);
  line(120,332,120,400);
  line(80,400,70,400);
  line(120,400,130,400);
end;

procedure Bird;
begin
  setcolor(14);
  line(50,100,100,100);
  line(100,100,100,75);
  line(50,100,100,75);
  circle(110,85,25);
  ellipse(180,136,0,360,70,50);
  line(160,184,140,230);
  line(200,184,220,230);
  line(160,145,200,145);
  line(200,145,220,200);
  line(220,200,160,145);
  line(235,150,235,130);
  line(235,130,300,130);
  line(300,130,235,150);
end;

procedure InitG(s:string);
var
  grDriver:Integer;
  grMode:Integer;
  ErrCode:Integer;
begin
  grDriver:=Detect;
  InitGraph(grDriver,grMode,s);
  ErrCode:=GraphResult;
  if ErrCode<>grOk
  then
    writeln('Графическая ошибка: ',GraphErrorMsg(ErrCode));
end;

begin
end.
