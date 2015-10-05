unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, Math,
  Matrix, XPMan;

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
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    E_e2: TEdit;
    E_Y02: TEdit;
    E_X02: TEdit;
    B_Solve2: TButton;
    SG_I2: TStringGrid;
    B_chng: TButton;
    XPManifest1: TXPManifest;
    B_chng2: TButton;
    procedure SolveClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure B_Solve2Click(Sender: TObject);
    procedure B_chngClick(Sender: TObject);
    procedure B_chng2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

const
  m=-5;

var
  Form1:TForm1;
  frm,g,h:Byte;

implementation

uses Unit2;

{$R *.dfm}

function Fun(x,y:Real; f:Byte):Real;
begin
  case f
  of
    1:
      Fun:=sin(2*x-y)-1.2*x-0.4;    {0.4}
    2:
      Fun:=0.8*sqr(x)+1.5*sqr(y)-1; {-0.75}
    3:
      if x>0
      then
        Fun:=x+3*log10(x)-sqr(y)     {3.4}
      else
        begin
          ShowMessage('Achtung!!!');
          Fun:=0;
        end;
    4:
      Fun:=2*sqr(x)-x*y-5*x+1;      {2.2}
  else
    Fun:=0;
  end;
end;

function Df(x,dx,y,dy:Real; f:Byte):Real;
var
  dd:Real;
begin
  if dx>0
  then
    dd:=dx
  else
    dd:=dy;
  Df:=(Fun(x+dx,y+dy,f)-Fun(x,y,f))/dd;
end;

procedure TForm1.SolveClick(Sender: TObject);
var
  i:Integer;
  e,X,Y,X0,Y0,nX,nY:Real;
  DetW:Real;
  W,Wi,Wif,f:TMyMat;
begin
  nX:=0;
  nY:=0;
  e:=StrToFloat(E_e.Text);
  X:=StrToFloat(E_X0.Text);
  Y:=StrToFloat(E_Y0.Text);
  i:=0;
  SG_I.Cells[1,0]:='0';
  SG_I.Cells[1,1]:=FloatToStr(X);
  SG_I.Cells[1,2]:=FloatToStr(Y);
  repeat
    Inc(i);
    X0:=X;
    Y0:=Y;
    W[1,1]:=Df(X0,e/10,Y0,0,g);
    W[2,1]:=Df(X0,0,Y0,e/10,g);
    W[1,2]:=Df(X0,e/10,Y0,0,g+1);
    W[2,2]:=Df(X0,0,Y0,e/10,g+1);
    DetW:=Determinate(W,2,[1,2],1);
    if DetW<>0
    then
      Wi:=MatRimInv(W,2)
    else
      begin
        ShowMessage('Матрица вырожденная');
        Break;
      end;
    f[1,1]:=Fun(X0,Y0,g);
    f[1,2]:=Fun(X0,Y0,g+1);
    Wif:=MultMat(Wi,f,2,2,1);
    X:=X0-Wif[1,1];
    Y:=Y0-Wif[1,2];
    SG_I.ColCount:=i+3;
    SG_I.Cells[i+1,0]:=IntToStr(i);
    SG_I.Cells[i+1,1]:=FloatToStr(RoundTo(X,m));
    SG_I.Cells[i+1,2]:=FloatToStr(RoundTo(Y,m));
    nX:=Fun(X,Y,g);
    nY:=Fun(X,Y,g+1);
    Application.ProcessMessages;
  until Abs(X-X0)+Abs(Y-Y0)<e;
  Inc(i);
  SG_I.Cells[i+1,0]:='Невязки';
  SG_I.Cells[i+1,1]:=FloatToStr(RoundTo(nX,m));
  SG_I.Cells[i+1,2]:=FloatToStr(RoundTo(nY,m))
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  SG_I.Cells[0,1]:='X';
  SG_I.Cells[0,2]:='Y';
  SG_I2.Cells[0,1]:='X';
  SG_I2.Cells[0,2]:='Y';
  g:=1;
  h:=1;
end;

procedure TForm1.B_Solve2Click(Sender: TObject);
var
  i:Integer;
  e,X,Y,X0,Y0,nX,nY:Real;
  DetW:Real;
  W,Wi,Wif,f:TMyMat;
begin
  e:=StrToFloat(E_e2.Text);
  X:=StrToFloat(E_X02.Text);
  Y:=StrToFloat(E_Y02.Text);
  i:=0;
  SG_I2.Cells[1,0]:='0';
  SG_I2.Cells[1,1]:=FloatToStr(X);
  SG_I2.Cells[1,2]:=FloatToStr(Y);
  nX:=Fun(X,Y,h);
  nY:=Fun(X,Y,h+1);
  repeat
    Inc(i);
    X0:=X;
    Y0:=Y;
    if i=1
    then
      begin
        W[1,1]:=Df(X0,e/10,Y0,0,h);
        W[2,1]:=Df(X0,0,Y0,e/10,h);
        W[1,2]:=Df(X0,e/10,Y0,0,h+1);
        W[2,2]:=Df(X0,0,Y0,e/10,h+1);
        DetW:=Determinate(W,2,[1,2],1);
        if DetW<>0
        then
          Wi:=MatRimInv(W,2)
        else
          begin
            ShowMessage('Матрица вырожденная');
            Break;
          end;
      end;
    f[1,1]:=Fun(X0,Y0,h);
    f[1,2]:=Fun(X0,Y0,h+1);
    Wif:=MultMat(Wi,f,2,2,1);
    X:=X0-Wif[1,1];
    Y:=Y0-Wif[1,2];
    SG_I2.ColCount:=i+3;
    SG_I2.Cells[i+1,0]:=IntToStr(i);
    SG_I2.Cells[i+1,1]:=FloatToStr(RoundTo(X,m));
    SG_I2.Cells[i+1,2]:=FloatToStr(RoundTo(Y,m));
    nX:=Fun(X,Y,h);
    nY:=Fun(X,Y,h+1);
    Application.ProcessMessages;
  until Abs(X-X0)+Abs(Y-Y0)<e;
  Inc(i);
  SG_I2.Cells[i+1,0]:='Невязки';
  SG_I2.Cells[i+1,1]:=FloatToStr(RoundTo(nX,m));
  SG_I2.Cells[i+1,2]:=FloatToStr(RoundTo(nY,m))
end;

procedure TForm1.B_chngClick(Sender: TObject);
begin
  frm:=1;
  Form2.ShowModal;
end;

procedure TForm1.B_chng2Click(Sender: TObject);
begin
  frm:=2;
  Form2.ShowModal;
end;

end.
