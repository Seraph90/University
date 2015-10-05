unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, Math;

type
  TForm1 = class(TForm)
    E_a: TEdit;
    E_b: TEdit;
    E_R: TEdit;
    B_MB: TButton;
    SG_S: TStringGrid;
    E_e: TEdit;
    CB_f: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    B_GSM: TButton;
    procedure B_MBClick(Sender: TObject);
    procedure CB_fChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure B_GSMClick(Sender: TObject);
  private
    function MB(a,b,e:Double):Double;
    function GSM(a,b,e:Double):Double;
  public
    { Public declarations }
  end;

var
  Form1:TForm1;
  k:Integer;

implementation

{$R *.dfm}
{$R WindowsXP.res}

function f(x:Double; n:Byte):Double;
begin
  case n
  of
    0:f:=(x*x-4)/(2*x+5);
    1:f:=x*x;
    2:f:=10*sin(x)+x*x;
    
  end;
end;

function TForm1.GSM(a,b,e:Double):Double;
var
  x1,x2,fi:Double;
begin
  k:=1;
  fi:=(1+Sqrt(5))/2;
  x1:=b-(b-a)/fi;
  x2:=a+(b-a)/fi;
  while Abs(b-a)>e
  do
    begin
      SG_S.Cells[0,k]:=FloatToStrF(a,ffExponent,4,2);
      SG_S.Cells[1,k]:=FloatToStrF(b,ffExponent,4,2);
      SG_S.Cells[2,k]:=FloatToStrF(x1,ffExponent,4,2);
      SG_S.Cells[3,k]:=FloatToStrF(x2,ffExponent,4,2);
      SG_S.Cells[5,k]:=FloatToStrF(f(x1,CB_f.ItemIndex),ffExponent,4,2);
      SG_S.Cells[6,k]:=FloatToStrF(f(x2,CB_f.ItemIndex),ffExponent,4,2);
      SG_S.RowCount:=k+1;
      if f(x1,CB_f.ItemIndex)<=f(x2,CB_f.ItemIndex)
      then
        begin
          b:=x2;
          x2:=x1;
          x1:=b-(b-a)/fi;
        end
      else
        begin
          a:=x1;
          x1:=x2;
          x2:=a+(b-a)/fi;
        end;
      k:=k+1;
    end;
  GSM:=f((x1+x2)/2,CB_f.ItemIndex);
end;

function TForm1.MB(a,b,e:Double):Double;
var
  x1,x2,x3:Double;
begin
  k:=1;
  while Abs(b-a)>e
  do
    begin
      x1:=(b+a)/2;
      x2:=(x1+a)/2;
      x3:=(b+x1)/2;
      SG_S.Cells[0,k]:=FloatToStrF(a,ffExponent,4,2);
      SG_S.Cells[1,k]:=FloatToStrF(b,ffExponent,4,2);
      SG_S.Cells[2,k]:=FloatToStrF(x1,ffExponent,4,2);
      SG_S.Cells[3,k]:=FloatToStrF(x2,ffExponent,4,2);
      SG_S.Cells[4,k]:=FloatToStrF(x3,ffExponent,4,2);
      SG_S.Cells[5,k]:=FloatToStrF(f(x1,CB_f.ItemIndex),ffExponent,4,2);
      SG_S.Cells[6,k]:=FloatToStrF(f(x2,CB_f.ItemIndex),ffExponent,4,2);
      SG_S.Cells[7,k]:=FloatToStrF(f(x3,CB_f.ItemIndex),ffExponent,4,2);
      SG_S.RowCount:=k+1;
      if f(x2,CB_f.ItemIndex)<f(x3,CB_f.ItemIndex)
      then
        if f(x2,CB_f.ItemIndex)<f(x1,CB_f.ItemIndex)
        then
          b:=x1
        else
          a:=x1
      else
        if f(x3,CB_f.ItemIndex)<f(x1,CB_f.ItemIndex)
        then
          a:=x1
        else
          b:=x1;
      k:=k+1;
    end;
  MB:=f(x1,CB_f.ItemIndex);
end;


procedure TForm1.B_MBClick(Sender: TObject);
var
  i,j:Integer;
begin
  for i:=0 to 7
  do
    for j:=1 to k
    do
      SG_S.Cells[i,j]:='';
  E_R.Text:=FloatToStr(RoundTo(MB(StrToFloat(E_a.Text),StrToFloat(E_b.Text),StrToFloat(E_e.Text)),-5));
end;

procedure TForm1.CB_fChange(Sender: TObject);
begin
  case CB_f.ItemIndex
  of
    0:
      begin
        E_a.Text:='-2,5';
        E_b.Text:='10';
      end;
    1:
      begin
        E_a.Text:='-9';
        E_b.Text:='10';
      end;
    2:
      begin
        E_a.Text:='-4';
        E_b.Text:='1,5';
      end;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  SG_S.Cells[0,0]:='a';
  SG_S.Cells[1,0]:='b';
  SG_S.Cells[2,0]:='x1';
  SG_S.Cells[3,0]:='x2';
  SG_S.Cells[4,0]:='x3';
  SG_S.Cells[5,0]:='f(x1)';
  SG_S.Cells[6,0]:='f(x2)';
  SG_S.Cells[7,0]:='f(x3)';
end;

procedure TForm1.B_GSMClick(Sender: TObject);
var
  i,j:Integer;
begin
  for i:=0 to 7
  do
    for j:=1 to k
    do
      SG_S.Cells[i,j]:='';
  E_R.Text:=FloatToStr(RoundTo(GSM(StrToFloat(E_a.Text),StrToFloat(E_b.Text),StrToFloat(E_e.Text)),-5));
end;

end.
