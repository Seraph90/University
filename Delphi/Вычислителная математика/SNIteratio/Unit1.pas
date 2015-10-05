unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, Math;

type
  TForm1 = class(TForm)
    E_e: TEdit;
    Label2: TLabel;
    SG_I: TStringGrid;
    Solve: TButton;
    Label4: TLabel;
    E_X0: TEdit;
    E_Y0: TEdit;
    Label1: TLabel;
    Label5: TLabel;
    L_q1: TLabel;
    L_q2: TLabel;
    L_q3: TLabel;
    L_q4: TLabel;
    CheckBox1: TCheckBox;
    procedure E_eChange(Sender: TObject);
    procedure SolveClick(Sender: TObject);
    procedure E_X0Change(Sender: TObject);
    procedure E_Y0Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
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

function Fun(x,y:Real; f:Byte):Real;
begin
  case f
  of
    1:Fun:=sin(2*x-y)-1.2*x-0.4;
    2:Fun:=0.8*sqr(x)+1.5*sqr(y)-1;
  else
    Fun:=0;
  end;
end;

function FunF(x,y,k1,k2:Real):Real;
begin
  FunF:=x+k1*Fun(x,y,1)+k2*Fun(x,y,2);
end;

function Df(x,dx,y,dy,k1,k2:Real):Real;
var
  dd:Real;
begin
  if dx>0
  then
    dd:=dx
  else
    dd:=dy;
  Df:=(FunF(x+dx,y+dy,k1,k2)-FunF(x,y,k1,k2))/dd;
end;

function FunG(x,y,k1,k2:Real):Real;
begin
  FunG:=y+k1*Fun(x,y,1)+k2*Fun(x,y,2);
end;

function Dg(x,dx,y,dy,k1,k2:Real):Real;
var
  dd:Real;
begin
  if dx>0
  then
    dd:=dx
  else
    dd:=dy;
  Dg:=(FunG(x+dx,y+dy,k1,k2)-FunG(x,y,k1,k2))/dd;
end;

function Ddf(x,dx,y,dy:Real; f:Byte):Real;
var
  dd:Real;
begin
  if dx>0
  then
    dd:=dx
  else
    dd:=dy;
  Ddf:=(Fun(x+dx,y+dy,f)-Fun(x,y,f))/dd;
end;

procedure GetABGD(x,y:Real; var Al,Bt,Gm,Dl:Real);
var
  df1dx,df1dy,df2dx,df2dy:Real;
begin
  Df1dx:=Ddf(x,e/10,y,0,1);
  Df1dy:=Ddf(x,0,y,e/10,1);
  Df2dx:=Ddf(x,e/10,y,0,2);
  Df2dy:=Ddf(x,0,y,e/10,2);
  Bt:=-df1dy/(df2dx*df1dy-df2dy*df1dx);
  Al:=-Bt*df2dy/df1dy;
  Dl:=-df1dx/(df2dy*df1dx-df1dy*df2dx);
  Gm:=-Dl*df2dx/df1dx;
end;

procedure TForm1.SolveClick(Sender: TObject);
var
  i:Integer;
  Al,Bt,Gm,Dl,q1,q2:Real;
  dd,dfdx,dfdy,dgdx,dgdy:Real;
  X,Y,X0,Y0,nX,nY,nM,m:Real;
