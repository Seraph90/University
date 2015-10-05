unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Spin, Grids, StdCtrls, XPMan;

type
  TForm1 = class(TForm)
    Button1: TButton;
    E_x: TEdit;
    E_e: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    SG_E: TStringGrid;
    Label3: TLabel;
    SE_n: TSpinEdit;
    XPManifest1: TXPManifest;
    Label4: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure SE_nChange(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1:TForm1;
  n:Integer;
  e,x:Real;
  xx,yy:array[0..100] of Real;

implementation

{$R *.dfm}

procedure TForm1.FormActivate(Sender: TObject);
begin
  SE_nChange(nil);
  SG_E.Cells[1,1]:='1';
  SG_E.Cells[1,2]:='2';
  SG_E.Cells[1,3]:='3';
  SG_E.Cells[1,4]:='7';
  SG_E.Cells[1,5]:='8';
  SG_E.Cells[2,1]:='1';
  SG_E.Cells[2,2]:='4';
  SG_E.Cells[2,3]:='9';
  SG_E.Cells[2,4]:='49';
  SG_E.Cells[2,5]:='64';
end;

procedure TForm1.SE_nChange(Sender: TObject);
var
  i:Integer;
begin
  n:=SE_n.Value;
  SG_E.RowCount:=n+1;
  SG_E.Cells[0,0]:='i';
  for i:=0 to n
  do
    SG_E.Cells[0,i+1]:=IntToStr(i);
  SG_E.Cells[1,0]:='x[i]';
  SG_E.Cells[2,0]:='y[i]';
  SG_E.Cells[3,0]:='x[i]-x';
end;

function L(i1,i2:Integer; x:Real):Real;
begin
  if i2-i1=1
  then
    L:=1/(xx[i2]-xx[i1])*(yy[i1]*(xx[i2]-x)-yy[i2]*(xx[i1]-x))
  else
    L:=1/(xx[i2]-xx[i1])*(L(i1,i2-1,x)*(xx[i2]-x)-L(i1+1,i2,x)*(xx[i1]-x));
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  i,j,k:Integer;
begin
  e:=StrToFloat(E_e.Text);
  x:=StrToFloat(E_x.Text);
  SG_E.ColCount:=4;
  for i:=1 to n
  do
    begin
      SG_E.Cells[3,i]:=FloatToStr(StrToFloat(SG_E.Cells[1,i])-x);
      xx[i-1]:=StrToFloat(SG_E.Cells[1,i]);
      yy[i-1]:=StrToFloat(SG_E.Cells[2,i]);
    end;
  j:=1;
  k:=1;
  repeat
    SG_E.ColCount:=SG_E.ColCount+1;
    for i:=j to n-1
    do
      SG_E.Cells[j+3,i+1]:=FloatToStr(L(j-k,j+k-1,x));
    Inc(j);
    Inc(k);
    Application.ProcessMessages;
  until Abs(L(0,j+1,x)-L(0,j,x))<e;
  Label4.Caption:='Искомое значение = '+FloatToStr(L(0,j,x));
end;

end.
