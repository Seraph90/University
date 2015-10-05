unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Math, Grids, ComCtrls, StdCtrls;

type
  TForm1 = class(TForm)
    I_G: TImage;
    SG: TStringGrid;
    Timer1: TTimer;
    ProgressBar1: TProgressBar;
    RB1: TRadioButton;
    RB2: TRadioButton;
    RB3: TRadioButton;
    Edit1: TEdit;
    procedure FormActivate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure I_GClick(Sender: TObject);
  private
    procedure Circle(x,y:Integer);
    procedure Field;
    procedure Fall(lr: Boolean; var xx, yy: Integer);
  public
  end;

const
  er=2;

var
  Form1: TForm1;
  i2,xx,yy,og,hh,mm,ss:Integer;
  mx:Cardinal;
  m:array[-25..25] of Integer;
  dt:TDateTime;
  N:Integer;

implementation

{$R *.dfm}
{$R WindowsXP.res}

procedure TForm1.Field;
var
  i,j,k:Integer;
begin
  I_G.Canvas.FillRect(I_G.Canvas.ClipRect);
  I_G.Canvas.Pen.Color:=0;
  k:=0;
  i2:=(I_G.Width div 2)-2*er-3;
  for i:=0 to 48
  do
    begin
      Inc(k);
      for j:=1 to k
      do
        Circle(i2-i*er*2+j*er*4,10+i*er*4);
    end;
  i:=49;
  for j:=0 to k+2
  do
    begin
      I_G.Canvas.MoveTo(i2-i*er*2+j*er*4,10+i*er*4);
      I_G.Canvas.LineTo(i2-i*er*2+j*er*4,I_G.Height);
    end;
  I_G.Canvas.Pen.Color:=clRed;
  I_G.Canvas.Brush.Color:=clRed;
  mx:=m[-25];
  for j:=-24 to 25
  do
    mx:=Max(mx,m[j]);
  for j:=-24 to 26
  do
    begin
      SG.Cells[0,j+24]:=IntToStr(m[j-1]);
      if mx>345
      then
        begin
          if m[j-1]<>0
          then
            I_G.Canvas.Rectangle(i2+j*4*er-3,I_G.Height,i2+j*4*er+4,Round(I_G.Height-m[j-1]*(345/mx)));
        end
      else
        I_G.Canvas.Rectangle(i2+j*4*er-3,I_G.Height,i2+j*4*er+4,Round(I_G.Height-m[j-1]));
    end;
  I_G.Canvas.Brush.Color:=clWhite;
end;

procedure TForm1.Circle(x,y:Integer);
begin
  I_G.Canvas.Ellipse(x-er,y-er,x+er,y+er);
end;

procedure TForm1.Fall(lr:Boolean; var xx,yy:Integer);
var
  i,x,y,tx,ty:Integer;
  fi:Double;
begin
  tx:=0;
  ty:=0;
  if lr
  then
    for i:=0 to 90
    do
      begin
        fi:=i*Pi/180;
        x:=xx+Round(2*er*Cos(fi-Pi/2));
        y:=yy+Round(2*er*Sin(fi-Pi/2));
        I_G.Canvas.Pen.Color:=clWhite;
        Circle(tx,ty);
        I_G.Canvas.Pen.Color:=clRed;
        Circle(x,y);
        tx:=x;
        ty:=y;
        if RB1.Checked
        then
          Sleep(10);
        Application.ProcessMessages;
      end
  else
    for i:=0 to 90
    do
      begin
        fi:=i*Pi/180;
        x:=xx+Round(2*er*Cos(-fi-Pi/2));
        y:=yy+Round(2*er*Sin(-fi-Pi/2));
        I_G.Canvas.Pen.Color:=clWhite;
        Circle(tx,ty);
        I_G.Canvas.Pen.Color:=clRed;
        Circle(x,y);
        tx:=x;
        ty:=y;
        if RB1.Checked
        then
          Sleep(10);
        Application.ProcessMessages;
      end;
  for i:=0 to 3
  do
    begin
      y:=y+1;
      I_G.Canvas.Pen.Color:=clWhite;
      Circle(tx,ty);
      I_G.Canvas.Pen.Color:=clRed;
      Circle(x,y);
      tx:=x;
      ty:=y;
      if RB1.Checked
      then
        Sleep(50);
      Application.ProcessMessages;
    end;
  if lr
  then
    xx:=xx+2*er
  else
    xx:=xx-2*er;
  yy:=yy+8;
end;

procedure TForm1.FormActivate(Sender: TObject);
var
  i,j,k:Integer;
begin
  Randomize;
  N:=StrToInt(Edit1.Text);
  ProgressBar1.Max:=N;
  dt:=Now;
  ss:=0;
  mm:=0;
  hh:=0;
  i2:=(I_G.Width div 2)-2*er-3;
  for k:=1 to N
  do
    begin
      Field;
      SG.Cells[0,52]:=IntToStr(k);
      ProgressBar1.Position:=k;
      Application.ProcessMessages;
      j:=-25;
      xx:=i2+4*er;
      yy:=10;
      for i:=1 to 50
      do
        if Random(2)=0
        then
          begin
            Inc(j);
            if not RB3.Checked
            then
              Fall(True,xx,yy);
          end
        else
          begin
            if not RB3.Checked
            then
              Fall(False,xx,yy);
          end;
      Inc(m[j]);
      Application.ProcessMessages;
    end;
  Field;
  Timer1.Enabled:=False;
  Application.ProcessMessages;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  Inc(ss);
  if ss=60
  then
    begin
      Inc(mm);
      ss:=0;
    end;
  if mm=60
  then
    begin
      Inc(hh);
      mm:=0;
    end;
  Caption:=TimeToStr(Now-dt);//StrToTime(IntToStr(hh)+':'+IntToStr(mm)+':'+IntToStr(ss)));
end;

procedure TForm1.I_GClick(Sender: TObject);
begin
  Form1.OnActivate(Application);
end;

end.