begin
  e:=StrToFloat(E_e.Text);
  dd:=e/10;
  X0:=StrToFloat(E_X0.Text);
  Y0:=StrToFloat(E_Y0.Text);
  SG_I.Cells[1,0]:='1';
  SG_I.Cells[1,1]:=FloatToStr(X0);
  SG_I.Cells[1,2]:=FloatToStr(Y0);
  // частные производные и q:
  Al:=1;
  Bt:=0;
  Gm:=0;
  Dl:=1;
  dfdx:=Df(X0,dd,Y0,0,Al,Bt);
  dgdx:=Dg(X0,dd,Y0,0,Gm,Dl);
  dfdy:=Df(X0,0,Y0,dd,Al,Bt);
  dgdy:=Dg(X0,0,Y0,dd,Gm,Dl);
  q1:=Abs(dfdx)+Abs(dgdx);
  q2:=Abs(dfdy)+Abs(dgdy);
  L_q1.Caption:='q1 = '+FloatToStr(RoundTo(q1,-6));
  L_q2.Caption:='q2 = '+FloatToStr(RoundTo(q2,-6));
  // приведение
  if (q1>=1) or (q2>=1)
  then
    begin
      GetABGD(X0,Y0,Al,Bt,Gm,Dl);
      dfdx:=Df(X0,dd,Y0,0,Al,Bt);
      dgdx:=Dg(X0,dd,Y0,0,Gm,Dl);
      dfdy:=Df(X0,0,Y0,dd,Al,Bt);
      dgdy:=Dg(X0,0,Y0,dd,Gm,Dl);
      q1:=Abs(dfdx)+Abs(dgdx);
      q2:=Abs(dfdy)+Abs(dgdy);
      m:=Max(q1,q2);
      L_q3.Caption:='Новая q1 = '+FloatToStr(RoundTo(q1,-6));
      L_q4.Caption:='Новая q2 = '+FloatToStr(RoundTo(q2,-6));
    end;
  X:=FunF(X0,Y0,Al,Bt);
  Y:=FunG(X0,Y0,Gm,Dl);
  SG_I.ColCount:=3;
  SG_I.Cells[2,0]:='2';
  SG_I.Cells[2,1]:=FloatToStr(RoundTo(X,-5));
  SG_I.Cells[2,2]:=FloatToStr(RoundTo(Y,-5));
  i:=2;
  repeat
    X0:=X;
    Y0:=Y;
    X:=FunF(X0,Y0,Al,Bt);
    Y:=FunG(X0,Y0,Gm,Dl);
    Inc(i);
    SG_I.ColCount:=i+1;
    SG_I.Cells[i,0]:=IntToStr(i);
    SG_I.Cells[i,1]:=FloatToStr(RoundTo(X,-5));
    SG_I.Cells[i,2]:=FloatToStr(RoundTo(Y,-5));
    nX:=Fun(X,Y,1);
    nY:=Fun(X,Y,2);
    if CheckBox1.Checked
    then
      if Abs(nX)>Abs(nY)
      then
        nM:=Abs(nX)
      else
        nM:=Abs(nY)
    else
      nM:=m/(1-m)*(Abs(nX-X)+Abs(nY-Y));
  until nM<e;
  Inc(i);
  SG_I.ColCount:=i+1;
  SG_I.Cells[i,0]:='Невязки';
  SG_I.Cells[i,1]:=FloatToStr(RoundTo(nX,-5));
  SG_I.Cells[i,2]:=FloatToStr(RoundTo(nY,-5))
end;

procedure TForm1.E_eChange(Sender: TObject);
begin
  try
    if StrToFloat(E_e.Text)>=1
    then
      Showmessage('Точность меньше еденицы!');
  except
    on EConvertError
    do
      Showmessage('Некорректный ввод!');
  end;
  E_e.Text:='0,001';
end;

procedure TForm1.E_X0Change(Sender: TObject);
begin
  try
    StrToFloat(E_X0.Text)
  except
    on EConvertError
    do
      begin
        Showmessage('Некорректный ввод!');
        E_X0.Text:='3,5';
      end
  end;
end;

procedure TForm1.E_Y0Change(Sender: TObject);
begin
  try
    StrToFloat(E_Y0.Text)
  except
    on EConvertError
    do
      begin
        Showmessage('Некорректный ввод!');
        E_Y0.Text:='2,2';
      end
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  SG_I.Cells[0,1]:='X';
  SG_I.Cells[0,2]:='Y';
end;

end.
