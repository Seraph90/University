unit UGradientDescent;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, Math, XPMan;

type
  TForm1 = class(TForm)
    L_X0: TLabel;
    E_X0: TEdit;
    E_Y0: TEdit;
    L_Y0: TLabel;
    E_e: TEdit;
    L_Epsilon: TLabel;
    SG: TStringGrid;
    E_FMin: TEdit;
    L_YMin: TLabel;
    E_YMin: TEdit;
    L_FMin: TLabel;
    E_XMin: TEdit;
    L_XMin: TLabel;
    B_Solve: TButton;
    XPManifest1: TXPManifest;
    procedure FormCreate(Sender: TObject);
    procedure B_SolveClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
var
  Form1:TForm1;
  e:Real;

implementation

{$R *.dfm}

function Fun(x,y:Real):Real;
begin
  Fun:=x*x/36+y*y/4;
end;

function dF(x,dx,y,dy:Real):Real;
var
  dd:Real;
begin
  if dx>dy
  then
    dd:=dx
  else
    dd:=dy;
  dF:=(Fun(x+dx,y+dy)-Fun(x-dx,y-dy))/(2*dd);
end;

function F(Xk,YK,h:Real):Real;
begin
  F:=Fun(Xk-h*dF(Xk,e/10,Yk,0),Yk-h*dF(Xk,0,Yk,e/10));
end;

function GS(a,b,k1,k2:Real):Real;
var
  t,x1,x2,y1,y2:Real;
begin
  t:=(-1+sqrt(5))/2;
  x1:=b-t*(b-a);
  x2:=a+t*(b-a);
  y1:=F(k1,k2,x1);
  y2:=F(k1,k2,x2);
  repeat
    if y2<y1
    then
      begin
        a:=x1;
        x1:=x2;
        y1:=y2;
        x2:=a+t*(b-a);
        y2:=F(k1,k2,x2);
      end
    else
      begin
        b:=x2;
        x2:=x1;
        y2:=y1;
        x1:=b-t*(b-a);
        y1:=F(k1,k2,x1);
      end;
  until (b-a)<=e;
  GS:=(a+b)/2;
end;

function Loc(Xk,Yk, a,b: Real):Real;
var
  sh,a1,b1,k1,Hh,mF:Real;
begin
  sh:=10*e;
  if F(Xk,Yk,a)>F(Xk,Yk,b)
  then
    mF:=b
  else
    mF:=a;
  while b1<b
  do
    begin
      a1:=a1+sh;
      b1:=b1+2*sh;
      k1:=a1+sh;
      if (F(Xk,Yk,a1)>F(Xk,Yk,k1)) and (F(Xk,Yk,b1)>F(Xk,Yk,k1))
      then
        begin
          k1:=GS(a1,b1,Xk,Yk);
          if F(Xk,Yk,Hh)>F(Xk,Yk,k1)
          then
            Hh:=k1;
        end;
    end;
  if Hh<mF
  then
    Loc:=Hh
  else
    Loc:=mF;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  SG.Cells[1,0]:='h';
  SG.Cells[2,0]:='X';
  SG.Cells[3,0]:='Y';
  SG.Cells[4,0]:='F(x,y)';
end;

procedure TForm1.B_SolveClick(Sender: TObject);
var
  dd,X0,Y0,X1,Y1,h,Dgrad,X,Y:Real;
  k,m:Integer;
begin
  m:=-6;
  e:=StrToFloat(E_e.Text);
  dd:=e/10;
  X0:=StrToFloat(E_X0.Text);
  Y0:=StrToFloat(E_Y0.Text);
  k:=0;
  repeat
    Inc(k);
    h:=Loc(X0,Y0,-100,100);
    Application.ProcessMessages;
    X1:=X0-h*dF(X0,dd,Y0,0);
    Y1:=Y0-h*dF(X0,0,Y0,dd);
    SG.RowCount:=k+1;
    Dgrad:=Abs(X0-X1)+Abs(Y0-Y1);
    X0:=X1;
    Y0:=Y1;
    SG.Cells[0,k]:=IntToStr(k);
    SG.Cells[1,k]:=FloatToStr(RoundTo(h,m));
    SG.Cells[2,k]:=FloatToStr(RoundTo(X0,m));
    SG.Cells[3,k]:=FloatToStr(RoundTo(Y0,m));
    SG.Cells[4,k]:=FloatToStr(RoundTo(Fun(X0,Y0),m));
  until Dgrad<e;
  X:=(X1+X0)/2;
  Y:=(Y1+Y0)/2;
  E_XMin.Text:=FloatToStr(RoundTo(X,m));
  E_YMin.Text:=FloatToStr(RoundTo(Y,m));
  E_FMin.Text:=FloatToStr(RoundTo(Fun(X,Y),m));
end;

end.
