unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Math, StdCtrls, Spin;

type
  TForm1 = class(TForm)
    I_LL: TImage;
    L_x: TLabel;
    L_y: TLabel;
    L_z: TLabel;
    I_Grad: TImage;
    SE_c: TSpinEdit;
    B_Redraw: TButton;
    procedure FormCreate(Sender: TObject);
    procedure I_LLMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure SE_cChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure B_RedrawClick(Sender: TObject);
  private
    procedure Redraw;
  public
  end;

var
  Form1:TForm1;
  Aclr:array[0..1020] of Cardinal;
  Ix,Iy:Integer;
  mn,mx,d,h,c:Double;

implementation

{$R *.dfm}
{$R WindowsXP.res}

function f(x,y:Double):Double;
begin
  if c<>0
  then
    begin
      x:=x/c;
      y:=-y/c;
    end;
  //f:=x*x+y*y;
  //f:=x*x+x*y*y+Sin(y);
  f:=Sqr(x*x+y-11)+Sqr(x+y*y-7);
  //f:=Sqr(x*x)/4+Sqr(y*y)/36;
end;

procedure TForm1.Redraw;
var
  i,j,mm:Integer;
begin
  mn:=f(0,0);
  mx:=f(0,0);
  for i:=0 to Ix
  do
    for j:=0 to Iy
    do
      begin
        mn:=min(mn,f(i-(Ix div 2),j-(Iy div 2)));
        mx:=max(mx,f(i-(Ix div 2),j-(Iy div 2)));
      end;
  d:=Abs(mx)+Abs(mn);
  h:=d/(1020);
  mm:=Round(f(0-(Ix div 2),0-(Iy div 2))/h);
  for i:=0 to Ix
  do
    for j:=0 to Iy
    do
      begin
        mm:=min(mm,Round(f(i-(Ix div 2),j-(Iy div 2))/h));
      end;
  I_Grad.Canvas.Brush.Style:=bsClear;
  I_Grad.Canvas.Font.Color:=clMaroon;
  for i:=1 to 510
  do
    begin
      I_Grad.Canvas.TextOut(10,I_Grad.Height-i*20+5,FloatToStrF(h*i*20,ffFixed,5,2));
    end;
  for i:=0 to Ix
  do
    begin
      for j:=0 to Iy
      do
        I_LL.Canvas.Pixels[i,j]:=Aclr[Round(f(i-(Ix div 2),j-(Iy div 2))/h)+Abs(mm)];
      Application.ProcessMessages;
    end;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  i,j:Integer;
begin
  c:=SE_c.Value;
  I_Grad.Canvas.FillRect(I_Grad.Canvas.ClipRect);
  Ix:=I_LL.Width;
  Iy:=I_LL.Height;
  for i:=0 to 255
  do
    Aclr[i]:=RGB(0,0,i);
  for i:=255 to 510
  do
    Aclr[i]:=RGB(i-255,i-255,255);
  for i:=510 to 765
  do
    Aclr[i]:=RGB(255,255,255-(i-2*255));
  for i:=765 to 1020
  do
    Aclr[i]:=RGB(255,255-(i-3*255),0);
  for i:=0 to 777
  do
    for j:=0 to I_Grad.Width-1
    do
      I_Grad.Canvas.Pixels[j,I_Grad.Height-i]:=Aclr[i*(1020 div I_Grad.Height)];
  for i:=1 to 1019
  do
    if (i mod 20)=0
    then
      begin
        Aclr[i-1]:=0;
        Aclr[i]:=0;
        Aclr[i+1]:=0;
      end;
end;

procedure TForm1.I_LLMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  L_x.Caption:='x='+FloatToStr((x-(Ix div 2))/c);
  L_y.Caption:='y='+FloatToStr(-(y-(Ix div 2))/c);
  L_z.Caption:='z(x,y)='+FloatToStrF(f((x-(Ix div 2)),(y-(Iy div 2))),ffFixed,16,5);
  //Caption:=FloatToStr(Round(f(x-(Ix div 2),y-(Ix div 2))/h));
end;

procedure TForm1.SE_cChange(Sender: TObject);
begin
  c:=SE_c.Value;
end;

procedure TForm1.FormActivate(Sender: TObject);
begin
  Redraw;
end;

procedure TForm1.B_RedrawClick(Sender: TObject);
begin
  Redraw;
end;

end.
