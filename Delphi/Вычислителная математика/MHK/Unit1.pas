unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, Math;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    E1: TEdit;
    Label2: TLabel;
    SG: TStringGrid;
    Solve: TButton;
    Label3: TLabel;
    Label4: TLabel;
    I1: TEdit;
    I2: TEdit;
    SGI: TStringGrid;
    Label5: TLabel;
    procedure E1Change(Sender: TObject);
    procedure I1Change(Sender: TObject);
    procedure I2Change(Sender: TObject);
    procedure SolveClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  An, Bn: real;
  a, b: array of real;
  X, Nev, X0, a1, b1: array[1..50] of real;
  eps: real;
  Kk: integer;

implementation

{$R *.dfm}

//*****************************************************************************
Function Fun(x:real):real;
begin
  Fun:=x*x*cos(2*x)+1;
end;

Function Deriv1(x:real):real;
var
  del:real;
begin
  del:=eps/10;
  Deriv1:=(Fun(x+del)-Fun(x))/del;
end;

Function Deriv2(x:real):real;
var
  del:real;
begin
  del:=eps/10;
  Deriv2:=(Deriv1(x+del)-Deriv1(x))/del;
end;

Procedure MethodHK(aa,bb:real;var Xx:real;i:integer);
var
  j:integer;
begin
  SetLength(a,1000);
  SetLength(b,1000);
  a[1]:=aa;
  b[1]:=bb;
  j:=1;
  while abs(a[j]-b[j])>=eps
  do
    begin
      a[j+1]:=a[j]-(Fun(a[j])*(bb-a[j]))/(Fun(bb)-Fun(a[j]));
      b[j+1]:=b[j]-Fun(b[j])/Deriv1(b[j]);
      j:=j+1;
      Xx:=(a[j]+b[j])/2;
      Form1.SG.Cells[i,j-1]:=FloatToStr(Xx);
      Form1.SG.Cells[0,j-1]:=IntToStr(j-1);
    end;
  Form1.SG.RowCount:=j+1;
  Kk:=j+1;
  a:=nil;
  b:=nil;
end;

procedure TForm1.SolveClick(Sender: TObject);
var
  i,j,k,l,Kint:integer;
  h,c,d:real;
begin
  eps:=StrToFloat(E1.Text);
  An:=StrToFloat(I1.Text);
  Bn:=StrToFloat(I2.Text);
  i:=1;
  j:=0;
  k:=0;
  c:=An;
  h:=eps*10;
  while c<Bn
  do
    begin
      d:=c+h;
      If Fun(c)*Fun(d)<0
      then
        begin
          j:=j+1;
          a1[j]:=c;
          b1[j]:=d;
        end;
      c:=d;
    end;
  Kint:=j;
  SGI.RowCount:=Kint+1;
  SGI.Cells[0,0]:='a';
  SGI.Cells[1,0]:='b';
  for l:=1 to Kint
  do
    begin
      SGI.Cells[0,l]:= FloatToStr(a1[l]);
      SGI.Cells[1,l]:= FloatToStr(b1[l]);
    end;
  SG.ColCount:=Kint+1;
  for i:=1 to Kint
  do
    begin
      X0[i]:=(a1[i]+b1[i])/2;
      If (Deriv1(X0[i])*Deriv2(X0[i])>0)
      then
        MethodHK(a1[i],b1[i],X[i],i)
      else
        MethodHK(b1[i],a1[i],X[i],i);
      Nev[i]:=abs(0-Fun(X[i]));
    end;
  for i:=1 to Kint
  do
    begin
      SG.Cells[i,0]:='X'+IntToStr(i);
      SG.Cells[i,Kk-1]:=FloatToStr(RoundTo(Nev[i],-6));
    end;
  SG.Cells[0,Kk-1]:='Невязки:';
end;

procedure TForm1.E1Change(Sender: TObject);
begin
  try
    if StrToFloat(E1.Text)>=1
    then
      begin
        Showmessage('Точность меньше еденицы!');
        E1.Text:='0,001';
      end
  except
    on EConvertError
    do
      begin
        Showmessage('Некорректный ввод!');
        E1.Text:='0,001';
      end
  end;
end;

procedure TForm1.I1Change(Sender: TObject);
var
  prov:real;
begin
  try
    prov:=StrToFloat(I1.Text);
  except
    on EConvertError
    do
      begin
        Showmessage('Некорректный ввод!');
        I1.Text:='-10';
      end
  end;
end;

procedure TForm1.I2Change(Sender: TObject);
var
  prov:real;
begin
  try
    prov:=StrToFloat(I2.Text);
  except
    on EConvertError
    do
      begin
        Showmessage('Некорректный ввод!');
        I2.Text:='10';
      end
  end;
end;

end.
