unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Mask, MPlayer;

type
  TForm1 = class(TForm)
    Timer1: TTimer;
    Timer2: TTimer;
    Timer3: TTimer;
    procedure Timer1Timer(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure Timer3Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

const
  cH=clLime;
  cM=clSilver;
  cS=clRed;
  n=25;

var
  Form1: TForm1;
  T:TDateTime;
  fH,fM,fS:Real;
  HMS,H,M,S:String;
  rHa,rMa,rSa,rHb,rMb,rSb:Integer;
  x,y,k:Integer;
  a,b:Real;
  ss:array[1..n,1..n,1..4] of Integer;

implementation

{$R *.dfm}

procedure Convert(tHMS:String; var tfH,tfM,tfS:Real);
begin
  if Length(tHMS)=7
  then
    tHMS:='0'+tHMS;
  H:=tHMS[1]+tHMS[2];
  M:=tHMS[4]+tHMS[5];
  S:=tHMS[7]+tHMS[8];
  tfS:=(6*3.14/180)*StrToInt(S)-3.14/2;
  tfM:=(6*3.14/180)*StrToInt(M)-3.14/2+StrToInt(S)*(3.14/1800);
  tfH:=(30*3.14/180)*StrToInt(H)-3.14/2+StrToInt(M)*(3.14/360);
end;

procedure TForm1.Timer1Timer(Sender: TObject);
var
  i,j:Integer;
begin
  T:=Time;
  HMS:=TimeToStr(T);
  Canvas.Pen.Width:=10;
  Canvas.Pen.Color:=Color;
  Canvas.MoveTo(x,y);
  Canvas.LineTo(Round(x+rHa*Cos(fH)),Round(y+rHb*sin(fH)));
  Canvas.MoveTo(x,y);
  Canvas.Pen.Width:=5;
  Canvas.LineTo(Round(x+rMa*Cos(fM)),Round(y+rMb*sin(fM)));
  Canvas.MoveTo(Round(x+(rSa/4)*Cos(fS-3.14)),Round(y+(rSb/4)*sin(fS-3.14)));
  Canvas.Pen.Width:=2;
  Canvas.LineTo(Round(x+rSa*Cos(fS)),Round(y+rSb*sin(fS)));

  Convert(HMS,fH,fM,fS);
  Caption:=H+':'+M+':'+S;
  if (StrToInt(M)=59) and (StrToInt(S)=60-(StrToInt(H) mod 12))
  then
    begin
      k:=StrToInt(H) mod 12;
      Timer2.Enabled:=True;
    end;
  Canvas.Pen.Width:=10;
  Canvas.MoveTo(x,y);
  Canvas.Pen.Color:=cH;
  Canvas.LineTo(Round(x+rHa*Cos(fH)),Round(y+rHb*sin(fH)));
  Canvas.MoveTo(x,y);
  Canvas.Pen.Color:=cM;
  Canvas.Pen.Width:=5;
  Canvas.LineTo(Round(x+rMa*Cos(fM)),Round(y+rMb*sin(fM)));
  Canvas.Pen.Color:=cS;
  Canvas.MoveTo(Round(x+(rSa/4)*Cos(fS-3.14)),Round(y+(rSb/4)*sin(fS-3.14)));
  Canvas.Pen.Width:=2;
  Canvas.LineTo(Round(x+rSa*Cos(fS)),Round(y+rSb*sin(fS)));
  for i:=0 to 11
  do
    begin
      Canvas.Pen.Width:=2;
      Canvas.Pen.Color:=clYellow;
      for j:=1 to 4
      do
        Canvas.Ellipse(round(x+(a*cos(i*(30*3.14/180)+j*(6*3.14/180))))-2,round(y+(b*Sin(i*(30*3.14/180)+j*(6*3.14/180))))-2,round(x+(a*cos(i*(30*3.14/180)+j*(6*3.14/180))))+2,round(y+(b*sin(i*(30*3.14/180)+j*(6*3.14/180))))+2);
      Canvas.Ellipse(round(x+(a*cos(i*(30*3.14/180))))-5,round(y+(b*Sin(i*(30*3.14/180))))-5,round(x+(a*cos(i*(30*3.14/180))))+5,round(y+(b*sin(i*(30*3.14/180))))+5);
    end;
end;

procedure TForm1.FormResize(Sender: TObject);
var
  i,j:Integer;
begin
  for i:=1 to n
  do
    for j:=1 to n
    do
      begin
        ss[i,j,1]:=Random(Width);
        ss[i,j,2]:=Random(Height);
        ss[i,j,3]:=ss[i,j,1];
        ss[i,j,4]:=ss[i,j,2];
      end;
  Canvas.FillRect(Canvas.ClipRect);
  rHa:=Round(ClientWidth*80/500);
  rHb:=Round(ClientHeight*80/500);
  rMa:=Round(ClientWidth*120/500);
  rMb:=Round(ClientHeight*120/500);
  rSa:=Round(ClientWidth*150/500);
  rSb:=Round(ClientHeight*150/500);
  a:=ClientWidth*0.4;
  b:=ClientHeight*0.4;
  x:=ClientWidth div 2;
  y:=ClientHeight div 2;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  i:Integer;
begin
end;

procedure TForm1.Timer2Timer(Sender: TObject);
begin
  Beep;
  Dec(k);
  Timer2.Enabled:=k>0;
end;

procedure TForm1.Timer3Timer(Sender: TObject);
var
  i,j:Integer;
begin
  for i:=1 to n
  do
    for j:=1 to n
    do
      begin
        ss[i,j,3]:=ss[i,j,1];
        ss[i,j,4]:=ss[i,j,2];
        ss[i,j,1]:=ss[i,j,1]+Random(10)-5;
        ss[i,j,2]:=ss[i,j,2]+Random(7);
        if ss[i,j,1]>Width
        then
          ss[i,j,1]:=0;
        if ss[i,j,1]<0
        then
          ss[i,j,1]:=Width;
        if ss[i,j,2]>Height
        then
          ss[i,j,2]:=0;
        Canvas.Pixels[ss[i,j,3]-1,ss[i,j,4]]:=clBlack;
        Canvas.Pixels[ss[i,j,3]+1,ss[i,j,4]]:=clBlack;
        Canvas.Pixels[ss[i,j,3],ss[i,j,4]]:=clBlack;
        Canvas.Pixels[ss[i,j,3],ss[i,j,4]-1]:=clBlack;
        Canvas.Pixels[ss[i,j,3],ss[i,j,4]+1]:=clBlack;
        Canvas.Pixels[ss[i,j,1]-1,ss[i,j,2]]:=RGB(Random(30)+225,0,Random(30)+225);
        Canvas.Pixels[ss[i,j,1]+1,ss[i,j,2]]:=RGB(Random(30)+225,0,Random(30)+225);
        Canvas.Pixels[ss[i,j,1],ss[i,j,2]]:=RGB(Random(30)+225,0,Random(30)+225);
        Canvas.Pixels[ss[i,j,1],ss[i,j,2]-1]:=RGB(Random(30)+225,0,Random(30)+225);
        Canvas.Pixels[ss[i,j,1],ss[i,j,2]+1]:=RGB(Random(30)+225,0,Random(30)+225);
      end;
end;

end.
